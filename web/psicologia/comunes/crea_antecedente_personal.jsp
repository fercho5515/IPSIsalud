<%-- 
    Document   : crea_antecedente_personal
    Created on : 22/02/2013, 12:24:29 PM
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
                String d=""+request.getParameter( "descripcion_ant" );
                d=d.replace("'","");
                d=d.replace("\"","");
                d=d.replace("\n", " ");
              
                String sql="INSERT INTO `antecedentes_personales` (`id_historia_clinica`, `id_descri_antecedente`, `descripcion`, `fecha`, `edad`,`id_empleado`,`id_consulta`,`id_permiso`) VALUES ('"+(String)session.getAttribute("serial_pacinete")+"','"+request.getParameter( "antecedentee" ).replace("'","").replace("\"","").replace("\n", " ")+"','"+d+"', now(), '"+request.getParameter( "edad_ant" ).replace("'","").replace("\"","").replace("\n", " ")+"','"+(String)session.getAttribute("id")+"','"+session.getAttribute("serial_consulta")+"','"+session.getAttribute("permiso")+"');";
           //  System.out.println("cre a p "+sql);           
                ba.transaccion(sql);
                ba.cerrar();           

               }
        %>
    </body>
</html>
