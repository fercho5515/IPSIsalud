<%-- 
    Document   : edad
    Created on : 8/04/2013, 08:20:34 PM
    Author     : EMMANUEL
--%>
<%@page import="pac.edad"%>
<%@page import="java.util.*" session="true" %>
<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <% request.setCharacterEncoding("UTF-8");
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     <% 
        out.println("</body></html>");
        return;
        }
         edad ed= new edad();
         String e=ed.edad(""+request.getParameter("dato")+"");
     %>  
        <input type="text" name="edad" size="13" id="edad" maxlength="30" readonly value="<% out.print(e); %>" style="width:100%">
    </body>
</html>
