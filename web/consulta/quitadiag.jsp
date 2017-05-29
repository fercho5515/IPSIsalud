<%-- 
    Document   : quitadiag
    Created on : 7/05/2013, 05:11:06 PM
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
          String id=request.getParameter( "qcie_10" );
          String sql="DELETE FROM `ips_isalud`.`impre_diagno` WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"' and`id_subcie`='"+id+"';";
          ba.transaccion(sql);
          ba.cerrar();
     %> 
    </body>
</html>
