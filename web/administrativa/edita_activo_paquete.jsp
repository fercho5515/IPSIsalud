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
              String opera=""+request.getParameter("oper");
                // System.out.println("hjg  =>"+opera);
             if(opera.compareTo("edit")==0){                           
                        String sql="UPDATE `ips_isalud`.`afiliados_pac_int` SET `activo2`='"+request.getParameter("activo2")+"' WHERE `id_contrato`='"+session.getAttribute("id_contratacion")+"' and `serial_paciente`='"+request.getParameter("id")+"' and `id_pac_int`='"+session.getAttribute("id_paq")+"';";
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