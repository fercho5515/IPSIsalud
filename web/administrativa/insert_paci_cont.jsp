<%-- 
    Document   : newjsp
    Created on : 20-mar-2013, 10:07:03
    Author     : Fercho
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
    <body >
        <%
            request.setCharacterEncoding("UTF-8");
            if (session.getAttribute("nombre") == null || session.getAttribute("clave") == null || session.getAttribute("id") == null || session.getAttribute("permiso") == null) {
            } else {
                    try{
                    conecta_bd ba = new conecta_bd();
                    ba.ConectaDb();
                    String cedu=request.getParameter("dato");
                    

                    String datos[] = new String[1];
                    String sqlper = "select serial_persona from personas, pacientes where personas.serial=pacientes.serial_persona and personas.id_person='"+ cedu +"';";
                    ResultSet resuper = ba.consultas(sqlper);
                    try {
                        while (resuper.next() || resuper != null) {
                            datos[0] = resuper.getString(1);
                        //    out.print(datos[0]);
                        }
                    } catch (SQLException e) {
                    } catch (Exception ex) {
                    }
                    
                    
                    String sql = "INSERT INTO `ips_isalud`.`afiliados_cont`(`serial_paciente`,`id_cont`,`activo`) VALUES ('"+datos[0]+"','"+session.getAttribute("id_contratacion")+"','1');";
                   
                    if (ba.transaccion(sql)) {
                        out.println("<h2 style='color: green'>Paciente agregado con exito bien</h2>");
                    } else {
                        out.println("<h2 style='color: red'>No se pudo insertar, revisa si el paciente ya esta en este contrato</h2>");
                    }
                    ba.cerrar();
                                       }
                    catch(Exception e){out.println("<h2 style='color: red'>No se pudo insertar, revisa si el paciente ya esta en este contrato</h2>");}
            }
        %>   
    </body>
</html>