<%-- 
    Document   : carga_recomendaciones
    Created on : 4/09/2013, 08:37:47 PM
    Author     : Emmanuel
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
                          // System.out.println(where);
                            
                            
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

                            total = conexiondb.countRec("r.id_recom", "recomendacion r,permisos p,personas p1 where r.id_medico_recom=p1.serial and r.permiso_med_recom=p.id_permi and r.id_paciente='"+session.getAttribute("serial_pacinete")+"' and (id_para_quien='6' or id_para_quien='15' ) and leida='0' "+where+"");
                           // System.out.print("aa");
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

                            strQuery = "select r.id_recom,r.descripcion as d1,p1.p_nom,p1.s_nom,p1.p_ape,p1.s_ape,p.descripcion as d2,r.fecha from recomendacion r,permisos p,personas p1 where r.id_medico_recom=p1.serial and r.permiso_med_recom=p.id_permi and r.id_paciente='"+session.getAttribute("serial_pacinete")+"' and (id_para_quien='6' or id_para_quien='15' ) and leida='0' "+where+" ORDER BY "+sidx + " " +sord +" LIMIT "+start+" , "+limit;
                           // System.out.println(strQuery);
                            
                            rs = conexiondb.Consulta(strQuery);
                         //   System.out.print("ac");
                          //  total = conexiondb.countRec("r.id_recom", "recomendacion r,permisos p,personas p1 where r.id_medico_recom=p1.serial and r.permiso_med_recom=p.id_permi and r.id_paciente='"+session.getAttribute("serial_pacinete")+"' and (id_para_quien='6' or id_para_quien='15' ) and leida='0' "+where+"");
                        
                            
                           //    System.out.print("af");
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
                                String nom="";
                                if(rs.getString("p_nom")!=null && rs.getString("p_nom").compareTo("null")!=0){nom=rs.getString("p_nom");}
                                if(rs.getString("s_nom")!=null && rs.getString("s_nom").compareTo("null")!=0){nom=nom+" "+rs.getString("s_nom");}
                                if(rs.getString("p_ape")!=null && rs.getString("p_ape").compareTo("null")!=0){nom=nom+" "+rs.getString("p_ape");}
                                if(rs.getString("s_ape")!=null && rs.getString("s_ape").compareTo("null")!=0){nom=nom+" "+rs.getString("s_ape");}
                                
                                json = json + "\n{";
                                json = json + "\"id\":\""+rs.getInt("id_recom")+"\",";
                                json = json + "\"cell\":["+rs.getInt("id_recom")+"";
                                json = json + ",\""+rs.getString("d1")+"\""; 
                                json = json + ",\""+rs.getString("d2")+"\"";                                 
                                json = json + ",\""+rs.getString("fecha")+"\"";                                     
                                json = json + ",\""+nom+"\"]";
                                json = json + "}";

                                rc=true;
                            }
                            
                            }
                            catch(Exception e){}
                           
                            
                            
                            json = json +"]\n";

                            json = json +"}";
                          //   System.out.print("ag");                          
                            out.print(json);
                            out.close();

conexiondb.Close();
        %>