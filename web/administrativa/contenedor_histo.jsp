<%-- 
    Document   : contenedor_histo
    Created on : 12/08/2013, 01:27:27 PM
    Author     : Emmanuel
--%>

<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>

<script type="text/javascript" language="javascript">
function cambiaPestanaHistoAdmnp(pestana2){

                           if(pestana2==1){$("#tabs-HistoAdmnp").load("soli_med_no_post.jsp");}
                           else if(pestana2==2){$("#tabs-HistoAdmnp").load("sube_archivos_lab.jsp");}
                           else{$("#tabs-HistoAdmnp").load("sube_archivos_img.jsp");}
                          }    

$(function() {
        $( "#tabsHistoAdmnp" ).tabs();
    });
                           
    
</script>     

<title></title>
</head>
<body>
<table border="0"><tr><td>
<div id="tabsHistoAdmnp" style="height:100%;width:100%;">
    <ul>    
        <li><a href="#tabs-HistoAdmnp" onclick="cambiaPestanaHistoAdmnp(1)">Solicitudes medicamentos no pos</a></li>
        <li><a href="#tabs-HistoAdmnp" onclick="cambiaPestanaHistoAdmnp(2)">Subir archivos laboratorios</a></li>
        <li><a href="#tabs-HistoAdmnp" onclick="cambiaPestanaHistoAdmnp(3)">Subir archivos imágenes</a></li>
     </ul>
    <div id="tabs-HistoAdmnp" style="height:100%;width:100%;overflow:auto;">
    </div>
</div>

</td></tr></table>


<script type="text/javascript" language="javascript">
var hoja = document.createElement('style')

  var element = document.getElementById("tabs-HistoAdmnp");
  element.style.width= ""+(screen.width-300)+"px";
  element.style.height= ""+(screen.height-335)+"px";
  cambiaPestanaHistoAdmnp(1);
</script>

</body>

</html>
