<%-- 
    Document   : loadforma
    Created on : 13-mar-2013, 10:56:13
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
     <select id="forma" name="forma">
         <%    
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb();
                  
                        String sql="select * from forma_farmaceutica;";    
                        ResultSet resu1=ba.consultas(sql);
                        try{
                            while (resu1.next()&&resu1!=null) {   
                                       out.print("<option value='"+resu1.getString(1)+"'>"+resu1.getString(2)+"</option>");
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                 ba.cerrar();
         
         %>           
            
                </select>   
    </body>
</html>
