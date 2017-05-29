<%-- 
    Document   : consulta_f4
    Created on : 6/05/2013, 05:13:49 PM
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
           <%     request.setCharacterEncoding("UTF-8");
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){
          
          %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
        conecta_bd ba = new conecta_bd();
        ba.ConectaDb(); 
       
        
        String plan=request.getParameter("plan");        
        
        plan=plan.replace("'","").replace("\"","");   
        
        String con="UPDATE `ips_isalud`.`consulta_medica` SET `plan`='"+plan+"' WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';";
     //   System.out.println("f4 "+con);
        ba.transaccion(con);       
                      
       ba.cerrar();
       
      %>
    </body>
</html>

