<%-- 
    Document   : borramedentregados
    Created on : 23/02/2015, 05:08:28 PM
    Author     : VAIO
--%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.lang.String"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%
      response.setContentType("text/x-json");
      response.setCharacterEncoding("utf-8");
      response.setHeader("Pragma", "no-cache");
      response.setHeader("Cache-Control", "no-cache, must-revalidate");
      response.setHeader("Pragma", "no-cache");
      JSONObject obj=new JSONObject();      
            
            
            request.setCharacterEncoding("UTF-8");
            if (session.getAttribute("nombre") == null || session.getAttribute("clave") == null || session.getAttribute("id") == null || session.getAttribute("permiso") == null) {
            } else {
                try {
                    HttpSession sesion = request.getSession();
                    conecta_bd ba = new conecta_bd();
                    ba.ConectaDb();
                    
                    String idsalida=""+request.getParameter("ids");
                    String cantidad = "0";
                    String idinv = "0";
                    String serial_formula_media="";
                    String fecha="";
                    String id_profesional="";
                    String id_recibe="";
                    String valor="";
                    String sql2 = "select id_medicamento_inventario,serial_formula_media,cantidad,fecha,id_profesional,id_recibe,valor from salidas_farmacia where id_salidas_farmacia='"+idsalida+"';";
                    //out.print(sql2);
                    ResultSet resu2 = ba.consultas(sql2);
                    try {
                        while (resu2.next() && resu2 != null) {
                            if (resu2.getString(1) != null) {  idinv = resu2.getString(1); }
                            if (resu2.getString(2) != null) {  serial_formula_media = resu2.getString(2); }
                            if (resu2.getString(3) != null) {  cantidad = resu2.getString(3); }
                            if (resu2.getString(4) != null) {  fecha = resu2.getString(4); }
                            if (resu2.getString(5) != null) {  id_profesional = resu2.getString(5); }
                            if (resu2.getString(6) != null) {  id_recibe = resu2.getString(6); }
                            if (resu2.getString(7) != null) {  valor = resu2.getString(7); }
                         }
                    } 
                    catch (SQLException e) { }
                    catch (Exception ex) { }

                    String sql = "DELETE FROM `ips_isalud`.`salidas_farmacia` WHERE `id_salidas_farmacia`='"+idsalida+"';";
                    //out.print(sql);
                    if (ba.transaccion(sql)) {
                             obj.put("res","1");
                            sql="UPDATE `ips_isalud`.`inventario_farmacia` SET existencias=(existencias+"+cantidad+") WHERE `serial_inven`='"+idinv+"';";
                            if(ba.transaccion(sql)){     obj.put("res2","1"); }
                            else{ obj.put("res2","0");  }
                            
                            sql="INSERT INTO `ips_isalud`.`salidas_farmacia_borradas` (`id_salidas_farmacia`, `id_medicamento_inventario`, `serial_formula_medica`, `cantidad`, `fecha`, `id_profesional`, `id_recibe`, `valor`, `id_quien_borro`, `fecha_borrado`) VALUES ('"+idsalida+"','"+idinv+"','"+serial_formula_media+"','"+cantidad+"','"+fecha+"','"+id_profesional+"','"+id_recibe+"','"+valor+"','"+session.getAttribute("id")+"',now());";
                            if(ba.transaccion(sql)){     obj.put("res3","1"); }
                            else{ obj.put("res3","0");  }
                            
                    } else {
                        obj.put("res","0");
                        obj.put("res2","0"); 
                        obj.put("res3","0");
                    }
                    
               
                   
                    ba.cerrar();
                } catch (Exception e) {
                       obj.put("res","0");
                       obj.put("res2","0");
                       obj.put("res3","0");
                }
                
            }
   
        out.print(obj);
        out.close(); 
            
                   
        %>