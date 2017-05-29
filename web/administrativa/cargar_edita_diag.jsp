
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
         <%    
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb();
         String dato=request.getParameter("dato");
         dato=dato.replace('*',' ');
         //out.print(dato);
                        String datos[]=new String[2];
                        String sql="select idcie10, descripcion from cie10 where idcie10 like '"+dato+"';";    
                        //out.print(sql);
                        ResultSet resu2=ba.consultas(sql);
                        try{
                             while (resu2.next()||resu2!=null) { 
                                         datos[0]=resu2.getString(1);
                                         datos[1]=resu2.getString(2);
                                       }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                        if(datos[0]==null){
                                        %>
                                        <label>Nuevo Codigo de Diagnostico:</label>
                                        <input type="text" id="nuevo_diag" name="nuevo_diag" value="Codigo no encontrado"readonly>
                                        <br>
                                        <label>Diagnostico:</label>
                                        <input type="text" id="nuevo_diag2" name="nuevo_diag2" size="90" readonly>  
                                        <%
                                          }
                                               else{
                                                %>
                                                <label>Nuevo Codigo de Diagnostico:</label>
                                                <input type="text" id="nuevo_diag" name="nuevo_diag" value="<% out.print(datos[0]); %>">
                                                <br>
                                                <label>Diagnostico:</label>
                                                <input type="text" id="nuevo_diag2" name="nuevo_diag2" size="90" value="<% out.print(datos[1]); %>">  
                                                <%
                                               }
                        ba.cierraResultado(resu2);
                        ba.cerrar();
                        %>      
    </body>
</html>