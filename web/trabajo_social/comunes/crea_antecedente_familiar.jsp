<%-- 
    Document   : crea_antecedente_familiar
    Created on : 22/02/2013, 04:43:56 PM
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
          
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){}
         else{
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
                String sql="INSERT INTO `ips_isalud`.`antecedentes_familiares` (`id_historia_clinica`, `id_descri_antecedente`, `id_parentesco`, `descripcion`, `vivo`, `fecha`,`id_empleado`,`id_consulta`,`id_permiso`) VALUES ('"+(String)session.getAttribute("serial_pacinete")+"','"+request.getParameter( "antecedentee2" )+"','"+request.getParameter( "id_perentesco" )+"', '"+request.getParameter( "descripcion_ant_f" ).replace("'","").replace("\"","").replace("\n", " ")+"', '"+request.getParameter( "pari_vive" )+"',now(),'"+(String)session.getAttribute("id")+"','"+session.getAttribute("serial_consulta")+"','"+session.getAttribute("permiso")+"');";
          //  System.out.println("sq-->"+sql);
                ba.transaccion(sql);
                ba.cerrar();           

               }
        %>
    </body>
</html>
