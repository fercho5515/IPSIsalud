<%-- 
    Document   : guarda_farma
    Created on : 13/03/2013, 06:56:23 PM
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
                 
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null ){}
         else{
               try{
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
                String sql="INSERT INTO `ips_isalud`.`temp_hum_cadfri_farmacia` (`temperatura`, `humedad`, `cadena_frio`,`fecha_hora`,`id_empleado`) VALUES ('"+request.getParameter("tempef")+"','"+request.getParameter("humef")+"','"+request.getParameter("cadff")+"',now(),'"+session.getAttribute("id")+"');";

             //          +"INSERT INTO `lab_farmaceutico` (`nombre`, `direccion`, `telefono`, `nit`) VALUES ('"+request.getParameter("nombrelado")+"','"+request.getParameter("direccionlabo")+"','"+request.getParameter("telefonolado")+"','"+request.getParameter("nitlado")+"');";

             // String sql="INSERT INTO `antecedentes_personales` (`id_historia_clinica`, `id_descri_antecedente`, `descripcion`, `fecha`, `edad`,`id_empleado`) VALUES ('"+(String)session.getAttribute("serial_pacinete")+"','"+request.getParameter( "antecedentee" )+"','"+request.getParameter( "descripcion_ant" )+"', curdate(), '"+request.getParameter( "edad_ant" )+"','"+(String)session.getAttribute("id")+"');";
             // System.out.println("cre a p "+sql);           
                if(ba.transaccion(sql)){//out.print("<center><h2 style='color:green'>distribuidor creado con exito</h2></center><br> ");
                                      }
                               else{out.print("<center><h2 style='color:red'>Fallo al ingresar datos, asegúrese que el nombre y nit del distribuidor no correspondan a datos existentes</h2></center><br>  ");
                               }
                
                ba.cerrar();   
                }
               catch(Exception exe){
                 %>  
                 <center><h2 style='color:red'>Fallo al ingresar datos</h2></center><br>                   
                 <%  
                 }
               }
        %>
    </body>
</html>
