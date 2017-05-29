<%-- 
    Document   : nueva_comida_menu
    Created on : 18/10/2013, 11:38:47 AM
    Author     : Emmanuel
--%>


<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     <%
     request.setCharacterEncoding("UTF-8");
        //  out.print("nom "+session.getAttribute("nombre")+" clave "+session.getAttribute("clave")+" id "+session.getAttribute("id")+" permiso "+session.getAttribute("permiso")+" s agenda "+session.getAttribute("serial_agenda" )+" s paciente"+session.getAttribute("serial_pacinete"));
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null || session.getAttribute("serial_consulta")==null ){
      
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
      <% 
              out.println("</body></html>");
              return;
            } 
      conecta_bd ba = new conecta_bd();
      ba.ConectaDb();
     
     
     
         //select
      String hora=request.getParameter("hora_d");      
      if(hora == null || hora.compareTo("-1")==0 || hora.compareTo("")==0){hora="null";}
      else{hora="'"+hora+"'";}
      
      String comida=request.getParameter("id_comida");      
      if(comida == null || comida.compareTo("-1")==0 || comida.compareTo("")==0){comida="null";}
      else{comida="'"+comida+"'";}
      
      String obse=request.getParameter("cantidadc");
      if(obse != null && obse.compareTo("")!=0){obse=obse.replace("'","").replace("\"","");obse="'"+obse+"'";}
        
      String sql="INSERT INTO `ips_isalud`.`menu_comida` (`id_consulta_nutri`, `id_comida`, `cantidad`) VALUES ('"+session.getAttribute("serial_consulta")+"',"+comida+", "+obse+");"; 
     // System.out.println("sql nueva_comida_menu.jsp "+sql);
      ba.transaccion(sql);
      ba.cerrar();       
      
 %>
    </body>
</html>
