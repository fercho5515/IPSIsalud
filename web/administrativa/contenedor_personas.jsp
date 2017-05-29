<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
<% request.setCharacterEncoding("UTF-8"); %>
<head>
<meta charset="utf-8">

<script type="text/javascript" language="javascript">
function cambiaPestanaPerso(pestana){
                             
                                if(pestana==1){$("#tabs-personas").load("crearpersona.jsp");}
                           else if(pestana==2){$("#tabs-personas").load("editarpersona.jsp");}
                          /* else{$("#tabs-empleados").load("crearmedicamento.html");} */
                          }    

$(function() {
        $( "#tabs_per" ).tabs();
    });
                           
    
</script>     


<title>Empleados</title>
</head>

<body>
   <% 
      
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
request.setCharacterEncoding("UTF-8");
%>    
<table border="0"><tr><td>
<div id="tabs_per" style="height:100%;width:99%;">
    <ul>    
        <li><a href="#tabs-personas" onclick="cambiaPestanaPerso(1)">Crear Persona</a></li>
        <li><a href="#tabs-personas" onclick="cambiaPestanaPerso(2)">Editar Persona</a></li>
   <!-- <li><a href="#tabs-empleados" onclick="cambiaPestanaDos(3)">Crear Cargo</a></li> -->
     </ul>
    <div id="tabs-personas" style="height:100%;overflow:auto;">
    </div>
</div>

</td></tr></table>


<script type="text/javascript" language="javascript">
var hoja = document.createElement('style')

  var element = document.getElementById("tabs-personas");
  element.style.width= ""+(screen.width-300)+"px";
  element.style.height= ""+(screen.height-325)+"px";
  cambiaPestanaPerso(1);
</script>

</body>

</html>
