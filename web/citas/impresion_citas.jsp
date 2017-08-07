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
        
        $(function(){
            $("#fecha_agenda").datepicker({
                //inline:true
                showOn:'both',
                buttonImageOnly:true,
                buttonImage:'../imagenes/fotos/calendar.gif',
                firstDay:1,
                changeMonth:true,
                changeYear:true
            });	
            $('#fecha_agenda').datepicker($.datepicker.regional['es']);
            $('#fecha_agenda').datepicker("option","showAnim","slideDown");
            $('#fecha_agenda').datepicker("option","dateFormat","yy-mm-dd");
        });
        function cargar_agenda(){
            
            
//            var cd_mask = jQuery("#id_citas").val();
            var dia = jQuery("#fecha_agenda").val();
            alert(dia);
            jQuery("#list_agenda_dia").jqGrid('setGridParam',{url:"busca_agenda_dia.jsp?&dia="+dia}).trigger("reloadGrid");
            
            
//            var varcambia_dia=document.getElementById("2cambia_dia").value;
//            var varid_perso=document.getElementById("id_citas").value;
//            var contra=document.getElementById("contra").value;
//            $("#carga_servicios").load("carga_servicios2.jsp?dato="+varcambia_dia+"&dato2="+varid_perso+"&dato3="+contra+"")
        }
        var anchoPantalla =$(window).width();
        
        
        jQuery("#list_agenda_dia").jqGrid({
            url:'busca_agenda_dia.jsp?dia=0',
            datatype: "json",
            colNames:['id','Identificacion','Primer Nombre','Segundo Nombre','Primer Apellido','Segundo Apellido','','Imprimir'],
            colModel:[
                {name:'i',index:'i', width:(anchoPantalla*0.04),hidden:false,search:true,editable: false,required : false,editoptions:{maxlength: 50},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                {name:'id_medico',index:'id_medico', width:(anchoPantalla*0.08),search:true,editable: false,required : false,editoptions:{maxlength: 50},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                {name:'p_nom',index:'p_nom', width:(anchoPantalla*0.08),search:true, editable: true,required : true,editoptions: {maxlength: 50},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'s_nom',index:'s_nom', width:(anchoPantalla*0.08),search:true, editable: true,required : true,editoptions: {maxlength: 50},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'p_ape',index:'p_ape', width:(anchoPantalla*0.08),search:true, editable: true,required : true,editoptions: {maxlength: 50},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'s_ape',index:'s_ape', width:(anchoPantalla*0.08),search:true, editable: true,required : true,editoptions: {maxlength: 50},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'id_permiso',index:'id_permiso', width:(anchoPantalla*0.08),search:true,editable: false,required : false,editoptions:{maxlength: 50},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                {name:'imprimir',index:'imprimir', width:(anchoPantalla*0.08),search:true, editable: true,required : true,editoptions: {maxlength: 50},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
            ],
            gridComplete: function ()
            {
                var ids = jQuery("#list_agenda_dia").jqGrid('getDataIDs');
                for (var i = 0; i < ids.length; i++)
                {
//                    var ret = jQuery("#list_agenda_dia").jqGrid('getRowData',i+1);
//                    var id_medico = ret.id_medico;
                    var fecha =$('#fecha_agenda').val();
//                    ret.id_person;
                    
                    var cl = ids[i];
                    var ret = jQuery("#list_agenda_dia").jqGrid('getRowData',ids[i]);
                    var id_medico = ret.id_medico;
                    var id_permiso= ret.id_permiso;
                    be = "<a style='height:22px;width:75px;color: red'  id='aceptar' target='_blank' value='Atendida' href='../reportes/reporte_citas/lista.jsp?fecha="+fecha+"&medico="+id_medico+"&permiso="+id_permiso+"'>Imprimir</a>";
                    jQuery("#list_agenda_dia").jqGrid('setRowData', ids[i], { imprimir: be });
                }
            },
            rowNum:10,
            rowList:[15,30,45],
            pager: '#pager_agenda_dia',
            sortname: 'id_medico',
            viewrecords: true,
            sortorder: "asc",
            height: 100,
            width:anchoPantalla*0.6,
            shrinkToFit: false,
            //            autowidth: true, 
            rownumbers: false,
//            editurl: "insert_cita.jsp?cod=3",
            caption: "Progesionales Agenda",
            ondblClickRow: function(cedula_nit){
                cedula_nit=cedula_nit.replace(" ","_");
                NuevoCaso2(""+cedula_nit+"");  
            }
        });
        jQuery("#list_agenda_dia").jqGrid('navGrid','#pager_agenda_dia',{add:false,edit:false,del:false,search:true,view: true},
        {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true,urledit:"insert_cita.jsp?"},//opciones edit
        
        {closeAfterAdd: true, closeOnEscape: true,top:10,left:10},        //opciones add
        {}, //opciones del
        {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
        {width:anchoPantalla*0.30} //para el view
        );
            
        jQuery('#list_agenda_dia').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});    
    </script>
    <body>
        <div>    
            <table id="list_agenda_dia"></table>
            <div id="pager_agenda_dia"></div>
        </div>
        <div>  
            <table>
            <td colspan="2">
                <label>Dia:</label>
            </td>
            <td colspan="2">
                <div id="cambia_dia" name="cambia_dia">
                    <input type="text" name="fecha_agenda" id="fecha_agenda" readonly onchange="cargar_agenda()">&nbsp;
                <!--<select name="fecha_agenda"  id="fecha_agenda" style="width: 150px" ></select>-->
                </div>
            </td>
                                <!--<td><input type="button" value="Cargar Servicios" onclick="cargar_agenda();"></td>-->
            <td></td>
            </table>
        </div>
    </body>
</html>
