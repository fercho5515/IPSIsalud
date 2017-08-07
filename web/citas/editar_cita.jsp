<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% request.setCharacterEncoding("UTF-8");
            if (session.getAttribute("nombre") == null || session.getAttribute("clave") == null || session.getAttribute("id") == null || session.getAttribute("permiso") == null) {
            } else {

                conecta_bd ba = new conecta_bd();
                ba.ConectaDb();
                int bandera = 0;

              

                //System.out.print("bandera==>" + bandera);
                String opera = "" + request.getParameter("oper");
                String id_estado = "" + request.getParameter("id_estado");
                String fecha = "" + request.getParameter("fecha");
                String id_agenda = "" + request.getParameter("id_agenda");
                // System.out.println("hjg  =>"+opera);
               
                if (bandera == 0) {
                    if (opera.compareTo("edit") == 0) {
                        String sql = "UPDATE `agenda` SET `id_estado`='" + id_estado + "' WHERE `id_agenda`='" + id_agenda + "';";
                        System.out.println("aja "+sql);


                        ba.transaccion(sql);
                        ba.cerrar();
                    }
                }

            }
        %>
    </body>
</html>
