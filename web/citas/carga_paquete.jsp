
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
         <%
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb();
         String dato=request.getParameter("dato");
         //dato=dato.replace('*',' ');
         //out.print("este es el dato--"+dato);
                        
         String sql="select pi.id_paquete_int,pi.nombre,pi.id_contratacion as nom from contratacion c,paquete_int pi,afiliados_pac_int ai,pacientes pa, personas pe where c.id_contratacion=pi.id_contratacion and ai.id_pac_int =pi.id_paquete_int and ai.serial_paciente=pa.serial_persona and pa.serial_persona=pe.serial and pe.id_person='"+dato+"' and ai.activo2=1;";    
//                       out.print(sql);
                        out.print("<select name='paquete' id='paquete'  onchange='cambia_dias()'>");
                        out.print("<option value='escoger'>--Escoja un Paquete--</option>");
                        ResultSet resu=ba.consultas(sql);
                        try{
                            while (resu.next()&&resu!=null) {   
                                       out.print("<option numcont='"+resu.getString(3)+"' value='"+resu.getString(1)+"'>"+resu.getString(2)+"</option>");
                            }
                        }
                        catch(SQLException e){}
                        catch(Exception ex){}
                        out.print("</select>");
            ba.cerrar();
                        %>
    </body>
</html>

