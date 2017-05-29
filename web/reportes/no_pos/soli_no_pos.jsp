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
        <title>Remision</title>
    </head>
    <body>
      <%   
         String cod_con="";  
         String cod_sol="";  
         String numero="";
        if(request.getParameter("cod_con")!=null){cod_con=request.getParameter("cod_con"); } 
        if(request.getParameter("cod_sol")!=null){cod_sol=request.getParameter("cod_sol"); } 
        if(request.getParameter("numero")!=null){numero=request.getParameter("numero"); } 
           
        if(cod_con == null || cod_con.compareTo("")==0 ){
            conecta_bd ba = new conecta_bd();
            ba.ConectaDb();
            String sqlcon="select cod_consulta FROM ips_isalud.soli_no_post where id_soli_no_post='"+cod_sol+"';";
            ResultSet resuu2=ba.consultas(sqlcon);
            try{
                while (resuu2.next()&&resuu2!=null) { cod_con=resuu2.getString(1);}
                }
            catch(SQLException e){}
            catch(Exception ex){}
            ba.cierraResultado(resuu2);  
            ba.cerrar();                                                                   
                                                         } 
         
         
           ruta r = new ruta();
           cla cl = new cla();
           conecta_bd ba = new conecta_bd();
           ba.ConectaDb();


         try {     
                    Connection conexion;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conexion=DriverManager.getConnection("jdbc:mysql://localhost:"+cl.puer()+"/"+cl.bas()+"",""+cl.us()+"",""+cl.clav()+""); 

                   // File reportFile = new File(r.dir()+"/ISALUD/reportes/no_pos/no_pos.jasper"); 
                    File reportFile = new File(r.dir()+"/reportes/no_pos/no_pos.jasper"); 
                    Map parameters = new HashMap(); 
                  
                                 
                    parameters.put("id_consulta",cod_con);
                    parameters.put("numero",numero);
          
                     
                    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (), parameters, conexion); 
                    response.setContentType("application/pdf"); 
                    response.setContentLength(bytes.length); 
                    ServletOutputStream ouputStream = response.getOutputStream(); 
                    ouputStream.write(bytes, 0, bytes.length); 
                    ouputStream.flush(); 
                    ouputStream.close(); 
                    } 
              catch(Exception ex ) {} 
             ba.cerrar();
     %> 
    </body>
</html>
