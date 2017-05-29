<%-- 
    Document   : contenedor_laboratorios
    Created on : 13/03/2013, 02:54:08 PM
    Author     : EMMANUEL
--%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
<% request.setCharacterEncoding("UTF-8"); %>
<head>
<meta charset="utf-8"/>

<script type="text/javascript" language="javascript">
function cambiaPestanaLaboratorios(pestana2){
                                if(pestana2==1){$("#tabs-laboratorios").load("crearlaboratorio.jsp");}
                           else if(pestana2==2){$("#tabs-laboratorios").load("editalaboratorio.jsp");}
                          }    

$(function() {
        $( "#tabs" ).tabs();
    });
                           
    
</script>     

<title>Medicamentos</title>
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
            }%>
<table border="0"><tr><td>
<div id="tabs" style="height:100%;width:100%;">
    <ul>    
        <li><a href="#tabs-laboratorios" onclick="cambiaPestanaLaboratorios(1)">Crear Laboratorio</a></li>
        <li><a href="#tabs-laboratorios" onclick="cambiaPestanaLaboratorios(2)">Editar Laboratorio</a></li>
     </ul>
    <div id="tabs-laboratorios" style="height:100%;width:100%;overflow:auto;">
    </div>
</div>

</td></tr></table>


<script type="text/javascript" language="javascript">
  var hoja = document.createElement('style')

  var element = document.getElementById("tabs-laboratorios");
  element.style.width= ""+(screen.width-300)+"px";
  element.style.height= ""+(screen.height-335)+"px";
  cambiaPestanaLaboratorios(1);
</script>

</body>

</html>

