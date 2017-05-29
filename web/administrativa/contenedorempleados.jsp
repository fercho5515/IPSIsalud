<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>

<script type="text/javascript" language="javascript">
function cambiaPestanaDos(pestana){

                           if(pestana==1){$("#tabs-empleados").load("crearempleado.jsp");}
                           else if(pestana==2){$("#tabs-empleados").load("editarempleado.jsp");}
                          /* else{$("#tabs-empleados").load("crearmedicamento.html");} */
                          }    

$(function() {
        $( "#tabs" ).tabs();
    });
                           
    
</script>     


<title>Empleados</title>
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
<table border="0"><tr><td>
<div id="tabs" style="height:100%;width:99%;">
    <ul>    
        <li><a href="#tabs-empleados" onclick="cambiaPestanaDos(1)">Crear Empleado</a></li>
        <li><a href="#tabs-empleados" onclick="cambiaPestanaDos(2)">Editar Empleado</a></li>
   <!-- <li><a href="#tabs-empleados" onclick="cambiaPestanaDos(3)">Crear Cargo</a></li> -->
     </ul>
    <div id="tabs-empleados" style="height:100%;overflow:auto;">
    </div>
</div>

</td></tr></table>


<script type="text/javascript" language="javascript">
var hoja = document.createElement('style')

  var element = document.getElementById("tabs-empleados");
  element.style.width= ""+(screen.width-300)+"px";
  element.style.height= ""+(screen.height-325)+"px";
 cambiaPestanaDos(1);
</script>

</body>

</html>
