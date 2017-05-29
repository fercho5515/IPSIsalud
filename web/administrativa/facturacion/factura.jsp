<%-- 
    Document   : factura.jsp
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
                
                        obj.put("res","0");
                        obj.put("msj","Sesión expirada ");
                        
            } else {
                try {
                    HttpSession sesion = request.getSession();
                    conecta_bd ba = new conecta_bd();
                    ba.ConectaDb();
                    
                    String idprof=""+session.getAttribute("id")+"";
                    String contr=request.getParameter("contr");
                    String fechi=request.getParameter("fechi");
                    String fechf=request.getParameter("fechf");
                    
                    
                    // borro facturas que se crearon previamente del mismo contrato y que haun no se guardan
                    String  sqldel1="SET SQL_SAFE_UPDATES=0;";
                            ba.transaccion(sqldel1);
                    String  sqldel2="delete from procedimientos_factura where id_factura in(select idfacturas from facturas where guardada=0 and cod_contrato='"+contr+"');";
                            ba.transaccion(sqldel2);
                    String  sqldel3="delete from medicamentos_factura where id_factura in(select idfacturas from facturas where guardada=0 and cod_contrato='"+contr+"');";
                            ba.transaccion(sqldel3);
                    String  sqldel4="delete from facturas where  guardada=0 and cod_contrato='"+contr+"';";
                            ba.transaccion(sqldel4);
                    String  sqldel5="SET SQL_SAFE_UPDATES=1;";
                            ba.transaccion(sqldel5);
                    
                            ///tipos en facturas
                            /// 0_paquete
                            /// 1_evento
                            /// 2_particular
                    
                            
                    // consulto las cosas que van a llenar las facturas de evento                    
                    String sqlconsultasmedeve   = "select distinct(c.id_consulta),c.serial_historia,c.id_medico,c.num_autorizacion,c.fecha,c.tipo_consulta,c.cod_consulta_cups,c.id_tipo_serv,a.id_paquete from consulta_medica c,agenda a where (c.id_consulta=a.id_consulta or c.id_agenda=a.id_agenda) and (c.cod_contra='"+contr+"' or a.id_contrato='"+contr+"') and c.id_estado_consulta=3 and c.facturada=0 and (c.fecha>='"+fechi+"' and c.fecha<='"+fechf+"') and a.id_paquete is null;";
                    ResultSet resu2 = ba.consultas(sqlconsultasmedeve);
                    try {
                        while (resu2.next() && resu2 != null) {
                                 //if (resu2.getString(1) != null) {   }
                                  //consultar si ya hay una factura activa para evento para esa persona en ese contrato
                                 String idpaquete="null";
                                 try{int pac=Integer.parseInt(resu2.getString(9));idpaquete="'"+pac+"'";}catch(Exception exe){idpaquete="null";}
                            
                                 int idfactu=0;
                                 String existefactra="select idfacturas from facturas where tipo=1 and cod_contrato='"+contr+"' and id_personas='"+resu2.getString(2)+"'  and guardada=0 order by idfacturas desc limit 1;";
                                 ResultSet resutem = ba.consultas(existefactra);
                                 while (resutem.next() && resutem != null) {try{idfactu=resu2.getInt(2);}catch(Exception ex){idfactu=0;}}
                                 if(idfactu==0){
                                        String creafactura="INSERT INTO `ips_isalud`.`facturas` (`id_profesional`, `id_personas`, `cod_contrato`, `cod_plan`, `tipo`, `guardada`, `resolucion_dian`, `fecha_creacion`, `fecha_ultima_mod`, `id_prof_modifico`) VALUES ('"+session.getAttribute("id")+"','"+resu2.getString(2)+"',"+contr+","+idpaquete+", '1', '0', resolucion_dia, 'curdate()', 'now()', id_prof_ultima_mod);";
                                 }
                         }
                    } 
                    catch (SQLException e) { }
                    catch (Exception ex) { }

                    String sqlconsultasnutrieve  = "select distinct(c.id_consulta),c.* from consulta_nutri c,agenda a where (c.id_consulta=a.id_consulta) and (c.cod_contra='"+contr+"' or a.id_contrato='"+contr+"') and c.guardado=1 and c.facturado=0 and (c.fecha>='"+fechi+"' and c.fecha<='"+fechf+"') and a.id_paquete is null;";
                    String sqlconsultapsicoeve   = "select distinct(c.id_consulta),c.* from consulta_psico c,agenda a where (c.id_consulta=a.id_consulta) and (c.cod_contra='"+contr+"' or a.id_contrato='"+contr+"') and c.guardado=3 and c.facturado=0 and (c.fecha>='"+fechi+"' and c.fecha<='"+fechf+"') and a.id_paquete is null;";
                    String sqlconsultatrabseve   = "select distinct(c.id_consulta_trabajo_social),c.* from consulta_trabajo_social c,agenda a where (c.id_consulta_trabajo_social=a.id_consulta) and (c.cod_contra='"+contr+"' or a.id_contrato='"+contr+"') and c.guardado=1 and c.facturado=0 and (c.fecha>='"+fechi+"' and c.fecha<='"+fechf+"') and a.id_paquete is null;";
                    String salidasfarmaeve = "select * from salidas_farmacia where fecha>='"+fechi+"' and fecha<='"+fechf+"' and a.id_paquete is null";
                    // consulto las cosas que van a llenar las facturas de paquete 
                    String sqlconsultasmedpac   = "select distinct(c.id_consulta),c.* from consulta_medica c,agenda a where (c.id_consulta=a.id_consulta or c.id_agenda=a.id_agenda) and (c.cod_contra='"+contr+"' or a.id_contrato='"+contr+"') and c.id_estado_consulta=3 and c.facturada=0 and (c.fecha>='"+fechi+"' and c.fecha<='"+fechf+"') and a.id_paquete is not null;";
                    String sqlconsultasnutripac = "select distinct(c.id_consulta),c.* from consulta_nutri c,agenda a where (c.id_consulta=a.id_consulta) and (c.cod_contra='"+contr+"' or a.id_contrato='"+contr+"') and c.guardado=1 and c.facturado=0 and (c.fecha>='"+fechi+"' and c.fecha<='"+fechf+"') and a.id_paquete is not null;";
                    String sqlconsultapsicopac  = "select distinct(c.id_consulta),c.* from consulta_psico c,agenda a where (c.id_consulta=a.id_consulta) and (c.cod_contra='"+contr+"' or a.id_contrato='"+contr+"') and c.guardado=3 and c.facturado=0 and (c.fecha>='"+fechi+"' and c.fecha<='"+fechf+"') and a.id_paquete is not null;";
                    String sqlconsultatrabspac  = "select distinct(c.id_consulta_trabajo_social),c.* from consulta_trabajo_social c,agenda a where (c.id_consulta_trabajo_social=a.id_consulta) and (c.cod_contra='"+contr+"' or a.id_contrato='"+contr+"') and c.guardado=1 and c.facturado=0 and (c.fecha>='"+fechi+"' and c.fecha<='"+fechf+"') and a.id_paquete is not null;";
                    String salidasfarmapac = "select * from salidas_farmacia where fecha>='"+fechi+"' and fecha<='"+fechf+"' and a.id_paquete is not null;";
                    
                    
                    
                    String sql = "INSERT INTO `ips_isalud`.`salidas_farmacia`(`id_medicamento_inventario`,`serial_formula_media`,`cantidad`,`fecha`,`id_profesional`,`id_recibe`,`valor`) VALUES ('" + request.getParameter("serial_inven") + "','" + request.getParameter("fid_formula") + "','" + request.getParameter("cantidad") + "', now(),'" + sesion.getAttribute("id") + "','','0');";
                    //out.print(sql);
                    if (ba.transaccion(sql)) {}
                    
                    
                    ba.cerrar();
                } catch (Exception e) {
                       obj.put("res","0");
                       obj.put("msj","error al facturar");
                }
                
            }
   
        out.print(obj);
        out.close(); 
            
                   
        %>