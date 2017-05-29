<%-- 
    Document   : renombrar_tarifario
    Created on : 21/05/2017, 18:13:05
    Author     : Fercho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" language="javascript">
            $("#list_renom_tarifario").jqGrid('GridUnload');
            $("#list_renom_tarifario").jqGrid('GridDestroy');
            jQuery("#list_renom_tarifario").jqGrid({
                url:'busca_renom_tarifarios.jsp?q=2',
                datatype: "json",
                colNames:['Id','Codigo','Nombre','Fecha','Activo'],
                colModel:[
                   {name:'id_tarifarios',index:'id_tarifarios',width:80,editable: true,required : true,editoptions: { readonly: "readonly",maxlength: 63 },editrules:{required: true}},
                    {name:'cod_tarifario',index:'cod_tarifario', width:80,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'nombre',index:'nombre', width:300,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'fecha_creacion',index:'fecha_creacion', width:120,search:true, editable: true,required : true,editoptions: {readonly: "readonly",maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
//                   {name:'activo',index:'activo', hidden:true,width:120,search:true, editable: true,required : true,sortable:true,edittype:"select",editoptions: {value:"1:Activo;0:Inactivo",maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq'],value: ' : ;1:Activo;0:inactivo'}},
                     {name:'activo',index:'activo', width:150,editrules:{edithidden:true},hidden:true,align:'left',search:false,sortable:true,editable:true,edittype:"select",editoptions:{value:"1:Activo;0:Inactivo"},searchoptions:{sopt:['cn','eq']}},
                ],
                rowNum:10,
                rowList:[15,30,45],
                pager: '#pager_renom_tarifario',
                sortname: 'id_tarifarios',
                viewrecords: true,
                sortorder: "asc",
                width: 700, 
                rownumbers: false,
                editurl: 'edit_renom_tarifarios.jsp',
                caption: "Medicamentos",
                onSelectRow: function (id_tarifarios){       
//                    var lineap=jQuery("#list_renom_tarifario").jqGrid('getRowData',id);
//                    var lineap2=""+lineap.id;
//                    lineap2=lineap2.replace(/ /gi,'*');
//                    $("#div_datos_tarimedic").load("mostrar_medic.jsp?dato="+lineap2+"");
//                    $( "#dialog_tarimedic" ).dialog( "close" );
                }

            });
            jQuery("#list_renom_tarifario").jqGrid('navGrid','#pager_renom_tarifario',{add:false,edit:true,del:true,search:true,view: true},
                {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true, 
                    afterSubmit: function (response,postdata) {
                        var result = jQuery.parseJSON(response.responseText); 
                        alert(result.msj);return [true,""];
                    },
                    errorTextFormat: function (response,postdata) {
                        var result = jQuery.parseJSON(response.responseText); 
                        alert(result.msj);return [true,""];
                    }
                },//opciones edit
                {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
                {closeAfterDel:false,width:300 
                    , afterSubmit: function (response,postdata) {
                        var result = jQuery.parseJSON(response.responseText); 
                        alert(result.msj);return [true,""];
                    },
                    errorTextFormat: function (response,postdata) {
                        var result = jQuery.parseJSON(response.responseText); 
                        alert(result.msj);return [true,""];
                    }
                },//opciones del 
                {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                {width:600} //para el view
            ); 
            jQuery('#list_renom_tarifario').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
    
        </script>

    </head>
    <body>
        <div>
            <table id="list_renom_tarifario" ></table>
            <div id="pager_renom_tarifario"></div>
        </div>
    </body>
</html>
