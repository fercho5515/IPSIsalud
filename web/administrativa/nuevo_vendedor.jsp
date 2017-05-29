<%-- 
    Document   : nuevo_vendedor
    Created on : 14/03/2013, 04:01:30 PM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="java.util.*" session="true" %>
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
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null ){}
         else{
               try{
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
                String sql="  INSERT INTO `ips_isalud`.`vendedores` (`cod_distri`, `cedula`, `nombres`, `apellidos`, `telefono`, `celular`, `direccion`) VALUES ('"+request.getParameter("cod_distribuidor")+"','"+request.getParameter("cedula_vend")+"','"+request.getParameter("nombres_vend")+"','"+request.getParameter("apellidos_vend")+"','"+request.getParameter("telefono_vend")+"','"+request.getParameter("celular_vend")+"','"+request.getParameter("direccion_vend")+"');";
             // System.out.println("cre a p "+sql);           
                if(ba.transaccion(sql)){out.print(" <h2 style='color:green'>vendedor creado con exito</h2><br> ");
                                        String sqlh="insert into historial_c (id_empleado,fecha_hora,descripcion) values ('"+session.getAttribute("id")+"',now(),'crea vendedor "+request.getParameter("nombres_vend")+" "+request.getParameter("apellidos_vend")+" con cedula "+request.getParameter("celular_vend")+" en distribuidor "+request.getParameter("cod_distribuidor")+"');";
                                        try{ if(ba.transaccion(sqlh)==true){ } }
                                        catch(Exception e){} 
                                       }
                               else{out.print(" <h2 style='color:red'>Fallo al crear vendedor</h2><br>  ");}
                
                
                ba.cerrar();   
                }
               catch(Exception exe){
                 %>  
                 <h2 style='color:red'>Fallo al crear vendedor</h2><br>                   
                 <%  
                 }
               }
        %>
    </body>
</html>
