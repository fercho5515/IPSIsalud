
<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="pac.conecta_bd"%>
<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <% 
         request.setCharacterEncoding("UTF-8");
         String txt="";
         
         if(session.getAttribute("nombre")==null || session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){}
         else{
             if(session.getAttribute("id_paq")==null || "0".compareTo(""+session.getAttribute("id_paq")+"")==0 ){
               txt="Seleccione paquete";
             }
             else{
              try{  
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
                
                String sql="INSERT INTO `ips_isalud`.`med_paq_int`(`cod_paq_int`,`cod_med`,`cod_tari`,`id_lab`) VALUES ('"+ session.getAttribute("id_paq") +"','"+request.getParameter( "id_medic" )+"','"+request.getParameter( "id_tari" )+"','"+request.getParameter( "id_labo" )+"');";
              //out.print(sql);
                if(ba.transaccion(sql)){txt="Insertado Exitosamente";}
                else{txt="Fallo al Crear ";}
                ba.cerrar();  
                               }
              catch(Exception e){txt="Fallo al Crear ";}
              }
             }
         
                    
           response.setContentType("text/x-json");
           response.setCharacterEncoding("utf-8");
           response.setHeader("Pragma", "no-cache");
           response.setHeader("Cache-Control", "no-cache, must-revalidate");
           response.setHeader("Pragma", "no-cache");
           String json= "{ \"msj\":\""+txt+"\" }";
           out.print(json);
           out.close();
         
        %>
    