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
         <link rel="shortcut icon" href="../../../../imagenes/fotos/favicon.ico">
        
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
          String tipo=request.getParameter("tipo_arc");// 1 contrato   2 firma
          String serial=""+session.getAttribute("serial_emple_f");
           
          
          
          
          conecta_bd ba = new conecta_bd();
          ba.ConectaDb();
         
          String sqpri="select ruta_contrato,firma from empleados where serial_empleado='"+serial+"'";
          
          if(tipo.compareTo("1")==0){}
                                else{}
          String ruta1="";
          String ruta2="";
          
          ResultSet resupri=null;
           try{  resupri=ba.consultas(sqpri);
                 while (resupri.next()&&resupri!=null) {  
                                                   ruta1=resupri.getString(1);
                                                   ruta2=resupri.getString(2);                                                     
                                                       }
              }                       
           catch(SQLException ex){ruta1="";ruta2="";}
           catch(Exception exe){ruta1="";ruta2="";}
           ba.cierraResultado(resupri);  
                               
          ba.cerrar();
          
          String style="";
        if( tipo.compareTo("1")==0 && (ruta1.trim().length()==0 || ruta1.compareTo("")==0 || ruta1.compareTo("null")==0 || ruta1==null) ){
        out.print("<br><br><br><center><h1>No existe ningún archivo relacionado</h1> </center>");
        }
       else if( tipo.compareTo("2")==0 && (ruta2.trim().length()==0 || ruta2.compareTo("")==0 || ruta2.compareTo("null")==0 || ruta2==null) ){
        out.print("<br><br><br><center><h1>No existe ningún archivo relacionado</h1> </center>");
        }  
        else{String rutat="";
            if(tipo.compareTo("1")==0){rutat=ruta1;    style=" width='100%' height='100%' style='min-height:750px'";}
            else{rutat=ruta2;}
          out.print("<a href='../../../"+rutat+"' >descargar si archivo esta en formato no compatible</a>"); 
          out.print("<div align='center'>");
          out.print("<embed src='../../../"+rutat+"' "+style+"></embed> ");
          out.print("</div>");
        }
        %>
        
    </body>
</html>
