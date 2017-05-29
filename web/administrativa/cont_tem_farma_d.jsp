<%-- 
    Document   : cont_tem_farma_d
    Created on : 16/03/2013, 05:26:23 PM
    Author     : EMMANUEL
--%>

<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script type="text/javascript" language="javascript">
                       $('#fecha_temp').submit(function() {
                       
                          if($("#fecha_t").val().length < 1) { 
                                                       alert("Ingrese fecha");
                                                       return false;  
                                                                      }                     
                    // Enviamos el formulario usando AJAX
                    // alert("dgdfgfdg");
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#tabla_todo2').html(data);
                                }                             
                          })
                     
                          return false;
                      }); 
                      $(function(){
		     $("#fecha_t").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#fecha_t').datepicker($.datepicker.regional['es']);
		     $('#fecha_t').datepicker("option","showAnim","slideDown");
		     $('#fecha_t').datepicker("option","dateFormat","yy-mm-dd");
		});
         </script>
    </head>
    <body>
          <% 
      
           request.setCharacterEncoding("UTF-8");
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }%>
    <center>
        <br>
        <form action="recarga_farma.jsp" method="posto" id="fecha_temp" name="fecha_temp">
            <label>Fecha: </label><input type="text" name="fecha_t" id="fecha_t" readonly><input type="submit" value="Consultar" id="aceptar" name="aceptar">
        </form>           
        <br>
      <div name="tabla_todo2" id="tabla_todo2">              
       <table border="1" style="border-radius:15px">
           <tr>
               <td style="text-align:center;padding-left:20px;padding-right:10px;border-radius:15px 0px 0px 0px">
                   <label>Hora:</label>  
               </td>
               <td style="text-align:center;padding-left:10px;padding-right:10px">
                   <label>Temperatura</label>  
               </td>
               <td style="text-align:center;padding-left:10px;padding-right:10px">
                   <label>Humedad Relativa</label>  
               </td>
               <td style="text-align:center;padding-left:10px;padding-right:20px;border-radius:0px 15px 0px 0px">
                   <label>Cadena de Frio</label>  
               </td>
           </tr>    
           <% 
              for(int i=5;i<=19;i++){
               String color="yellow";
               String r1="";
               String r2="";
               int dato=i;
                    if(dato==12){color="blue";} 
               else if(dato>12) {color="blue"; dato=dato-12;}      
                    if(i==19) {r1=";border-radius:0px 0px 0px 15px";r2=";border-radius:0px 0px 15px 0px";}                                                        
                  
               out.print("    <tr>");
               out.print("        <td style='text-align:center"+r1+"'>");
               out.print("            <center><label>"+dato+" - "+(dato+1)+"</label></center>");
               out.print("        </td>");
               out.print("        <td style='text-align:center;background-color:"+color+"' >");
               out.print("            <center><label></label></center>");
               out.print("        </td>");
               out.print("        <td style='text-align:center;background-color:"+color+"' >");
               out.print("            <center><label></label></center>");
               out.print("        </td>");
               out.print("        <td style='text-align:center;background-color:"+color+""+r2+"' >");
               out.print("            <center><label></label></center>");
               out.print("        </td>");
               out.print("    </tr>");
           
              }
           %>
       </table>  
       </div> 
    </center>
    </body>
</html>
