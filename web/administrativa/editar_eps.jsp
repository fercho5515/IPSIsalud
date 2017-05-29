
<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>
<title>Crear Medicamento</title>
     
<script type="text/javascript" language="javascript">
      jQuery("#listbuscaeps").jqGrid({
   	url:'busca_eps.jsp?q=2',
	datatype: "json",
   	colNames:['id','Codigo','Nit','Nombre','Tipo'],
   	colModel:[
                {name:'id',index:'id', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'ideps',index:'ideps',width:80,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'nit',index:'nit', width:80,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'nombre',index:'nombre', width:380,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	        {name:'tipo',index:'tipo', width:130,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                ],
   	rowNum:11,
   	rowList:[10,20,30,40,400],
   	pager: '#pagerbuscaeps',
   	sortname: 'nombre',//OJO AQUI
        viewrecords: true,
        sortorder: "asc",
        height: 150,
        width:1025,
        shrinkToFit: false,//columnas tamaño dato
        
        rownumbers: false,
        editurl: 'editaCli.php',
	caption: "Buscar Medicamentos",
	onSelectRow: function (id){       
                                   var lineap=jQuery("#listbuscaeps").jqGrid('getRowData',id);
                                   var lineap2=""+lineap.ideps;
                                   lineap2=lineap2.replace(/ /gi,'*');
                                   
                                   $("#div_datos_eps").load("cargar_eps.jsp?dato="+lineap2+"");
                                  }	
});


jQuery("#listbuscaeps").jqGrid('navGrid','#pagerbuscaeps',{add:false,edit:false,del:false,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);
            
jQuery('#listbuscaeps').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
    
</script>
</head>

<body>
    <center>
       <table id="listbuscaeps" ></table>
        <div id="pagerbuscaeps"></div>     
</center> 
    <div id="div_datos_eps" name="div_datos_eps"></div>
</body>
</html>