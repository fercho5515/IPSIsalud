<%-- 
    Document   : cambiaComida
    Created on : 24-feb-2013, 21:05:21
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
            <select id="id_comida" name="id_comida" style="min-width:120px">
         <option value="-1">Seleccione...</option>
         <%    
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb();
         String dato=request.getParameter("dato");
         
         
                        String sql="select id_comida,descripcion from comida where id_hora_comida='"+dato+"' and id_comida not in (select c.id_comida from menu_comida m,hora_comida h,comida c where m.id_comida=c.id_comida and c.id_hora_comida=h.id_hora_comida and m.id_consulta_nutri='"+session.getAttribute("serial_consulta")+"' ) order by id_comida;";    
                        ResultSet resu2=ba.consultas(sql);
                        try{
                            while (resu2.next()&&resu2!=null) {   
                                       out.print("<option value='"+resu2.getString(1)+"'>"+resu2.getString(2)+"</option>");
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cierraResultado(resu2);
                        ba.cerrar();
    
         
         %>           
            
                </select>   
    </body>
</html>
