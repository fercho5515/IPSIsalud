
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
                                                  else if(ope.compareTo("bw")==0){ where=where+" "+campo+" like '"+dato+"%'"; }  // comienza con
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
                         //  System.out.println(where);
                            
                            
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
                            String id = request.getParameter("id");
                            total = conexiondb.countRec("i.serial", " inventario_farmacia i, medicamentos m,forma_farmaceutica ff,via_admin v,lab_farmaceutico lf, unidad_medida um  where "
                                                                    + "i.laboratorio= lf.idlab_farmaceutico and i.cod_medicamento=m.serial and ff.id_forma_farmaceutica=m.forma_farmaceutica and m.unidad_medida =um.id_unidad_medida "
                                                                    + "and v.id_via_admin=m.via_administracion and "
                                                                    + "(i.serial_inven in (select i.serial_inven from inventario_farmacia i,medica_cont mc where "
                                                                    + "i.laboratorio=mc.id_lab and i.cod_medicamento=mc.cod_med  and "
                                                                    + "i.fecha_fab<=curdate() and i.fecha_ven>=curdate() and i.existencias>0 and " 
                                                                    + "mc.cod_contra = (select a.id_contrato from agenda a, consulta_medica c where (a.id_consulta=c.id_consulta or c.id_agenda=a.id_agenda) and c.id_consulta="+id+" limit 1) "
                                                                    + ") or "
                                                                    + "i.serial_inven in (select i.serial_inven from inventario_farmacia i,med_paq_int mp where "
                                                                    + "i.laboratorio=mp.id_lab and i.cod_medicamento=mp.cod_med   and "
                                                                    + "i.fecha_fab<=curdate() and i.fecha_ven>=curdate() and i.existencias>0  and " 
                                                                    + "mp.cod_paq_int =(select a.id_paquete from agenda a, consulta_medica c where (a.id_consulta=c.id_consulta or c.id_agenda=a.id_agenda) and c.id_consulta="+id+" limit 1)) "
                                                                    + ") "
                                                                    + " "+where);
                            
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
                            
                            
                            strQuery = "select i.serial_inven,m.serial,i.cod_barras,m.producto, m.cod_atc, m.cum,ff.descripcion as f1,v.descripcion as v1,m.concentracion,m.presentacion,i.valor_compra,i.existencias,lf.nombre as lab,i.fecha_fab,i.fecha_ven,i.ubicacion,i.lote,um.descripcion as unidadmedida "
                                     + "from inventario_farmacia i, medicamentos m,forma_farmaceutica ff,via_admin v,lab_farmaceutico lf, unidad_medida um  where "
                                     + "i.laboratorio= lf.idlab_farmaceutico and i.cod_medicamento=m.serial and ff.id_forma_farmaceutica=m.forma_farmaceutica and m.unidad_medida =um.id_unidad_medida "
                                     + "and v.id_via_admin=m.via_administracion and "
                                     + "(i.serial_inven in (select i.serial_inven from inventario_farmacia i,medica_cont mc where "
                                     + "i.laboratorio=mc.id_lab and i.cod_medicamento=mc.cod_med  and "
                                     + "i.fecha_fab<=curdate() and i.fecha_ven>=curdate() and i.existencias>0 and " 
                                     + "mc.cod_contra = (select a.id_contrato from agenda a, consulta_medica c where (a.id_consulta=c.id_consulta or c.id_agenda=a.id_agenda) and c.id_consulta="+id+" limit 1) "
                                     + ") or "
                                     + "i.serial_inven in (select i.serial_inven from inventario_farmacia i,med_paq_int mp where "
                                     + "i.laboratorio=mp.id_lab and i.cod_medicamento=mp.cod_med   and "
                                     + "i.fecha_fab<=curdate() and i.fecha_ven>=curdate() and i.existencias>0  and " 
                                     + "mp.cod_paq_int =(select a.id_paquete from agenda a, consulta_medica c where (a.id_consulta=c.id_consulta or c.id_agenda=a.id_agenda) and c.id_consulta="+id+" limit 1)) "
                                     + ") "
                                     + " "+where+" ORDER BY "+sidx + " " +sord +" LIMIT "+start+" , "+limit;
                           // System.out.println(strQuery+"\n");
                            
                            rs = conexiondb.Consulta(strQuery);
                            
                            
                            //System.out.println(total);
                            //System.out.print("af");
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
                            while(rs.next()){
                                
                                if(rc){
                                    json = json + ",";
                                }
                            
                                json = json + "\n{";
                                json = json + "\"id\":\""+rs.getInt("serial_inven")+"\",";
                                json = json + "\"cell\":["+rs.getInt("serial_inven")+"";
                                json = json + ",\""+rs.getString("serial")+"\"";  
                                json = json + ",\""+rs.getString("cod_barras")+"\"";  
                                json = json + ",\""+rs.getString("cod_atc")+"\"";                                
                                json = json + ",\""+rs.getString("cum")+"\"";                            
                                json = json + ",\""+rs.getString("producto")+"\"";  //nombre
                                json = json + ",\""+rs.getString("f1")+"\"";//forma
                                json = json + ",\""+rs.getString("concentracion")+"\""; //concentracion
                                json = json + ",\""+rs.getString("unidadmedida")+"\""; //unidad de medida
                                json = json + ",\""+rs.getString("v1")+"\"";//via administracion
                                json = json + ",\""+rs.getString("presentacion")+"\"";
                                json = json + ",\""+rs.getString("valor_compra")+"\"";
                                json = json + ",\""+rs.getString("existencias")+"\"";
                                json = json + ",\""+rs.getString("lab")+"\"";
                                json = json + ",\""+rs.getString("fecha_fab")+"\"";
                                json = json + ",\""+rs.getString("fecha_ven")+"\"";
                                json = json + ",\""+rs.getString("ubicacion")+"\"";
                                json = json + ",\""+rs.getString("lote")+"\"]";
                                json = json + "}";

                                rc=true;
                            }
                            
                            }
                            catch(Exception e){}
                           
                            
                            
                            json = json +"]\n";
                            json = json +"}";
                            out.print(json);
                            out.close();

conexiondb.Close();
        %>