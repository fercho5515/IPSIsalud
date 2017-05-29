<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        request.setCharacterEncoding("UTF-8"); 
        HttpSession sesion=request.getSession();
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){}
         else{
            conecta_bd ba = new conecta_bd();
            ba.ConectaDb();
            
            String ret;
            ret=request.getParameter("retroviral");
         
                if(ret==null){
                    ret="0";
                }
                else{
                    ret="1";
                } 
            
//            String emin=request.getParameter( "edadmin" );
//            if(emin.compareTo("")==0){
//                emin="null";
//            }
//            else {emin="'"+emin+"'";}
//            String emax=request.getParameter( "edadmax" );
//            if(emax.compareTo("")==0){
//                emax="null";
//            }
//            else {emax="'"+emax+"'";}
            
            try{
                String sql="UPDATE  `ips_isalud`.`medicamentos` SET `cum`='"+request.getParameter( "cum" )+"'," 
 + "`producto`='"+request.getParameter( "producto" )+"'," 
 + "`titular`='"+request.getParameter( "laboratorio" )+"'," 
 + "`registro_sanitario`='"+request.getParameter( "registrosanitario" )+"',"
 + "`fecha_expedicion`='"+request.getParameter( "fechae" )+"',"
 + "`fecha_vencimiento`='"+request.getParameter( "fechav" )+"',"
 + "`estado_registro`='"+request.getParameter( "estador" )+"',"
 + "`consecutivo`='"+request.getParameter( "consecutivo" )+"',"
 + "`cantidad_cum`='"+request.getParameter( "cantidadcum" )+"',"
 + "`descripcion_comercial`='"+request.getParameter( "descripcionc" )+"',"
 + "`estado_cum`='"+request.getParameter( "estadocum" )+"',"
 + "`fecha_activo`='"+request.getParameter( "fechaac" )+"',"
 + "`fecha_inactivo`='"+request.getParameter( "fechain" )+"',"
 + "`muestra_medica`='"+request.getParameter( "muestra" )+"',"
 + "`unidad`='"+request.getParameter( "unidad" )+"',"
 + "`atc`='"+request.getParameter( "atc" )+"',"
 + "`descripcion_atc`='"+request.getParameter( "descripcionatc" )+"',"
 + "`via_adimin`='"+request.getParameter( "viaadmin" )+"',"
 + "`concentracion_letra`='"+request.getParameter( "concentracion" )+"',"
 + "`principio_activo`='"+request.getParameter( "principioa" )+"',"
 + "`unidad_medida`='"+request.getParameter( "unidadmedida" )+"',"
 + "`cantidad`='"+request.getParameter( "cantidad" )+"'," 
 + "`unidad_referencia`='"+request.getParameter( "unidadreferencia" )+"',"
 + "`forma_farmaceutica`='"+request.getParameter( "formafarma" )+"',"
 + "`nombre_rol`='"+request.getParameter( "nombrerol" )+"',"
 + "`tipo_rol`='"+request.getParameter( "tiporol" )+"',"
 + "`modalidad`='"+request.getParameter( "modalidad" )+"'," 
 + "`activo`='"+request.getParameter( "activo" )+"',"
 + "`retroviral`='"+request.getParameter( "retroviral" )+"',"
 + "`plan_beneficios`='"+request.getParameter( "plan" )+"' "                                                                                                                                                                      
 + "where `serial`='"+request.getParameter( "serial_med" )+"';";
               
                out.print(sql);
                if(ba.transaccion(sql)){%><h2 style="color:green">Actualizado Exitosamente</h2><%}
                else{%><label style="color:red">Fallo al Crear<%}
                }
                catch(Exception ex){%><label style="color:red">Fallo<%}
                ba.cerrar();         
                }
        %>   
    </body>
</html>
