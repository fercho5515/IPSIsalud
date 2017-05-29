
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
         request.setCharacterEncoding("UTF-8");
         String dato= request.getParameter("dato");
         dato=dato.replace('*',' ');
         
                        String datos[]=new String[1];
                        
                        String sql="select count(descripcion) from hora_comida where descripcion='"+dato+"';";    
                        
                        ResultSet resu2=ba.consultas(sql);
                                        
                        try{
                             while (resu2.next()||resu2!=null) { 
                                         datos[0]=resu2.getString(1);
                                         
                                       }}
                        
                        
                        catch(SQLException e){}
                        catch(Exception ex){}
                        int x = Integer.parseInt(datos[0]);
                        if(x==1){
                                        %>
                                        <label style="color:red">ESTA HORA DE COMIDA YA EXISTE</label><input type="text" name="hcomida1" id="hcomida1" style="display: none" value='existe'  readonly>
                                         <%
                                          }
                                               else{
                                                %>
                                                <input type="text" id="hcomida1" name="hcomida1" style="display: none" value="noexiste" readonly>
                                                <%
                                        
                                               }
                        ba.cierraResultado(resu2);
                        ba.cerrar();
                        %>      
    </body>
</html>
