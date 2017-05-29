<%-- 
    Document   : comprob_diag
    Created on : 09-abr-2013, 14:36:52
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
     
         <%    
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb();
         String dato=request.getParameter("dato");
         dato=dato.replace('*',' ');
         //out.print(dato);
                        String datos[]=new String[1];
                        String sql="select count(descripcion) from cie10 where idcie10 = '"+dato+"';";    
                        //out.print(" consulta==> "+sql);
                        ResultSet resu2=ba.consultas(sql);
                        int x=0;                
                        try{
                             while (resu2.next()||resu2!=null) { 
                                            //out.print("amam");
                                         x=Integer.parseInt(resu2.getString(1));
                                         //datos[0]=resu2.getString(0);
                                       }}
                        
                        
                        catch(SQLException e){}
                        catch(Exception ex){}
                        //int x = Integer.parseInt(datos[0]);
                        //out.print(" contador: "+x);
                      //  int x = Integer.parseInt(datos[0]);
                        if(x==1){
                                        %>
                                        <label style="color:red">ESTE CODIGO YA EXISTE</label><input type="text" name="diag" id="diag" style="display: none" value='existe'  readonly>
                                         <%
                                          }
                                               else{
                                                %>
                                                <input type="text" id="diag" name="diag" style="display: none" value="noexiste" readonly>
                                                <%
                                        
                                               }
                        ba.cierraResultado(resu2);
                        ba.cerrar();
                        %>      
    </body>
</html>
