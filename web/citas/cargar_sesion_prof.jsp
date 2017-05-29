
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
         String dato= request.getParameter("dato");
         sesion.setAttribute("id_medico",dato);
        // out.print(sesion.getAttribute("id_medico"));
        // out.print("<br>");
         String dato2= request.getParameter("dato2");
         sesion.setAttribute("fecha_cita",dato2);
        // out.print(sesion.getAttribute("fecha_cita"));
        // out.print("<br>");
         String dato3= request.getParameter("dato3");
         sesion.setAttribute("contratin",dato3);
        // out.print(sesion.getAttribute("contratin"));
        // out.print("<br>");
         String dato4= request.getParameter("dato4");
         sesion.setAttribute("id_paciente",dato4);
        // out.print(sesion.getAttribute("id_paciente"));
        %>
    </body>
</html>
