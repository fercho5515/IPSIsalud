<%-- 
    Document   : carga_vid_pa
    Created on : 24/02/2013, 04:25:33 PM
    Author     : EMMANUEL
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
          <select id="parte" name="parte">
        <%
        
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb(); 
         
         String sql="select id_parte,descripcion from partes_cuerpo where id_parte not in (select id_parte from ex_cefalocaudal where id_consulta='"+session.getAttribute("serial_consulta")+"' );";
       
            ResultSet resu=null;
           // int bandera=0;
          try{  
              
           resu=ba.consultas(sql);
           while (resu.next()&&resu!=null) {   
                      //   bandera=1;
                         out.print(" <option value='"+resu.getString(1)+"'>"+resu.getString(2)+"</option>");
                     }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        
        ba.cierraResultado(resu);  
        ba.cerrar();
     //   if(bandera==1){out.print(" <option value='nadadenada#$#'></option>");}
        %>
          
    </select>
    </body>
</html>
