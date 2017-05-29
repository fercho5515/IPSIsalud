<%-- 
    Document   : edita_datos_eps
    Created on : 28-ago-2013, 21:20:57
    Author     : servidor
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
                        String sql="UPDATE `ips_isalud`.`eps` SET `ideps`='"+request.getParameter("ideps")+"', `nit`='"+request.getParameter("nit")+"', `nombre`='"+request.getParameter("nombre")+"', `direccion`='"+request.getParameter("direccion")+"', `telefono`='"+request.getParameter("telefono")+"', `ciudad`='"+request.getParameter("ciudad")+"', `tipo`='"+request.getParameter("tipo")+"' WHERE `ideps`='"+request.getParameter("ideps")+"';";
                        //System.out.print(sql);
                        conecta_bd ba = new conecta_bd();
                        ba.ConectaDb();
                        ba.transaccion(sql);
                        ba.cerrar();
                                     }
             else if(opera.compareTo("del")==0){
             
                        String sql="DELETE FROM `ips_isalud`.`eps` WHERE `indice`='"+request.getParameter("id")+"';"; 
                   //     System.out.println(sql); 
                        conecta_bd ba = new conecta_bd();
                        ba.ConectaDb();
                        ba.transaccion(sql);
                        ba.cerrar();                     

                                }
              } 
        %>
    </body>
</html>
