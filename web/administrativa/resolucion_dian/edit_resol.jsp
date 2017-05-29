<%-- 
    Document   : nueva_resol
    Created on : 27/11/2013, 04:12:14 PM
    Author     : servidor
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <% 
      
           request.setCharacterEncoding("UTF-8");
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
           
           String idres="null";
           if(request.getParameter("id_resolucionn")!=null && request.getParameter("id_resolucionn").compareTo("null")!=0 && request.getParameter("id_resolucionn").trim().compareTo("")!=0){
                           idres="'"+request.getParameter("id_resolucionn").replace("'","").replace("\"","")+"'"; }
           
           String Nresol="null";
           if(request.getParameter("num_resul2")!=null && request.getParameter("num_resul2").compareTo("null")!=0 && request.getParameter("num_resul2").trim().compareTo("")!=0){
                           Nresol="'"+request.getParameter("num_resul2").replace("'","").replace("\"","")+"'"; }
           
            String fecha="null";
           if(request.getParameter("fech_resul2")!=null && request.getParameter("fech_resul2").compareTo("null")!=0 && request.getParameter("fech_resul2").trim().compareTo("")!=0){
                           fecha="'"+request.getParameter("fech_resul2").replace("'","").replace("\"","")+"'";}
            
           String Nini="null";
           if(request.getParameter("num_ini2")!=null && request.getParameter("num_ini2").compareTo("null")!=0 && request.getParameter("num_ini2").trim().compareTo("")!=0){
                          Nini="'"+request.getParameter("num_ini2").replace("'","").replace("\"","")+"'";}
           
            String Nfin="null";
           if(request.getParameter("num_fin2")!=null && request.getParameter("num_fin2").compareTo("null")!=0 && request.getParameter("num_fin2").trim().compareTo("")!=0){
                         Nfin="'"+request.getParameter("num_fin2").replace("'","").replace("\"","")+"'";}
            
            String tipo="null";
           if(request.getParameter("num_tifac2")!=null && request.getParameter("num_tifac2").compareTo("null")!=0 && request.getParameter("num_tifac2").trim().compareTo("")!=0){
                         tipo="'"+request.getParameter("num_tifac2").replace("'","").replace("\"","")+"'";}
           
            String estado=request.getParameter("estado_resolucionn");
            
             conecta_bd ba = new conecta_bd();
                       ba.ConectaDb(); 
           
           
            
            
                                        
            
                            
            String sql="UPDATE `ips_isalud`.`resolucion_dian` SET `numero_resolucion`="+Nresol+", `fecha_resolucion`="+fecha+", `tipo_factura`="+tipo+", `num_inicial`="+Nini+", `num_final`="+Nfin+", `empleado_crea`='"+session.getAttribute("id")+"', `fecha_creacion`= curdate(), `estado`='"+estado+"' WHERE `id_resolucion_dian`="+idres+";";
            if(ba.transaccion(sql)){      out.print("<label style='color: green'><b>Resolución Actualizada Satisfactoriamente</b></label>"); 
                  
                 if(estado.compareTo("1")==0){  
                            ba.transaccion("SET SQL_SAFE_UPDATES=0;"); 
                            ba.transaccion("UPDATE `ips_isalud`.`resolucion_dian` SET `estado`='0' WHERE `id_resolucion_dian`!="+idres+" ");
                            ba.transaccion("SET SQL_SAFE_UPDATES=1;"); 
                                             }    
                                   }
            else{ out.print("<label style='color: red'><b>Falla al Actualizar Resolución</b></label>");}           
            ba.cerrar();
            %>
            
            
    </body>
</html>
