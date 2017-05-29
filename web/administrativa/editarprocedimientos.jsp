<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>
<title>Crear Procedimiento</title>

<style type="text/css">
	</style>
        
<script type="text/javascript" >
            
                  
    jQuery("#listeditapro").jqGrid({
   	url:'busca_proc.jsp?q=2',
	datatype: "json",
   	colNames:['Id','Cups','Mapipos','Descripcion'],
   	colModel:[
                {name:'id',index:'id',hidden:true,width:60,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'cod_cups',index:'cup_verdadero', width:80,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'codigo_maipos',index:'codigo_maipos', width:80,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'descripcion',index:'pt_descripcion', width:500,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	       ],
   	rowNum:10,
   	rowList:[10,20,30,40,400],
   	pager: '#pagereditapro',
   	sortname: 'cod_cups',
        viewrecords: true,
        sortorder: "asc",
        height: "auto",
        width:825,
       // shrinkToFit: false,//columnas tamaño dato
           
        rownumbers: false,
        editurl: 'editaCli.php',
	caption: "Buscar procedimientos",
	onSelectRow: function (id){       
                                   var lineap=jQuery("#listeditapro").jqGrid('getRowData',id);
                                   var lineap2=""+lineap.id;
                                   lineap2=lineap2.replace(/ /gi,'*');
                                   //alert(lineap2);
                                   $("#div_datos_proced").load("cargar_proced.jsp?dato="+lineap2+"");
                                  }
});


jQuery("#listeditapro").jqGrid('navGrid','#pagereditapro',{add:false,edit:false,del:false,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);
            
jQuery('#listeditapro').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
                           



</script>	

</head>

<body>
<center>
      <table id="listeditapro" ></table>
        <div id="pagereditapro"></div>     
</center>    
    
<div id="div_datos_proced" name="div_datos_proced">
</div>
<br>
</body>
</html>