<%-- 
    Document   : consu_paque
    Created on : 27-nov-2013, 20:08:21
    Author     : MiPc
--%>

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
        <%
                     conecta_bd ba = new conecta_bd();
                                ba.ConectaDb();
                                String dto=request.getParameter("dato");
                                String dto2=request.getParameter("dato2");
                                
                                String sqlant = "select id_paquete_int from paquete_int p, afiliados_pac_int af where id_contratacion='"+dto+"' and p.id_paquete_int=af.id_pac_int and serial_paciente='"+dto2+"' and af.activo2='1';";
                                //out.print(sqlant);
                                ResultSet resuant = ba.consultas(sqlant);
                                try {
                                while (resuant.next() && resuant != null) {
                                    out.print("<input type='hidden' name='paquete' id='paquete' value='"+resuant.getString(1)+"'>");
                                    out.print("<input type='hidden' name='serial_paciente' id='serial_paciente' value='"+dto2+"'>");
                                }
                                } catch (SQLException e) {
                                    out.print("<input type='hidden' name='paquete' id='paquete' value='0'>");
                                    out.print("<input type='hidden' name='serial_paciente' id='serial_paciente' value='"+dto2+"'>");
                                
                                } catch (Exception ex) {
                                    out.print("<input type='hidden' name='paquete' id='paquete' value='0'>");
                                    out.print("<input type='hidden' name='serial_paciente' id='serial_paciente' value='"+dto2+"'>");
                                }
                                ba.cerrar();
        %>
    </body>
</html>