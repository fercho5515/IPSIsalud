<%-- 
    Document   : quita_signo_fisico
    Created on : 15/10/2013, 11:53:27 AM
    Author     : Emmanuel
--%>

<%-- 
    Document   : crear_signo_fisico
    Created on : 24-feb-2013, 23:37:38
    Author     : Fercho
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
                
                int id = Integer.parseInt(request.getParameter("idsbs"));
                
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
                String sql="DELETE FROM `ips_isalud`.`histo_subsig` WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"' and`id_sub_sig`='"+id+"';";
             //   System.out.print("dfggfgfg "+sql);
                ba.transaccion(sql);
                ba.cerrar();           

               }
        %>
    </body>
</html>
