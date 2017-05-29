<%-- 
    Document   : cargaunidad
    Created on : 13-mar-2013, 11:27:49
    Author     : Fercho
--%>

<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body >
        <%
            if (session.getAttribute("nombre") == null || session.getAttribute("clave") == null || session.getAttribute("id") == null || session.getAttribute("permiso") == null) {
            } else {
                try {
                    conecta_bd ba = new conecta_bd();
                    ba.ConectaDb();
                    String sql = "INSERT INTO `ips_isalud`.`unidad_medida`(`descripcion`) VALUES ('" + request.getParameter("nuevaunidad") + "');";
                    if (ba.transaccion(sql)) {
                        out.println("<br>Insertado Exitosamente");
                    } else {
                        out.println("<br>Fallo al Crear");
                    }
                    ba.cerrar();
                } catch (Exception e) {
                    out.println("<br>Fallo");
                }
            }
        %>

    </body>
</html>

