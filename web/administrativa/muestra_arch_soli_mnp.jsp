<%-- 
    Document   : muestra_arch_soli_mnp
    Created on : 16/08/2013, 05:42:22 PM
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
         <link rel="shortcut icon" href="../imagenes/fotos/favicon.ico">
         
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
       conecta_bd ba = new conecta_bd();
              ba.ConectaDb(); 
        
          String id_soli=request.getParameter("id_soli_no");
          String num=request.getParameter("id_num_med");    
              
        String sqa1="select ruta_archivo from autorizacion_no_pos where id_soli_no_post='"+id_soli+"' and num='"+num+"'";                                                            
        ResultSet result011=null;
          String ruta=""; 
        try{  
            result011=ba.consultas(sqa1); 
            while (result011.next()&&result011!=null) {
                           if(result011.getString(1)!=null  && result011.getString(1).compareTo("null")!=0 ){
                                        ruta=result011.getString(1);                                        
                                                                                                            }
                                                       }
            }                
        catch(SQLException ex){}
        catch(Exception exe){}    
        ba.cierraResultado(result011); 
        
        if(ruta.trim().length()==0 || ruta.compareTo("")==0 || ruta.compareTo("null")==0 || ruta==null){
        out.print("<br><br><br><center><h1>No existe ningún archivo relacionado con la aprobación de medicamentos no POS seleccioada</h1> </center>");
        }
        else{
            
          out.print("<a href='../archivos/apro_medic_mp/"+ruta+"' >descargar si archivo esta en formato no compatible</a>"); 
          out.print("<div align='center'>");
          out.print("<embed src='../archivos/apro_medic_mp/"+ruta+"' width='100%' height='100%' style='min-height:750px'></embed> ");
          out.print("</div>");
        }
        ba.cerrar();
        %>
        
    </body>
</html>
