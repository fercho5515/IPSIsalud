<%@page import="org.json.simple.JSONObject"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>

<%      
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/x-json");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        JSONObject obj = new JSONObject();

        if (session.getAttribute("nombre") == null || session.getAttribute("clave") == null || session.getAttribute("id") == null || session.getAttribute("permiso") == null) {
             obj.put("res", "2");
             obj.put("msj", "Error sesi�n expirada");   
        } else {
        String operador = request.getParameter("oper");
        String id = request.getParameter("id");
        String descr = request.getParameter("desc");
        String sql = "";
        if (operador.equals("edit")) {
            try {
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb();
                sql="UPDATE `tarifarios` SET `cod_tarifario`='"+request.getParameter("cod_tarifario")+"', `nombre`='"+request.getParameter("nombre")+"', `activo`='"+request.getParameter("activo")+"' WHERE `id_tarifarios`='"+request.getParameter("id_tarifarios")+"';";     
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
        }else if (operador.equals("del")) {
            try {
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb();
                sql = "DELETE FROM `tarifarios` WHERE `id_tarifarios`='" +request.getParameter("id")+ "';";
                System.out.print(sql);
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

                