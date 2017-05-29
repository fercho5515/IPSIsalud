$(document).ready(function(){
			jQuery("#list10").jqGrid({
			url:'server.php?q=2',
			datatype: "json",
			colNames:['CEDULA','PRIMER NOMBRE','SEGUNDO NOMBRE', 'PRIMER APELLIDO','SEGUNDO APELLIDO', 'TELEFONO','CELULAR','DIRECCION','EMPRESA','EMAIL'],
			colModel:[
				{name:'cedula_nit',index:'cedula_nit', width:55,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true, edithidden:true },searchoptions:{sopt:['cn','eq']}},
				{name:'primer_nombre',index:'primer_nombre', width:90,search:true,editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true }, searchoptions:{sopt:['cn','eq']}},
				{name:'segundo_nombre', index:'segundo_nombre', width: 40, align: 'left', editable: true,editrules: { edithidden: true }, hidden: true,editoptions: {maxlength: 43}, searchoptions:{sopt:['cn','eq']} },
				{name:'primer_apellido',index:'primer_apellido', width:100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true }, searchoptions:{sopt:['cn','eq']}},
				{name:'segundo_apellido', index:'segundo_apellido', width: 40, align: 'left', editable: true, editrules: { edithidden: true }, hidden: true,editoptions: {maxlength: 43}, searchoptions:{sopt:['cn','eq']} },
				{name:'telefono',index:'telefono', width:60, align:"right",search:true, editable: true,editoptions: {maxlength: 43}, searchoptions:{sopt:['cn','eq']}},
				{name:'celular',index:'celular', width:60, align:"right",search:true, editable: true,editoptions: {maxlength: 43},editrules: { }, searchoptions:{sopt:['cn','eq']}},		
				{name:'direccion',index:'direccion', width:140,align:"right",search:true, editable: true,editoptions: {maxlength: 43},editrules: { }, searchoptions:{sopt:['cn','eq']}},		
				{name:'nombre_empresa',index:'nombre_empresa', width:140, sortable:false,search:true, editable: true,editoptions: {maxlength: 43}, searchoptions:{sopt:['cn','eq']}},
				{name:'email', index:'email', width: 40, align: 'left', editable: true, editrules: { edithidden: true }, hidden: true,editoptions: {maxlength: 43}, searchoptions:{sopt:['cn','eq']} }
			],
			rowNum:7,
			rowList:[7,15,20,30,40],
			pager: '#pager10',
			sortname: 'cedula_nit',
			viewrecords: true,
			sortorder: "desc",
			height: 160,
			//multiselect: false,
			//loadonce: true,
			autowidth: true, 
			rownumbers: true,
			editurl: 'editaCli.php',
			caption: "LISTADO DE CLIENTES",
			ondblClickRow: function(cedula_nit){
										       cedula_nit=cedula_nit.replace(" ","_");
	                                           $("#contenido").load("clientcaso.php?cedula="+cedula_nit+"");
										 }
	});
});


function regresardetallecli(id)
{
      document.cookie ='identificador='+id+'; expires=Thu, 2 Aug 2421 20:47:11 UTC; path=/';
	  document.cookie ='tipo=busqueda; expires=Thu, 2 Aug 2421 20:47:11 UTC; path=/';
	  document .cookie='casilla=cli; expires=Thu, 2 Aug 2421 20:47:11 UTC; path=/';
      location.href='contenedor.php';  
}