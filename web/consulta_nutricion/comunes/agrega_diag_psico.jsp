<%-- 
    Document   : agrega_diag_psico
    Created on : 14/09/2013, 09:56:03 AM
    Author     : Emmanuel
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
           <%    request.setCharacterEncoding("UTF-8");
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){
          
          %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
        conecta_bd ba = new conecta_bd();
        ba.ConectaDb(); 
       
      
                    String subcie10=request.getParameter("diagnosticoppsico_visi").replace("'","").replace("\"","");
                    String causaexte=request.getParameter("causaexterna_visi").replace("'","").replace("\"","");
                    String tipodiag=request.getParameter("tipodiagnostico_visi").replace("'","").replace("\"","");
                    String descrip="";
                    if(request.getParameter("observaciones_visi")!=null){descrip=""+request.getParameter("observaciones_visi").replace("'","").replace("\"","");}
                    String sql="INSERT INTO `ips_isalud`.`impre_diagno_psico` (`id_consulta_psico`, `id_subcie`, `descrip`, `id_tipo_diagnostico`, `causa_externa`, `control`) VALUES ('"+session.getAttribute("serial_consulta")+"','"+subcie10+"','"+descrip+"','"+tipodiag+"','"+causaexte+"',now());";
             //    System.out.print("agrega diag psico: "+sql);
                      ba.transaccion(sql);    /// System.out.println("agrega_diag "+sql);   
                        
       ba.cerrar();
      
      %>
    </body>
</html>
