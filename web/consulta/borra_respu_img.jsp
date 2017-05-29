<%-- 
    Document   : borra_respu_img
    Created on : 18/05/2013, 08:32:18 PM
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
                 String  idimg=""+request.getParameter("soli_img");
                 String serial=""+request.getParameter("resu_img");
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
               
                String  sql="DELETE FROM `ips_isalud`.`resu_img` WHERE `id_ima`='"+serial+"';";
                String sql2="UPDATE `ips_isalud`.`imgs_sol` SET `leido`=0 WHERE `serial`='"+idimg+"';";
           
                
                if(ba.transaccion(sql)){
                            ba.transaccion(sql2);
                                       }
                else{}
                ba.cerrar();           
             // System.out.print("borra resu img: "+sql+" \n sql2 "+sql2);
               }
        %>
       
    </body>
</html>