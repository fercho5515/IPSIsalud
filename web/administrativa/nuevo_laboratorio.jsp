<%-- 
    Document   : nuevo_laboratorio
    Created on : 13/03/2013, 04:32:06 PM
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
                String sql="INSERT INTO `lab_farmaceutico` (`nombre`, `direccion`, `telefono`, `nit`) VALUES ('"+request.getParameter("nombrelado")+"','"+request.getParameter("direccionlabo")+"','"+request.getParameter("telefonolado")+"','"+request.getParameter("nitlado")+"');";

             // String sql="INSERT INTO `antecedentes_personales` (`id_historia_clinica`, `id_descri_antecedente`, `descripcion`, `fecha`, `edad`,`id_empleado`) VALUES ('"+(String)session.getAttribute("serial_pacinete")+"','"+request.getParameter( "antecedentee" )+"','"+request.getParameter( "descripcion_ant" )+"', curdate(), '"+request.getParameter( "edad_ant" )+"','"+(String)session.getAttribute("id")+"');";
             // System.out.println("cre a p "+sql);           
                if(ba.transaccion(sql)){out.print(" <h2 style='color:green'>Laboratorio creado con exito</h2><br> ");}
                               else{out.print(" <h2 style='color:red'>Fallo al crear laboratorio, asegúrese que el nombre no corresponda a datos existentes</h2><br>  ");}
            
                  ba.cerrar();   
                                  
                   }
               catch(Exception exe){
                 %>  
                 <h2 style='color:red'>Fallo al crear laboratorio</h2><br>                   
                 <%  
                 }
               }
        %>
    </body>
</html>
