
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
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){}
         else{
              try{  
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
                String sql="UPDATE `ips_isalud`.`cie10` SET `idcie10`='"+request.getParameter( "nuevo_diag" )+"', `descripcion`='"+request.getParameter( "nuevo_diag2" )+"' WHERE `idcie10`='"+request.getParameter( "comp_diag" )+"';";
                
                if(ba.transaccion(sql)){out.println("<h2 style='color:red'>Actualizado Exitosamente</h2>");}
                else{out.println("<h2 style='color:red'>Fallo al actualizar</h2>");}
                ba.cerrar();  
                }
                catch(Exception e){out.println("<h2 style='color:red'>Fallo al actualizar</h2>");}
             }
        %>
    </body>
</html>