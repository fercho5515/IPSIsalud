<%-- 
    Document   : index
    Created on : 2/03/2013, 06:59:18 PM
    Author     : EMMANUEL
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="sube_contraro.jsp" method="post" enctype="multipart/form-data"><br>
            nombre <input type="text" size="50" name="nombre"><br>
            archivo <input type="file" name="file"><br>
            <input type="submit" value="enviar" name="Subir" />
        </form>
    </body>
</html>
