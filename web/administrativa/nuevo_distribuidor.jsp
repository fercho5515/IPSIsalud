<%-- 
    Document   : nuevo_distribuidor
    Created on : 11/03/2013, 06:56:51 PM
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
                String sql="INSERT INTO `ips_isalud`.`distribuidores` (`nombre`, `nit`, `telefono`, `celular`, `camara_comercio`, `direccion`) VALUES ('"+request.getParameter("nom_distri")+"', '"+request.getParameter("nit")+"', '"+request.getParameter("telefono_distri")+"', '"+request.getParameter("celular_distri")+"', '"+request.getParameter("cam_comercio")+"', '"+request.getParameter("direc_distrin")+"');";
                 //          +"INSERT INTO `lab_farmaceutico` (`nombre`, `direccion`, `telefono`, `nit`) VALUES ('"+request.getParameter("nombrelado")+"','"+request.getParameter("direccionlabo")+"','"+request.getParameter("telefonolado")+"','"+request.getParameter("nitlado")+"');";

             // String sql="INSERT INTO `antecedentes_personales` (`id_historia_clinica`, `id_descri_antecedente`, `descripcion`, `fecha`, `edad`,`id_empleado`) VALUES ('"+(String)session.getAttribute("serial_pacinete")+"','"+request.getParameter( "antecedentee" )+"','"+request.getParameter( "descripcion_ant" )+"', curdate(), '"+request.getParameter( "edad_ant" )+"','"+(String)session.getAttribute("id")+"');";
             // System.out.println("cre a p "+sql);           
                if(ba.transaccion(sql)){out.print(" <h2 style='color:green'>distribuidor creado con exito</h2><br> ");
                                                    String sqlh="insert into historial_c (id_empleado,fecha_hora,descripcion) values ('"+session.getAttribute("id")+"',now(),'crea distribuidor "+request.getParameter("nom_distri")+" con nit "+request.getParameter("nit")+"');";

                                                    try{ if(ba.transaccion(sqlh)==true){ } }
                                                    catch(Exception e){}  
                                                    ba.cerrar();   
                                                    }
                               else{out.print(" <h2 style='color:red'>Fallo al crear distribuidor, asegúrese que el nombre y nit del distribuidor no correspondan a datos existentes</h2><br>  ");}
               
                ba.cerrar();
                }
               catch(Exception exe){
                 %>  
                 <h2 style='color:red'>Fallo al crear distribuidor</h2><br>                   
                 <%  
                 }
               }
        
        %>
    </body>
</html>
