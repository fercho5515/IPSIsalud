<%-- 
    Document   : quitalabs
    Created on : 10/05/2013, 01:59:36 PM
    Author     : EMMANUEL
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
          String id=request.getParameter( "idlabo" );
          String sql="DELETE FROM `ips_isalud`.`labs_sol` WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"' and `serial`='"+id+"';";
        //  System.out.println("delete "+sql);
          ba.transaccion(sql);
          ba.cerrar();
     %> 
    </body>
</html>
