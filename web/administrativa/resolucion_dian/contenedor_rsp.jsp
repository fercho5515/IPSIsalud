<%-- 
    Document   : contenedor_eps
    Created on : 28-ago-2013, 12:30:12
    Author     : servidor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>

<script type="text/javascript" language="javascript">
    
function cambiaRsp(pestana){
                                if(pestana==1){$("#tabs-rsp").load("resolucion_dian/crea_resolucion.jsp");}
                           else if(pestana==2){$("#tabs-rsp").load("resolucion_dian/edita_resolucion.jsp");}
                          /* else{$("#tabs-empleados").load("crearmedicamento.html");} */
                          }    

$(function() {
        $( "#tabs_rsp" ).tabs();
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
            }
          int per=Integer.parseInt(""+session.getAttribute("permiso")+"");
           if(per < 7){
                out.print("<br><center><h1>No posee permiso para realizar esta acción</h1></center>");
                out.println("</body></html>");
                return;          
          } 
     %>    
<table border="0"><tr><td>
<div id="tabs_rsp" style="height:100%;width:99%;">
    <ul>    
        <li><a href="#tabs-rsp" onclick="cambiaRsp(1)">Crear Nueva Resolución de la DIAN</a></li>
        <li><a href="#tabs-rsp" onclick="cambiaRsp(2)">Editar Resolución de la DIAN</a></li>
   <!-- <li><a href="#tabs-empleados" onclick="cambiaPestanaDos(3)">Crear Cargo</a></li> -->
     </ul>
    <div id="tabs-rsp" style="height:100%;overflow:auto;">
    </div>
</div>

</td></tr></table>


<script type="text/javascript" language="javascript">
var hoja = document.createElement('style')

  var elementrsp = document.getElementById("tabs-rsp");
  elementrsp.style.width= ""+(screen.width-300)+"px";
  elementrsp.style.height= ""+(screen.height-325)+"px";
  
  cambiaRsp(1);
</script>

</body>

</html>

