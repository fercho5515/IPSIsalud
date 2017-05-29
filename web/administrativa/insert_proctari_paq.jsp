<%-- 
    Document   : insert_proctari_paq
    Created on : 07-jul-2013, 16:44:59
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
                    String sql = "INSERT INTO `ips_isalud`.`procedimientos_paquete`(`cod_paq_int`,`cod_actividad`,`cod_tarifario`,`tiempo_mesese`,`cantidad`) VALUES ('" + session.getAttribute("id_paq") + "','" + request.getParameter("id_procedcont") + "','" + request.getParameter("id_taricont") + "','" + request.getParameter("tiempo") + "','" + request.getParameter("cantidad") + "');";
                 //   out.print(sql);

                    if (ba.transaccion(sql)) {
                        out.println("<h2 style='color: green'>Procedimiento agregado </h2>");
                    } else {
                        out.println("<h2 style='color: red'>No se pudo insertar, revisa si el procedimiento ya esta en el paquete</h2>");
                    }
                    ba.cerrar();

                } catch (Exception e) {
                    out.println("<h2 style='color: red'>No se pudo insertar, revisa si el procedimiento ya esta en el tarifario</h2>");
                }
            }
        %>
    </body>
</html>

