
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body >
        <%
            request.setCharacterEncoding("UTF-8");
            String ret;
            ret = request.getParameter("retroviral");

            if (ret == null) {
                ret = "0";
            } else {
                ret = "1";
            }
            if (session.getAttribute("nombre") == null || session.getAttribute("clave") == null || session.getAttribute("id") == null || session.getAttribute("permiso") == null) {
            out.print("no entra");
            } else {
                
                try {
                    conecta_bd ba = new conecta_bd();
                    ba.ConectaDb();
                    

                    
//
//                    String plan2 = request.getParameter("plan");
//                    //out.print(plan2);
//                    if (plan2 == null) {
//                        plan2 = "4";
//                        //out.print(emax);
//                    }

                    String sql = "INSERT INTO `ips_isalud`.`medicamentos`(`cum`,`producto`,`titular`,`registro_sanitario`,`fecha_expedicion`,`fecha_vencimiento`,`estado_registro`,`consecutivo`,`cantidad_cum`,`descripcion_comercial`,`estado_cum`,`fecha_activo`,`fecha_inactivo`,`muestra_medica`,`unidad`,`atc`,`descripcion_atc`,`via_adimin`,`concentracion_letra`,`principio_activo`,`unidad_medida`,`cantidad`,`unidad_referencia`,`forma_farmaceutica`,`nombre_rol`,`tipo_rol`,`modalidad`,`activo`,`retroviral`,`plan_beneficios`) VALUES ('" + request.getParameter("cum") + "','" + request.getParameter("producto") + "','" + request.getParameter("laboratorio") + "','" + request.getParameter("registrosanitario") + "','" + request.getParameter("fechae") + "','" + request.getParameter("fechav") + "','" + request.getParameter("estador") + "','" + request.getParameter("consecutivo") + "','" + request.getParameter("cantidadcum") + "','" + request.getParameter("descripcionc") + "','" + request.getParameter("estadocum") + "','" + request.getParameter("fechaac") + "','" + request.getParameter("fechain") + "','" + request.getParameter("muestra") + "','" + request.getParameter("unidad") + "','" + request.getParameter("atc") + "','" + request.getParameter("descripcionatc") + "','" + request.getParameter("viaadmin") + "','" + request.getParameter("concentracion") + "','" + request.getParameter("principioa") + "','" + request.getParameter("unidadmedida") + "','" + request.getParameter("cantidad") + "','" + request.getParameter("unidadreferencia") + "','" + request.getParameter("formafarma") + "','" + request.getParameter("nombrerol") + "','" + request.getParameter("tiporol") + "','" + request.getParameter("modalidad") + "','" + request.getParameter("activo") + "','" + request.getParameter("retroviral") + "','" + request.getParameter("plan") + "');";
                    out.print(sql);
                    if (ba.transaccion(sql)) {
                        out.println("<h2 style='color:green'>Insertado Exitosamente</h2>");
                    } else {
                        out.println("<h2 style='color:red'>Fallo al Crear</h2>");
                    }
                    ba.cerrar();
                } catch (Exception e) {
                    out.println("<h2 style='color:red'>Fallo</h2>");
                    
                }
            }
        %>
    </body>
</html>