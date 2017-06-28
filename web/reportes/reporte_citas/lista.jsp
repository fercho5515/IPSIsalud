<%-- 
    Document   : formula
    Created on : 5/11/2013, 03:16:07 PM
    Author     : servidor
--%>

<%@page import="net.sf.jasperreports.engine.export.JRPdfExporter"%>
<%@page import="pac.ruta"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="pac.cla"%>
<%@page import="java.util.*" session="true" %>

<%@page import = "net.sf.jasperreports.engine.*" %>
<%@page import = "net.sf.jasperreports.engine.util.*"%> 
<%@page import = "net.sf.jasperreports.components.barcode4j.*" %> 
<%@page import = "java.util.*" %>
<%@page import = "java.io.*" %>
<%@page import = "java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="../../imagenes/fotos/favicon.ico">
        <title>Formula Medica</title>
    </head>
    <body>
      <%   
           
         String fecha=request.getParameter("fecha"); 
         String medico=request.getParameter("medico"); 
         String permiso=request.getParameter("permiso"); 
         
         
         String titulo="Titulo";  
              if(permiso.compareTo("1")==1){ titulo="Consulta Enfermeria";}
         else if(permiso.compareTo("2")==1){ titulo="Consulta Medicina";}
         else if(permiso.compareTo("3")==1){ titulo="Consulta Medicina Especializada";}
         else if(permiso.compareTo("4")==1){ titulo="Consulta Nutricion";}
         else if(permiso.compareTo("5")==1){ titulo="Consulta Psicologia";}
         else if(permiso.compareTo("6")==1){ titulo="Consulta Trabajo Social";}

         
         
           
           ruta r = new ruta();
           cla cl = new cla();
           conecta_bd ba = new conecta_bd();
           ba.ConectaDb();


         try {     
                    Connection conexion;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conexion=DriverManager.getConnection("jdbc:mysql://localhost:"+cl.puer()+"/"+cl.bas()+"",""+cl.us()+"",""+cl.clav()+""); 

                    //File reportFile = new File(r.dir()+"/ISALUD/reportes/reporte_formula_med/report_formulita.jasper"); 
                    File reportFile = new File(r.dir()+"/reportes/reporte_citas/report1.jasper"); 
                    Map parameters = new HashMap(); 
                  
                    parameters.put("fecha",fecha);
                    parameters.put("medico",Integer.parseInt(medico));
                    parameters.put("permiso",Integer.parseInt(permiso));
                    parameters.put("titulo",titulo);
          
                     
                    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conexion); 
                    response.setContentType("application/pdf"); 
                    response.setContentLength(bytes.length); 
                    ServletOutputStream ouputStream = response.getOutputStream(); 
                    ouputStream.write(bytes, 0, bytes.length); 
                    ouputStream.flush(); 
                    ouputStream.close(); 
                    } 
              catch(Exception ex ) {
                  out.println("ex =>"+ex);
              } 
             ba.cerrar();
            // out.println("fecha =>"+fecha);
     %> 
    </body>
</html>
