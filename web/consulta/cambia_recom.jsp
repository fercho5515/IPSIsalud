<%-- 
    Document   : cambia_recom
    Created on : 4/09/2013, 10:01:40 PM
    Author     : Emmanuel
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
                String oper=request.getParameter("oper");
                if(oper!=null && oper.compareTo("add")==0){ } 
                if(oper!=null && oper.compareTo("up")==0){
                                             String sql="UPDATE `ips_isalud`.`recomendacion` SET `leida`=1, `id_quien_leyo`='"+session.getAttribute("id")+"', `fecha_lee`=curdate(), `cod_consulta_lee`='"+session.getAttribute("serial_consulta")+"' WHERE `id_recom`='"+request.getParameter("id")+"';";     
                                             ba.transaccion(sql);              }
                else{
                    String sql2="DELETE FROM `ips_isalud`.`recomendacion` WHERE `id_recom`='"+request.getParameter("id")+"' and cod_consulta_crea='"+session.getAttribute("serial_consulta")+"';";
                    ba.transaccion(sql2);  
                    }                              
                ba.cerrar();           
               }
        %>
    </body>
</html>
