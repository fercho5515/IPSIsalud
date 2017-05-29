<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>
<title>Crear Medicamento</title>
     
<script type="text/javascript" language="javascript">
      jQuery("#listbuscamed").jqGrid({
   	url:'busca_medicamento.jsp?q=2',
	datatype: "json",
   	colNames:['ID','Cum','Atc','Nombre','Concentacion','Unidad de Medida','Forma Farmaceutica','Presentacion'],
   	colModel:[
                {name:'id',index:'id', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'cum',index:'m_cum',width:80,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'titular',index:'atc', width:80,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'nombre',index:'m_producto', width:300,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	        {name:'concentracion',index:'m_concentracion', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'unidad',index:'um_descripcion', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'forma',index:'ff_descripcion', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'presentacion',index:'presentacion', width:150,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    
     ],
   	rowNum:11,
   	rowList:[10,20,30,40,400],
   	pager: '#pagerbuscamed',
   	sortname: 'm.serial',//OJO AQUI
        viewrecords: true,
        sortorder: "desc",
        height: 150,
        width:1025,
        shrinkToFit: false,//columnas tamaño dato
        
        rownumbers: false,
        editurl: 'editaCli.php',
	caption: "Buscar empleado",
	onSelectRow: function (id){       
                                   var lineap=jQuery("#listbuscamed").jqGrid('getRowData',id);
                                   var lineap2=""+lineap.id;
                                   lineap2=lineap2.replace(/ /gi,'*');
                                   //alert(lineap2);
                                   $("#div_datos_medic").load("cargar_medic.jsp?dato="+lineap2+"");
                                  }	
});


jQuery("#listbuscamed").jqGrid('navGrid','#pagerbuscamed',{add:false,edit:false,del:false,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);
            
jQuery('#listbuscamed').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
    
</script>
</head>

<body>
    <center>
       <table id="listbuscamed" ></table>
        <div id="pagerbuscamed"></div>     
</center> 
    <div id="div_datos_medic" name="div_datos_medic"></div>
</body>
</html>