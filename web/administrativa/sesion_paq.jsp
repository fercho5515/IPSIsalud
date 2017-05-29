<%-- 
    Document   : sesion_paq
    Created on : 25-jun-2013, 11:21:19
    Author     : Andrea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <% request.setCharacterEncoding("UTF-8");
            if (session.getAttribute("nombre") == null || session.getAttribute("clave") == null || session.getAttribute("id") == null || session.getAttribute("permiso") == null) {
        %>

    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>    

    <%
            out.println("</body></html>");
            return;
        }
        request.setCharacterEncoding("UTF-8");
        HttpSession sesion = request.getSession();
        String dato = request.getParameter("pcod");
        sesion.setAttribute("id_paq", dato);
       // out.print(sesion.getAttribute("id_paq"));
    %>
    </body>
</html>
