<%-- 
    Document   : edita_distribuidor
    Created on : 14/03/2013, 11:55:29 AM
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
                        String sql="UPDATE `ips_isalud`.`distribuidores` SET `nombre`='"+request.getParameter("nombre")+"', `nit`='"+request.getParameter("nit")+"', `telefono`='"+request.getParameter("telefono")+"', `celular`='"+request.getParameter("celular")+"', `camara_comercio`='"+request.getParameter("camco")+"', `direccion`='"+request.getParameter("direc")+"' WHERE `id_distri`='"+request.getParameter("id")+"';";
                     // System.out.println("aja "+sql);
                        conecta_bd ba = new conecta_bd();
                        ba.ConectaDb();
                        ba.transaccion(sql);
                        ba.cerrar();
                                     }
             else if(opera.compareTo("del")==0){
             
                        String sql="delete from distribuidores where id_distri='"+request.getParameter("id")+"';";
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
