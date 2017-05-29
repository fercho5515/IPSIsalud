<%-- 
    Document   : cargarmedicamentosinventario
    Author     : VAIO
--%>


<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<%@page import="java.sql.*" %>
<%@page import="pac.conexion" %>


  <%
  request.setCharacterEncoding("UTF-8");         
         
                            int start=0;
                            int total=0;
                            int total_pages =0;

                            int intpage = new Integer(request.getParameter("page"));
                            int limit = new Integer(request.getParameter("rows"));

                            String sidx = request.getParameter("sidx");
                            String sord = request.getParameter("sord");
                          
                            String strQuery="";
                            String json ="";

                             // analiza busqueda
                            int bandera=0;
                            String where=" and (";
                            
                            JSONParser parser = new JSONParser();
                            
                            String busca=""+request.getParameter("_search");
                            if(busca.compareTo("true")==0){
                                        String json0=""+request.getParameter("filters");
                            
                                        try {
                                             Object obj = parser.parse(json0);

                                             JSONObject jsonObject = (JSONObject) obj;

                                             String and_or = (String) jsonObject.get("groupOp");
                                           
                                           

                                             // loop array
                                             JSONArray msg = (JSONArray) jsonObject.get("rules");
                                             
                                             
                                            
                                             for(int i=0;i<Integer.parseInt(""+msg.size());i++){   ///ago un ciclo para todad las restricciones

                                                if(bandera==0){bandera=1;}
                                                else{where=where+" "+and_or;}
                                                 
                                                 
                                                Object obj2 = parser.parse(""+msg.get(i)+"");
                                                JSONObject jsonObject2 = (JSONObject) obj2;

                                                String campo = (String) jsonObject2.get("field");
                                                if(campo.compareTo("atc")==0){campo="m.cod_atc";}
                                                else if(campo.compareTo("fecha_fab")==0){campo="ifa.fecha_fab";}
                                                else if(campo.compareTo("fecha_ven")==0){campo="ifa.fecha_ven";}
                                                else if(campo.compareTo("cod_barras")==0){campo="ifa.cod_barras";}
                                                else if(campo.compareTo("nombre")==0){campo="lfar.nombre";}
                                                else{campo=campo.replace("_",".");}
                                                       
                                                String ope = (String) jsonObject2.get("op");
                                                String dato = (String) jsonObject2.get("data");
                                                
                                                
                                                
                                                  /// miro la opcion que pucieron para crear la restriccion
                                                       if(ope.compareTo("eq")==0){ where=where+" "+campo+" = '"+dato+"'";} // igual
                                                  else if(ope.compareTo("ne")==0){ where=where+" "+campo+" != '"+dato+"'"; }  // '<>' diferente                                                
                                                  else if(ope.compareTo("lt")==0){ where=where+" "+campo+" < '"+dato+"'"; }   // menor que
                                                  else if(ope.compareTo("le")==0){ where=where+" "+campo+" <= '"+dato+"'"; }  // menor igula
                                                  else if(ope.compareTo("gt")==0){ where=where+" "+campo+" > '"+dato+"'"; }   // mayor que
                                                  else if(ope.compareTo("ge")==0){ where=where+" "+campo+" >= '"+dato+"'"; }  // mayor igual
                                                  else if(ope.compareTo("bw")==0){ where=where+" "+campo+" like '%"+dato+"%'"; }  // comienza con
                                                  else if(ope.compareTo("bn")==0){ where=where+" "+campo+" not like '"+dato+"%'";} //  no comienza por
                                                  else if(ope.compareTo("in")==0){ where=where+" "+campo+" like '%"+dato+"%'";} //se encuentra en
                                                  else if(ope.compareTo("ni")==0){ where=where+" "+campo+" not like '%"+dato+"%'";} //no esta en 
                                                  else if(ope.compareTo("ew")==0){ where=where+" "+campo+" like '%"+dato+"'";}   // termina con
                                                  else if(ope.compareTo("en")==0){ where=where+" "+campo+" not like '%"+dato+"'";} //no termina con
                                                  else if(ope.compareTo("cn")==0){ where=where+" "+campo+" like '%"+dato+"%'";} // contiene
                                                  else if(ope.compareTo("nc")==0){ where=where+" "+campo+" not like '%"+dato+"%'";} //no contiene

                                                 }where=where+" )";

                                              }

                                             
                                             
                                          catch (ParseException e) {
                                             e.printStackTrace();
                                         }
                             }else{where="";}
                    //       System.out.println(where);
                            
                            
                            // finaliza busqueda
                            boolean rc;

                            ResultSet rs = null;

                            if(sidx ==""){
                                sidx ="1";
                            }


                            /*-----------------------------------Conexión a la base de datos MySql-------------------------------------------*/
                            conexion  conexiondb = new conexion();
                            conexiondb.Conectar();
                            /*-----------------------------------------------------------------------------------------------------------*/

                            total = conexiondb.countRec("ifa.serial_inven", "medicamentos m,forma_farmaceutica f,via_admin v,unidad_medida u,inventario_farmacia ifa,lab_farmaceutico lf where  ifa.cod_medicamento=m.serial and lf.idlab_farmaceutico=ifa.laboratorio and m.forma_farmaceutica=f.id_forma_farmaceutica and m.via_administracion=v.id_via_admin and m.unidad_medida=u.id_unidad_medida and (existencias>0 and fecha_ven>=curdate() )  "+where+"");
                 //      System.out.println("total : "+total);
                            if( total>0 ) {
                                double d = Math.ceil( (double)(total) / (double)(limit) );
                                total_pages = (int)(d);
                            } else {
                                total_pages = 0;
                            }

                            if (intpage > total_pages) {
                                intpage=total_pages;
                            }

                            start = limit * intpage - limit; 

                            if(start < 0 ){
                                start = 0;
                            }

                            strQuery = "select DISTINCT ifa.serial_inven,m.serial,lf.idlab_farmaceutico,m.producto,m.cod_atc,v.descripcion as via_ad,f.descripcion as forma_f,concat(m.concentracion,' ',u.descripcion) as unioon,lf.nombre as laboratorio,ifa.cod_barras,ifa.lote,ifa.num_factura,ifa.existencias from medicamentos m,forma_farmaceutica f,via_admin v,unidad_medida u,inventario_farmacia ifa,lab_farmaceutico lf where  ifa.cod_medicamento=m.serial and lf.idlab_farmaceutico=ifa.laboratorio and m.forma_farmaceutica=f.id_forma_farmaceutica and m.via_administracion=v.id_via_admin and m.unidad_medida=u.id_unidad_medida and (existencias>0 and fecha_ven>=curdate() )  "+where+" ORDER BY "+sidx + " " +sord +" LIMIT "+start+" , "+limit;
                            
                            rs = conexiondb.Consulta(strQuery);
                            
                          //  System.out.println(strQuery);
                            response.setContentType("text/x-json");
                            response.setCharacterEncoding("utf-8");
                            response.setHeader("Pragma", "no-cache");
                            response.setHeader("Cache-Control", "no-cache, must-revalidate");
                            response.setHeader("Pragma", "no-cache");

                            json ="";
                            json = json + "{\n";
                            json = json + " \"page\":\""+intpage+"\",\n";
                            json = json + "\"total\":"+total_pages+",\n";
                            json = json + "\"records\":"+total+",\n";
                            json = json + "\"rows\": [";
                            rc =false;

                            try{
                                int conta=0;
                            while(rs.next()){
                                
                                if(rc){
                                    json = json + ",";
                                }
                                conta++;
                                json = json + "\n{";
                                json = json + "\"id\":\""+rs.getString("serial_inven")+"\",";
                                json = json + "\"cell\":["+rs.getString("serial_inven")+"";
                                json = json + ",\""+rs.getString("m.serial")+"\"";                                
                                json = json + ",\""+rs.getString("idlab_farmaceutico")+"\""; 
                                json = json + ",\""+rs.getString("cod_atc")+"\"";                               
                                json = json + ",\""+rs.getString("producto")+"\"";
                                json = json + ",\""+rs.getString("forma_f")+"\"";
                                json = json + ",\""+rs.getString("unioon")+"\"";
                                json = json + ",\""+rs.getString("via_ad")+"\"";
                                json = json + ",\""+rs.getString("existencias")+"\"";
                                json = json + ",\""+rs.getString("laboratorio")+"\"";
                                json = json + ",\""+rs.getString("cod_barras")+"\"";
                                json = json + ",\""+rs.getString("lote")+"\"";
                                json = json + ",\""+rs.getString("num_factura")+"\"]";
                                json = json + "}";
                                rc=true;
                               }
                            }
                            catch(Exception e){}
                           
                            
                            json = json +"]\n";

                            json = json +"}";
                           // System.out.print("ag");                          
                            out.print(json);
                            out.close();
    conexiondb.Close();

        %>