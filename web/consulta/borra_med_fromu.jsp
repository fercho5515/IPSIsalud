<%-- 
    Document   : borra_med_fromu
    Created on : 1/08/2013, 12:23:47 PM
    Author     : Emmanuel
--%>
<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <% request.setCharacterEncoding("UTF-8");
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     <% 
        out.println("</body></html>");
        return;
        }
          conecta_bd ba = new conecta_bd();
          ba.ConectaDb(); 
          String id=request.getParameter( "id" );
          String sql="DELETE FROM `ips_isalud`.`formula_medica` WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"' and `serial`='"+id+"';";
          ba.transaccion(sql);
          ba.cerrar();
     %> 
    </body>
</html>
