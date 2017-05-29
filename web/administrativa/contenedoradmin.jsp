<%@page import="java.util.*" session="true" %>
<% response.setCharacterEncoding("UTF-8"); %>
<% request.setCharacterEncoding("UTF-8"); %>
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
  
  function cambiaPestanaadmin(pstana){

                                if(pstana==1){$("#tabs-1_admin").load("personas/empleados/contenedorempleados.jsp");}        //empleados
                           else if(pstana==2){$("#tabs-1_admin").load("personas/pacientes/contenedorpacientes.jsp");}        //pacientes
                           else if(pstana==3){$("#tabs-1_admin").load("contenedor_diagnosticos.html");}    //diagnosticos
                           else if(pstana==4){$("#tabs-1_admin").load("contenedorprocedimientos.html");}   //procedimientos
			   else if(pstana==5){$("#tabs-1_admin").load("contenedormedicamentos.html");}     //medicamentos                     
                           else if(pstana==6){$("#tabs-1_admin").load("contenedordistribuidores.html");}   //Distribuidores
                           else if(pstana==7){$("#tabs-1_admin").load("contenedor_laboratorios.jsp");}     //Laboratorios
                           else if(pstana==8){$("#tabs-1_admin").load("sisa.jsp");}     //Vendedores
                           else if(pstana==9){$("#tabs-1_admin").load("contenedorcitas.html");}            //citas
                           else if(pstana==10){$("#tabs-1_admin").load("contenedor_contratos.jsp");}       //Contratos
                           else if(pstana==11){$("#tabs-1_admin").load("contenedor_tarifarios.jsp");}       //Tarifarios
                           else if(pstana==12){$("#tabs-1_admin").load("contenedormedicamentos_1.jsp?dato=2");}    //Inventario
			   else if(pstana==13){$("#tabs-1_admin").load("contenedortemeperaturahumedad.jsp");}    //Temperatura y Humedad
                           else if(pstana==14){$("#tabs-1_admin").load("rips/contenedor_rips.jsp");}    //rips
                           else if(pstana==15){$("#tabs-1_admin").load("facturacion/contenedorfacturacion.jsp");}    //Facturas
                           else if(pstana==16){$("#tabs-1_admin").load("contenedor_menu.jsp");}    //Menu
                           else if(pstana==17){$("#tabs-1_admin").load("eps/contenedor_eps.jsp");}    //Instituciones
                           else if(pstana==18){$("#tabs-1_admin").load("contenedor_antecedentes.jsp");}    //Antecedentes
                           else if(pstana==19){$("#tabs-1_admin").load("contenedor_cefalocaudal.jsp");}    //Examen cefalocaudal
                           else if(pstana==20){$("#tabs-1_admin").load("contenedor_signos.jsp");}    //Signos Desnutricion
                           else if(pstana==21){$("#tabs-1_admin").load("sisa.jsp");}    //Departamentos y ciudades
                           else if(pstana==22){$("#tabs-1_admin").load("resolucion_dian/contenedor_rsp.jsp");}    //Resolucion DIAN
                           else if(pstana==23){$("#tabs-1_admin").load("personas/personas/contenedor_personas.jsp");}    //presonas
                           else if(pstana==24){$("#tabs-1_admin").load("contenedor_histo.jsp");} //admin historia clinica
                           else if(pstana==25){$("#tabs-1_admin").load("../respaldos/copia_local.jsp");}    //copia local
                           else if(pstana==26){$("#tabs-1_admin").load("../respaldos/copia_internet.jsp");} //coipa internet
                           else if(pstana==27){$("#tabs-1_admin").load("reportes_historia/contenedor_histo.jsp");} //coipa internet
                           else if(pstana==28){$("#tabs-1_admin").load("cargar_pac_arch/sube.jsp");} //coipa internet
                           else if(pstana==29){$("#tabs-1_admin").load("contenedormedicamentos_1.jsp?dato=0");} //compras medicamentos
                           else if(pstana==30){$("#tabs-1_admin").load("contenedormedicamentos_1.jsp?dato=1");} //entrea medicamentos
                       
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

<body>
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
  <h3>Personas</h3>
    <div>         
         <table border="0" style="width:100%;" class="menuu">
            <tr>
            <td style="height:10px;width:100%"  class="mano" onclick="cambiaPestanaadmin(23)">
            Personas
            </td>
            </tr>
            <% if(permisos.compareTo("10")==0 || permisos.compareTo("11")==0 ){
            out.print("<tr>");
            out.print("<td style='height:10px;width:100%'  class='mano' onclick='cambiaPestanaadmin(1)'>");
            out.print("Empleados");
            out.print("</td>");
            out.print("</tr>");
           } %>
            <tr>
            <td onclick="cambiaPestanaadmin(2)" class="mano" >
            Pacientes
            </td>
            </tr>  	
          </table>
     </div>
  
  <h3>Administración</h3>
   <div>
        <table border="0" style="width:100%" class="menuu">
            <!--
        <tr>
	<td onclick="cambiaPestanaadmin(3)" class="mano" style="height:10px;width:100%">
	   Diagnosticos	
	</td>
	</tr>
	-->
	<tr>
	<td onclick="cambiaPestanaadmin(4)" class="mano">
	   Procedimientos
	</td>
	</tr>
	
	<tr>
	<td onclick="cambiaPestanaadmin(5)" class="mano">
	    Medicamentos	
	</td>
	</tr> 
        
        <tr>
          <td onclick="cambiaPestanaadmin(17)" class="mano">
             Eps
          </td>
         </tr>  
        
         <tr>
          <td onclick="cambiaPestanaadmin(18)" class="mano">
             Antecedentes	
          </td>
          </tr>  
        
         <tr>
          <td onclick="cambiaPestanaadmin(19)" class="mano">
             Examen cefalocaudal	
          </td>
          </tr>  
        
         <tr>
          <td onclick="cambiaPestanaadmin(20)" class="mano">
             Signos Desnutricion	
          </td>
          </tr>
          
            
        
         <tr>
          <td onclick="cambiaPestanaadmin(16)" class="mano">
             Menu	
          </td>
          </tr>          
            
         <!--        
         <tr>
          <td onclick="cambiaPestanaadmin(21)" class="mano">
             Departamentos y ciudades	
          </td>
          </tr> -->
         
          
         <tr>
          <td onclick="cambiaPestanaadmin(24)" class="mano">
             Historia Clinica	
          </td>
          </tr>
          
         <tr>
          <td onclick="cambiaPestanaadmin(27)" class="mano">
             Impresión Historia Clinica	
          </td>
          </tr>  
        </table>
    </div>   
  <h3>Contratacion</h3>
    <div>
  	<table border="0" style="width:100%" class="menuu">  	
  	<tr>
	<td onclick="cambiaPestanaadmin(10)" style="width:100%" class="mano">
	  Contratos	
	</td>
	</tr>
	<tr>
	<td onclick="cambiaPestanaadmin(11)" style="width:100%"  class="mano">
	   Tarifarios
	</td>
	</tr>
	<tr>
	<td onclick="cambiaPestanaadmin(28)" style="width:100%"  class="mano">
	   Archivo de Pacientes 
	</td>
	</tr>
	</table>
      </div>
 <!-- 
  <h3>Entidades</h3>
  <div>
    Cras dictum
  </div>  -->
  <h3>Farmacia</h3>
  <div>
  <table style="width:100%" class="menuu" >
        <tr>
	<td onclick="cambiaPestanaadmin(7)" class="mano">
	  Laboratorios	
	</td>
	</tr>
        
	<tr>
	<td onclick="cambiaPestanaadmin(6)" class="mano">
	  Distribuidores	
	</td>
	</tr>
	
    <!--
	<tr>
	<td onclick="cambiaPestanaadmin(8)" class="mano">
	   Vendedores
	</td>
	</tr>
     
	
	<tr>
	<td onclick="cambiaPestanaadmin(13)" class="mano">
	   Temperatura y Humedad	
	</td>
	</tr>
        
        
	<tr>
	<td onclick="cambiaPestanaadmin(29)" class="mano">
	   Compras
	</td>
	</tr>
	
	<tr>
	<td onclick="cambiaPestanaadmin(30)" class="mano">
	   Entregas
	</td>
	</tr>     
     
	<tr>
	<td onclick="cambiaPestanaadmin(12)" class="mano">
	   Inventario
	</td>
	</tr>
    -->
  </table>
  </div>
  <!--
  <h3>Agenda</h3>
  <div>
    <table style="width:100%" class="menuu">
          <tr>
          <td onclick="cambiaPestanaadmin(9)" class="mano">
             Citas	
          </td>
          </tr>
    </table>
  </div> -->
<h3>Facturación</h3>
  <div>
      <table style="width:100%" class="menuu">
           <tr>
          <td onclick="cambiaPestanaadmin(14)" class="mano">
             Rips	
          </td>
          </tr>
    
          <tr>
          <td onclick="cambiaPestanaadmin(15)" class="mano">
              Facturas
          </td>
          </tr>
       
          <tr>
          <td onclick="cambiaPestanaadmin(22)" class="mano">
             Resolucion DIAN	
          </td>
          </tr>   
    </table>
  </div> 
 
<h3>Copias de seguridad</h3>
  <div>
    <table style="width:100%" class="menuu">
          <tr>
          <td onclick="cambiaPestanaadmin(25)" class="mano">
             Copia local	
          </td>
          </tr>
          <tr>
          <td onclick="cambiaPestanaadmin(26)" class="mano">
             Copia a correo electronico	
          </td>
          </tr>
    </table>
  </div>  
</div>
</td>



<td style="text-align:left"  valign="top">

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
</script>

<div id="caja2" style="position:absolute;visibility:visible;position:absolute;right:20px;top: 3px;text-align: right;width:615px" >
 <h2><% out.print(""+(String)session.getAttribute("nombre")+""); %></h2>     
<input type="button" value="Inicio" name="aceptar" size="25" id="aceptar" maxlength="30" onclick="agenda()"><br> 
<input type="button" value="Cerrar Sesion" name="aceptar" size="25" id="aceptar" onclick="cierra();" >
</div>


</body>

</html>
