<%-- 
    Document   : crea_rips
    Created on : 4/12/2013, 03:39:36 PM
    Author     : servidor
--%>

<%@page import="java.io.File"%>
<%@page import="pac.ruta"%>
<%@page import="pac.Rips"%>
<%@page import="java.util.Calendar"%>

<!DOCTYPE html>
<%-- CrearDirectorio.jsp --%> 
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="error.jsp" %> 
<%@ page import="java.io.*" %> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><% 
      
           request.setCharacterEncoding("UTF-8");
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
            
                Calendar cal1 = Calendar.getInstance();
	            String dia=""+cal1.get(Calendar.DATE)+"";
	                   dia=dia.trim();
	            String mes=""+(1+Integer.parseInt(""+cal1.get(Calendar.MONTH)+""))+"";
	                   mes=mes.trim();
	            if(dia.length()==1){dia="0"+dia;} 
	            if(mes.length()==1){mes="0"+mes;} 	      
                String nombre="rips_"+dia+"-"+mes+"-"+cal1.get(Calendar.YEAR)+"-"+cal1.get(Calendar.HOUR)+"-"+cal1.get(Calendar.MINUTE)+"-"+cal1.get(Calendar.SECOND)+"-"+cal1.get(Calendar.MILLISECOND);

   //  out.print("<br> "+nombre);
     
     
     String contrato="";
     if(request.getParameter("contrato_arch_rips")!=null && request.getParameter("contrato_arch_rips").compareTo("null")!=0){contrato=request.getParameter("contrato_arch_rips");}
     
     String paquete="";
     if(request.getParameter("paquet_int_arch_rips")!=null && request.getParameter("paquet_int_arch_rips").compareTo("null")!=0){paquete=request.getParameter("paquet_int_arch_rips");}
     
     String fecha_i="";
     if(request.getParameter("fecha_inicial_rips")!=null && request.getParameter("fecha_inicial_rips").compareTo("null")!=0){fecha_i=request.getParameter("fecha_inicial_rips");}
     
     String fecha_f="";
     if(request.getParameter("fecha_final_rips")!=null && request.getParameter("fecha_final_rips").compareTo("null")!=0){fecha_f=request.getParameter("fecha_final_rips");}
     
     Rips cr=new Rips();
          cr.RipsIni(contrato, paquete, nombre,fecha_i,fecha_f);       
   
     String result=cr.crea_rips();
     out.println(result);
        
     
%>
  
        <h1></h1>
    </body>
</html>
