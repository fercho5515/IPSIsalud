<%-- 
    Document   : insert_proctari_porc
    Created on : 19-jun-2013, 19:44:19
    Author     : Andrea
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
        <% request.setCharacterEncoding("UTF-8");%>
        <%
            if (session.getAttribute("nombre") == null || session.getAttribute("clave") == null || session.getAttribute("id") == null || session.getAttribute("permiso") == null) {
            } else {
                try {
                    conecta_bd ba = new conecta_bd();
                    ba.ConectaDb();
                    String sql = "INSERT INTO `ips_isalud`.`procedimientos_cont`(`id_contrato`,`cod_activ`,`cod_tarifario`,`porcentaje`) VALUES ('" + session.getAttribute("id_contratacion") + "','" + request.getParameter("id_procedcont") + "','" + request.getParameter("id_taricont") + "','" + request.getParameter("porcentaje") + "');";
                //    out.print(sql);

                    if (ba.transaccion(sql)) {
                        out.println("<center><h2 style='color:green'>Operación realizada satisfactoriamente</h2></center>");
                    } else {
                        out.println("<center><h2 style='color: red'>No se pudo insertar, revisa si el procedimiento ya esta en el tarifario</h2></center>");
                    }
                    ba.cerrar();

                } catch (Exception e) {
                    out.println("<center><h2 style='color: red'>Ocurrió un error al agregar procedimiento </h2></center>");
                }
            }
        %>

    </body>
</html>
