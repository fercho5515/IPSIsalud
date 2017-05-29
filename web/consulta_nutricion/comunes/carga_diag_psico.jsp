<%-- 
    Document   : carga_diag_psico
    Created on : 14/09/2013, 10:11:46 AM
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
                                                
                                                
                                                if(campo.compareTo("d2")==0){campo="s.descripcion";}
                                                else if(campo.compareTo("d1")==0){campo="c.descripcion";}
                                                
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

                             total = conexiondb.countRec("imp.id_subcie ", " impre_diagno_psico imp,tipo__diagnostico t,causa_externa ce,sub_cie10 s where imp.id_subcie=s.id_subcie10 and imp.id_tipo_diagnostico=t.idtipodiag and imp.causa_externa=ce.idcausa and id_consulta_psico='"+session.getAttribute("serial_consulta")+"' "+where+"");
                           
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

                            strQuery = "select imp.id_subcie,s.descripcion as d1,t.descripcion as d2,ce.descripcion as d3,imp.descrip from impre_diagno_psico imp,tipo__diagnostico t,causa_externa ce,sub_cie10 s where imp.id_subcie=s.id_subcie10 and imp.id_tipo_diagnostico=t.idtipodiag and imp.causa_externa=ce.idcausa and id_consulta_psico='"+session.getAttribute("serial_consulta")+"' "+where+" ORDER BY "+sidx + " " +sord +" LIMIT "+start+" , "+limit;
      // System.out.println(strQuery);
                            
                            rs = conexiondb.Consulta(strQuery);

                           // total = conexiondb.countRec("imp.id_subcie ", " impre_diagno_psico imp,tipo__diagnostico t,causa_externa ce,sub_cie10 s where imp.id_subcie=s.id_subcie10 and imp.id_tipo_diagnostico=t.idtipodiag and imp.causa_externa=ce.idcausa and id_consulta_psico='"+session.getAttribute("serial_consulta")+"' "+where+"");
                            
                             
                            
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
                          
                            int num=1;
                            String estado="";
                            try{
                            while(rs.next()){
                                
                                if(rc){
                                    json = json + ",";
                                }
                                if(num==1){estado="DX Princial";}
                                else if(num==2){estado="DX uno";}
                                else if(num==3){estado="DX dos";}
                                else if(num==4){estado="DX tres";}
                                
                                json = json + "\n{";
                                json = json + "\"id\":\""+num+"\",";
                                json = json + "\"cell\":["+num+"";
                                json = json + ",\""+estado+"\""; 
                                json = json + ",\""+rs.getString("id_subcie")+"\""; 
                                json = json + ",\""+rs.getString("d1")+"\"";  
                                json = json + ",\""+rs.getString("d2")+"\"";  
                                json = json + ",\""+rs.getString("d3")+"\"";  
                                json = json + ",\""+rs.getString("descrip")+"\"]";
                                json = json + "}";

                                rc=true;
                                num++;
                            }
                            
                            }
                            catch(Exception e){}
                           
                            
                            
                            json = json +"]\n";

                            json = json +"}";

                            out.print(json);
                            out.close();

conexiondb.Close();
        %>
