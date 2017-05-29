<%-- 
    Document   : cargatarifarios_para_medicamento
    Created on : 19/02/2015, 04:32:43 PM
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


  <%                        request.setCharacterEncoding("UTF-8");
                            
                            conexion  conexiondb = new conexion();
                            conexiondb.Conectar();
                            
                            
                          String idmed=request.getParameter("idmed");
                         
                          String  strQuery = "SELECT DISTINCT t.id_tarifarios,t.nombre FROM `ips_isalud`.`tarifarios` as t,`ips_isalud`.`tari_med` as m where t.id_tarifarios=id_tari and m.id_med='"+idmed+"';";
                        //  out.println(strQuery);
                            
                          ResultSet rs = conexiondb.Consulta(strQuery);

                             /*
                            response.setContentType("text/x-json");
                            response.setCharacterEncoding("utf-8");
                            response.setHeader("Pragma", "no-cache");
                            response.setHeader("Cache-Control", "no-cache, must-revalidate");
                            response.setHeader("Pragma", "no-cache");
                            */
                            // String json ="[";
                            boolean rc =false;

                            out.print("<option value='0'>Seleccione</option>");
                            try{
                            while(rs.next()){
                                out.print("<option value='"+rs.getString("id_tarifarios")+"'>"+rs.getString("nombre")+"</option>");
                                
                                
                           /*     if(rc){
                                    json = json + ",";
                                }
                                json = json + "{\"id\",\""+rs.getString("id")+"\"";                                
                                json = json + ",\""+rs.getString("direccion")+"\"}";
                                rc=true;*/
                            }                           
                              //  json = json + "]";
                            }
                            catch(Exception e){}
                           
                            
                            conexiondb.Close();
                            
                            //out.print(json);
                            //out.close();


        %>
