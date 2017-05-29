<%-- 
    Document   : crearlaboratorio
    Created on : 13/03/2013, 03:05:08 PM
    Author     : EMMANUEL
--%>
<%@page import="java.util.*" session="true" %>

<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>
<script type="text/javascript" language="javascript">
   $('#flabo').submit(function() {
                                                       
                               if($("#nombrelabo").val().length < 1) { 
                                                        document.getElementById('validacionelab').innerHTML = "<h2 style='color:red'>El nombre es obligatorio</h2><br>  ";
                                                       return false;  
                                                                      } 
                          else if($("#nombrelabo").val().length > 100) { 
                                                        document.getElementById('validacionelab').innerHTML = "<h2 style='color:red'>El nombre tiene como maximo 199 caracteres</h2><br>  ";
                                                       return false;  
                                                                      } 
                     /*   else if($("#direccionlabo").val().length < 1) { 
                                                        document.getElementById('validacionelab').innerHTML = "<h2 style='color:red'>La direccion es obligatoria</h2><br>  ";
                                                       return false;  
                                                                      } */
                          else if($("#direccionlabo").val().length > 100) { 
                                                        document.getElementById('validacionelab').innerHTML = "<h2 style='color:red'>La direccion tiene como maximo 199 caracteres</h2><br>  ";
                                                       return false;  
                                                                      } 
                    /*    else if($("#telefonolabo").val().length < 1) { 
                                                        document.getElementById('validacionelab').innerHTML = "<h2 style='color:red'>el telefono es obligatorio</h2><br>  ";
                                                       return false;  
                                                                      } */
                          else if($("#telefonolabo").val().length > 100) { 
                                                        document.getElementById('validacionelab').innerHTML = "<h2 style='color:red'>el telefono tiene como maximo 199 caracteres</h2><br>  ";
                                                       return false;  
                                                                      } 
                     /*   else if($("#nitlabo").val().length < 1) { 
                                                        document.getElementById('validacionelab').innerHTML = "<h2 style='color:red'>El nit es obligatoria</h2><br>  ";
                                                       return false;  
                                                                      } */
                          else if($("#nitlabo").val().length > 100) { 
                                                        document.getElementById('validacionelab').innerHTML = "<h2 style='color:red'>El nit tiene como maximo 199 caracteres</h2><br>  ";
                                                       return false;  
                                                                      }                                                 
       
                    // Enviamos el formulario usando AJAX
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#validacionelab').html(data);
                                  document.getElementById("nombrelabo").value="";
                                  document.getElementById("direccionlabo").value="";
                                  document.getElementById("telefonolabo").value="";
                                  document.getElementById("nitlabo").value="";
                                  //borrar los campos cuando crre
                                }                             
                          })
                     
                          return false;
                      });      
</script>
<title>Crear Medicamento</title>
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
    <br><br><br>
<center>
<div id="validacionelab" name="validacionelab">
    
</div>
    
<fieldset style="width:500px;text-align:left" ><legend>Nuevo Laboratorio Farmaceutico</legend>
   
<form name="flabo" id="flabo" action="nuevo_laboratorio.jsp" method="post" >
<table>
    
<!-----1da fila---->

<tr>
<td colspan="2">
</td>
</tr>

<!-----2ra fila---->

<tr>
    <td style="width:90px"><label>Nombre:</label>
</td>
<td style="width:100%"><input type="text" id="nombrelabo" name="nombrelado" maxlength="199" required  style="width:100%">
</td>
</tr>

<!-----3ta fila---->

<tr>
<td><label>Dirección:</label>
</td>
<td><input type="text" id="direccionlabo" name="direccionlabo" maxlength="199" style="width:100%" >
</td>
</tr>

<!-----4ta fila---->

<tr>
<td><label>Telefono:</label>
</td>
<td><input type="text" id="telefonolabo" name="telefonolado" maxlength="199" style="width:100%" >
</td>
</tr>

<!-----5ta fila---->

<tr>
<td><label>Nit:</label>
</td>
<td><input type="text" id="nitlabo" name="nitlado" maxlength="199" style="width:100%" >
</td>
</tr>
<tr>
<td colspan="2">
    <center><input type="submit" value="Crear" id="aceptar" name="aceptar" ></center>    
</td>
</tr>
</table>
 </form>       
</fieldset>
</center>

</body>
</html>