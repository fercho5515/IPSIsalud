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
         sesion.setAttribute("tarifariomed",dato);
        // out.print(sesion.getAttribute("tarifario"));
        %>
    </body>
</html>
