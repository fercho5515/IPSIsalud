<%-- 
    Document   : consu_formula
    Created on : 18-mar-2014, 11:12:18
    Author     : MiPc
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                     conecta_bd ba = new conecta_bd();
                                ba.ConectaDb();
                                String dto=request.getParameter("dato");
                                String dto2=request.getParameter("dato2");
                                out.print("<input type='hidden' name='id_formula' id='id_formula' value='"+dto+"'>");
                                out.print("<input type='hidden' name='id_consulta' id='id_consulta' value='"+dto2+"'>");
                         ba.cerrar();
        %>
    </body>
</html>