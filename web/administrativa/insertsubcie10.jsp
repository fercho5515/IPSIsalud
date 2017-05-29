<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% request.setCharacterEncoding("UTF-8");%>
        <%
            if (session.getAttribute("nombre") == null || session.getAttribute("clave") == null || session.getAttribute("id") == null || session.getAttribute("permiso") == null) {
                %><h2 style="color:red">Session expirada</h2><%
            } else {
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb();
                String emin = request.getParameter("edadmin");
                if (emin.compareTo("") == 0) {
                    emin = "null";
                    //out.print(emin);
                } else {
                    emin = "'" + emin + "'";
                }

                String emax = request.getParameter("edadmax");
                if (emax.compareTo("") == 0) {
                    emax = "null";
                    //out.print(emax);
                } else {
                    emax = "'" + emax + "'";
                }
                try {

                    String sql2 = "INSERT INTO `ips_isalud`.`sub_cie10`(`id_subcie10`,`cie10`,`descripcion`,`masc_fem`,`edad_minima`,`uni_edad_minima`,`edad_maxima`,`uni_edad_maxima`) VALUES ('" + request.getParameter("subcie10") + "','" + request.getParameter("cie10") + "','" + request.getParameter("diagnostico") + "','" + request.getParameter("sexo") + "'," + emin + ",'" + request.getParameter("edadmin2") + "'," + emax + ",'" + request.getParameter("edadmax2") + "');";
                    //out.print(sql2);
                    if (ba.transaccion(sql2)) {%><h2 style="color:green">Insertado Exitosamente</h2><%} else {%><h2 style="color:red">Fallo al Crear</h2><%}
                               } catch (Exception ex) {%><h2 style="color:red">Fallo al crear, es posible que el sub diagnostico ya exista</h2><%}
                                   ba.cerrar();
                               }
        %>   
    </body>
</html>