<%-- 
    Document   : index_e
    Created on : 18/02/2013, 02:43:09 PM
    Author     : EMMANUEL
--%>
<%@page import="java.util.*" session="true" %>
<% 
  if(session.getAttribute("id")!=null){  session.invalidate();  }
%>

<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>

         <link rel="shortcut icon" href="imagenes/fotos/favicon.ico">
	 <link rel="stylesheet" type="text/css" media="screen" href="jquery/css/flick/jquery-ui-1.9.2.custom.css" >
        <link rel="stylesheet" type="text/css" media="screen" href="jquery/jqgrid/css/ui.jqgrid.css" >
        <link rel="stylesheet" type="text/css" media="screen" href="jquery/bajados/ui.multiselect.css" >
       	<script src="jquery/bajados/jquery.min.js" type="text/javascript"></script>
        <script src="jquery/bajados/jquery-ui.min.js" type="text/javascript"></script> 
		<script type="text/javascript" language="javascript" src="jquery/js/jquery-ui.js"></script>
		<script type="text/javascript" src="jquery/bajados/jquery.ui.widget.js"></script>
		<script type="text/javascript" src="jquery/bajados/jquery.ui.datepicker-es.js"></script>
		<script type="text/javascript" src="jquery/bajados/jquery.ui.core.js"></script>
		
        <script src="jquery/jqgrid/js/i18n/grid.locale-es.js" type="text/javascript"></script>
        <script src="jquery/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
           
        <link type='text/css' href='jquery/bajados/modal/osx.css' rel='stylesheet' media='screen'>
        <script type='text/javascript' src='jquery/bajados/modal/jquery.simplemodal.js'></script>

        <script type="text/javascript"  language="javascript" >
            
         function cambiaImagen(){ 
                                    var usuario = document.getElementById("usuario").value;
                                    $("#foto_usuario").load("buscar_imagen.jsp?id="+usuario+""); 
                                 }   
         function valida(){
                            var usuario = document.getElementById("usuario").value;
                            if( usuario == null || usuario.length == 0 || /^\s+$/.test(usuario) ) {
                                        				               alert("ingrese id de usuario" ); 
                                        						return false;
                                                                                       }
                            var clave = document.getElementById("clave").value;
                            if( clave == null || clave.length == 0 || /^\s+$/.test(clave) ) {
                                        					       alert("ingrese clave" ); 
                                        					       return false;
                                                                                      }  
                           return true;
                         }                                                      
        </script>
<style type="text/css">
	body{
		font: 62.5% "Trebuchet MS", sans-serif;
		margin: 5px;
	}
	#dsa{padding: 5px 5px 0px 5px;}
	label,option,select{font-family:"Eras Medium ITC";
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
          font-size:11pt;
          background:#e4f1fb;
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

	</style>

<title>IPS ISALUD TOTAL S.A.S</title>
</head>

<body>
    <form action="ingreso.jsp" method="post" onsubmit="return valida();">
<table style="height:100%;width:75%;background:#deedf7" align="center">
<tr style="height:150px">
<td colspan="2">
<center><img src="imagenes/fotos/baner.png" alt="imagen no encontrada" height="150px" width="100%"></center>
</td>
</tr>

<tr style="height:450px">
<td  style="width:60%">
<div name="foto_usuario" id="foto_usuario">    
<center><img src="imagenes/fotos/silueta.png" alt="imagen no encontrada" height="200px" width="auto"></center>
</div>
</td>
<td>
<table style="width:100%">
<tr>
<td>
<center><label for="usuario">Usuario:</label></center>
</td>
</tr>

<tr>
<td>
<center><input type="text" name="usuario" size="25" id="usuario" maxlength="30"   onkeyup="cambiaImagen()"></center>
</td>
</tr>

<tr>
<td>
<center><label for="clave">Clave: </label></center>
</td>
</tr>

<tr>
<td>
<center><input type="password" name="clave" size="25" id="clave" maxlength="30"></center>
</td>
</tr>

<tr>
<td>
<center><input type="submit" value="Aceptar" name="aceptar" size="25" id="aceptar" maxlength="30"></center>
</td>
</tr>


</table>
</td>
</tr>


</table>
     </form>
</body>

</html>
