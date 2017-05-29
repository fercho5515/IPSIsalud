<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html> 
<html lang="es"> 
<head>
<meta charset="utf-8">
<title>Ips Isalud Total S.A.S</title>
	 <link rel="shortcut icon" href="../imagenes/fotos/favicon.ico">
        <link rel="stylesheet" type="text/css" media="screen" href="../jquery/css/flick/jquery-ui-1.9.2.custom.css" >
        <link rel="stylesheet" type="text/css" media="screen" href="../jquery/jqgrid/css/ui.jqgrid.css" >
        <link rel="stylesheet" type="text/css" media="screen" href="../jquery/bajados/ui.multiselect.css" >
       	<script src="../jquery/bajados/jquery.min.js" type="text/javascript"></script> 
        <script type="text/javascript" language="javascript" src="../jquery/js/jquery-ui.js"></script>
	<script src="../jquery/jqgrid/js/i18n/grid.locale-es.js" type="text/javascript"></script>        
        <script type="text/javascript" src="../jquery/bajados/jquery.ui.datepicker-es.js"></script> 
        <script src="../jquery/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
        <link type='text/css' href='../jquery/bajados/modal/osx.css' rel='stylesheet' media='screen'>
        <script type='text/javascript' src='../jquery/bajados/modal/jquery.simplemodal.js'></script>
        <script type="text/javascript" src="../jquery/bajados/jquery.previewInputFileImage.js"></script>        
        <script src="../jquery/apprise/apprise-1.5.min.js" type="text/javascript"></script> 
        <link type='text/css' href='../jquery/apprise/apprise.min.css' rel='stylesheet' media='screen'>

  <script type="text/javascript" language="javascript">

   if(document.getElementById) {
    window.alert = function(txt) {
        apprise(txt);
    }
}  
      
$(function() {
    $( "#accordionadmin" ).accordion({
      heightStyle: "content",
      collapsible: true
    });
  });
  
  
    function agenda(){
                       location.href="../ingreso.jsp";
                }
    function cierra(){
                               location.href="../cierra_sesion.jsp";    
                     }
  
  function cambiaPestanaMedic(pstana){
                               
                                if(pstana==1){$("#tabs-1_admin").load("contenedor_laboratorios.jsp");$("#conetedorcosas").removeClass('ui-tabs').removeClass('ui-widget').removeClass('ui-widget-content').removeClass('ui-corner-all');}     //Laboratorios
                           else if(pstana==2){$("#tabs-1_admin").load("contenedordistribuidores.html");$("#conetedorcosas").removeClass('ui-tabs').removeClass('ui-widget').removeClass('ui-widget-content').removeClass('ui-corner-all');}   //Distribuidores
                           else if(pstana==3){$("#tabs-1_admin").load("contenedortemeperaturahumedad.jsp");$("#conetedorcosas").removeClass('ui-tabs').removeClass('ui-widget').removeClass('ui-widget-content').removeClass('ui-corner-all');}    //Temperatura y Humedad
                           else if(pstana==4){$("#tabs-1_admin").load("inventario_medic.jsp");$("#conetedorcosas").addClass('ui-tabs').addClass('ui-widget').addClass('ui-widget-content').addClass('ui-corner-all');} //compras medicamentos
                           else if(pstana==5){$("#tabs-1_admin").load("farmacia/contenedorsalidasfarmacia.jsp");$("#conetedorcosas").removeClass('ui-tabs').removeClass('ui-widget').removeClass('ui-widget-content').removeClass('ui-corner-all');} //entrea medicamentos
                           else if(pstana==6){$("#tabs-1_admin").load("farmacia/inventariofarmacia.jsp");$("#conetedorcosas").addClass('ui-tabs').addClass('ui-widget').addClass('ui-widget-content').addClass('ui-corner-all');}    //Inventario
                           else if(pstana==7){$("#tabs-1_admin").load("contenedormedicamentos.html");$("#conetedorcosas").removeClass('ui-tabs').removeClass('ui-widget').removeClass('ui-widget-content').removeClass('ui-corner-all');}     //medicamentos                    
                         
 }    

                          
    
</script>        


