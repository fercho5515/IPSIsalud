
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>
<title>Crear Distribuidor</title>
        <script type="text/javascript" language="javascript">
           $('#fndistri').submit(function() {
                                                       
                               if($("#nom_distri").val().length < 1) { 
                                                        document.getElementById('respu').innerHTML = "<h2 style='color:red'>El nombre es obligatorio</h2><br>  ";
                                                       return false;  
                                                                      } 
                          else if($("#nom_distri").val().length > 399) { 
                                                        document.getElementById('respu').innerHTML = "<h2 style='color:red'>El nombre tiene como maximo 399 caracteres</h2><br>  ";
                                                       return false;  
                                                                      } 
                     /*   else if($("#direccionlabo").val().length < 1) { 
                                                        document.getElementById('respu').innerHTML = "<h2 style='color:red'>La direccion es obligatoria</h2><br>  ";
                                                       return false;  
                                                                      } */
                          else if($("#direc_distrin").val().length > 399) { 
                                                        document.getElementById('respu').innerHTML = "<h2 style='color:red'>La direccion tiene como maximo 399 caracteres</h2><br>  ";
                                                       return false;  
                                                                      }
                          else if($("#nit").val().length > 399) { 
                                                        document.getElementById('respu').innerHTML = "<h2 style='color:red'>El nit tiene como maximo 399 caracteres</h2><br>  ";
                                                       return false;  
                                                                      }  
                         else if($("#cam_comercio").val().length > 199) { 
                                                        document.getElementById('respu').innerHTML = "<h2 style='color:red'>La camara de comercio tiene como maximo 199 caracteres</h2><br>  ";
                                                       return false;  
                                                                      }
                         else if($("#celular_distri").val().length > 199) { 
                                                        document.getElementById('respu').innerHTML = "<h2 style='color:red'>El celular tiene como maximo 199 caracteres</h2><br>  ";
                                                       return false;  
                                                                      }
                         else if($("#telefono_distri").val().length > 199) { 
                                                        document.getElementById('respu').innerHTML = "<h2 style='color:red'>El telefono tiene como maximo 199 caracteres</h2><br>  ";
                                                       return false;  
                                                                      }
                    // Enviamos el formulario usando AJAX
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#respu').html(data);
                                  document.getElementById("nom_distri").value="";
                                  document.getElementById("direc_distrin").value="";
                                  document.getElementById("nit").value="";
                                  document.getElementById("cam_comercio").value="";
                                  document.getElementById("celular_distri").value="";
                                  document.getElementById("telefono_distri").value="";
                                  //borrar los campos cuando crre
                                }                             
                          })
                     
                          return false;
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
    <center><div id="respu" name="respu"></div></center>   <br>
    <form id="fndistri" name="fndistri" action="nuevo_distribuidor.jsp" method="post">    
<br>
<table style="width:80%" border="0" align="center">
<tr>
<td>
<fieldset>
<legend>Crear Nuevo Distribuidor</legend>

<table style="width:100%" border="0">


<tr>
<td style="width:25%" >
<label>Nombre del Distribuidor:</label>
</td>
<td style="width:75%" colspan="3">
<input type="text" name="nom_distri" id="nom_distri" maxlength="399" style="width:100%">
</td>
</tr>
<tr>
<td style="width:25%">
<label>Direccion:</label>
</td>
<td style="width:75%"  colspan="3">
<input type="text" name="direc_distrin" id="direc_distrin" maxlength="399" style="width:100%">
</td>
</tr>
<tr>
<td style="width:25%">
<label>NIT:</label>
</td>
<td style="width:25%">
<input type="text" name="nit" id="nit" size="25" maxlength="399">
</td>
<td style="width:25%">
<label>Camara de Comercio:</label>
</td>
<td style="width:25%">
<input type="text" name="cam_comercio" id="cam_comercio" size="25" maxlength="199">
</td>
</tr>

<tr>
<td style="width:25%">
<label>Celular:</label>
</td>
<td style="width:25%">
<input type="text" name="celular_distri" id="celular_distri" size="25" maxlength="199">
</td>

<td style="width:25%">
<label>Telefono:</label>
</td>
<td style="width:25%">
<input type="text" name="telefono_distri" id="telefono_distri" size="25" maxlength="199">
</td>
</tr>


</table>
</fieldset>
</td>
</tr>
<tr>
    <td colspan="4">
            <center><input type="submit" value="Crear" id="aceptar" name="aceptar" ></center>    
    </td>    
</tr>
</table>
</form>
 
</body>

</html>
