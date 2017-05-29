<%-- 
    Document   : carga_medicamentos_no_pos
    Created on : 14/08/2013, 07:42:49 PM
    Author     : Emmanuel
--%>



<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<%@page import="java.sql.*" %>
<%@page import="pac.conexion" %>
<%@page import="java.util.Date"%>


  <%
                            String sln=""+request.getParameter("sln")+"";
                            int start=0;
                            int total=0;
                            int total_pages =0;

                            int intpage = new Integer(request.getParameter("page"));
                            int limit = new Integer(request.getParameter("rows"));

                            String sidx = request.getParameter("sidx");
                            String sord = request.getParameter("sord");
                          
                            String strQuery0="";
                            String strQuery="";
                            String json ="";
                            String json2 ="";

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
                                                
                                                
                                                if(campo.compareTo("d0")==0){campo="v.descripcion";}
                                                else if(campo.compareTo("d1")==0){campo="f.descripcion";}
                                                else if(campo.compareTo("d2")==0){campo="concat(m.concentracion,' ',u.descripcion)";}
                                                
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
                              
                            /*-----------------------------------Conexión a la base de datos MySql-------------------------------------------*/
                            conexion  conexiondb = new conexion();
                            conexiondb.Conectar();
                            /*-----------------------------------------------------------------------------------------------------------*/

                            
                            String where2="";
                            strQuery0="select s.id_soli_no_post as cod,ADDDATE(max(a.fecha_fin), INTERVAL 3 MONTH) as fmax from soli_no_post s,autorizacion_no_pos a where s.id_soli_no_post=a.id_soli_no_post and s.re_solicitada<1 and a.idpaciente_apro='"+session.getAttribute("serial_pacinete")+"' group by s.id_soli_no_post";
                            ResultSet rs0 = null;
                            rs0 = conexiondb.Consulta(strQuery0);
                            while(rs0.next()){  
                                             String cod_s_n_p = ""+rs0.getString("cod");
                                             String fecha     = ""+rs0.getString("fmax");
                                             
                                             Date fechas = new java.util.Date();//esta seria la fecha del sistema 
                                             SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
                                             Date fechaa = null;
                                             try {fechaa = formatoDelTexto.parse(fecha);} //esta seria la fecha de finalizacion de la autorizacion sacada de la base de datos
                                             catch (Exception ex) {}  
                                              if (fechaa.before(fechas)){
                                                //  System.out.print(fechaa+" "+fechas);
                                                  where2=where2+" and s.id_soli_no_post != '"+cod_s_n_p+"' ";
                                                            //    out.print("la fecha sumada es menor o igual a la actual ");  
                                                                         }                                                                   
                                             }
                            
                            // finaliza busqueda
                            boolean rc;

                            ResultSet rs = null;

                            if(sidx ==""){
                                sidx ="1";
                            }
                   
                            int total0=0;
                            String cuenta = "select s.id_soli_no_post,s.nom_generc_uno,s.nom_generc_dos,s.nom_generc_tres,ADDDATE(max(a.fecha_fin), INTERVAL 3 MONTH) as fmax from soli_no_post s,autorizacion_no_pos a where s.id_soli_no_post=a.id_soli_no_post and s.re_solicitada<1 and a.idpaciente_apro='"+session.getAttribute("serial_pacinete")+"' "+where2+" "+where+"  group by s.id_soli_no_post ORDER BY "+sidx + " " +sord +" LIMIT "+start+" , "+limit;
                            ResultSet rs0c = null;
                            rs0c = conexiondb.Consulta(cuenta);
                            while(rs0c.next()){ total0++;   }
                    //   total = conexiondb.countRec("s.id_soli_no_post", " soli_no_post s,autorizacion_no_pos a where s.id_soli_no_post=a.id_soli_no_post and a.idpaciente_apro='"+session.getAttribute("serial_pacinete")+"' "+where2+" "+where+"  group by s.id_soli_no_post ");
                           total=total0;
                            
                            
                            if( total>0 ) {
                                double d = Math.ceil( (double)(total) / (double)(limit) );
                                total_pages = (int)(d);
                            } 
                            else { total_pages = 0;}

                            if (intpage > total_pages) {intpage=total_pages; }

                            start = limit * intpage - limit; 

                            if(start < 0 ){ start = 0; }

                            strQuery = "select s.id_soli_no_post,s.nom_generc_uno,s.nom_generc_dos,s.nom_generc_tres,ADDDATE(max(a.fecha_fin), INTERVAL 3 MONTH) as fmax from soli_no_post s,autorizacion_no_pos a where s.id_soli_no_post=a.id_soli_no_post and s.re_solicitada<1 and a.idpaciente_apro='"+session.getAttribute("serial_pacinete")+"' "+where2+" "+where+"  group by s.id_soli_no_post ORDER BY "+sidx + " " +sord +" LIMIT "+start+" , "+limit;
                         // System.out.println(strQuery);
                            
                            rs = conexiondb.Consulta(strQuery);

                            //total = conexiondb.countRec("s.id_soli_no_post", " soli_no_post s,autorizacion_no_pos a where s.id_soli_no_post=a.id_soli_no_post and a.idpaciente_apro='"+session.getAttribute("serial_pacinete")+"' "+where2+" "+where+"  group by s.id_soli_no_post ");
                            total=total0; 
                            
                            
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
                                            if(rc){ json = json + ",";   }                                
                                            json = json + "\n{";
                                            json = json + "\"id\":\""+rs.getInt("id_soli_no_post")+"\",";
                                            json = json + "\"cell\":["+rs.getInt("id_soli_no_post")+""; 
                                            json = json + ",\""+rs.getString("nom_generc_uno")+"\"";  
                                            json = json + ",\""+rs.getString("nom_generc_dos")+"\"";  
                                            json = json + ",\""+rs.getString("nom_generc_tres")+"\"";  
                                            json = json + ",\""+rs.getString("fmax")+"\"]";
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