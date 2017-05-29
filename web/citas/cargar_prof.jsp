
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
        <select name="profesionales" id="profesionales" onchange="cambia_agenda();">
            <option value='escoger'>- Seleccione Profesional -</option>
            <%
                request.setCharacterEncoding("UTF-8");
                HttpSession sesion=request.getSession();
                String datot= request.getParameter("datot");
                sesion.setAttribute("id_tar",datot);
                String datop= request.getParameter("datop");
                sesion.setAttribute("id_proce2",datop);
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb();
                String sqlfina = "select pe.serial,concat(pe.p_nom,' ',pe.p_ape) from personas pe, empleados em,permiso_empleado pem,permisos per where pe.serial=em.serial_empleado and pem.serial_empleado=em.serial_empleado and per.id_permi=pem.id_permi and (per.cup1='" + request.getParameter("dato") + "' || per.cup2='" + request.getParameter("dato") + "');";
                System.out.print(sqlfina);
                ResultSet resufina = ba.consultas(sqlfina);
                try {
                    while (resufina.next() && resufina != null) {
                        out.print("<option value='" + resufina.getString(1) + "'>" + resufina.getString(2) + "</option>");
                    }
                } catch (SQLException e) {
                } catch (Exception ex) {
                }
                String sql2 = "select id_permi from permisos where (cup1='" + request.getParameter("dato") + "' || cup2='" + request.getParameter("dato") + "');";
                out.print(sql2);
                ResultSet resu2 = ba.consultas(sql2);
                try {
                    while (resu2.next() && resu2 != null) {
                        //HttpSession sesion = request.getSession();
                        sesion.setAttribute("permiso_cita", "" + resu2.getString(1));
                        out.print(sesion.getAttribute("permiso_cita"));
                    }
                } catch (SQLException e) {
                } catch (Exception ex) {
                }
                ba.cerrar();
            %>
        </select>
    </body>
</html>
