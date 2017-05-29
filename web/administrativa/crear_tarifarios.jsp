<%-- 
    Document   : crear_tarifarios
    Created on : 25/03/2013, 11:21:08 AM
    Author     : EMMANUEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
             <script type="text/javascript" language="javascript">
           $('#agragatari').submit(function() {
                                                       
                               if($("#codi").val().length < 1) { 
                                                       alert("EL codigo es obligatorio");
                                                       return false;  
                                                                      } 
                          else if($("#codi").val().length > 44) { 
                                                       alert("EL codigo tiene como maximo 44 caracteres");
                                                       return false;  
                                                                      }                         
                          else if($("#nombre").val().length < 1) { 
                                                       alert("EL nombre es obligatorio");
                                                       return false;  
                                                                      } 
                          else if($("#nombre").val().length > 199) { 
                                                       alert("EL nombre tiene como maximo 199 caracteres");
                                                       return false;  
                                                                      }                                          
                    // Enviamos el formulario usando AJAX
               //     alert("dgdfgfdg");
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#resutari').html(data);
                                  document.getElementById("codi").value()="";
                                  document.getElementById("nombre").value()="";
                                 }                             
                          })
                     
                          return false;
                      });      
      </script>    
    </head>
    <body>
        <br>
    <center>
        <div name="resutari" id="resutari"></div>
        <form action="nuevo_tarifario.jsp" name="agragatari" id="agragatari"> 
        <table>
               <tr>
                   <td>
                       <label>Codigo:</label>
                   </td>
                   <td>
                       <input type="text" id="codi" name="codi" style="width:400px" maxlength="44">
                   </td>
               </tr>
               <tr>   
                   <td>
                       <label>Nombre Tarifario:</label>
                   </td>
                   <td>
                       <input type="text" id="nombre" name="nombre" style="width:400px" maxlength="199">
                   </td>
               </tr>
               <tr>
                   <td colspan="2">
                        <center>
                            <input type="submit" id="aceptar" name="aceptar" value="Crear">
                        </center>
                   </td>
               </tr>
        </table>        
            </form> 
    </center>    
    </body>
</html>
