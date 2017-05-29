<%-- 
    Document   : insert_eps
    Created on : 12-abr-2013, 19:21:33
    Author     : Fercho
--%>

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
                HttpSession sesion = request.getSession();
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
                String sql="UPDATE `ips_isalud`.`eps` SET `ideps`='"+request.getParameter( "eps" )+"' , `nit`='"+request.getParameter( "nit" )+"', `nombre`='"+request.getParameter( "nomeps" )+"',`direccion`='"+request.getParameter( "direccion" )+"',`telefono`='"+request.getParameter( "telefono" )+"',`ciudad`='"+request.getParameter( "ciudad" )+"',`tipo`='"+request.getParameter( "tipo" )+"' WHERE `ideps`='"+sesion.getAttribute("codeps")+"';";
                
               if(ba.transaccion(sql)){out.println("<h2 style='color:red'>Actualizado Exitosamente");}
                else{out.println("<h2 style='color:red'>Fallo al Crear");}
                ba.cerrar();  
                
                               }
              catch(Exception e){out.println("<h2 style='color:red'>Fallo al Crear");}
                
                  
                
             }
        %>
             
    </body>
</html>