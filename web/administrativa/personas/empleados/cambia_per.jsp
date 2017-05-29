<%-- 
    Document   : cambia_per
    Created on : 25/04/2013, 09:11:36 AM
    Author     : EMMANUEL
--%>
<%@page import="pac.conecta_bd"%>
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
     <%  request.setCharacterEncoding("UTF-8");
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     <% 
        out.println("</body></html>");
        return;
        }
         request.setCharacterEncoding("UTF-8");
         String serial  =request.getParameter("serial");
         String idpermi =request.getParameter("id");
         int estado  =Integer.parseInt(""+request.getParameter("estado")+""); 
         
         String del="DELETE FROM `ips_isalud`.`permiso_empleado` WHERE `id_permi`='"+idpermi+"' and`serial_empleado`='"+serial+"';";
         String ins="INSERT INTO `ips_isalud`.`permiso_empleado` (`id_permi`, `serial_empleado`) VALUES ('"+idpermi+"','"+serial+"');";

         String sql="select concat(' a ',p_nom,' ',s_nom,' ',p_ape,' ',s_ape,' con identificacion ',id_person,' y serial interno ',serial) from personas where serial='"+serial+"';";
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb(); 
          
         String nper="";
         ResultSet resuper=null;
         try{  resuper=ba.consultas("select descripcion from permisos where id_permi='"+idpermi+"'");
                while (resuper.next()&&resuper!=null) {nper=""+resuper.getString(1)+""; }
            }
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resuper); 
          
         String histo="";
         ResultSet resuhi=null;
         try{  resuhi=ba.consultas(sql);
                while (resuhi.next()&&resuhi!=null) {histo=""+resuhi.getString(1)+""; }
            }
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resuhi); 
          
         
        
         
         if(estado==0){
                    if(ba.transaccion(del)){out.print("<input type='hidden' name='resultado' id='resultado' value='Permiso "+nper+" revocado satisfactoriamente'>");
                                            String sqlh="insert into historial_c (id_empleado,fecha_hora,descripcion) values ('"+session.getAttribute("id")+"',now(),'revoca permiso de "+nper+""+histo+"');";
                                            ba.transaccion(sqlh);
                                           }  
                                       else{out.print("<input type='hidden' name='resultado' id='resultado' value='Fallo al revocar permiso de "+nper+"'>");}
                      }
                 else{
                    if(ba.transaccion(ins)){out.print("<input type='hidden' name='resultado' id='resultado' value='Permiso "+nper+" otorgado satisfactoriamente'>");
                                            String sqlh="insert into historial_c (id_empleado,fecha_hora,descripcion) values ('"+session.getAttribute("id")+"',now(),'otorga permiso de "+nper+""+histo+"');";
                                            ba.transaccion(sqlh);
                                           }  
                                       else{out.print("<input type='hidden' name='resultado' id='resultado' value='Fallo al otorgar permiso de "+nper+"'>");}
                      }
         
         ba.cerrar();                                 
    %>     
        
            
      
    </body>
</html>
