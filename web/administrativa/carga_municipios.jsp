<%-- 
    Document   : carga_municipios
    Created on : 2/04/2013, 07:22:58 PM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%  request.setCharacterEncoding("UTF-8");
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
     %>  
        <select name="ciudad" size="1" id="ciudad" style="width:90%"  onchange="quita()">
            <option value="nssdu">Seleccionar Departamento</option>
             <%
                         String sql="select id_muni,descripcion from municipio where id_depto='"+request.getParameter("dato") +"'";

                             ResultSet resu=null;
                             try{  resu=ba.consultas(sql);
                                   while (resu.next()&&resu!=null) {  
                                        out.print("<option value='"+resu.getString(1)+"'>"+resu.getString(2)+"</option>");
                                                                    }
                                 }                       
                             catch(SQLException ex){}
                             catch(Exception exe){}
                             ba.cierraResultado(resu);
                             ba.cerrar();
             %>   
       </select>
    </body>
</html>
