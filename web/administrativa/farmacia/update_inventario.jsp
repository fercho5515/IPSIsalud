
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
                        obj.put("est","0");
                        obj.put("msj","Sesión Expirada.");
            } else {
                    try{  
                        conecta_bd ba = new conecta_bd();
                        ba.ConectaDb(); 
                             
                         int cantidadcompradaant=0;
                         int cantidadcomprada=0;
                         int existenciasant=0;
                         int existencias=0;
                         
                        try{
                            cantidadcompradaant=Integer.parseInt(request.getParameter("cantidadcompradaant"));
                            cantidadcomprada=Integer.parseInt(request.getParameter("cantidadcomprada"));
                            existenciasant=Integer.parseInt(request.getParameter("existenciasant"));
                            existencias=Integer.parseInt(request.getParameter("existencias"));
                        }catch(Exception exe){}
                                            //  
                        String sql="UPDATE `ips_isalud`.`inventario_farmacia` SET `cod_vendedor`='"+request.getParameter("vendedor")+"',`cantidad_comprada`='"+request.getParameter("cantidadcomprada")+"', `cod_medicamento`='"+request.getParameter("idmedic")+"', `laboratorio`='"+request.getParameter("laboratorio")+"', `lote`='"+request.getParameter("lote")+"', `fecha_fab`='"+request.getParameter("calendariofecfab")+"', `fecha_ven`='"+request.getParameter("calendariofecven")+"', `descuento`='"+request.getParameter("descuento")+"', `valor_compra`='"+request.getParameter("valorcompra")+"', `impuesto`='"+request.getParameter("impuesto")+"', `num_factura`='"+request.getParameter("numfac")+"', `existencias`='"+request.getParameter("existencias")+"', `ubicacion`='"+request.getParameter("ubicacion")+"', `cod_barras`='"+request.getParameter("codigobarras")+"', `invima`='"+request.getParameter("invima")+"', `id_empleado`='"+session.getAttribute("id")+"' WHERE `serial_inven`='"+request.getParameter("idinvent")+"';";

                        String mensaje="";
                        String mensajereg="";
                        String coma="";
                        int control=0;
                        if(cantidadcompradaant!=cantidadcomprada){
                          mensaje=mensaje+"Se realiza cambio de cantidad en el inventario de farmacia, cantidad anterior: "+cantidadcompradaant+" , cantidad posterior: "+cantidadcomprada;
                          mensajereg=". Se realiza una anotación especial por modificación de cantidad";                          
                          coma=". ";
                          control++;
                        } 
                        if(existenciasant!=existencias){
                          mensaje=mensaje+coma+"Se realiza cambio en las existencias en el inventario de farmacia existencias anteriores: "+existenciasant+" , existencias posteriores: "+existencias;
                          mensajereg=mensajereg+". Se realiza una anotación especial por modificación de existencias";
                          control++;
                        }   

                        // + "INSERT INTO `ips_isalud`.`inventario_farmacia`(`cod_vendedor`,`cod_medicamento`,`laboratorio`,`lote`,`fecha_fab`,`fecha_ven`,`cantidad_comprada`,`descuento`,`valor_compra`,`impuesto`,`num_factura`,`ubicacion`,`cod_barras`,`invima`,`id_empleado`,`existencias`) VALUES ('"+request.getParameter( "vendedor" )+"','"+request.getParameter( "serial_med" )+"','"+request.getParameter( "laboratorio" )+"','"+request.getParameter( "lote" )+"','"+request.getParameter( "calendariofecfab" )+"','"+request.getParameter( "calendariofecven" )+"','"+request.getParameter( "cantidadcomprada" )+"','"+request.getParameter( "descuento" )+"','"+request.getParameter( "valorcompra" )+"','"+request.getParameter( "impuesto" )+"',"+request.getParameter( "numfac" )+",'"+request.getParameter( "ubicacion" )+"',"+request.getParameter( "codigobarras" )+",'"+request.getParameter( "invima" )+"','"+session.getAttribute( "id" )+"','"+ request.getParameter("cantidadcomprada") +"');";
                       // out.print(sql);
                        //out.print(request.getParameter( "invima" ));
                        if(ba.transaccion(sql)){ obj.put("est","1");
                                                 obj.put("msj","Actualizado Exitosamente"+mensajereg);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
                                                 if(control>0){
                                                               String sql22="INSERT INTO `ips_isalud`.`historial_cambios` (`id_empleado`, `descriocion`, `fecha`) VALUES ('"+session.getAttribute("id")+"', '"+mensaje+"', now());";
                                                               ba.transaccion(sql22);                           
                                                              }
                        }
                        else{ obj.put("est","2");
                              obj.put("msj","Fallo al Actualizar");
                              }
                        ba.cerrar();  
                                       }
                      catch(Exception e){obj.put("est","2");
                                         obj.put("msj","Fallo al Actualizar");
                                        }
             }
         
            
            
        out.print(obj);
        out.close(); 
            
            
 %>