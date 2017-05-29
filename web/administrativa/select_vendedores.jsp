
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.util.*" session="true" %>
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
            conecta_bd ba = new conecta_bd();
            ba.ConectaDb();
            String dato = request.getParameter("dato");
            //dato=dato.replace('*',' ');
            //out.print(dato2);
            out.print("<select name='vendedor' id='vendedor' style='width:85%'>");
            out.print("<option value='0'>--seleccione vendedor--</option>");
            String sql = "select id_vendedor, nombres from vendedores where cod_distri='" + dato + "';";
            out.print(sql);
            ResultSet resu2 = ba.consultas(sql);

            try {
                while (resu2.next() || resu2 != null) {
                    out.print("<option value='" + resu2.getString(1) + "'>" + resu2.getString(2) + "</option>");

                }
            } catch (SQLException e) {
            } catch (Exception ex) {
            }
            out.print("</select>");
            ba.cierraResultado(resu2);
            ba.cerrar();
        %>      
    </body>
</html>