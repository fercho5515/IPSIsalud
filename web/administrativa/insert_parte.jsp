<%@page import="org.json.simple.JSONObject"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/x-json");
    response.setCharacterEncoding("utf-8");
    request.setCharacterEncoding("UTF-8");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    JSONObject obj=new JSONObject();
    if (session.getAttribute("nombre") == null || session.getAttribute("clave") == null || session.getAttribute("id") == null || session.getAttribute("permiso") == null) {
        obj.put("res", "2");
        obj.put("msj", "Error sesión expirada"); 
    } else {
        
        String operador = request.getParameter("oper");
        String id = request.getParameter("id");
        String descr = request.getParameter("desc");

        if (operador.equals("add")) {
            try {
                String sql = "INSERT INTO `ips_isalud`.`partes_cuerpo`(`descripcion`) VALUES ('" + descr + "');";
                //out.print(sql);
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb();
                if (ba.transaccion(sql)) {
                    obj.put("res", "1");
                    obj.put("msj", "Insertado exitosamente"); /* response.setStatus(200, "Insertado exitosamente"); */
                } else {
                    obj.put("res", "2");
                    obj.put("msj", "Error, no se pudo insertar los datos");/* response.setStatus(404, "error dato dplicado");*/
                }
                ba.cerrar();
            } catch (Exception e) {/*response.setStatus(400, "error");*/
                obj.put("res", "0");
                obj.put("msj", "Error, no se pudo insertar los datos");
            }
        } else if (operador.equals("edit")) {
            try {
                String sql = "UPDATE `ips_isalud`.`partes_cuerpo` SET `descripcion`='" + descr + "' where id_parte='" + id + "';";
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb();
                if (ba.transaccion(sql)) {
                    obj.put("res", "1");
                    obj.put("msj", "Editado exitosamente"); /* response.setStatus(200, "Insertado exitosamente"); */
                } else {
                    obj.put("res", "2");
                    obj.put("msj", "Error, no se pudo editar los datos");/* response.setStatus(404, "error dato dplicado");*/
                }
                ba.cerrar();
            } catch (Exception e) {/*response.setStatus(400, "error");*/
                obj.put("res", "0");
                obj.put("msj", "Error, no se pudo editar los datos");
            }
        } else if (operador.equals("del")) {
            try {
                String sql = "DELETE FROM `ips_isalud`.`partes_cuerpo` WHERE `id_parte`='" + id + "';";
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb();
                if (ba.transaccion(sql)) {
                    obj.put("res", "1");
                    obj.put("msj", "Eliminado exitosamente"); /* response.setStatus(200, "Insertado exitosamente"); */
                } else {
                    obj.put("res", "2");
                    obj.put("msj", "Error, no se pudo eliminar los datos");/* response.setStatus(404, "error dato dplicado");*/
                }
                ba.cerrar();
            } catch (Exception e) {/*response.setStatus(400, "error");*/
                obj.put("res", "0");
                obj.put("msj", "Error, no se pudo eliminar los datos");
            }
        }
        out.print(obj);
        out.close();
    }
%>