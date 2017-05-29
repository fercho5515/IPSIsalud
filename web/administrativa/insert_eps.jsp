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
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
                String sql="INSERT INTO `ips_isalud`.`eps`(`ideps`,`nit`,`nombre`,`direccion`,`telefono`,`ciudad`,`tipo`) VALUES ('"+request.getParameter( "eps" )+"','"+request.getParameter( "nit" )+"','"+request.getParameter( "nomeps" )+"','"+request.getParameter( "direccion" )+"','"+request.getParameter( "telefono" )+"','"+request.getParameter( "ciudad" )+"','"+request.getParameter( "tipo" )+"');";
                //out.print(sql);
                
               if(ba.transaccion(sql)){out.println("<h2 style='color:red'>Insertado Exitosamente</h2>");}
                else{out.println("<h2 style='color:red'>Fallo al Crear</h2>");}
                ba.cerrar();  
                
                               }
              catch(Exception e){out.println("<h2 style='color:red'>Fallo</h2>");}
                
                  
                
             }
        %>
             
    </body>
</html>