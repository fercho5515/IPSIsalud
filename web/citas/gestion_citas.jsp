<%-- 
    Document   : gestion_citas
    Created on : 08/06/2017, 23:38:51
    Author     : Fercho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script type="text/javascript" language="javascript">
        var anchoPantalla =$(window).width();
        
        
        jQuery("#list_pacientes").jqGrid({
            url:'busca_pacientes.jsp?q=2',
            datatype: "json",
            colNames:['id','Identificacion','Primer Nombre','Segundo Nombre','Primer Apellido','Segundo Apellido'],
            colModel:[
                {name:'i',index:'i', width:(anchoPantalla*0.04),hidden:true,search:true,editable: false,required : false,editoptions:{maxlength: 50},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                {name:'id_person',index:'id_person', width:(anchoPantalla*0.08),search:true,editable: false,required : false,editoptions:{maxlength: 50},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                {name:'p_nom',index:'p_nom', width:(anchoPantalla*0.08),search:true, editable: true,required : true,editoptions: {maxlength: 50},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'s_nom',index:'s_nom', width:(anchoPantalla*0.08),search:true, editable: true,required : true,editoptions: {maxlength: 50},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'p_ape',index:'p_ape', width:(anchoPantalla*0.08),search:true, editable: true,required : true,editoptions: {maxlength: 50},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'s_ape',index:'s_ape', width:(anchoPantalla*0.08),search:true, editable: true,required : true,editoptions: {maxlength: 50},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
            ],
            
            rowNum:10,
            rowList:[15,30,45],
            pager: '#pager_pacientes',
            sortname: 'id_person',
            viewrecords: true,
            sortorder: "asc",
            height: 100,
            width:anchoPantalla*0.47,
            shrinkToFit: false,
            //            autowidth: true, 
            rownumbers: false,
//            editurl: "insert_cita.jsp?cod=3",
            caption: "Pacientes  ",
            onSelectRow: function(ids){
                
                var ret = jQuery("#list_pacientes").jqGrid('getRowData',ids);
//                var per = ret.p_nom+" "+ret.s_nom+" "+ret.p_ape+" "+ret.s_ape;
                var per =ret.id_person;
//                alert(per)ale;                               
                jQuery("#list_citas_gestion").jqGrid('setGridParam',{url:"carga_agenda_editar.jsp?q=1&id="+per,page:1});
                jQuery("#list_citas_gestion").jqGrid('setCaption',"Agenda del día"+ids)
                .trigger('reloadGrid'); 
            }
        });
        jQuery("#list_pacientes").jqGrid('navGrid','#pager_pacientes',{add:false,edit:false,del:false,search:true,view: true},
        {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true,urledit:"insert_cita.jsp?"},//opciones edit
        
        {closeAfterAdd: true, closeOnEscape: true,top:10,left:10},        //opciones add
        {}, //opciones del
        {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
        {width:anchoPantalla*0.30} //para el view
        );            
        jQuery('#list_pacientes').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});    
    
       
        jQuery("#list_citas_gestion").jqGrid({
            url:'carga_agenda_editar.jsp?q=2',
            datatype: "json",
            colNames:['id','Id agenda','Procedimiento','Fecha','ID estado','Estado'],
            colModel:[
                {name:'i',index:'i', width:(anchoPantalla*0.04),hidden:true,search:true,editable: false,required : false,editoptions:{maxlength: 50},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                {name:'id_agenda',index:'id_agenda', width:(anchoPantalla*0.04),search:true,editable: true,required : false,editoptions:{readonly:"readonly",maxlength: 50},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                {name:'descripcion',index:'descripcion', width:(anchoPantalla*0.20),search:true, editable: true,required : true,editoptions: {maxlength: 50,width:anchoPantalla*0.40},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'fecha',index:'fecha', width:(anchoPantalla*0.07),search:true, editable: true,required : true,editoptions: { size: 20, maxlengh: 10,
                dataInit: function(element) 
                         { $(element).datepicker({ dateFormat: 'yy/mm/dd',        constrainInput: false, showOn: 'button', buttonText: '...' });
                         } } ,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'id_estado',index:'id_estado', width:(anchoPantalla*0.05),hidden:false,search:true, editable: true,required : true,edittype:"select",editoptions:{value:"1:Programada;2:Cumplida;4:Inasistencia;5:Cancelada"},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'des',index:'des', width:(anchoPantalla*0.08),search:true, editable: false,required : true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
            
            ],
            rowNum:10,
            rowList:[15,30,45],
            pager: '#pager_citas_gestion',
            sortname: 'id_person',
            viewrecords: true,
            sortorder: "asc",
            height: 100,
            width:anchoPantalla*0.47,
            shrinkToFit: false,
            //            autowidth: true, 
            rownumbers: false,
            editurl: "editar_cita.jsp?cod=0",
            caption: "Agenda del Dia",
            onSelectRow: function(ids){
                 
            }
        });
        jQuery("#list_citas_gestion").jqGrid('navGrid','#pager_citas_gestion',{add:false,edit:true,del:false,search:true,view: true},
        {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true,urledit:"editar_cita.jsp?cod=0",width:anchoPantalla*0.40},//opciones edit
        
        {closeAfterAdd: true, closeOnEscape: true,top:10,left:10},        //opciones add
        {}, //opciones del
        {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
        {width:anchoPantalla*0.50} //para el view
        );
            
        jQuery('#list_citas_gestion').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
        
    </script>
    <body>
        <div>
            <div style="float: left">
                <table id="list_pacientes"></table>
                <div id="pager_pacientes"></div>
            </div>
            <div style="float: left;margin: 0 20px 0 20px">
                <table id="list_citas_gestion"></table>
                <div id="pager_citas_gestion"></div>
        </div>
        </div>
    </body>
</html>
