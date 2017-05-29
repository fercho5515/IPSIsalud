<%-- 
    Document   : autocompleta_med
    Created on : 24/07/2013, 11:25:08 AM
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

 String sql="select id_subcie10,descripcion from sub_cie10 where id_subcie10 not in (select id_subcie from impre_diagno where id_consulta='"+session.getAttribute("serial_consulta")+"') and id_subcie10 like '"+dato+"%' LIMIT 15";
String sql2="select  count(id_subcie10),descripcion,id_subcie10 from sub_cie10 where id_subcie10 not in (select id_subcie from impre_diagno where id_consulta='"+session.getAttribute("serial_consulta")+"') and id_subcie10 like '"+dato+"%'";


 conecta_bd ba = new conecta_bd();
 ba.ConectaDb();
 
 ResultSet resu2=ba.consultas(sql2);

 try{
	    while (resu2.next()&&resu2!=null) {
                           out.print(" <input type='hidden' name='cantidaddff"+dato2+"' id='cantidaddff"+dato2+"' value='"+resu2.getString(1)+"'>");
                           out.print(" <input type='hidden' name='nommed"+dato2+"' id='nommed"+dato2+"' value='"+resu2.getString(2)+"'>");              
                           out.print(" <input type='hidden' name='codatc"+dato2+"' id='codatc"+dato2+"' value='"+resu2.getString(3)+"'>");              
                }
             }
        catch(SQLException e){}
        catch(Exception ex){}
 ba.cierraResultado(resu2);
         
         
        

         
         
         
 ResultSet resu=ba.consultas(sql);
           

            
         
	try{
	    while (resu.next()&&resu!=null) { 
                        %>
                        <div class="display_box_for" align="left" onclick="pasadatoForm('<% out.print(resu.getString(1));%>','<% out.print(resu.getString(2));%>','<% out.print(dato2); %>')">
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




