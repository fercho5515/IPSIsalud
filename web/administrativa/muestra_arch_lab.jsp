<%-- 
    Document   : muestra_arch_lab
    Created on : 17/08/2013, 03:22:24 PM
    Author     : Emmanuel
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Archivo de soporte para aprobación de medicamento no POS</title>
    </head>
    <body>
         <% 
                    request.setCharacterEncoding("UTF-8");
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null ){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp" >volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            } 
          String ruta=request.getParameter("ruta_arch_lab");

        if(ruta.trim().length()==0 || ruta.compareTo("")==0 || ruta.compareTo("null")==0 || ruta==null){
        out.print("<br><br><br><center><h1>No existe ningún archivo relacionado con la aprobación de medicamentos no POS seleccioada</h1> </center>");
        }
        else{
            
          out.print("<a href='../archivos/laboratorios/"+ruta+"' >descargar si archivo esta en formato no compatible</a>"); 
          out.print("<div align='center'>");
          out.print("<embed src='../archivos/laboratorios/"+ruta+"' width='100%' height='100%' style='min-height:750px'></embed> ");
          out.print("</div>");
        }
        %>
        
    </body>
</html>
