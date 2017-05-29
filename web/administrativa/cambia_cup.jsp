<%-- 
    Document   : cambia_cup
    Created on : 19-mar-2013, 10:26:17
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
         request.setCharacterEncoding("UTF-8");         
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb();
         String dato=request.getParameter("dato");
         
                        String datos[]=new String[2];
                        String sql="select descripcion,id_cups from cups where cup_verdadero='"+dato+"';";    
                        //out.print(sql);
                        ResultSet resu2=ba.consultas(sql);
                        try{
                             while (resu2.next()||resu2!=null) { 
                                         datos[0]=resu2.getString(1);
                                         datos[1]=resu2.getString(2);
                                         }}
                        
                        catch(SQLException e){}
                        catch(Exception ex){}
                        
                        String sql2="select count(cod_cups) from procedimientos_tari where cod_cups='"+datos[1]+"';";
                        //out.print(sql2);
                        String datos3[]=new String[1];
                        ResultSet resu3=ba.consultas(sql2);
                        try{
                             while (resu3.next()||resu3!=null) { 
                                         datos3[0]=resu3.getString(1);
                                         }}
                        
                        catch(SQLException e){}
                        catch(Exception ex){datos3[0]=""+'0';}
                        
                        int iq;
                        try{iq=Integer.parseInt(datos3[0]);}
                        catch(Exception exe){iq=0;}
                        //out.print(datos3[0]);
                        
                        if(datos[0]==null){
                                        %>
                                         <input type="text" name="producto" size="85%" id="producto" maxlength="400" value='CUP No Valido'  readonly>
                                         <input type="text" name="comprob_cup" style="display: none" size="85%" id="comprob_cup" maxlength="400" readonly value="no existe">
                                         <%
                                          }
                        else{
                            if( iq == 1){
                                         %>
                                         <input type="text" name="producto" size="85%" id="producto" maxlength="400" value='<% out.print(datos[0]); %>'  readonly>
                                         <br><label style="color:red">Este Codigo Cup ya ha sido Ingresado</label><input type="text" name="comprob_cup" style="display: none" size="85%" id="comprob_cup" maxlength="400" readonly value="existe">
                                         <%
                                        }
                            else {
                                         %>
                                         <input type="text" name="producto" size="85%" id="producto" maxlength="400" value='<% out.print(datos[0]); %>'  readonly>
                                         <input type="text" name="comprob_cup" style="display: none" size="85%" id="comprob_cup" maxlength="400" readonly value="no existe">
                                         <%
                                        }
                        }
                        ba.cierraResultado(resu2);
                        ba.cerrar();
                        %>      
    </body>
</html>