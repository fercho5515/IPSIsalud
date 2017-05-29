<%-- 
    Document   : cambia_signo_desnu
    Created on : 24-feb-2013, 21:05:21
    Author     : Fercho
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
     <select id="cambiasigno" name="cambiasigno"  style="width: 100%">
         <option value="-1">Seleccione...</option>
         <%    
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb();
         String dato=request.getParameter("dato");
         
         
                        String sql="select id_sub_signos,decripcion from sub_signos where id_signos='"+dato+"' and id_sub_signos not in (select id_sub_sig from histo_subsig where id_consulta='"+session.getAttribute("serial_consulta")+"' );";    
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
