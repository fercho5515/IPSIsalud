<%-- 
    Document   : contenedor_instituciones
    Created on : 12-abr-2013, 16:24:56
    Author     : Fercho
--%>
<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>

<script type="text/javascript" language="javascript">
function cambiaPestanaInstitucion(pestanaIns){

                           if(pestanaIns==1){$("#tabs-instituciones").load("crear_eps.jsp");}
                           else if(pestanaIns==2){$("#tabs-instituciones").load("subdiagnostico.jsp");}
                           else if(pestanaIns==4){$("#tabs-instituciones").load("editasubcie10.jsp");}
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
        <li><a href="#tabs-instituciones" onclick="cambiaPestanaInstitucion(1)">Crear EPS </a></li>
        <li><a href="#tabs-instituciones" onclick="cambiaPestanaInstitucion(2)">Editar EPS</a></li>
        <li><a href="#tabs-instituciones" onclick="cambiaPestanaInstitucion(4)">EDTAR SUBCIE10</a></li>
    </ul>
    <div id="tabs-instituciones" style="height:400px;width:1012px;overflow:auto;">
    </div>
</div>

</td></tr></table>


<script type="text/javascript" language="javascript">
var hoja = document.createElement('style')

  var element = document.getElementById("tabs-instituciones");
  element.style.width= ""+(screen.width-300)+"px";
  element.style.height= ""+(screen.height-335)+"px";
  cambiaPestanaInstitucion(1);
</script>
</body>

</html>

