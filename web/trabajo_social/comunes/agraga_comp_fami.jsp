<%-- 
    Document   : agraga_comp_fami
    Created on : 30/10/2013, 12:06:27 PM
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
       
      
                    String parentesco=request.getParameter("perentesco_fam").replace("'","").replace("\"","");
                    String escolaridad=request.getParameter("escolaridad_fam").replace("'","").replace("\"","");
                    String ocupacion=request.getParameter("ocupacion_fam").replace("'","").replace("\"","");
                    String nombre="";
                    if(request.getParameter("nombre_fam")!=null){nombre=""+request.getParameter("nombre_fam").replace("'","").replace("\"","");}
                    String edad="";
                    if(request.getParameter("edad_fam")!=null){edad=""+request.getParameter("edad_fam").replace("'","").replace("\"","");}
                    String descrip="";
                    if(request.getParameter("observaciones_fam")!=null){descrip=""+request.getParameter("observaciones_fam").replace("'","").replace("\"","");}
                    
                    
                    
                    String sql="INSERT INTO `ips_isalud`.`comp_fami` (`id_cons_trab_soci`, `nombre_apellidos`, `parentesco`, `edad`, `escolaridad`, `ocupacion`, `observaciones`) VALUES ('"+session.getAttribute("serial_consulta")+"', '"+nombre+"', '"+parentesco+"', '"+edad+"', '"+escolaridad+"','"+ocupacion+"','"+descrip+"');";
             
                    //    System.out.print("agrega diag psico: "+sql);
                      ba.transaccion(sql);    /// System.out.println("agrega_diag "+sql);   
                        
       ba.cerrar();
      
      %>
    </body>
</html>

