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
        }else{
        String operador = request.getParameter("oper");
        String descr = request.getParameter("descr");
        String id = request.getParameter("id");
        String id_hc = request.getParameter("id_hc");
        String sql = "";
        
            if (operador.compareTo("add") == 0) {
                try {
                    conecta_bd ba = new conecta_bd();
                    ba.ConectaDb();
                    sql = "INSERT INTO `ips_isalud`.`comida`(`id_hora_comida`,`descripcion`) VALUES ('"+id_hc+"','"+descr+"');";
                    //out.print(sql);
                    if (ba.transaccion(sql)) {
                        obj.put("res", "1");
                        obj.put("msj", "Insertado exitosamente"); /* response.setStatus(200, "Insertado exitosamente"); */
                    } else {
                        obj.put("res", "2");
                        obj.put("msj", "Error dato duplicado");/* response.setStatus(404, "error dato dplicado");*/
                    }
                    ba.cerrar();
                } catch (Exception e) {/*response.setStatus(400, "error");*/
                    obj.put("res", "0");
                }
            } else if(operador.compareTo("edit")==0){                           
                try {
                    conecta_bd ba = new conecta_bd();
                    ba.ConectaDb();
                    sql="UPDATE `ips_isalud`.`comida` SET `descripcion`='"+descr+"',`id_hora_comida`='"+id_hc+"' WHERE `id_comida`='"+id+"';";
                    if (ba.transaccion(sql)) {
                        obj.put("res", "1");
                        obj.put("msj", "Editado exitosamente"); /* response.setStatus(200, "Insertado exitosamente"); */
                    } else {
                        obj.put("res", "2");
                        obj.put("msj", "Error dato duplicado");/* response.setStatus(404, "error dato dplicado");*/
                    }
                    ba.cerrar();
                } catch (Exception e) {/*response.setStatus(400, "error");*/
                    obj.put("res", "0");
                }
            } else if(operador.compareTo("del")==0){                           
                try {
                    conecta_bd ba = new conecta_bd();
                    ba.ConectaDb();
                    sql="DELETE FROM `ips_isalud`.`comida` WHERE `id_comida`='"+id+"';"; 
                    if (ba.transaccion(sql)) {
                        obj.put("res", "1");
                        obj.put("msj", "Eliminado exitosamente"); /* response.setStatus(200, "Insertado exitosamente"); */
                    } else {
                        obj.put("res", "2");
                        obj.put("msj", "Error dato duplicado");/* response.setStatus(404, "error dato dplicado");*/
                    }
                    ba.cerrar();
                } catch (Exception e) {/*response.setStatus(400, "error");*/
                    obj.put("res", "0");
                }
            }
        
        out.print(obj);
        out.close(); 
        }
        %>
