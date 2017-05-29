<%-- 
    Document   : crea_antecedente_personal
    Created on : 22/02/2013, 12:24:29 PM
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
          
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){}
         else{
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
                String   nom_pac = request.getParameter("paquete_pac");
                String   id_cont = request.getParameter("id_cont");
                String valor_pac = request.getParameter("valor_pac");

                String sql="INSERT INTO `paquete_int` (`id_contratacion`, `valor_pac`, `nombre`) VALUES ('"+id_cont+"','"+valor_pac+"','"+nom_pac+"');";  
        
               // String sql="INSERT INTO `antecedentes_personales` (`id_historia_clinica`, `id_tipo_antecedente`, `descripcion`, `fecha`, `edad`,`id_empleado`) VALUES ('"+(String)session.getAttribute("serial_pacinete")+"','"+request.getParameter( "tipo_antecedente" )+"','"+request.getParameter( "descripcion_ant" )+"', curdate(), '"+request.getParameter( "edad_ant" )+"','"+(String)session.getAttribute("id")+"');";
                ba.transaccion(sql);
                ba.cerrar();           

               }
        %>
    </body>
</html>

