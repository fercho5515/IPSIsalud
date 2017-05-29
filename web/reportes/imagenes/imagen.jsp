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
        if(request.getParameter("cod_con")!=null){cod_con=request.getParameter("cod_con"); } 
    
         
           ruta r = new ruta();
           cla cl = new cla();
           conecta_bd ba = new conecta_bd();
           ba.ConectaDb();
           String sql="SELECT p.fecha_naci,i.id_subcie from consulta_medica c,personas p,impre_diagno i where p.serial=c.serial_historia and c.id_consulta=i.id_consulta and c.id_consulta='"+cod_con+"' order by i.control";
                   String diagp="";String diag1="";String diag2="";String diag3="";String fecha="";
                    int control=0;
                    ResultSet resu2=null;
                    try{  resu2=ba.consultas(sql);
                        while (resu2.next()&&resu2!=null) {  
                                              if(control==0){fecha=""+resu2.getString(1);diagp=""+resu2.getString(2);}
                                         else if(control==1){diag1=""+resu2.getString(2);}
                                         else if(control==2){diag2=""+resu2.getString(2);}
                                         else if(control==3){diag3=""+resu2.getString(2);}
                                            control++;
                                                    }
                        }                       
                    catch(SQLException ex){}
                    catch(Exception exe){}
                    ba.cierraResultado(resu2);
        
                    edad s = new edad();
                    String fechitss="";
                    try{ fechitss=s.edad(fecha); }catch(Exception ee){}
                    
                    int t=cod_con.length();
                        t=12-t;   
                    String cod_con2=cod_con;                                        
                    for(int i=0;i<t;i++){
                                   cod_con2="0"+cod_con2;     
                                        }
                      
                                    

         try {     
                    Connection conexion;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conexion=DriverManager.getConnection("jdbc:mysql://localhost:"+cl.puer()+"/"+cl.bas()+"",""+cl.us()+"",""+cl.clav()+""); 

                 // File reportFile = new File(r.dir()+"/ISALUD/reportes/laboratorios/laboratorios.jasper");                     
               //  out.print(r.dir()+"/ISALUD/reportes/imagenes/imagen_uno.jasper");
                 //   File reportFile = new File(r.dir()+"/ISALUD/reportes/imagenes/imagen_uno.jasper"); 
                    File reportFile = new File(r.dir()+"/reportes/imagenes/imagen_uno.jasper"); 
                    Map parameters = new HashMap(); 
                  
                     parameters.put("id_consulta",cod_con);
                     parameters.put("id_barcod",cod_con2);
                     parameters.put("edad",fechitss);
                     parameters.put("diag_p",diagp);
                     parameters.put("diag_1",diag1);
                     parameters.put("diag_2",diag2);
                     parameters.put("diag_3",diag3);  
          
                     
                    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (), parameters, conexion); 
                  
                    response.setContentType("application/pdf"); 
                    response.setContentLength(bytes.length); 
                    ServletOutputStream ouputStream = response.getOutputStream(); 
                    ouputStream.write(bytes, 0, bytes.length); 
                    ouputStream.flush(); 
                    ouputStream.close(); 
                    } 
              catch(Exception ex ) {out.print(ex);} 
             ba.cerrar();
     %> 
    </body>
</html>