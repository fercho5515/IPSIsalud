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
                    String sql = "INSERT INTO `ips_isalud`.`tari_med`(`id_tari`,`id_med`,`id_laboratorio`,`precio`,`cod_medicamento`) VALUES ('" + session.getAttribute("tarifariomed") + "','" + request.getParameter("id_medic") + "','" + request.getParameter("laboratorio") + "','" + request.getParameter("precio") + "','0');";
                  //  out.print(sql);

                    if (ba.transaccion(sql)) {
                           obj.put("res","1");
                    } else {
                           obj.put("res","2");
                        //out.println("<h2 style='color: red'</h2>");
                    }
                    ba.cerrar();

                } catch (Exception e) {
                      obj.put("res","2");
                }
            }
            
        out.print(obj);
        out.close(); 
        %>
