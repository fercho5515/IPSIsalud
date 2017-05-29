<%-- 
    Document   : borra
    Created on : 27/11/2013, 07:35:08 PM
    Author     : servidor
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
                 String  id=""+request.getParameter("id");
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
               
                               
                String  sql="DELETE FROM `ips_isalud`.`resolucion_dian` WHERE `id_resolucion_dian`='"+id+"' ";
                ba.transaccion(sql);
                
                ba.cerrar();           
             // System.out.print("borra resu img: "+sql+" \n sql2 "+sql2);
               }
        %>
       
    </body>
</html>
