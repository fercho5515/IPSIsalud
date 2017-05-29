<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>
<title>Crear Procedimiento</title>
<script type="text/javascript" language="javascript">
    
    
    
    
    
    
    
    
    
    
    
    var  anchoPantalla=document.body.offsetWidth -200;
    
    
  $(function(){             
                  
    jQuery("#listcreacups").jqGrid({
   	url:'cups/cargacups.jsp?q=2',
	datatype: "json",
   	colNames:['Id','Cod Cups','Descripción','Cod aux1','Cod aux2','Tipo','Sexo','Quirurgico'],
   	colModel:[
                {name:'id',index:'id',hidden:true,width:60,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'cup_verdadero',index:'cup_verdadero', width:((anchoPantalla*8)/100),search:true, editable: true,required : true,editoptions: {maxlength: 10},editrules: { required: true },searchoptions:{sopt:['cn','eq']},align:"center"},
   		{name:'nom',index:'nom',  width:((anchoPantalla*61)/100),search:true, editable: true,required : true,editoptions: {maxlength: 300},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'cod_aux1',index:'cod_aux1', width:((anchoPantalla*7)/5),hidden:true,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'cod_aux2',index:'cod_aux2', width:((anchoPantalla*7)/5),hidden:true,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'tipo',index:'tipo', width:((anchoPantalla*9)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'sexo',index:'sexo', width:((anchoPantalla*9)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'quirur',index:'quirur', width:((anchoPantalla*9)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}}
   		],
   	rowNum:10,
   	rowList:[10,20,30,40,400],
   	pager: '#pagercreacups',
   	sortname: 'c.descripcion',
        viewrecords: true,
        sortorder: "asc",
        height: "auto",
        width:anchoPantalla,
        shrinkToFit: false,//columnas tamaÃ±o dato
           
        rownumbers: false,
        editurl: 'editaCli.php',
	caption: "CUPS",
	onSelectRow: function (id){       
                                   var lineap=jQuery("#listcreacups").jqGrid('getRowData',id);
                                   $("#cod_cup").val(""+lineap.cup_verdadero+"");
                                   $("#producto").val(""+lineap.nom+"");
                                   $( "#dialog_cups" ).dialog("close");
                                  }
});


jQuery("#listcreacups").jqGrid('navGrid','#pagercreacups',{add:false,edit:false,del:false,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);
            
jQuery('#listcreacups').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
    
$( "#dialog_cups" ).dialog({
      autoOpen: false,
      modal: true,
      dialogClass: 'no-close',
      width:""+(anchoPantalla+100)+"px",
      open: function(event, ui) {},
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1200
      }
    });    
 });
    
    
    
    
    
    
    
    
    
    
    
    
function cambia_cup(){
  var cambiarcup=document.getElementById("cod_cup").value;
  $("#divcup").load("cambia_cup.jsp?dato="+cambiarcup+"");
}
$('#formproced').submit(function() {
                           var vdes=document.getElementById("producto").value;
                           if(vdes == null || vdes =='CUP No Valido' ||/^\s+$/.test(vdes)){
                                                      alert('Codigo CUP no valido');
                                                       return false; 
                           }
                           var vcomprob_cup=document.getElementById("comprob_cup").value;
                           if(vcomprob_cup =='existe' ||/^\s+$/.test(vcomprob_cup)){
                                                      alert('El codigo CUP ya ha sido utilizado en otro procedimiento');
                                                       return false; 
                           }
                           var vcup = document.getElementById("cod_cup").value;  
                           if( vcup == null || vcup.length == 0 || /^\s+$/.test(vcup) ) {
                                                      alert('Codigo CUP es obligatorio');
                                                       return false;  
                                                                      } 
                           var vmap = document.getElementById("cod_mapipo").value;  
                           if( vmap == null || vmap.length == 0 || /^\s+$/.test(vmap) ) {
                                                      alert('Codigo Mapipo es obligatorio');
                                                       return false;  
                                                                      }
                           var vmapipo = document.getElementById("mapipo").value;               
                           if( vmapipo == null || vmapipo.length == 0 ||vmapipo.length > 198|| /^\s+$/.test(vmapipo) ) {
                                                      alert('No has descrito el procedimiento, o has sobrepasado el límite de caracteres (199)');
                                                       return false;  
                                                                      }  
                             
                           var vedadmin=document.getElementById("edadmin").value;
                           var vedadmin2=$("input[name='edadmin2']:checked").val();
                           if(vedadmin.length != 0 || /^\s+$/.test(vedadmin)){
                                    var comp = parseInt(vedadmin);
                                    if (isNaN(comp)) {
                                    alert('Edad minima no valida');
                                    return false;
                                    }
                                    else if(comp!=vedadmin || comp.toString()!=vedadmin.toString()){
                                    alert('Edad minima no valida');
                                    return false;
                                    }
                                    if(vedadmin2==0){
                                    alert('Debes escoger una unidad para Edad Minima');
                                    return false;
                                    }
                           }
                            else if(vedadmin.length == 0){
                               if(vedadmin2==1||vedadmin2==2||vedadmin2==3){
                                   alert('Debes escribir una Edad Minima');
                                   return false;
                               }
                           } 
                           
                           var vedadmax=document.getElementById("edadmax").value;
                           var vedadmax2=$("input[name='edadmax2']:checked").val();
                           if(vedadmax.length != 0 || /^\s+$/.test(vedadmax)){
                                    var comp2 = parseInt(vedadmax);
                                    if (isNaN(comp2)) {
                                    alert('Edad maxima no valida');
                                    return false;
                                    }
                                    else if(comp2!=vedadmax || comp2.toString()!=vedadmax.toString()){
                                    alert('Edad maxima no valida');
                                    return false;
                                    }
                                    if(vedadmax2==0){
                                    alert('Debes escoger una unidad para Edad Maxima');
                                    return false;
                                    }
                           }
                           else if(vedadmax.length == 0){
                               if(vedadmax2==1||vedadmax2==2||vedadmax2==3){
                                   alert('Debes escribir una Edad Maxima');
                                   return false;
                               }
                           }
                           $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              dataType: "json",
                              success: function(data) {;
                                 if(data.res==1){
                                            $("#cod_cup").val("");
                                            $("#producto").val("");
                                            $("#cod_mapipo").val("");
                                            $("#mapipo").val("");
                                            alert("Procedimiento creado con exito");
                                        }
                                 else{alert("Falla al crear procedimiento");}       
                              }
                          })
                          return false;
                      }); 
