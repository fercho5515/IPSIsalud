<%-- 
    Document   : cierra_sesion
    Created on : 20/02/2013, 01:10:25 PM
    Author     : EMMANUEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <script type="text/javascript"  language="javascript" >
                    location.href="index.jsp";                     
                </script>

        <title>JSP Page</title>
    </head>
    <body>
        
        <%
          session.invalidate();
        %>
         <script type="text/javascript"  language="javascript" >
                 volver();
             </script>
    </body>
</html>
