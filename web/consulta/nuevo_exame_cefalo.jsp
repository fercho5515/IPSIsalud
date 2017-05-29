<%-- 
    Document   : nuevo_exame_cefalo
    Created on : 24/02/2013, 04:46:53 PM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
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
           <%    request.setCharacterEncoding("UTF-8");
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){
          
          %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
    
        String id=request.getParameter("parte").replace("'","").replace("\"","");
        String afectacion=request.getParameter("afectacion").replace("'","").replace("\"","");
        String sql="INSERT INTO `ex_cefalocaudal` (`id_parte`, `dolencia`,`id_consulta`) VALUES ('"+id+"', '"+afectacion+"','"+session.getAttribute("serial_consulta")+"');";
        
       conecta_bd ba = new conecta_bd();
       ba.ConectaDb(); 
       ba.transaccion(sql);
       ba.cerrar();
       
      %>
    </body>
</html>
