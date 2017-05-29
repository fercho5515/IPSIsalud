<%-- 
    Document   : cambia_contrasena
    Created on : 27/11/2013, 10:01:50 AM
    Author     : servidor
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
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
           if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null){
        %>
            
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="/ISALUD/index.jsp">volver</a></center>    
  
            <% 
              out.println("</body></html>");
              return;
            }
           String claveAnte=request.getParameter("clave_ant");
           String claveNue1=request.getParameter("clave_nue1");
           String claveNue2=request.getParameter("clave_nue2");
           
           conecta_bd ba = new conecta_bd();
           ba.ConectaDb();         
           String sqluno="SELECT count(serial_empleado) from empleados where serial_empleado='"+session.getAttribute("id")+"' and clave=password('"+claveAnte+"');";
           int cuenta=0;
           ResultSet resu=ba.consultas(sqluno);
           try{
	    while (resu.next()&&resu!=null) {  
                                            cuenta=Integer.parseInt(resu.getString(1)); 
                                            }
              }
          catch(SQLException ex){cuenta=0;}
	  catch(Exception exe){cuenta=0;}
          ba.cierraResultado(resu);     
          
          if(cuenta==0){out.print(" <center><label style='color:red'><b>La contraseña antigua es incorrecta</b></label></center>");}
          else{
              String dos="UPDATE `ips_isalud`.`empleados` SET `clave`=password('"+claveNue1+"') WHERE `serial_empleado`='"+session.getAttribute("id")+"';";
              if(ba.transaccion(dos)){out.print(" <center><label style='color:green'><b>La contraseña fue actualizada satisfactoriamente</b></label></center>");}
                                 else{out.print(" <center><label style='color:red'><b>Falla al actualizar la contraseña</b></label></center>");}
              }
          ba.cerrar();    
            
            %>
           
    </body>
</html>
