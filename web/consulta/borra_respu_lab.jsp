<%-- 
    Document   : borra_respu_lab
    Created on : 18/05/2013, 08:20:23 PM
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
                 String  idlab=""+request.getParameter("soli_lab");
                 String serial=""+request.getParameter("resu_lab");
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
               
                String  sql="DELETE FROM `ips_isalud`.`resu_laboratorios` WHERE `id_lab`='"+serial+"';";
                String sql2="UPDATE `ips_isalud`.`labs_sol` SET `leido`=0 WHERE `serial`='"+idlab+"';";
           
                
                if(ba.transaccion(sql)){
                            ba.transaccion(sql2);
                                       }
                else{}
              //  System.out.print("borra resu lab: "+sql+" \nsql2 "+sql2);
                ba.cerrar();           

               }
        %>
       
    </body>
</html>