<%-- 
    Document   : borra_soli_no_pos_med_gen
    Created on : 16/11/2013, 10:08:46 AM
    Author     : servidor
--%>
<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <% request.setCharacterEncoding("UTF-8");
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     <% 
        out.println("</body></html>");
        return;
        }
          conecta_bd ba = new conecta_bd();
          ba.ConectaDb(); 
          String id=request.getParameter("cod_borra");
          String id2=""; 
          String sql0="select id_ant from soli_no_post where id_soli_no_post='"+id+"'";
          ResultSet result1=null;           
          try{  
           result1=ba.consultas(sql0);            
           while (result1.next()&&result1!=null) { 
                                                  id2=result1.getString(1);                            
                                                 }
              }
          catch(SQLException ex){}
          catch(Exception exe){}
          ba.cierraResultado(result1); 
        
          
          ba.transaccion("SET SQL_SAFE_UPDATES=0;");
          ba.transaccion("DELETE FROM `ips_isalud`.`soli_no_post` WHERE `id_soli_no_post`='"+id+"';");
          ba.transaccion("UPDATE `ips_isalud`.`soli_no_post` SET `re_solicitada`='0', `id_consu_resol`=null WHERE `id_soli_no_post`='"+id2+"';");
          ba.transaccion("SET SQL_SAFE_UPDATES=1;");
          ba.cerrar();
     %> 
    </body>
</html>
