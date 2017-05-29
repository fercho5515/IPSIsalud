<%-- 
    Document   : carga_labor
    Created on : 18/11/2013, 08:57:09 PM
    Author     : servidor
--%>


<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<%@page import="java.sql.*" %>
<%@page import="pac.conexion" %>


  <%                        request.setCharacterEncoding("UTF-8");
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
                                                String ope = (String) jsonObject2.get("op");
                                                String dato = (String) jsonObject2.get("data");
                                                
                                                     if(campo.compareTo("pac")==0){campo=" concat(per.p_nom,' ',per.s_nom,' ',per.p_ape,' ',per.s_ape) ";}
                                                else if(campo.compareTo("fecha")==0){campo="co.fecha";}
                                                else if(campo.compareTo("consu")==0){campo="c.descripcion";}
                                                else if(campo.compareTo("codigo")==0){campo="co.id_consulta";
                                                     if(dato.length()>12){dato=dato.substring(0,12);}
                                                         try{
                                                             int datoi=Integer.parseInt(dato);
                                                                 dato=""+datoi+"";
                                                             }
                                                         catch(Exception exe){}
                                                }
                                                dato =dato.replace(" ","%");
                                                
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

                           
                            int total0=0;
                            String cuenta = "select distinct(co.id_consulta) as id from agenda a,procedimientos_tari p,cups c,consulta_medica co,personas per,labs_sol l where co.id_consulta=a.id_consulta and a.id_procedimiento=p.idprocedimientos_tari and p.cod_cups=c.id_cups   and (a.id_permiso='1' or a.id_permiso='2' or a.id_permiso='3') and co.id_consulta=l.id_consulta and co.id_estado_consulta='3' and co.serial_historia=per.serial "+where+" ";
                            ResultSet rs0c = null;
                            rs0c = conexiondb.Consulta(cuenta);
                            while(rs0c.next()){ total0++;   }
                    //   total = conexiondb.countRec("s.id_soli_no_post", " soli_no_post s,autorizacion_no_pos a where s.id_soli_no_post=a.id_soli_no_post and a.idpaciente_apro='"+session.getAttribute("serial_pacinete")+"' "+where2+" "+where+"  group by s.id_soli_no_post ");
                           total=total0;
                            
                            
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

                            strQuery = "select distinct(co.id_consulta) as id,date(co.fecha) as fecha,per.p_nom as p1,per.s_nom as p2,per.p_ape as p3,per.s_ape as p4,c.descripcion as descripcion from agenda a,procedimientos_tari p,cups c,consulta_medica co,personas per,labs_sol l where co.id_consulta=a.id_consulta and a.id_procedimiento=p.idprocedimientos_tari and p.cod_cups=c.id_cups   and (a.id_permiso='1' or a.id_permiso='2' or a.id_permiso='3') and co.id_consulta=l.id_consulta and co.id_estado_consulta='3' and co.serial_historia=per.serial "+where+" ORDER BY "+sidx + " " +sord +" LIMIT "+start+" , "+limit;
                        //    System.out.println(strQuery);
                            
                            rs = conexiondb.Consulta(strQuery);
                            
                            total = total0;
                             
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
                                json = json + "\"id\":\""+rs.getInt("id")+"\",";
                                json = json + "\"cell\":["+rs.getInt("id")+"";
                                json = json + ",\""+rs.getString("id")+"\"";
                                json = json + ",\""+rs.getString("fecha")+"\"";
                                json = json + ",\""+rs.getString("p1")+" "+rs.getString("p2")+" "+rs.getString("p3")+" "+rs.getString("p4")+"\"";                                
                                json = json + ",\""+rs.getString("descripcion")+"\"]";
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