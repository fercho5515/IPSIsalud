<%-- 
    Document   : buscar_imagen
    Created on : 18/02/2013, 03:38:38 PM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
          conecta_bd ba = new conecta_bd();
          ba.ConectaDb(); 
         
         String sql="select foto from personas p,empleados e where p.serial=e.serial_empleado and p.id_person='"+request.getParameter("id")+"';";
       
          ResultSet resu=ba.consultas(sql);
	
          String foto="silueta.png";
	try{
	    while (resu.next()&&resu!=null) { foto=""+resu.getString(1);   }
	    }
	catch(SQLException ex){}
	catch(Exception exe){}
        
        ba.cierraResultado(resu);     
        ba.cerrar();    
         
  
          %>
          
       <center><img src="imagenes/fotos/<% out.println(foto);%>" onerror="this.src='imagenes/fotos/silueta.png'" alt="imagen no encontrada" height="200px" width="auto"></center>

    </body>
</html>
