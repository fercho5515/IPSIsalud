<%-- 
    Document   : paquete_int
    Created on : 12/12/2013, 09:09:12 AM
    Author     : servidor
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            
              out.println("</body></html>");
              return;
            } %>
        <select id="paquet_int_arch_rips" name="paquet_int_arch_rips">
                                    <option value="-1">Seleccione un Paquete de la Lista</option>
                                    <%
                                        String sql="select id_paquete_int,nombre from paquete_int where id_contratacion='"+request.getParameter("id_cont") +"'";
                                        ResultSet resu55=null;
                                        conecta_bd ba = new conecta_bd();
                                        ba.ConectaDb(); 
                                        try{  resu55=ba.consultas(sql);
                                            while (resu55.next()&&resu55!=null) {  
                                                out.print("<option value='"+resu55.getString(1)+"' >"+resu55.getString(2)+"</option>");
                                                                                }
                                        }                       
                                        catch(SQLException ex){}
                                        catch(Exception exe){}
                                        ba.cierraResultado(resu55); 
                                        ba.cerrar(); 
                                    %>
                                </select>
      
   </body>
</html>