function vercups(){
    $( "#dialog_cups" ).dialog("open");
}

</script>
</head>
<body>
<div id="divconf" name="divconf"></div>
<form id="formproced" name="formproced" method="post" action="insertproced.jsp">
<table style="height:100%;width:80%;padding-top:5px" align="center">
<tbody valign="top">
<tr>
<td>
<fieldset><legend>Procedimiento</legend>
<table style="width:100%"  border="0">
<tr>
<td style="width:33%"  colspan="2">
<label for="codigo">Codigo CUP:</label>
</td>
<td style="width:66%" colspan="4">
<label>Nombre:</label>
</td>
</tr>
<!-----2da fila---->

<tr>
<td  colspan="2">
<input type="text" name="cod_cup" size="15" id="cod_cup" maxlength="30" onkeyup="cambia_cup();">
<input type="button" value="ver" onclick="vercups()">
</td>

<td colspan="4">
    <div id="divcup" name="divcup">
        <input type="text" name="producto" size="85%" id="producto" maxlength="400" readonly>
        <input type="text" name="comprob_cup" style="display: none" size="85%" id="comprob_cup" maxlength="400" readonly>
    </div>
</td>
</tr>
<!----------------------->
<tr>
<td style="width:33%"  colspan="2">
<label for="codigo">Codigo Mapipo:</label>
</td>
<td style="width:66%" colspan="4">
<label>Procedimiento</label>
</td>
</tr>
<!----------------------->
<tr>
<td  colspan="2">
<input type="text" name="cod_mapipo" size="15" id="cod_mapipo" maxlength="30">
</td>
<td colpasn="4">
    <input type="text" id="mapipo" name="mapipo" size="85%" maxlength="199">
</td>
</tr>
<!-----3ra fila---->
</table>

    <table style="height:100%;width:80%;padding-top:5px" align="center">
<tr>
<td style="width:16%">
<input type="checkbox" name="obstetrico" id="obstetrico">
<label>Obstetrico</label>
</td>
<td style="width:14%">
<input type="checkbox" name="pyp" id="pyp">
<label for="PyP">PyP</label>
</td>
<td style="width:16%">
<input type="checkbox" name="quirurjico" id="quirurjico">
<label for="quirurjico">Quirurjico</label>
</td>
<td style="width:22%">
<input type="checkbox" name="consulta1" id="consulta1">
<label for="consulta1">Consulta 1ra vez</label>
</td>
<td style="width:15%">
<input type="checkbox" name="consulta" id="consulta">
<label for="consulta">Consulta</label>
</td>
<td style="width:16%">
<input type="checkbox" name="servicio" id="servicio">
<label for="servicio">Servicio</label>
</td>
</tr>
</table>
</fieldset>
<fieldset><legend>Edad y Sexo</legend>
<table style="width:100%">
<tr>
<td style="width:16%">
<label>Sexo:</label>
</td>
<td >
<input type="radio" name="sexo" id="sexo" value="1">
<label>Masculino</label>
<input type="radio" name="sexo" id="sexo" value="2">
<label>Femenino</label>
<input type="radio" name="sexo" id="sexo" value="0" checked>
<label>Ambos</label>
</td>
<td rowspan="3">
<fieldset  style="width:70%">
<legend>Plan de Beneficios</legend>
<input type="radio" name="plan" id="plan" value="1" checked><label>   POS</label><br>
<input type="radio" name="plan" id="plan" value="2"><label>   POS_S</label><br>
<input type="radio" name="plan" id="plan" value="3"><label>   PAB</label><br>
<input type="radio" name="plan" id="plan" value="4"><label>   No Aplica</label>
</fieldset>
</td>

