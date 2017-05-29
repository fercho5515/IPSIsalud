
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
         out.print(dato);
                        String datos[]=new String[1];
                        String sql="select descripcion from cie10 where idcie10 like '"+dato+"';";    
                        out.print(sql);
                        ResultSet resu2=ba.consultas(sql);
                        try{
                             while (resu2.next()||resu2!=null) { 
                                         datos[0]=resu2.getString(1);
                                       }
                        }
                        catch(SQLException e){}
                        catch(Exception ex){}
                        if(datos[0]==null){
                                        %>
                                         <label>Nombre: </label><input type="text" name="c10" size="85%" id="c10" maxlength="388" value='Cie10 no Valido'  readonly>
                                         <%
                                          }
                                         else{
                                         %>
                                         <label>Nombre: </label><input type="text" name="c10" size="85%" id="c10" maxlength="388" value='<% out.print(datos[0]); %>'  readonly>
                                         <%
                                          }
                        ba.cierraResultado(resu2);
                        ba.cerrar();
                        %>      
    </body>
</html>