<%-- 
    Document   : agrega_medicamento
    Created on : 30/07/2013, 06:38:26 PM
    Author     : EMMANUEL
--%>
<!--          -->
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
    
        String serial_med=request.getParameter("seria_medic").replace("'","").replace("\"","");
        String cantid_med=request.getParameter("cantidad_med").replace("'","").replace("\"","");
        String tiempo_med=request.getParameter("tiempo_trat").replace("'","").replace("\"","");
        String diagno_med=request.getParameter("select_diag_form").replace("'","").replace("\"","");
        String posologia=request.getParameter("formu_posologia").replace("'","").replace("\"","");
        String viaadmin=request.getParameter("viaadmin_med").replace("'","").replace("\"","");
        
        String sql=" INSERT INTO `ips_isalud`.`formula_medica` (`id_consulta`, `cod_medicamento`, `posologia`, `cantidad`, `sub_cie10`, `tiempo_tratamiento`, `via_admin`) VALUES ('"+session.getAttribute("serial_consulta")+"','"+serial_med+"', '"+posologia+"','"+cantid_med+"', '"+diagno_med+"', '"+tiempo_med+"','"+viaadmin+"');";
        
       conecta_bd ba = new conecta_bd();
       ba.ConectaDb(); 
       ba.transaccion(sql);
       ba.cerrar();
       
      %>
    </body>
</html>

