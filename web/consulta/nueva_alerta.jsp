<%-- 
    Document   : nueva_alerta
    Created on : 4/09/2013, 01:16:13 PM
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
                if(oper!=null && oper.compareTo("add")==0){
                                            String alerta="";
                                            if(request.getParameter("alerta")!=null && request.getParameter("alerta").compareTo("null")!=0){alerta=""+request.getParameter("alerta");}
                                              alerta=alerta.replace("\n", " ");
                                              alerta=alerta.replace("'","").replace("\"","");
                                            String sql="INSERT INTO `ips_isalud`.`alertas` (`alerta`, `id_permiso`, `id_empleado_crea`,`fecha_crea`,`cod_consult_crea`,`id_paciente`) VALUES ('"+alerta+"','"+session.getAttribute("permiso")+"','"+session.getAttribute("id")+"',curdate(),'"+session.getAttribute("serial_consulta")+"','"+session.getAttribute("serial_pacinete")+"');";
                                            ba.transaccion(sql);  
                                                          } 
                if(oper!=null && oper.compareTo("up")==0){
                                             String sql="UPDATE `ips_isalud`.`alertas` SET `id_empleado_lee`='"+session.getAttribute("id")+"', `fecha_lee`=curdate(), `cod_consult_lee`='"+session.getAttribute("serial_consulta")+"', `leido`=1 WHERE `id_alertas`='"+request.getParameter("id")+"';";     
                                             ba.transaccion(sql);              }
                else{
                    String sql2="DELETE FROM `ips_isalud`.`alertas` WHERE `id_alertas`='"+request.getParameter("id")+"' and cod_consult_crea='"+session.getAttribute("serial_consulta")+"';";
                    ba.transaccion(sql2);  
                    }                              
                ba.cerrar();           
               }
        %>
    </body>
</html>
