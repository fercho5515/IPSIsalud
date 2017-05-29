<%-- 
    Document   : carga_pacientes
    Created on : 29/04/2013, 10:37:43 AM
    Author     : EMMANUEL
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
                         
                         String idhist="-1";
                         String idtipo="-1";
                         String historia="";
                         String sqt0="";
                         String sqt1="";
                         String sqtt="";
                         
                         String wher="";
                          if(request.getParameter("hist")!=null ){idhist=request.getParameter("hist");} 
                          if(request.getParameter("idtipo")!=null ){idtipo=request.getParameter("idtipo");} 
                                                  
                         String sql1="select co.id_consulta as d1,c.descripcion as d2,pe.p_nom as d3,pe.s_nom as d4,pe.p_ape as d5,pe.s_ape as d6,co.fecha as d7 from consulta_medica co,agenda a,cups c,procedimientos_tari p,personas pe where a.id_procedimiento=p.idprocedimientos_tari and p.cod_cups=c.id_cups and co.id_consulta=a.id_consulta and co.id_medico=pe.serial and co.serial_historia = '"+idhist+"' and a.id_permiso='"+idtipo+"' and id_estado_consulta='3' ";    
                         String sq10="co.id_consulta"; String sq11="consulta_medica co,agenda a,cups c,procedimientos_tari p,personas pe where a.id_procedimiento=p.idprocedimientos_tari and p.cod_cups=c.id_cups and co.id_consulta=a.id_consulta and co.id_medico=pe.serial and co.serial_historia = '"+idhist+"' and a.id_permiso='"+idtipo+"' and id_estado_consulta='3' ";
                         
                         String sql2="select co.id_consulta as d1,c.descripcion as d2,pe.p_nom as d3,pe.s_nom as d4,pe.p_ape as d5,pe.s_ape as d6,co.fecha as d7 from consulta_nutri co,agenda a,cups c,procedimientos_tari p,personas pe where a.id_procedimiento=p.idprocedimientos_tari and p.cod_cups=c.id_cups and co.id_consulta=a.id_consulta and co.profecional=pe.serial and co.id_historia = '"+idhist+"'  and a.id_permiso='"+idtipo+"' and guardado='1' ";
                         String sq20="co.id_consulta"; String sq21="consulta_nutri co,agenda a,cups c,procedimientos_tari p,personas pe where a.id_procedimiento=p.idprocedimientos_tari and p.cod_cups=c.id_cups and co.id_consulta=a.id_consulta and co.profecional=pe.serial and co.id_historia = '"+idhist+"' and guardado='1' ";
                         
                         String sql3="select co.id_consulta as d1,c.descripcion as d2,pe.p_nom as d3,pe.s_nom as d4,pe.p_ape as d5,pe.s_ape as d6,co.fecha as d7 from consulta_psico co,agenda a,cups c,procedimientos_tari p,personas pe where a.id_procedimiento=p.idprocedimientos_tari and p.cod_cups=c.id_cups and co.id_consulta=a.id_consulta and co.id_profecional=pe.serial and co.id_historia = '"+idhist+"' and (a.id_permiso='5' or a.id_permiso='14') and guardado='3'";
                         String sq30="co.id_consulta"; String sq31="consulta_psico co,agenda a,cups c,procedimientos_tari p,personas pe where a.id_procedimiento=p.idprocedimientos_tari and p.cod_cups=c.id_cups and co.id_consulta=a.id_consulta and co.id_profecional=pe.serial and co.id_historia = '"+idhist+"' and (a.id_permiso='5' or a.id_permiso='14') and guardado='3'";
                         
                         String sql4="select co.id_consulta_trabajo_social as d1,c.descripcion as d2,pe.p_nom as d3,pe.s_nom as d4,pe.p_ape as d5,pe.s_ape as d6,co.fecha_real as d7 from consulta_trabajo_social co,agenda a,cups c,procedimientos_tari p,personas pe where a.id_procedimiento=p.idprocedimientos_tari and p.cod_cups=c.id_cups and co.id_consulta_trabajo_social=a.id_consulta and co.id_profecional=pe.serial and co.id_historia = '"+idhist+"' and  (a.id_permiso='6' or a.id_permiso='15') and guardado='1'";
                         String sq40="co.id_consulta_trabajo_social"; String sq41="consulta_trabajo_social co,agenda a,cups c,procedimientos_tari p,personas pe where a.id_procedimiento=p.idprocedimientos_tari and p.cod_cups=c.id_cups and co.id_consulta_trabajo_social=a.id_consulta and co.id_profecional=pe.serial and co.id_historia = '"+idhist+"' and  (a.id_permiso='6' or a.id_permiso='15') and guardado='1'";
                         
                         
                               if(idtipo.compareTo("1")==0){sqt0=sq10;sqt1=sq11; sqtt=sql1;sidx="co.fecha";}
                          else if(idtipo.compareTo("2")==0){sqt0=sq10;sqt1=sq11; sqtt=sql1;sidx="co.fecha";}
                          else if(idtipo.compareTo("3")==0){sqt0=sq10;sqt1=sq11; sqtt=sql1;sidx="co.fecha";}
                          else if(idtipo.compareTo("4")==0){sqt0=sq20;sqt1=sq21; sqtt=sql2;sidx="co.fecha";}
                          else if(idtipo.compareTo("5")==0){sqt0=sq30;sqt1=sq31; sqtt=sql3;sidx="co.fecha";}
                          else if(idtipo.compareTo("6")==0){sqt0=sq40;sqt1=sq41; sqtt=sql4;sidx="co.fecha_real";}
                                                 
                            
                             total = conexiondb.countRec(sqt0, sqt1+" "+where+"");
                        //     System.out.println("total "+total);
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

                            strQuery = sqtt+" "+where+" ORDER BY "+sidx + " " +sord +" LIMIT "+start+" , "+limit;
                        //out.println(strQuery);
                            
                            rs = conexiondb.Consulta(strQuery);
                            
                         
                        //    total = conexiondb.countRec(sqt0, sqt1+" "+where+"");
                        //    System.out.println("total2 "+total);
                             
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
                                String nom=""+rs.getString("d3")+" "+rs.getString("d4")+" "+rs.getString("d5")+" "+rs.getString("d6")+"";
                                json = json + "\n{";
                                json = json + "\"id\":\""+rs.getInt("d1")+"\",";
                                json = json + "\"cell\":["+rs.getInt("d1")+"";
                                
                                 int formu=0;
                                 formu = conexiondb.countRec("serial","formula_medica where id_consulta='"+rs.getInt("d1")+"'");
                                
                                json = json + ",\""+idtipo+"\"";                                
                                json = json + ",\""+rs.getString("d2")+"\"";                             
                                json = json + ",\""+nom+"\"";                           
                                json = json + ",\""+rs.getString("d7")+"\"";
                                json = json + ",\""+formu+"\"]";
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

