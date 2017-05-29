<%-- 
    Document   : comprob_eps
    Created on : 12-abr-2013, 19:00:05
    Author     : Fercho
--%>

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

        <%
            conecta_bd ba = new conecta_bd();
            ba.ConectaDb();
            //String dato=request.getParameter("dato");

            String datos[] = new String[1];
            datos[0]="0";
            String sql = "select count(ideps) from eps where ideps='" + request.getParameter("dato") + "';";
            //out.print(sql);
            ResultSet resu2 = ba.consultas(sql);

            try {
                while (resu2.next() || resu2 != null) {
                    datos[0] = resu2.getString(1);

                }
            } catch (SQLException e) {
            } catch (Exception ex) {
            }
            int x=0;
            try{x = Integer.parseInt(datos[0]);}catch(Exception e){}
            if (x >= 1) {
        %>
        <label style="color:red">ESTE CODIGO YA EXISTE</label><input type="text" name="eps1" id="eps1" style="display: none" value='existe'  readonly>
        <%                                         } else {
        %>
        <input type="text" id="eps1" name="eps1" style="display: none" value="noexiste" readonly>
        <%                                                    }
            ba.cierraResultado(resu2);
            ba.cerrar();
        %>      
    </body>
</html>