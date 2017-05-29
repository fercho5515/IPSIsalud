<%-- 
    Document   : insert_paci_paq
    Created on : 09-jul-2013, 10:47:55
    Author     : Andrea
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
                    String sqlper = "select serial_persona from personas, pacientes,afiliados_cont where personas.serial=pacientes.serial_persona and afiliados_cont.serial_paciente=pacientes.serial_persona and personas.id_person='"+ cedu +"'and id_cont='"+session.getAttribute("id_contratacion")+"' and afiliados_cont.activo='1';;";
                    //out.print("la consulta:"+sqlper+"...fin...");
                    ResultSet resuper = ba.consultas(sqlper);
                    try {
                        while (resuper.next() || resuper != null) {
                            datos[0] = resuper.getString(1);
                            //out.print(datos[0]);
                        }
                    } catch (SQLException e) {
                    } catch (Exception ex) {
                    }
                            
                    String sql = "INSERT INTO `ips_isalud`.`afiliados_pac_int`(`serial_paciente`,`id_contrato`,`id_pac_int`,`activo2`) VALUES ('"+datos[0]+"','"+session.getAttribute("id_contratacion")+"','"+session.getAttribute("id_paq")+"','1');";
                    //out.print(sql);

                    if (ba.transaccion(sql)){
                        out.println("<center><h2 style='color: green'>Paciente agregado con exito bien</h2></center>");
                    } else {
                                       out.println("<center><h2 style='color: red'>No se pudo insertar, revisa si el paciente ya esta activo en este contrato</h2></center>");
                    }
                    ba.cerrar();
                                       }
                    catch(Exception e){out.println("<center><h2 style='color: red'>No se pudo insertar, revisa si el paciente ya esta activo en este contrato</h2></center>");}
            }
        %>   
    </body>
</html>