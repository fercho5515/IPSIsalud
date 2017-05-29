<%-- 
    Document   : agregaima
    Created on : 17/05/2013, 01:34:22 PM
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
           <%   
                 request.setCharacterEncoding("UTF-8");
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){
          %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
          <% 
              out.println("</body></html>");
              return;
            }
    
        String id=request.getParameter("id_img_real");
        String obserba=request.getParameter("observaciones_img_consu").replace("'","").replace("\"","");
        String sql="INSERT INTO `ips_isalud`.`imgs_sol` (`id_consulta`, `id_img`, `serial_historia`, `descri`, `leido`, `fecha_soli`) VALUES ('"+session.getAttribute("serial_consulta")+"','"+id+"','"+session.getAttribute("serial_pacinete")+"','"+obserba+"','0',now());";
  
       conecta_bd ba = new conecta_bd();
       ba.ConectaDb(); 
       ba.transaccion(sql);
       ba.cerrar();
       
      %>
    </body>
</html>
