<%-- 
    Document   : insertcie10
    Created on : 01-abr-2013, 12:06:04
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
                String sql="INSERT INTO `ips_isalud`.`cie10`(`idcie10`,`descripcion`) VALUES ('"+request.getParameter( "cie10" )+"','"+request.getParameter( "diagnostico" )+"');";
                //out.print(sql);
                
               if(ba.transaccion(sql)){out.println("<br><h2 style='color: green'>Insertado con éxito</h2>");}
                else{out.println("<br><h2 style='color: red'>Fallo al crear, es posible que el diagnostico ya exista.</h2>");}
                ba.cerrar();  
                
                               }
              catch(Exception e){out.println("<br><h2 style='color: red'>Fallo</h2>");}
                
                  
                
             }
        %>
             
    </body>
</html>