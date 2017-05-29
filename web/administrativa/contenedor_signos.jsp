<%-- 
    Document   : contenedor_cefalocaudal
    Created on : 17-abr-2013, 12:36:42
    Author     : Fercho
--%>
<% request.setCharacterEncoding("UTF-8"); %>
<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>

<script type="text/javascript" language="javascript">
function cambiaPestanaSigno(pestanaSigno){

                           if(pestanaSigno==1){$("#tabs-signo").load("crear_signo.jsp");}
                           else if(pestanaSigno==2){$("#tabs-signo").load("crear_subsigno.jsp");}
                          
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
        <li><a href="#tabs-signo" onclick="cambiaPestanaSigno(1)">Crear Signo </a></li>
        <li><a href="#tabs-signo" onclick="cambiaPestanaSigno(2)">Crear Subsignos</a></li>
        
    </ul>
    <div id="tabs-signo" style="height:400px;width:1012px;overflow:auto;">
    </div>
</div>

</td></tr></table>


<script type="text/javascript" language="javascript">
var hoja = document.createElement('style')

  var element = document.getElementById("tabs-signo");
  element.style.width= ""+(screen.width-300)+"px";
  element.style.height= ""+(screen.height-335)+"px";
  cambiaPestanaSigno(1);
</script>
</body>

</html>


