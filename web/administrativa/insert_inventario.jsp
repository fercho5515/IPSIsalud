<%-- 
    Document   : insertmedicamento
    Created on : 13-mar-2013, 14:23:42
    Author     : Fercho
--%>


<%@page import="org.json.simple.JSONObject"%>
<%@page import="pac.conecta_bd"%>
        <% 
          response.setContentType("text/x-json");
          response.setCharacterEncoding("utf-8");
          response.setHeader("Pragma", "no-cache");
          response.setHeader("Cache-Control", "no-cache, must-revalidate");
          response.setHeader("Pragma", "no-cache");
          JSONObject obj=new JSONObject();      
          request.setCharacterEncoding("UTF-8");
        
         
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
                        obj.put("est","0");
                        obj.put("msj","Sesión Expirada.");
         }
         else{
              try{  
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
                
                String sql="INSERT INTO `ips_isalud`.`inventario_farmacia`(`cod_vendedor`,`cod_medicamento`,`laboratorio`,`lote`,`fecha_fab`,`fecha_ven`,`cantidad_comprada`,`descuento`,`valor_compra`,`impuesto`,`num_factura`,`ubicacion`,`cod_barras`,`invima`,`id_empleado`,`existencias`) VALUES ('"+request.getParameter( "vendedor" )+"','"+request.getParameter( "serial_med" )+"','"+request.getParameter( "laboratorio" )+"','"+request.getParameter( "lote" )+"','"+request.getParameter( "calendariofecfab" )+"','"+request.getParameter( "calendariofecven" )+"','"+request.getParameter( "cantidadcomprada" )+"','"+request.getParameter( "descuento" )+"','"+request.getParameter( "valorcompra" )+"','"+request.getParameter( "impuesto" )+"',"+request.getParameter( "numfac" )+",'"+request.getParameter( "ubicacion" )+"',"+request.getParameter( "codigobarras" )+",'"+request.getParameter( "invima" )+"','"+session.getAttribute( "id" )+"','"+ request.getParameter("cantidadcomprada") +"');";
               // out.print(sql);
                //out.print(request.getParameter( "invima" ));
                if(ba.transaccion(sql)){ obj.put("est","1");
                                         obj.put("msj","Insertado Exitosamente");}
                else{ obj.put("est","2");
                      obj.put("msj","Fallo al Crear");
                      }
                ba.cerrar();  
                               }
              catch(Exception e){obj.put("est","2");
                                 obj.put("msj","Fallo al Crear");}
             }
         
         
        out.print(obj);
        out.close(); 
        %>