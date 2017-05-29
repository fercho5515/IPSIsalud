<%-- 
    Document   : agregadiag
    Created on : 5/05/2013, 11:02:53 PM
    Author     : EMMANUEL
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
       
        String con="select count(id_subcie) from impre_diagno where id_consulta='"+session.getAttribute("serial_consulta")+"';";         
        int canti=0;         
        ResultSet ressuu=null;
          try{  
           ressuu=ba.consultas(con);
           while (ressuu.next()&&ressuu!=null) { 
                        canti=Integer.parseInt(ressuu.getString(1));
                     }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        
        ba.cierraResultado(ressuu);
        
        if(canti<4){
                    String subcie10=request.getParameter("diagnosticoconsu_evol").replace("'","").replace("\"","");
                    String causaexte=request.getParameter("causaexterna_consu_evol").replace("'","").replace("\"","");
                    String tipodiag=request.getParameter("tipodiagnostico_consu_evol").replace("'","").replace("\"","");
                    String descrip="";
                    if(request.getParameter("observaciones_evol_consu")!=null){descrip=""+request.getParameter("observaciones_evol_consu").replace("'","").replace("\"","");}
                    String sql="INSERT INTO `ips_isalud`.`impre_diagno` (`id_consulta`, `id_subcie`, `descrip`, `id_tipo_diagnostico`, `causa_externa`, `control`) VALUES ('"+session.getAttribute("serial_consulta")+"','"+subcie10+"','"+descrip+"','"+tipodiag+"','"+causaexte+"',now());";
                    ba.transaccion(sql);    /// System.out.println("agrega_diag "+sql);   
                    }       
       ba.cerrar();
      
      %>
    </body>
</html>
