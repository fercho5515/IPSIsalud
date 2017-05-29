<%-- 
    Document   : borra_soli_no_poss
    Created on : 10/07/2013, 07:16:52 PM
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
               
                String sql="DELETE FROM `ips_isalud`.`soli_no_post` WHERE `cod_consulta`='"+session.getAttribute("serial_consulta")+"';";
           
                if(ba.transaccion(sql)){out.print(" <input type='hidden' id='result_form3_nopos' name='result_form3_nopos' value='1'>");}
                else{out.print(" <input type='hidden' id='result_form3_nopos' name='result_form3_nopos' value='0'>");}
                ba.cerrar();           

               }
        %>
       
    </body>
</html>

