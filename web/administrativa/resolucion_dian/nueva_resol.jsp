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
           String Nresol="null";
           if(request.getParameter("num_resul")!=null && request.getParameter("num_resul").compareTo("null")!=0 && request.getParameter("num_resul").trim().compareTo("")!=0){
                           Nresol="'"+request.getParameter("num_resul").replace("'","").replace("\"","")+"'"; }
           
            String fecha="null";
           if(request.getParameter("fech_resul")!=null && request.getParameter("fech_resul").compareTo("null")!=0 && request.getParameter("fech_resul").trim().compareTo("")!=0){
                           fecha="'"+request.getParameter("fech_resul").replace("'","").replace("\"","")+"'";}
            
           String Nini="null";
           if(request.getParameter("num_ini")!=null && request.getParameter("num_ini").compareTo("null")!=0 && request.getParameter("num_ini").trim().compareTo("")!=0){
                          Nini="'"+request.getParameter("num_ini").replace("'","").replace("\"","")+"'";}
           
            String Nfin="null";
           if(request.getParameter("num_fin")!=null && request.getParameter("num_fin").compareTo("null")!=0 && request.getParameter("num_fin").trim().compareTo("")!=0){
                         Nfin="'"+request.getParameter("num_fin").replace("'","").replace("\"","")+"'";}
            
            String tipo="null";
           if(request.getParameter("num_tifac")!=null && request.getParameter("num_tifac").compareTo("null")!=0 && request.getParameter("num_tifac").trim().compareTo("")!=0){
                         tipo="'"+request.getParameter("num_tifac").replace("'","").replace("\"","")+"'";}
           
            conecta_bd ba = new conecta_bd();
                       ba.ConectaDb();                   
            String sql="INSERT INTO `ips_isalud`.`resolucion_dian` (`numero_resolucion`, `fecha_resolucion`, `tipo_factura`, `num_inicial`, `num_final`, `empleado_crea`, `fecha_creacion`,`estado`) VALUES ("+Nresol+","+fecha+","+tipo+","+Nini+","+Nfin+","+session.getAttribute("id")+", curdate(),'1' );";
            if(ba.transaccion(sql)){      out.print("<label style='color: green'><b>Resolución Creada Satisfactoriamente</b></label>"); 
                       String sqlmax="select max(id_resolucion_dian) from resolucion_dian ";
                       ResultSet resUu2=ba.consultas(sqlmax);
                       String max="";
                        try{ while (resUu2.next()&&resUu2!=null) { max=resUu2.getString(1); }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cierraResultado(resUu2);
                        
                    ba.transaccion("SET SQL_SAFE_UPDATES=0;"); 
                    ba.transaccion("UPDATE `ips_isalud`.`resolucion_dian` SET `estado`='0' WHERE `id_resolucion_dian`!='"+max+"' ");            
                    ba.transaccion("SET SQL_SAFE_UPDATES=1;"); 
            }
            else{ out.print("<label style='color: red'><b>Falla al Crear Resolución</b></label>");}           
            ba.cerrar();
            %>
            
            
    </body>
</html>
