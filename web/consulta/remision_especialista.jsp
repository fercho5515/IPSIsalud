<%-- 
    Document   : remision_especialista
    Created on : 11/05/2013, 12:49:40 PM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">  
            function cargandoo(dato){
                        if(dato==0){ $("#todo").load("subremision_uno.jsp");}
                   else if(dato==1){ $("#todo").load("subremision_dos.jsp");}
            }
            function sino(){var dato=""+document.getElementById("result_form").value+"";
                        if(dato==0){ alert("Falla al realizar remision");}
                   else if(dato==1){ $("#todo").load("subremision_dos.jsp");alert("Remision realizada con exito");}
            }
            function sino2(){var dato=""+document.getElementById("result_form2").value+"";
                        if(dato==0){ alert("Falla al realizar actualizacion de remision");}
                   else if(dato==1){ alert("Remision actualizada con exito");}
            }
            function borraremis(){
                               apprise("¿Esta seguro de eliminar la remision realizada? ", {'verify':true}, function(opcion) {
                                            if(opcion) {  
                                                    $("#todorb").load("borra_remision.jsp");
                                                     setTimeout ('bbora()',400); 
                                                    }
                                           });
                         
            }
            function bbora(){
                        var dato=""+document.getElementById("result_form3").value+"";
                        if(dato==0){ alert("Falla al borrar remision");}
                   else if(dato==1){  $("#todo").load("subremision_uno.jsp");alert("Remision borrada con exito");}
                            }
        </script>
    </head>
    <body>
           <% request.setCharacterEncoding("UTF-8");
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){
          
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
           
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb(); 
        
         String  sqlc="select count(serial) from remision_espe where id_consulat='"+session.getAttribute("serial_consulta")+"' ;";
          
           ResultSet result=null;
           int cant=0;
          try{  
           result=ba.consultas(sqlc);            
           while (result.next()&&result!=null) { 
                         cant=Integer.parseInt(""+result.getString(1)+"");
                                               }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        ba.cierraResultado(result);  

     if(cant==0){out.print("<script type='text/javascript'>cargandoo(0);</script>");}
            else{out.print("<script type='text/javascript'>cargandoo(1);</script>");}                 
    %>
    <div id="todo" name="todo"></div>  
    <div id="todorb" name="todorb"></div>  
    </body>
</html>
