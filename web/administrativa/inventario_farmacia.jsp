﻿<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8">
<script type="text/javascript" language="javascript">

		


</script>

	<title>Sin título 1</title>
</head>

<body>
<table style="width:60%;padding-top:5px" align="center">
<!-- 
<tr>
<td>
<label>Serial Inventario: </label> 
<input type="text" name="serialinventario" size="25" id="serialinventario" maxlength="30" disabled="disabled">
</td>
</tr>
-->

<tr>
<td>
<br>
<fieldset>
<legend>Medicamento</legend>
<table style="width:100%">

<tr>
<td style="width:70%">
<label>Medicamento: </label>
<input type="text" name="medicamento" size="60" id="medicamento" maxlength="130">
</td>

<td style="width:30%">
<label>Codigo: </label>
<input type="text" name="codigo" size="10" id="codigo" maxlength="130">
</td>
</tr>

</table>
</fieldset>
<br>
<fieldset>
<legend>Distribuidor</legend>
<table style="width:100%">

<tr>

<td style="width:15%">
<label>Distribuidor: </label>
</td>

<td style="width:35%">
<select name="distribuidor" id="distribuidor" style="width:85%"></select>
</td>


<td style="width:15%">
<label>Vendedor: </label>
</td>

<td style="width:35%">
<select name="vendedor" id="vendedor" style="width:85%"></select>
</td>

</tr>

<tr>

<td>
<label>Laboratorio: </label>
</td>

<td>
<select name="laboratorio" id="laboratorio" style="width:85%"></select>
</td>

<td>
<label>Numero de Factura: </label>
</td>

<td>
<input type="text" size="40" name="numfac" id="numfac" maxlength="50">
</td>

</tr>

</table>
</fieldset>
<br>
<fieldset>
<legend>Fabricacion</legend>
<table style="width:100%">

<tr>

<td style="width:15%">
<label>Lote: </label>
</td>

<td style="width:35%">
<input name="distribuidor" id="distribuidor" style="width:85%">
</td>


<td style="width:15%">
<label>Invima: </label>
</td>

<td style="width:35%">
<input name="vendedor" id="vendedor" style="width:85%">
</td>

</tr>

<tr>

<td>
<label>Fecha de Fabricacion: </label>
</td>

<td>
<input type="text" name="calendariofecfab" id="calendariofecfab" style="width:60%">
</td>

<td>
<label>Fecha de Vencimiento:</label>
</td>

<td>
<input type="text" name="calendariofecven" id="calendariofecven" style="width:60%">
</td>

</tr>
</table>
</fieldset>

<br>

<fieldset>
<legend>Compra</legend>
<table>
<tr>
<td style="width:20%">
<label>Cantidad Comprada: </label>
</td>
<td style="width:30%">
<input type="text" name="cantidadcomprada" size="25" id="cantidadcomprada" maxlength="30">
</td>
<td style="width:20%">
<label>Valor de Compra: </label>
</td>
<td style="width:30%">
<input type="text" name="valorcompra" size="25" id="valorcompra" maxlength="30">
</td>
</tr>

<tr>
<td>
<label>Descuento: </label>
</td>
<td>
<input type="text" name="descuento" size="25" id="descuento" maxlength="30">
</td>
<td>
<label>Impuesto: </label>
</td>
<td>
<input type="text" name="impuesto" size="25" id="impuesto" maxlength="30">
</td>
</tr>

<tr>
<td>
<label>Ubicacion Fisica: </label>
</td>
<td>
<input type="text" name="ubicacion" size="25" id="ubicacion" maxlength="30">
</td>
<td>
<label>Codigo de Barras: </label>
</td>
<td>
<input type="text" name="codigobarras" size="25" id="codigobarras" maxlength="30">
</td>
</tr>
</table>
</fieldset>

</td>
</tr>
</table>
<center><input type="button" name="aceptar" id="aceptar" value="Agregar"> </center>   
</body>

</html>
