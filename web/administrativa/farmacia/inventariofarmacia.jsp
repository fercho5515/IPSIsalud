<%-- 
    Document   : inventariofarmacia
--%>


    <% 
        request.setCharacterEncoding("UTF-8");
        if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
    %>
                <br><center><h1>Por favor ingrese adecuadamente</h1></center>
                <br><center><a href="/ISALUD/index.jsp">volver</a></center>
    <% 
        return;
        }
    %> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>
<title>Crear Medicamento</title>
     
<script type="text/javascript" language="javascript">
      jQuery("#listinventariofarmacia").jqGrid({
   	url:'farmacia/cargainventariofarmacia.jsp?q=2',
	datatype: "json",
   	colNames:['IDF','IDM','Cum','Atc','Nombre','Concentacion','Unidad de Medida','Forma Farmaceutica','Presentacion','existencias','fabricacion','vencimiento','codigo de barras','ubicacion','invima','laboratorio'],
   	colModel:[
                {name:'serial_inven',index:'serial_inven', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'serial',index:'serial', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'cum',index:'m_cum',width:80,hidden:true,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'atc',index:'atc', width:80,hidden:true,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'nombre',index:'m_producto', width:250,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	        {name:'concentracion',index:'m_concentracion', width:60,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'unidad',index:'um_descripcion', width:60,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'forma',index:'ff_descripcion', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'presentacion',index:'presentacion', width:150,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                
                {name:'existencias',index:'existencias', width:75,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'fecha_fab',index:'fecha_fab', width:60,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'fecha_ven',index:'fecha_ven', width:60,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'cod_barras',index:'cod_barras', width:60,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'ubicacion',index:'ubicacion', width:60,hidden:true,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'invima',index:'invima', width:50,hidden:true,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'nombre',index:'nombre', width:50,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}}
                
                 ],
   	rowNum:10,
   	rowList:[10,20,30,40,400],
   	pager: '#pagerinventariofarmacia',
   	sortname: 'm.serial',//OJO AQUI
        viewrecords: true,
        sortorder: "desc",
        height: 150,
        width:1025,
        shrinkToFit: false,//columnas tamaÃ±o dato
        
        rownumbers: false,
        editurl: 'editaCli.php',
	caption: "Medicamentos",
	onSelectRow: function (id){       
                               //    var lineap=jQuery("#listinventariofarmacia").jqGrid('getRowData',id);
                               //    var lineap2=""+lineap.id;
                               //    lineap2=lineap2.replace(/ /gi,'*');
                                   //alert(lineap2);
                               //    $("#div_datos_medic_inv").load("cargar_medic.jsp?dato="+lineap2+"");
                                  }	
});


jQuery("#listinventariofarmacia").jqGrid('navGrid','#pagerinventariofarmacia',{add:false,edit:false,del:false,search:true,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);
jQuery("#listinventariofarmacia").jqGrid('navButtonAdd','#pagerinventariofarmacia',{
    caption: "Columnas",
    title: "Columnas",
    onClickButton : function (){
        jQuery("#listinventariofarmacia").jqGrid('columnChooser');
    }
});

jQuery("#listinventariofarmacia").jqGrid('navButtonAdd','#pagerinventariofarmacia',
                                                            {
                                                             caption:"",
                                                             buttonicon:"ui-icon-pencil",
                                                             onClickButton:function(){ 
                                                                //  $( "#div-crea-sub" ).dialog( "open" );
                                                                 var id = jQuery("#listinventariofarmacia").jqGrid('getGridParam','selrow');
                                                                 if (id){
                                                                       var ret = jQuery("#listinventariofarmacia").jqGrid('getRowData',id);
                                                                       $("#editarinvfarmacia").load("farmacia/editarinventariofarmacia.jsp?dato="+ret.serial+"&datoo="+id);
                                                                 }
                                                                 else{alert("Seleccione Fila");}                                                              
                                                             },
                                                             position:"last",
                                                             title:"Editar",
                                                             cursor: "pointer"});  
            
jQuery('#listinventariofarmacia').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
  /*$(function(){
                $('#editarinvfarmacia').dialog({
                    autoOpen: false,
                    modal:true,
                    buttons: {
                        Ok: function() {
                            // $("#div_sesiones").load("cerrar_sesiones.jsp");
                            $( this ).dialog( "close" );
                        }
                    },
                    show:{
                        effect: "blind",
                        duration: 500
                    },
                    hide:{
                        effect: "explode",
                        duration: 500
                    },
                    width:'1020px'
                }); 
            });  */      
</script>
</head>

<body>
    <div style="max-height: 503px;overflow: auto">
        <br>
        <center>
               <table id="listinventariofarmacia" ></table>
               <div id="pagerinventariofarmacia"></div>     
        </center> 
        <div id="div_datos_medic_inv" name="div_datos_medic_inv"></div>    
        <div id="editarinvfarmacia" title="Editar Medicamento Inventario"></div>
    </div>
</body>
</html>
