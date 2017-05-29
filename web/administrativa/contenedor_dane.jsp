
<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>

<script type="text/javascript" language="javascript">
function cambiaPestanaAntecedentes(pestanaAnte){

                           if(pestanaAnte==1){$("#tabs-antecedentes").load("crear_depto.jsp");}
                           else if(pestanaAnte==2){$("#tabs-antecedentes").load("crear_ciudad.jsp");}
                           
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
        <li><a href="#tabs-antecedentes" onclick="cambiaPestanaAntecedentes(1)">Crear Tipo de Antecedente </a></li>
        <li><a href="#tabs-antecedentes" onclick="cambiaPestanaAntecedentes(2)">Crear Antecedente</a></li>
        
    </ul>
    <div id="tabs-antecedentes" style="height:400px;width:1012px;overflow:auto;">
    </div>
</div>

</td></tr></table>


<script type="text/javascript" language="javascript">
var hoja = document.createElement('style')

  var element = document.getElementById("tabs-antecedentes");
  element.style.width= ""+(screen.width-300)+"px";
  element.style.height= ""+(screen.height-335)+"px";
  cambiaPestanaAntecedentes(1);
</script>
</body>

</html>


