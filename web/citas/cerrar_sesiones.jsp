
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
         HttpSession sesion=request.getSession();
         sesion.setAttribute("id_medico",null);
         out.print(sesion.getAttribute("null"));
         out.print("<br>");
         sesion.setAttribute("fecha_cita",null);
         out.print(sesion.getAttribute("null"));
         out.print("<br>");
         sesion.setAttribute("contratin",null);
         out.print(sesion.getAttribute("null"));
         out.print("<br>");
         sesion.setAttribute("id_paciente",null);
         out.print(sesion.getAttribute("id_paciente"));
        %>
    </body>
</html>