</tr>

<!---2da fila---->

<tr>
<td>
<label>Edad minima:</label>
</td>
<td>
<input type="text" name="edadmin" size="2" id="edadmin" maxlength="2">
<label>en: </label>
<input type="radio" id="edadmin2" name="edadmin2" value="0" style="display: none" checked>
<input type="radio" id="edadmin2" name="edadmin2" value="1"><label>semanas</label>
<input type="radio" id="edadmin2" name="edadmin2" value="2"><label>meses</label>
<input type="radio" id="edadmin2" name="edadmin2" value="3"><label>años</label>
</td>
</tr>

<!---3ra fila----->


<tr>
<td>
<label>Edad maxima:</label>
</td>
<td>
<input type="text" name="edadmax" size="2" id="edadmax" maxlength="3">
<label>en: </label>
<input type="radio" id="edadmax2" name="edadmax2" value="0" style="display: none" checked>
<input type="radio" id="edadmax2" name="edadmax2" value="1"><label>semanas</label>
<input type="radio" id="edadmax2" name="edadmax2" value="2"><label>meses</label>
<input type="radio" id="edadmax2" name="edadmax2" value="3"><label>años</label>
</td>
</tr>
</table>
</fieldset>

<br>

<fieldset>
<table style="width:100%">
<tr>
<td style="width:65%">
<label>Finalidad:</label>
</td>
<td style="width:35%">
<label>RIP adicional:</label>
</td>
</tr>

<tr>
<td>
<select name="finalidad" id="finalidad" style="width:85%"> 

     <%    
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb();
                       String sqlfina="select fn.idfinalidad, fn.descripcion from finalidad fn;";    
                       out.print(sqlfina);
                       ResultSet resufina=ba.consultas(sqlfina);
                       try{
                            while (resufina.next()&&resufina!=null) {   
                                       out.print("<option value='"+resufina.getString(1)+"'>"+resufina.getString(2)+"</option>");
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
         %>
</select>
</td>
<td>
<select name="rip_adicional" id="rip_adicional" style="width:85%">
    <%
                        String sqlrip="select ra.id_rip_adicional, ra.descripcion from rip_adicional ra;";    
                        out.print(sqlrip);
                        ResultSet resurip=ba.consultas(sqlrip);
                        try{
                            while (resurip.next()&&resurip!=null) {   
                                       out.print("<option value='"+resurip.getString(1)+"'>"+resurip.getString(2)+"</option>");
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
         %>
</select>
</td>
</tr>


<tr>
<td style="width:65%">
<label>Forma de Realizacion:</label>
</td>
<td style="width:35%">
<label>Tipo de Servicio:</label>
</td>
</tr>

<tr>
<td>
<select name="formarealizacion" id="formarealizacion" style="width:85%"> 
    <%
                        String sqlforma="select id_forma_realizacion, descripcion from forma_realizacion;";    
                        out.print(sqlforma);
                        ResultSet resuforma=ba.consultas(sqlforma);
                        try{
                            while (resuforma.next()&&resuforma!=null) {   
                                       out.print("<option value='"+resuforma.getString(1)+"'>"+resuforma.getString(2)+"</option>");
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                        
    %>
</select>
</td>
<td>
<select name="tiposervicio" id="tiposervicio" style="width:85%">
    <%
                        String sqltipo="select id_tipo_servicio, descripcion from tipo_servicio;";    
                        ResultSet resutipo=ba.consultas(sqltipo);
                        try{
                            while (resutipo.next()&&resutipo!=null) {   
                                       out.print("<option value='"+resutipo.getString(1)+"'>"+resutipo.getString(2)+"</option>");
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
     %>
</select>
</td>
</tr>



<tr>
<td style="width:65%">
<label>Concepto de Facturacion</label>
</td>
<td style="width:35%">
</td>
</tr>

<tr>
<td>
<select name="conceptofactu" id="conceptofactu" style="width:85%"> 
        <%
                        String sqlfactu="select id_concepto_facturacion, descripcion from concepto_facturacion;";    
                        out.print(sqlfactu);
                        ResultSet resufactu=ba.consultas(sqlfactu);
                        try{
                            while (resufactu.next()&&resufactu!=null) {   
                                       out.print("<option value='"+resufactu.getString(1)+"'>"+resufactu.getString(2)+"</option>");
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
         %>
</select>
</td>
<td>
</td>
</tr>
</table>
</fieldset>
</td>
</tr>
<tr>
<td style="text-align:right;width:70%">
<input type="submit" value="Guardar" name="aceptar" size="25" id="aceptar" maxlength="30"><br>
</td>
</tr>

</table>
</form>
<div id="resuproced" name="resuproced"></div>

<div id="dialog_cups">    
    <center> 
      <table id="listcreacups" ></table>
      <div id="pagercreacups"></div>
    </center>  
</div>

</body>
</html>
<% ba.cerrar(); %>