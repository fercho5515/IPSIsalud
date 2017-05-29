<%-- 
    Document   : edita_vendedor
    Created on : 14/03/2013, 11:21:58 PM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% request.setCharacterEncoding("UTF-8");
           if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null ){}
         else{
              String opera=(String)request.getParameter("oper");
                // System.out.println("hjg  =>"+opera);
             if(opera.compareTo("edit")==0){                           
                        String sql="UPDATE `ips_isalud`.`vendedores` SET `cedula`='"+request.getParameter("cedula")+"', `nombres`='"+request.getParameter("nombres")+"', `apellidos`='"+request.getParameter("apellidos")+"', `telefono`='"+request.getParameter("telefono")+"', `celular`='"+request.getParameter("celular")+"', `direccion`='"+request.getParameter("direccion")+"' WHERE `id_vendedor`='"+request.getParameter("id")+"';";
                     // System.out.println("aja "+sql);
                        conecta_bd ba = new conecta_bd();
                        ba.ConectaDb();
                        ba.transaccion(sql);
                        ba.cerrar();
                                     }
             else if(opera.compareTo("del")==0){
             
                        String sql="delete from vendedores where id_vendedor='"+request.getParameter("id")+"';";
                     // System.out.println("aja "+sql);                        
                        conecta_bd ba = new conecta_bd();
                        ba.ConectaDb();
                        ba.transaccion(sql);
                        ba.cerrar();                     

                                }
              } 
        %>
    </body>
</html>
