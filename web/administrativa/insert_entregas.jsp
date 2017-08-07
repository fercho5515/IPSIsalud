<%-- 
    Document   : insert_entregas
    Created on : 29/10/2013, 09:30:19 AM
    Author     : Fercho
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
                
                        obj.put("res","0");
                        obj.put("res2","0");
                        obj.put("res3","0");
            } else {
                try {
                    HttpSession sesion = request.getSession();
                    conecta_bd ba = new conecta_bd();
                    ba.ConectaDb();
                    
                    String serialhistoria = "0";
                    String sql2 = "select serial_historia from consulta_medica where id_consulta='"+request.getParameter("fid_consulta")+"';";
                    //out.print(sql2);
                    ResultSet resu2 = ba.consultas(sql2);
                    try {
                        while (resu2.next() && resu2 != null) {
                            if (resu2.getString(1) != null) {  serialhistoria = resu2.getString(1); }
                         }
                    } 
                    catch (SQLException e) { }
                    catch (Exception ex) { }
                    
                    //*************Consulta cantidad**************
                    String cantidad ="0";
                    String sqlc = "select sum(cantidad) from salidas_farmacia where serial_formula_media=3;";
                    //out.print(sql2);
                    ResultSet resuc = ba.consultas(sqlc);
                    try {
                        while (resuc.next() && resuc != null) {
                            if (resuc.getString(1) != null) {  cantidad = resuc.getString(1); }
                         }
                    } 
                    catch (SQLException e) { }
                    catch (Exception ex) { }
                    int cantidadentregada=Integer.parseInt(cantidad);
                    int cantidadtotalentregar=Integer.parseInt(request.getParameter("can_formula"));
                    int cantidadentregar=Integer.parseInt(request.getParameter("cantidad"));
                    //*************Fin Cantidad
                    if(cantidadtotalentregar<cantidadentregada+cantidadentregar){
                        obj.put("res","5");
                        obj.put("res2","Muchos medicamentos");
                        obj.put("res3","0");
                    }else{

                    String sql = "INSERT INTO `ips_isalud`.`salidas_farmacia`(`id_medicamento_inventario`,`serial_formula_media`,`cantidad`,`fecha`,`id_profesional`,`id_recibe`,`valor`) VALUES ('" + request.getParameter("serial_inven") + "','" + request.getParameter("fid_formula") + "','" + request.getParameter("cantidad") + "', now(),'" + sesion.getAttribute("id") + "','" + serialhistoria+ "','0');";
                    System.out.print(sql);
                    if (ba.transaccion(sql)) {
                         obj.put("res","1");
                         obj.put("res3",""+request.getParameter("fid_formula")+"");
                         sql="UPDATE `ips_isalud`.`inventario_farmacia` SET existencias=(existencias-"+request.getParameter( "cantidad" )+") WHERE `serial_inven`='"+request.getParameter( "serial_inven" )+"';";
                         if(ba.transaccion(sql)){  obj.put("res2","1");  }
                         else{ obj.put("res2","0");  }
                    } else {
                        obj.put("res","0");
                        obj.put("res2","0");
                        obj.put("res3","0");
                    }
                    
                                  }
                    
                    ba.cerrar();
                    
                    //ba.cerrar();
                } catch (Exception e) {
                       obj.put("res","0");
                       obj.put("res2","0"); 
                       obj.put("res3","0");
                }
                
            }
   
        out.print(obj);
        out.close(); 
            
                   
        %>