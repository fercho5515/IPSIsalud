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
         <link rel="shortcut icon" href="../../../imagenes/fotos/favicon.ico">
        
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
          String id=request.getParameter("id_arch");
           
          conecta_bd ba = new conecta_bd();
          ba.ConectaDb();
         
          String sqpri="select nombre from archivos_consulta_trabajo_so where id='"+id+"'";
          String nom="";
                   
          ResultSet resupri=null;
           try{  resupri=ba.consultas(sqpri);
                 while (resupri.next()&&resupri!=null) {  
                                                   nom=resupri.getString(1);                                                     
                                                       }
              }                       
           catch(SQLException ex){nom="";}
           catch(Exception exe){nom="";}
           ba.cierraResultado(resupri);  
                               
          ba.cerrar();
          
          String style="";
        if( nom==null || nom.compareTo("null")==0 || nom.trim().length()==0 || nom.compareTo("")==0 ){
        out.print("<br><br><br><center><h1>No existe ningún archivo relacionado "+sqpri+"</h1> </center>");
        }  
        else{String rutat="ISALUD/archivos/arc_trab_soci/"+nom;
              style=" width='100%' height='100%' style='min-height:400px'";
          out.print("<a href='../../../"+rutat+"' target='_blank' >descargar si archivo esta en formato no compatible</a>"); 
          out.print("<div align='center'>");
          out.print("<embed src='../../../"+rutat+"' "+style+"></embed> ");
          out.print("</div>");
        }
        %>
        
    </body>
</html>
