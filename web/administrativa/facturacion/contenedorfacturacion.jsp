<%-- 
    Document   : contenedorfacturacion
    Author     : VAIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>

<script type="text/javascript" language="javascript">
    
function cambiafactu(pestanafactu){
                                if(pestanafactu==1){$("#tabs-rips").load("facturacion/generar_facturas.jsp");}
                           else if(pestanafactu==2){$("#tabs-rips").load("facturacion/editar_facturas.jsp");}
                           else if(pestanafactu==3){$("#tabs-rips").load("facturacion/consultar_facturas.jsp");}
                          /* else{$("#tabs-empleados").load("crearmedicamento.html");} */
                          }    

$(function() {
        $( "#tabs_fact2" ).tabs();
    });
                           
    
</script>     


<title>Facturación</title>
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
<div id="tabs_fact2" style="height:100%;width:99%;">
    <ul>    
        <li><a href="#tabs-rips" onclick="cambiafactu(1)">Generar Facturas</a></li>
        <li><a href="#tabs-rips" onclick="cambiafactu(2)">Editar Facturas</a></li>
        <li><a href="#tabs-rips" onclick="cambiafactu(3)">Colsultar Facturas</a></li>
   <!-- <li><a href="#tabs-empleados" onclick="cambiaPestanaDos(3)">Crear Cargo</a></li> -->
     </ul>
    <div id="tabs-rips" style="height:100%;overflow:auto;">
    </div>
</div>

</td></tr></table>


<script type="text/javascript" language="javascript">
var hoja = document.createElement('style')

  var elementrsp = document.getElementById("tabs-rips");
  elementrsp.style.width= ""+(screen.width-300)+"px";
  elementrsp.style.height= ""+(screen.height-325)+"px";
  
  cambiafactu(1);
</script>

</body>

</html>

