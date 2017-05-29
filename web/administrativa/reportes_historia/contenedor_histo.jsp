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
        <li><a href="#tabs-reporte-histo" >Historia Clinica</a></li>
        <li><a href="#tabs-reporte-histo2" >Remisiones</a></li>
        <li><a href="#tabs-reporte-histo3" >Solicitudes no POS</a></li>
   <!-- <li><a href="#tabs-reporte-histo4" >Laboratorios</a></li> -->
        <li><a href="#tabs-reporte-histo6" >Laboratorios por Consulta</a></li>
  <!-- <li><a href="#tabs-reporte-histo5" >Imagenes</a></li> -->
        <li><a href="#tabs-reporte-histo7" >Imagenes por Consulta</a></li>
     </ul>
     <div id="tabs-reporte-histo" style="height:100%;width:100%;overflow:auto;"> </div>    
     <div id="tabs-reporte-histo2" style="height:100%;width:100%;overflow:auto;"> </div>
     <div id="tabs-reporte-histo3" style="height:100%;width:100%;overflow:auto;"> </div>
<!-- <div id="tabs-reporte-histo4" style="height:100%;width:100%;overflow:auto;"> </div> -->
<!-- <div id="tabs-reporte-histo5" style="height:100%;width:100%;overflow:auto;"> </div> -->
     <div id="tabs-reporte-histo6" style="height:100%;width:100%;overflow:auto;"> </div>
     <div id="tabs-reporte-histo7" style="height:100%;width:100%;overflow:auto;"> </div>
</div>

</td></tr></table>


<script type="text/javascript" language="javascript">

  var element = document.getElementById("tabs-reporte-histo");
  element.style.width= ""+(screen.width-300)+"px";
  element.style.height= ""+(screen.height-335)+"px";
 
  var element2 = document.getElementById("tabs-reporte-histo2");
  element2.style.width= ""+(screen.width-300)+"px";
  element2.style.height= ""+(screen.height-335)+"px";
 
  var element3 = document.getElementById("tabs-reporte-histo3");
  element3.style.width= ""+(screen.width-300)+"px";
  element3.style.height= ""+(screen.height-335)+"px";
 /*
  var element4 = document.getElementById("tabs-reporte-histo4");
  element4.style.width= ""+(screen.width-300)+"px";
  element4.style.height= ""+(screen.height-335)+"px";
 
  var element5 = document.getElementById("tabs-reporte-histo5");
  element5.style.width= ""+(screen.width-300)+"px";
  element5.style.height= ""+(screen.height-335)+"px";
  */
  var element6 = document.getElementById("tabs-reporte-histo6");
  element6.style.width= ""+(screen.width-300)+"px";
  element6.style.height= ""+(screen.height-335)+"px";
  
  var element7 = document.getElementById("tabs-reporte-histo7");
  element7.style.width= ""+(screen.width-300)+"px";
  element7.style.height= ""+(screen.height-335)+"px";
  
    $("#tabs-reporte-histo").load("reportes_historia/historias.jsp");
    $("#tabs-reporte-histo2").load("reportes_historia/remision/remisiones_or.jsp");
    $("#tabs-reporte-histo3").load("reportes_historia/soli_no_pos/soli_no_pos.jsp");
 // $("#tabs-reporte-histo4").load("reportes_historia/laboratorios/laboratorio.jsp");
 // $("#tabs-reporte-histo5").load("reportes_historia/imagenes/imagenes.jsp");
    $("#tabs-reporte-histo6").load("reportes_historia/laboratorios_tot/laboratorio.jsp");
    $("#tabs-reporte-histo7").load("reportes_historia/imagenes_tot/imagenes.jsp");
</script>

</body>

</html>

