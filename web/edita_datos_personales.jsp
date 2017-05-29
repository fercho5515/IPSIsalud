<%-- 
    Document   : edita_datos_personales
    Created on : 19/02/2013, 11:53:36 AM
    Author     : EMMANUEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>

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
<script type="text/javascript" language="javascript">

		$(function(){
		     $("#fechanacimiento").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#fechanacimiento').datepicker($.datepicker.regional['es']);
		     $('#fechanacimiento').datepicker("option","showAnim","slideDown");
		     $('#fechanacimiento').datepicker("option","dateFormat","yy-mm-dd");
		     		
	});
		



</script> 
<title>Sin título 1</title>

</head>

<body>
<table  style="width:100%">
<tr>
<td style="width:20%">
<label for="nombre1">Primer Nombre </label>
</td>

<td style="width:20%">
<label for="nombre2">Segundo Nombre </label>
</td>

<td style="width:20%">
<label for="apellido1">Primer Apellido </label>
</td>

<td style="width:20%">
<label for="apellido2">Segundo Apellido </label>
</td>

<td style="width:20%" rowspan="8">
<input type="image" name="foto" size="25" id="foto" src="imagenes/1.jpg" alt="Pintura geométrica" style="width:100%;height:150px">
</td>
</tr>

<!--Segunda Fila-->

<tr>
<td style="width:20%">
<input type="text" name="nombre1" size="25" id="nombre1" maxlength="30" disabled="disabled">
</td>

<td style="width:20%">
<input type="text" name="nombre2" size="25" id="nombre2" maxlength="30" disabled="disabled">
</td>

<td style="width:20%">
<input type="text" name="apellido1" size="25" id="apellido1" maxlength="30" disabled="disabled">
</td>

<td style="width:20%">
<input type="text" name="apellido2" size="25" id="apellido2" maxlength="30" disabled="disabled">
</td>

</tr>

<!--Tercera Fila-->

<tr>

<td style="width:20%">
<label for="numidentificacion">Cedula </label>
</td>

<td style="width:20%">
    <label>Fecha de Nacimiento </label>
</td>

<td style="width:20%">
<label for="edad">Edad </label>
</td>

<td style="width:20%">
<label for="estadocivil">Estado Civil </label>
</td>
</tr>

<!--Cuarta Fila-->

<tr>
<td style="width:20%">
<input type="text" name="numidentificacion" size="25" id="numidentificacion" maxlength="30" disabled="disabled">
</td>

<td style="width:20%">
<input type="text" name="fechanacimiento" id="fechanacimiento">
</td>

<td style="width:20%">
<input type="text" name="edad" size="25" id="edad" maxlength="30" disabled="disabled">
</td>

<td style="width:20%">
<input type="text" name="estadocivil" size="25" id="estadocivil" maxlength="30" disabled="disabled">
</td>
</tr>

<!--Quinta Fila-->

<tr>

<td style="width:20%">
<label for="nivelsisben">Nivel Sisben </label>
</td>

<td style="width:20%">
<label for="sexo">Sexo </label>
</td>

<td style="width:20%">
<label for="rh">RH </label>
</td>

<td style="width:20%">
<label for="orientacionsexual">Orientacion Sexual </label>
</td>

</tr>

<!--Sexta Fila-->

<tr>
<td style="width:20%">
<input type="text" name="nivelsisben" size="25" id="nivelsisben" maxlength="30" disabled="disabled">
</td>

<td style="width:20%">
<input type="text" name="sexo" size="25" id="sexo" maxlength="30" disabled="disabled">
</td>

<td style="width:20%">
<input type="text" name="rh" size="25" id="rh" maxlength="30" disabled="disabled">
</td>

<td style="width:20%">
<input type="text" name="orientacionsexual" size="25" id="orientacionsexual" maxlength="30" disabled="disabled">
</td>
</tr>

<!--Septima Fila-->

<tr>

<td style="width:20%">
<label for="departamento">Departamento </label>
</td>

<td style="width:20%">
<label for="ciudad">Ciudad </label>
</td>

<td style="width:20%">
<label for="barrio">Barrio </label>
</td>

<td style="width:20%">
<label for="direccion">Direccion </label>
</td>
</tr>

<!--Octava Fila-->

<tr>
<td style="width:20%">
<input type="text" name="departamento" size="25" id="departamento" maxlength="30" disabled="disabled">
</td>

<td style="width:20%">
<input type="text" name="ciudad" size="25" id="ciudad" maxlength="30" disabled="disabled">
</td>

<td style="width:20%">
<input type="text" name="barrio" size="25" id="barrio" maxlength="30" disabled="disabled">
</td>

<td style="width:20%">
<input type="text" name="direccion" size="25" id="direccion" maxlength="30" disabled="disabled">
</td>
</tr>

</table>


</body>

</html>

