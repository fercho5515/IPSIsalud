<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
        <% 
            
            
      response.setContentType("text/x-json");
      response.setCharacterEncoding("utf-8");
      response.setHeader("Pragma", "no-cache");
      response.setHeader("Cache-Control", "no-cache, must-revalidate");
      response.setHeader("Pragma", "no-cache");
      JSONObject obj=new JSONObject();      
      
            if (session.getAttribute("nombre") == null || session.getAttribute("clave") == null || session.getAttribute("id") == null || session.getAttribute("permiso") == null) {
            obj.put("res","2");
            } else {
                try {
                    conecta_bd ba = new conecta_bd();
                    ba.ConectaDb();
                    String sql = "INSERT INTO `ips_isalud`.`tari_proced`(`id_tarifario`,`id_proced`,`precio`) VALUES ('" + session.getAttribute("tarifario") + "','" + request.getParameter("id_proced") + "','" + request.getParameter("precio") + "');";
                    //out.print(sql);

                    if (ba.transaccion(sql)) {obj.put("res","1");
                      //  out.println("<br>todo bien");
                    } else {
                        obj.put("res","0");
                      //  out.println("<h2 style='color: red'>No se pudo insertar, revisa si el procedimiento ya esta en el tarifario</h2>");
                    }
                    ba.cerrar();

                } catch (Exception e) {
                        obj.put("res","2");
                    out.println("<br>fallo");
                }
            }
            
        out.print(obj);
        out.close(); 
        %>
