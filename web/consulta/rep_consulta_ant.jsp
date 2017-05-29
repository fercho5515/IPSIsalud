<%-- 
    Document   : rep_consulta_ant
    Created on : 10/08/2013, 07:00:40 PM
    Author     : Emmanuel
--%>

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
        <title>JSP Page</title>
    </head>
    <body>
          <% request.setCharacterEncoding("UTF-8");
        //  out.print("nom "+session.getAttribute("nombre")+" clave "+session.getAttribute("clave")+" id "+session.getAttribute("id")+" permiso "+session.getAttribute("permiso")+" s agenda "+session.getAttribute("serial_agenda" )+" s paciente"+session.getAttribute("serial_pacinete"));
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){
          
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
          
            cla cl = new cla();
           conecta_bd ba = new conecta_bd();
                      ba.ConectaDb();
           String sql="select fecha_naci from personas where serial='"+session.getAttribute("serial_pacinete")+"'";
           String fecha="";
             ResultSet resuu=ba.consultas(sql);
                        try{
                            while (resuu.next()&&resuu!=null) {   
                               fecha=resuu.getString(1);                           
                            }
                        }
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cierraResultado(resuu);
               ba.cerrar();         
              edad s = new edad();
              String fechitss=s.edad(fecha);
              String cod_consulta=request.getParameter("cod_con");
              
              try {     
                    Connection conexion;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    conexion=DriverManager.getConnection("jdbc:mysql://localhost:"+cl.puer()+"/"+cl.bas()+"",""+cl.us()+"",""+cl.clav()+""); 


                    File reportFile = new File(application.getRealPath("reportes/reporte_consulta_med_ant/consulta_tod.jasper")); 
                    Map parameters = new HashMap(); 
                     //parameters.put("Parametro1", "valor"); 
                     parameters.put("id_paciente",""+session.getAttribute("serial_pacinete")+"");
                     parameters.put("edad",""+fechitss+"");
                     parameters.put("cod_consulta",""+cod_consulta+"");
                    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (), parameters, conexion); 
                    response.setContentType("application/pdf"); 
                    response.setContentLength(bytes.length); 
                    ServletOutputStream ouputStream = response.getOutputStream(); 
                    ouputStream.write(bytes, 0, bytes.length); 
                    ouputStream.flush(); 
                    ouputStream.close(); 
                    } 
              catch(Exception ex ) {} 

         %>
    </body>
</html>
