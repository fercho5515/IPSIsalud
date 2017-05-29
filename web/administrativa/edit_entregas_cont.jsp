<%-- 
    Document   : edit_entregas_cont
    Created on : 28-nov-2013, 20:05:09
    Author     : MiPc
--%>

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
                HttpSession sesion = request.getSession();
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb();
                int bandera = 0;

                String datos1[] = new String[1];
                String sqlacti = "select count(ac.activo) from afiliados_cont ac where serial_paciente='" + request.getParameter("id") + "' and ac.activo='1';";
                //System.out.print("consulta==>"+sqlacti);

                try {
                    ResultSet resuac = ba.consultas(sqlacti);
                    while (resuac.next() || resuac != null) {
                        datos1[0] = resuac.getString(1);
                        bandera = Integer.parseInt(datos1[0]);
                        //System.out.print("aqui" + datos1[0]);
                    }
                } catch (SQLException e) {
                } catch (Exception ex) {
                }

                //System.out.print("bandera==>" + bandera);
                String opera = "" + request.getParameter("oper");
                // System.out.println("hjg  =>"+opera);
                int a = Integer.parseInt(request.getParameter("activo"));
                if ((bandera == 1 && a == 0) || (bandera == 0)) {
                    if (opera.compareTo("edit") == 0) {
                        String sql = "INSERT INTO `ips_isalud`.`salidas_farmacia`(`id_medicamento_inventario`,`serial_formula_media`,`cantidad`,`fecha`,`id_profesional`,`id_recibe`,`valor`) VALUES ('" + request.getParameter("dato") + "','" + request.getParameter("dato2") + "'," + 1 + ",now(),'" + sesion.getAttribute("id") + "','" + request.getParameter("dato3") + "','" + 100 + "');";
                    // System.out.println("aja "+sql);


                        ba.transaccion(sql);
                        ba.cerrar();
                    }
                }

            }
        %>
    </body>
</html>
