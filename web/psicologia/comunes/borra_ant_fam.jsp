<%-- 
    Document   : borra_ant_lab
    Created on : 22/05/2013, 03:58:51 PM
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
                String  idant=""+request.getParameter("id_ant_f");
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
               
                String  sql="DELETE FROM `ips_isalud`.`antecedentes_familiares` WHERE `id_antecedentes_familiares`='"+idant+"' and `id_empleado`='"+session.getAttribute("id")+"' and`id_consulta`='"+session.getAttribute("serial_consulta")+"' and `id_permiso`='"+session.getAttribute("permiso")+"';";
                           
                ba.transaccion(sql);
                
                ba.cerrar();           
             // System.out.print("borra resu img: "+sql+" \n sql2 "+sql2);
               }
        %>
       
    </body>
</html>