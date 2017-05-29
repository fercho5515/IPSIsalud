<%-- 
    Document   : agrega_tarifario
    Created on : 25/03/2013, 02:27:47 PM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <%
           request.setCharacterEncoding("UTF-8");      
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null ){}
         else{
               try{
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
                String sql=" INSERT INTO `ips_isalud`.`tarifarios` (`cod_tarifario`, `nombre`, `fecha_creacion`, `activo`) VALUES ('"+request.getParameter("codi")+"', '"+request.getParameter("nombre")+"',now(),'1');";
     // System.out.println("cre a p "+sql);           
                if(ba.transaccion(sql)){out.print(" <h2 style='color:green'>Tarifario creado con exito</h2><br> ");
                                        String sqlh="insert into historial_c (id_empleado,fecha_hora,descripcion) values ('"+session.getAttribute("id")+"',now(),'crea tarifario "+request.getParameter("nombre")+" con codigo de tarifario "+request.getParameter("codi")+"');";

                                        try{ if(ba.transaccion(sqlh)==true){ } }
                                        catch(Exception e){}  
                                        }
                               else{out.print(" <h2 style='color:red'>Fallo al crear Tarifario</h2><br>  ");}
               
                ba.cerrar();
                }
               catch(Exception exe){
                 %>  
                 <h2 style='color:red'>Fallo al crear Tarifario</h2><br>                   
                 <%  
                 }
               }
        %>
    </body>
</html>
