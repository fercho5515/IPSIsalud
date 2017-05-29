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
        <% request.setCharacterEncoding("UTF-8");         
       
        HttpSession sesion=request.getSession();
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){}
         else{
            conecta_bd ba = new conecta_bd();
            ba.ConectaDb();
            String emin=request.getParameter( "edadmin" );
            if(emin.compareTo("")==0){
                emin="null";
                //out.print(emin);
            }
            else {emin="'"+emin+"'";}
            //out.print(emin);
            String emax=request.getParameter( "edadmax" );
            if(emax.compareTo("")==0){
                emax="null";
                //out.print(emax);
            }
            else {emax="'"+emax+"'";}
            //out.print(emax);
            try{
                String sql2="UPDATE `ips_isalud`.`sub_cie10` SET `id_subcie10`='"+request.getParameter( "subcie10" )+"', `descripcion`= '"+request.getParameter( "diagnostico" )+"', `masc_fem`='"+request.getParameter( "sexo" )+"',`edad_minima`="+emin+",`edad_maxima`="+emax+",`uni_edad_minima`='"+request.getParameter( "edadmin2" )+"',`uni_edad_maxima`='"+request.getParameter( "edadmax2" )+"' WHERE `id_subcie10`='"+sesion.getAttribute("codigo_sibcie10")+"';";
                //out.print(sql2);
                if(ba.transaccion(sql2)){%><h2 style="color:red">Actualizado Exitosamente</h2><%}
                               else{%><h2 style="color:red">Fallo al Crear</h2><%}
                }
            catch(Exception ex){%><h2 style="color:red">Fallo</h2><%}
                ba.cerrar();         
                }
        %>   
    </body>
</html>