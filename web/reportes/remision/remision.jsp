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
         String cod_rem="";
        if(request.getParameter("cod_con")!=null){cod_con=request.getParameter("cod_con"); } 
        if(request.getParameter("cod_rem")!=null){cod_rem=request.getParameter("cod_rem"); } 
           
        if(cod_con == null || cod_con.compareTo("")==0 ){
            conecta_bd ba = new conecta_bd();
            ba.ConectaDb();
            String sqlcon="SELECT id_consulat FROM ips_isalud.remision_espe where serial='"+cod_rem+"';";
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

                    //File reportFile = new File(r.dir()+"/ISALUD/reportes/remision/remisiones.jasper"); 
                    File reportFile = new File(r.dir()+"/reportes/remision/remisiones.jasper");
                    Map parameters = new HashMap(); 
                  
                    String sql="SELECT p.fecha_naci from consulta_medica c,personas p where p.serial=c.serial_historia and c.id_consulta='"+cod_con+"' ";
                    String fecha="";
                    ResultSet resu2=null;
                    try{  resu2=ba.consultas(sql);
                        while (resu2.next()&&resu2!=null) {  
                                                        fecha=""+resu2.getString(1);
                                                    }
                        }                       
                    catch(SQLException ex){}
                    catch(Exception exe){}
                    ba.cierraResultado(resu2);
                    
                    edad s = new edad();
                    String fechitss="";
                    try{ fechitss=s.edad(fecha); }catch(Exception es){}
                    
                    parameters.put("id_consulta",cod_con);
                    parameters.put("edad",fechitss);
          
                     
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
