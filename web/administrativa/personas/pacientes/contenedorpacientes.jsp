<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
<% request.setCharacterEncoding("UTF-8"); %>
<head>
<meta charset="utf-8"/>

<script type="text/javascript" language="javascript">
function cambiaPestanaPaciente(pestana1){

                                if(pestana1==1){$("#tabs-pacientes").load("personas/pacientes/crearpaciente.jsp");}
                           else if(pestana1==2){$("#tabs-pacientes").load("personas/pacientes/editarpaciente.jsp");}
                          /* else{$("#tabs-pacientes").load("crearciudad.html");}*/
                          }    

$(function() {
        $( "#tabs" ).tabs();
    });
                           
    
</script>     

<title>Empleados</title>
</head>
<body>
<table border="0"><tr><td>
<div id="tabs" style="height:100%;width:100%;">
    <ul>    
        <li><a href="#tabs-pacientes" onclick="cambiaPestanaPaciente(1)">Crear Pacientes</a></li>
        <li><a href="#tabs-pacientes" onclick="cambiaPestanaPaciente(2)">Editar Pacientes</a></li>
   <!-- <li><a href="#tabs-pacientes" onclick="cambiaPestanaPaciente(3)">Crear Cargo</a></li> -->
     </ul>
    <div id="tabs-pacientes" style="height:400px;width:1012px;overflow:auto;">
    </div>
</div>

</td></tr></table>


<script type="text/javascript" language="javascript">
var hoja = document.createElement('style')

  var element = document.getElementById("tabs-pacientes");
  element.style.width= ""+(screen.width-300)+"px";
  element.style.height= ""+(screen.height-325)+"px";
  cambiaPestanaPaciente(1);
</script>

</body>

</html>
