<%-- 
    Document   : formulas_anteriores
    Created on : 02-mar-2013, 15:07:20
    Author     : Fercho
--%>

<!doctype html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" language="javascript">

         $(document).ready(function(){
             jQuery("#listformulas").jqGrid({
   	url:'server.php?q=2',
	datatype: "json",
   	colNames:['Fecha','Especialidad',],
   	colModel:[
   		{name:'parte',index:'parte', width:50,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'afectacion',index:'afectacion', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		],
   	rowNum:15,
   	rowList:[15,30,45],
   	pager: '#pagerformulas',
   	sortname: 'cedula_nit',
    viewrecords: true,
    sortorder: "desc",
	//multiselect: false,
	////loadonce: true,
	//height: 'auto',
	//height: 190,
	//height: 'auto',
    autowidth: true, 
    rownumbers: false,
    editurl: 'editaCli.php',
	caption: "",
	ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
	                                     NuevoCaso2(""+cedula_nit+"");  }
	
});
jQuery("#listformulas").jqGrid('navGrid','#pagerformulas',{add:false,edit:false,del:false,search:true,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 								);
/* 								
$("#pager10").click(function(){
	var gr = jQuery("#list10").getGridParam('selrow');
	if( gr != null ) jQuery("#list10").editGridRow(gr,{height:280,reloadAfterSubmit:false});
	else alert("Por Favor Seleccione Un Usuario");
});
*/

 });
</script>        

        <title>JSP Page</title>
    </head>
    <body>
        <table style="width: 60%" align="center">
            <tr>
                <td style="width:30%"></td>
                <td style="width:40%"><h2>Formulas Anteriores</h2></td>
                <td style="width:30%"></td>
            </tr>
            <tr>
                <td align="right"><label>Digite Id:</label></td>
                <td><input type="text" style="width:90%"></td>
                <td align="left"><input type="submit" value="Buscar"></td>
            </tr>
            
            <tr>
            <td colspan="3">
            <table id="listformulas" ></table>
			<div id="pagerformula"></div> 
            </td>
            </tr>
         </table>
         <table  style="width: 50%" align="center">
         
         <tr>
         <td><h2>Medicamento</h2></td>
         <td><h2>Cantidad</h2></td>
         <td><h2>Posología</h2></td>
         <td><h2>Entrega</h2></td>
         </tr>
         
         <tr>
         <td>
         <label>ACETAMINOFEN 500 mg</label>
         </td>
         <td align="center"><label>25</label></td>
         <td><label>una cada 8 horas</label></td>
         <td align="center"><input type="checkbox"></td>
         </tr>
         
         <tr>
         <td>
         <label>ABACAVIR 200 mg/ml</label>
         </td>
         <td  align="center"><label>20</label></td>
         <td><label>una cada 6 horas</label></td>
         <td align="center"><input type="checkbox"></td>
         </tr>
				
         <tr>
         <td colspan="4" align="center"><input type="submit" value="Guardar"></td>
         </tr>
         </table>
        
        
        
    </body>
</html>
