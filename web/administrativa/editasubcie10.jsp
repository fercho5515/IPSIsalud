
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8"/>
<title>Crear Medicamento</title>
<script type="text/javascript" language="javascript">
    var anchoPantalla=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
    
      jQuery("#listbuscasubcie10").jqGrid({
   	url:'busca_subcie10.jsp?q=2',
	datatype: "json",
   	colNames:['ID','Cie10','Descripcion','Cie10'],
   	colModel:[
                {name:'id',index:'id', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'cie10',index:'cie10', width:((anchoPantalla*9)/100),search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'subdi',index:'id_subcie10',width:((anchoPantalla*9)/100),editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'descripcion',index:'descripcion', width:((anchoPantalla*79)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		],
   	rowNum:11,
   	rowList:[10,20,30,40,400],
   	pager: '#pagerbuscasubcie10',
   	sortname: 'id_subcie10',//OJO AQUI
        viewrecords: true,
        sortorder: "asc",
        height: 150,
        width:anchoPantalla,
        shrinkToFit: false,//columnas tamaÃ±o dato
        grouping:true,         
        groupingView : {
   		groupField : ['cie10']
   	},   
        rownumbers: false,
        editurl: 'editaCli.php',
	caption: "Buscar diagnostico",
	onSelectRow: function (id){       
                                   var linea=jQuery("#listbuscasubcie10").jqGrid('getRowData',id);
                                   var linea2=""+linea.subdi;
                                   linea2=linea2.replace(/ /gi,'*');
                                   
                                   $("#div_datos_subcie10").load("cargar_subdiag.jsp?dato="+linea2+"");
                                  }	
});
jQuery("#listbuscasubcie10").jqGrid('navGrid','#pagerbuscasubcie10',{add:false,edit:false,del:false,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);
jQuery('#listbuscasubcie10').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
</script>
</head>
<body>
<table style="height:100%;width:80%;padding-top:5px" align="center">
<tbody valign="top">
<tr>
<td>
<center>
      <table id="listbuscasubcie10" ></table>
      <div id="pagerbuscasubcie10"></div>     
</center> 
</td>
</tr>
<tr><td><div id="div_datos_subcie10" name="div_datos_subcie10">
</div></td></tr>
</table>
</body>
</html>