<style type="text/css">
	body{
		font: 62.5% "Trebuchet MS", sans-serif;
		margin: 5px;
	}
	#dsa{padding: 5px 5px 0px 5px;}
	label,option,select,p{font-family:"Eras Medium ITC";
                            color:#2779aa;
                            font-size:11pt;}
        .menuu td{font-family:"Eras Medium ITC";
	          color:#2779aa;
                  font-size:11pt;}
	legend{font-family:"Eras Bold ITC";
	       font-size:11pt;
    	       color:#2779aa;}
    fieldset{border:1px #2779aa solid;
             -webkit-border-radius: 10px;
             -moz-border-radius: 10px;
             border-radius: 10px;} 
             
    #aceptar{font-family:"Eras Medium ITC";
   	     color:#2779aa;
             font-size:11pt; background:white;
             -webkit-border-radius: 10px;
             -moz-border-radius: 10px;
             border-radius: 10px;
         }
    #aceptar:hover {
     	            background: #3baae3;
 	            border-top-color: #3baae3;
                    color: #ffffff;
                    cursor: pointer;
		}
	h2{
	   color:#2779aa;
	}
        
     
 .mano:hover{
     	 cursor: pointer;
         background-color:#2694e8;
         border-radius:4px;
         color:white;
	    }
</style>


  
</head>

<body style="background-color: #f2f5f7;">
         <% 
                    request.setCharacterEncoding("UTF-8");
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || (request.getParameter( "permiso" )==null&&session.getAttribute("permiso")==null)){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
              String permisos="";
             
              if(request.getParameter( "permiso" )==null){
                 permisos=(String)session.getAttribute("permiso");
               }
              else{permisos=request.getParameter( "permiso" );
                  session.setAttribute("permiso",permisos);
                  }                          
                         
               String nombre=(String)session.getAttribute("nombre");
               String clave=(String)session.getAttribute("clave");
               String id=(String)session.getAttribute("id");
               String cedula=(String)session.getAttribute("cedula");
               String imagen=(String)session.getAttribute("imagen");
                   session.setAttribute("valida","1");
        %>       
<table border="0" style="height:100%;width:100%" >
<tr style="height:100px" >
<td colspan="2" >
<center><img src="../imagenes/fotos/baner.png" alt="imagen no encontrada" height="100px" width="100%"></center>
</td>
</tr>

<tr>
<td  style="width:250px"  valign="top">
<!----------------------menu con acordion------------------------------>
<div id="accordionadmin" >
  <h3>Farmacia</h3>
  <div>
  <table style="width:100%" class="menuu" >
        
	<tr>
	<td onclick="cambiaPestanaMedic(5)" class="mano">
	   Salida Farmacia
	</td>
	</tr> 
        
        
	<tr>
	<td onclick="cambiaPestanaMedic(4)" class="mano">
	   Compras
	</td>
	</tr>
	
        
	<tr>
	<td onclick="cambiaPestanaMedic(6)" class="mano">
	   Inventario
	</td>
	</tr>
        
	<tr>
	<td onclick="cambiaPestanaMedic(7)" class="mano">
	   Medicamentos
	</td>
	</tr>
        
        <tr>
	<td onclick="cambiaPestanaMedic(1)" class="mano">
	  Laboratorios	
	</td>
	</tr>
        
	<tr>
	<td onclick="cambiaPestanaMedic(2)" class="mano">
	  Distribuidores	
	</td>
	</tr>
	
	<tr>
	<td onclick="cambiaPestanaMedic(3)" class="mano">
	   Temperatura y Humedad	
	</td>
	</tr>
        
            
     
  </table>
  </div>

</div>
</td>



<td style="text-align:left"  valign="top" id="conetedorcosas">

<div id="tabs-1_admin" ></div>	
</td>
</tr>


</table>

<script type="text/javascript" language="javascript">

//document.writeln("<b>Tú resolución es de:</b> " + screen.width + " x " + screen.height +"");
  var hoja = document.createElement('style')
  var element = document.getElementById("tabs-1_admin");
  element.style.width= ""+(screen.width-260)+"px";
  element.style.height= ""+(screen.height-255)+"px";
  
  
  cambiaPestanaMedic(5);
  
</script>

<div id="caja2" style="position:absolute;visibility:visible;position:absolute;right:20px;top: 3px;text-align: right;width:615px" >
 <h2><% out.print(""+(String)session.getAttribute("nombre")+""); %></h2>     
<input type="button" value="Inicio" name="aceptar" size="25" id="aceptar" maxlength="30" onclick="agenda()"><br> 
<input type="button" value="Cerrar Sesion" name="aceptar" size="25" id="aceptar" onclick="cierra();" >
</div>


</body>

</html>
