<%-- 
    Document   : auto_completa_cie10
    Created on : 22/02/2013, 02:42:01 PM
    Author     : EMMANUEL
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

String dato=request.getParameter( "searchword" );
String dato2=request.getParameter( "dato" );

 String sql="select id_subcie10,descripcion from sub_cie10 where id_subcie10 like '"+dato+"%' LIMIT 15";
String sql2="select  count(id_subcie10),descripcion  from sub_cie10 where id_subcie10 like '"+dato+"%'";


 conecta_bd ba = new conecta_bd();
 ba.ConectaDb();
 
 ResultSet resu2=ba.consultas(sql2);

 try{
	    while (resu2.next()&&resu2!=null) {
                           out.print(" <input type='hidden' name='cantidadd"+dato2+"' id='cantidadd"+dato2+"' value='"+resu2.getString(1)+"'>");
                           out.print(" <input type='hidden' name='nomcie10"+dato2+"' id='nomcie10"+dato2+"' value='"+resu2.getString(2)+"'>");              
              }
             }
        catch(SQLException e){}
        catch(Exception ex){}
 ba.cierraResultado(resu2);
         
         
        

         
         
         
 ResultSet resu=ba.consultas(sql);
           

            
         
	try{
	    while (resu.next()&&resu!=null) { 
                        %>
                        <div class="display_box" align="left" onclick="pasadatoConsuNutri('<% out.print(resu.getString(1));%>','<% out.print(resu.getString(2));%>','<% out.print(dato2); %>')">
                     <% out.print(resu.getString(1));%><br/>
                </div>              
           <%                       
                     }
             }
        catch(SQLException e){}
        catch(Exception ex){}
 ba.cierraResultado(resu);
 ba.cerrar();
%>




