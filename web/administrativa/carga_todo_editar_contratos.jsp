<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">

        <style type="text/css">

            #mase:hover{
                background-color:#3baae3;
                cursor:pointer;
                border-radius: 10px;
            }
        </style>
        <script type="text/javascript" language="javascript">
                
       
            
          
            
            
            var anchoPantalla=document.body.offsetWidth -((document.body.offsetWidth*24)/100);  
       
            function agregar_pacicont(){
                var ced= document.getElementById("cedula").value; 
                $("#div_inspacicont").load("insert_paci_cont.jsp?dato="+ced+"");
                setTimeout ('recargapac()',500);       
            };
           
            function agregar_pacipaq(){
                var ced= document.getElementById("cedulapaq").value; 
                $("#div_inspacipaq").load("insert_paci_paq.jsp?dato="+ced+"");
                setTimeout ('recargapacpaq()',500);       
            };
           
            function agregar_procont(){
                $( "#dialog_btariproced" ).dialog( "open" );
                
            }
            function agregar_propaq(){
                $( "#dialog_proc_paq" ).dialog( "open" );
               
            }
            function agregar_medicpaq(){
                $( "#dialog_med_paq" ).dialog( "open" );
               
            }
            function agregar_medicont(){
                $( "#dialog_med_cont" ).dialog( "open" );
               
            }
            function recargapac(){
                jQuery("#listPacicont").jqGrid('setCaption',"Pacientes Activos Paquete").trigger('reloadGrid');
            };
            function recargapacpaq(){
                jQuery("#listPaci").jqGrid('setCaption',"Pacientes Activos Paquete").trigger('reloadGrid');
            };           
            function recargaprocedcont(){
                jQuery("#listProccont").jqGrid('setCaption',"Actividades Contratadas Contrato").trigger('reloadGrid');
            };
            function recargaprocedpaq(){
                jQuery("#listProc").jqGrid('setCaption',"Actividades Cotratadas Paquete").trigger('reloadGrid');
            };             
            function recargamedpaq(){
                jQuery("#listMed").jqGrid('setCaption',"Medicamentos Contratados Paquete").trigger('reloadGrid');
            };             
            function recargamedcont(){
                jQuery("#listMedcont").jqGrid('setCaption',"Medicamentos Contratados").trigger('reloadGrid');
            };           
            $(function(){
                $('#dialog_btariproced').dialog({
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
                    width:'720px'
                }); 
            });     
       
            $(function(){
                $('#dialog_proc_paq').dialog({
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
                    width:'720px'
                }); 
            });
       
            $(function(){
                $('#dialog_med_paq').dialog({
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
            });
       
            $(function(){
                $('#dialog_med_cont').dialog({
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
            });

            $("#list_btariproced").jqGrid('GridUnload');
            $("#list_btariproced").jqGrid('GridDestroy');
            jQuery("#list_btariproced").jqGrid({
                url:'busca_proced2.jsp?q=2',
                datatype: "json",
                colNames:['id','id_tari','id_proced','Cup','Mapipo','Nombre','Tarifario','Precio'],
                colModel:[
                    {name:'id',index:'id', width:10,hidden:true,search:true,editable: false,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'id_tari',index:'id_tari', width:10,hidden:true,search:true,editable: false,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'id_proced',index:'id_proced', width:10,hidden:true,search:true,editable: false,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'cup_verdadero',index:'cup_verdadero', width:20,search:true,editable: false,required : true,editoptions:{maxlength: 40},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'codigo_maipos',index:'codigo_maipos', width:20,search:true,editable: false,required : true,editoptions:{maxlength: 40},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'d1',index:'pt_descripcion', width:20,search:true,editable: false,required : true,editoptions:{maxlength: 40},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'n1',index:'t_nombre', width:20,search:true,editable: false,required : true,editoptions:{maxlength: 40},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'precio',index:'precio', width:20,search:true, editable: false,required : true,editoptions: {maxlength: 40},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                ],
                rowNum:10,
                rowList:[15,30,45],
                pager: '#pager_btariproced',
                sortname: 'cup_verdadero',
                viewrecords: true,
                sortorder: "asc",
                width: 700, 
                rownumbers: false,
                editurl: 'editaCli.php',
                caption: "Procedimientos Para Contrato",
                onSelectRow: function (id)
                {   
                    var lineap=jQuery("#list_btariproced").jqGrid('getRowData',id);
                    var lineap2=""+lineap.id_tari;
                    var lineap3=""+lineap.id_proced;
                    //lineap2=lineap2.replace(/ /gi,'*');
                    //alert(lineap2);
                    //alert(lineap3);
                    $("#div_datos_tariproced2").load("mostrar_proced2.jsp?dato="+lineap2+"&&dato2="+lineap3+"");
                    $( "#dialog_btariproced" ).dialog( "close" );
                    setTimeout ('recargaprocedcont()',500);
                }
            });

            jQuery("#list_btariproced").jqGrid('navGrid','#pager_btariproced',{add:false,edit:false,del:false,search:true,view: true},
            {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
            {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
            {}, //opciones del
            {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
            {width:60} //para el view
        );
            jQuery('#list_btariproced').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});


            $("#list_btariproced2").jqGrid('GridUnload');
            $("#list_btariproced2").jqGrid('GridDestroy');
            jQuery("#list_btariproced2").jqGrid({
                url:'busca_proced2.jsp?q=2',
                datatype: "json",
                colNames:['id','id_tari','id_proced','Cup','Mapipo','Nombre','Tarifario','Precio'],
                colModel:[
                    {name:'id',index:'id', width:10,hidden:true,search:true,editable: false,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'id_tari',index:'id_tari', width:10,hidden:true,search:true,editable: false,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'id_proced',index:'id_proced', width:10,hidden:true,search:true,editable: false,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'cup_verdadero',index:'cup_verdadero', width:20,search:true,editable: false,required : true,editoptions:{maxlength: 40},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'codigo_maipos',index:'codigo_maipos', width:20,search:true,editable: false,required : true,editoptions:{maxlength: 40},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'d1',index:'pt_descripcion', width:20,search:true,editable: false,required : true,editoptions:{maxlength: 40},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'n1',index:'t_nombre', width:20,search:true,editable: false,required : true,editoptions:{maxlength: 40},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'precio',index:'precio', width:20,search:true, editable: false,required : true,editoptions: {maxlength: 40},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                ],
                rowNum:10,
                rowList:[15,30,45],
                pager: '#pager_btariproced2',
                sortname: 'cup_verdadero',
                viewrecords: true,
                sortorder: "asc",
                width: 700, 
                rownumbers: false,
                editurl: 'editaCli.php',
                caption: "Procedimientos Para Paquete",
                onSelectRow: function (id){   
                    var lineap=jQuery("#list_btariproced2").jqGrid('getRowData',id);
                    var lineap2=""+lineap.id_tari;
                    var lineap3=""+lineap.id_proced;
                    //lineap2=lineap2.replace(/ /gi,'*');
                    //alert(lineap2);
                    //alert(lineap3);
                    $("#div_datos_tariproced3").load("mostrar_proced3.jsp?dato="+lineap2+"&&dato2="+lineap3+"");
                    $( "#dialog_proc_paq" ).dialog( "close" );
                }
            });

            jQuery("#list_btariproced2").jqGrid('navGrid','#pager_btariproced2',{add:false,edit:false,del:false,search:true,view: true},
            {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
            {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
            {}, //opciones del
            {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
            {width:60} //para el view
        );
            jQuery('#list_btariproced2').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});

            
                $("#list_medicamentos").jqGrid('GridUnload');
                $("#list_medicamentos").jqGrid('GridDestroy');
            jQuery("#list_medicamentos").jqGrid({
                url:'busca_medic_tari.jsp?q=2',
                datatype: "json",
                colNames:['ID','Cum','Atc','Nombre','Concentacion','Unidad de Medida','Forma Farmaceutica','Presentacion','Precio','Laboratorio','Tarifario','idtari','idmed','idlab'],
                colModel:[
                    {name:'id',index:'id', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'cum',index:'m_cum',width:50,editable: false,required : true,editoptions:{maxlength: 63}},
                    {name:'atc',index:'atc', width:50,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'nombre',index:'m_producto', width:250,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'concentracion',index:'m_concentracion', width:100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'unidad',index:'um_descripcion', width:100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'forma',index:'ff_descripcion', width:100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'presentacion',index:'presentacion', width:100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'precio',index:'precio', width:50,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'laboratorio',index:'laboratorio', width:100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'tarifario',index:'tarifario', width:50,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'id_tari',index:'id_tari', width:0,hidden:true,search:false,editable: false,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'id_med',index:'id_med', width:0,hidden:true,search:false,editable: false,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'id_lab',index:'id_lab', width:0,hidden:true,search:false,editable: false,editrules: { required: true },searchoptions:{sopt:['cn','eq']}}
                   ],
                rowNum:10,
                rowList:[15,30,45],
                pager: '#pager_medicamentos',
                sortname: 'cum',
                viewrecords: true,
                sortorder: "asc",
                width: 1000, 
                shrinkToFit: false,
                rownumbers: false,
                editurl: 'editaCli.php',
                caption: "Medicamentos Para Paquete",
                onSelectRow: function (id){   
                    var lineap=jQuery("#list_medicamentos").jqGrid('getRowData',id);
                    var lineap1=""+lineap.id_tari;
                    var lineap2=""+lineap.id_med;
                    var lineap3=""+lineap.id_lab;
                    //lineap2=lineap2.replace(/ /gi,'*');
                    //alert(lineap3);
                    //alert(lineap2);
                    $("#div_medicamentos_paquete").load("mostrar_medicamentos.jsp?dato="+lineap1+"&dato2="+lineap2+"&dato3="+lineap3);
                    $( "#dialog_med_paq" ).dialog( "close" );
                }
            });

            jQuery("#list_medicamentos").jqGrid('navGrid','#pager_medicamentos',{add:false,edit:false,del:false,search:true,view: true},
            {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
            {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
            {}, //opciones del
            {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
            {width:60} //para el view
        );
            jQuery('#list_medicamentos').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});



            $("#list_medicamentos2").jqGrid('GridUnload');
            $("#list_medicamentos2").jqGrid('GridDestroy');
            jQuery("#list_medicamentos2").jqGrid({
                url:'busca_medic_tari2.jsp?q=2',
                datatype: "json",
                colNames:['ID','ser','tar','labo','Cum','Atc','Nombre','Concentacion','Unidad de Medida','Forma Farmaceutica','Presentacion','Precio','Laboratorio','Tarifario'],
                colModel:[
                    {name:'id',index:'id', width:15,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'serial',index:'serial', width:15,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'tarif',index:'tarif', width:15,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'labo',index:'labo', width:15,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'cum',index:'m_cum',width:50,editable: false,required : true,editoptions:{maxlength: 63}},
                    {name:'atc',index:'atc', width:50,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'nombre',index:'m_producto', width:250,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'concentracion',index:'m_concentracion', width:100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'unidad',index:'um_descripcion', width:100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'forma',index:'ff_descripcion', width:100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'presentacion',index:'presentacion', width:100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'precio',index:'precio', width:50,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'laboratorio',index:'laboratorio', width:100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'tarifario',index:'tarifario', width:50,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                ],
                rowNum:10,
                rowList:[15,30,45],
                pager: '#pager_medicamentos2',
                sortname: 'cum',
                viewrecords: true,
                sortorder: "asc",
                width: 1000, 
                shrinkToFit: false,
                rownumbers: false,
                editurl: 'editaCli.php',
                caption: "Medicamentos Para Paquete",
                onSelectRow: function (id){   
                    var lineap=jQuery("#list_medicamentos2").jqGrid('getRowData',id);
                    var lineap2=""+lineap.serial;
                    var lineap3=""+lineap.tarif;
                    var lineap4=""+lineap.labo;
                    //lineap2=lineap2.replace(/ /gi,'*');
                    //alert(lineap3);
                    //alert(lineap2);
                    $("#div_medicamentos_contrato").load("mostrar_medicamentos2.jsp?med="+lineap2+"&&tarif="+lineap3+"&&labo="+lineap4+"");
                    $( "#dialog_med_cont" ).dialog( "close" );
                }
            });

            jQuery("#list_medicamentos2").jqGrid('navGrid','#pager_medicamentos2',{add:false,edit:false,del:false,search:true,view: true},
            {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
            {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
            {}, //opciones del
            {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
            {width:60} //para el view
        );
            jQuery('#list_medicamentos2').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});



            function cargapac(idpaq){//alert("ncom "+com);
                $("#div_sesion_paq").load("sesion_paq.jsp?pcod="+idpaq);
                setTimeout ('recargapacpaq()',500);
                setTimeout ('recargaprocedpaq()',500);
                setTimeout ('recargamedpaq()',500);
            }
  
            
            function ponefecha(dato1,dato2){
                $("#fcontratod").val(dato1); 
                $("#fcontratoh").val(dato2);   
            }
 
            $('#form_nuevo_pac').submit(function() {
       
                var ncont= document.getElementById("paquete_pac").value;               
                if( ncont == null || ncont.length == 0 || /^\s+$/.test(ncont) ) {
                    alert('Nombre del paquete es obligatorio');
                    return false;  
                } 
       
                var noco= document.getElementById("valor_pac").value;               
                if( noco == null || noco.length == 0 || /^\s+$/.test(noco) ) {
                    alert('Valor del paquete es obligatorio');
                    return false;  
                }
                else{
                    var ree = /^(-)?[0-9]*$/;
                    if (!ree.test(noco)){//si la conversion NO fue realizada con exito
                        alert('Valor del paquete debe ser entero');
                        document.getElementById('valor_pac').value="";
                        return false;  
                    }
                }                                           
                           
                                    
                // Enviamos el formulario usando AJAX
                  
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                              
                    success: function(data) {
                        $('#carga_paquetes').html(data);    
                        $.modal.close(); 
                    }                             
                })  
                     
                return false;
            });   
 
            $(document).ready(function(){
                $("#listProc").jqGrid('GridUnload');
                $("#listProc").jqGrid('GridDestroy');
                jQuery("#listProc").jqGrid({
                    url:'cargar_proced_paq.jsp?q=2',
                    datatype: "json",
                    colNames:['id','CUP','Mapipo','Nombre','Tarifario','Tiempo Meses','Cantidad'],
                    colModel:[
                        {name:'id',index:'id', width:80,search:true,editable: true,hidden:true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'cup_verdadero',index:'cup_verdadero', width:80,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'codigo_maipos',index:'codigo_maipos', width:80,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'nombre',index:'pt_descripcion', width:400,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'tarifario',index:'t_nombre', width:200,search:true, editable: true,required : true,editoptions: {maxlength: 400},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'precio',index:'tiempo_mesese', width:150,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'porcentaje',index:'cantidad', width:100,search:true, editable: true,required : true,editoptions: {maxlength: 400},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    ],
                    rowNum:15,
                    rowList:[15,30,45],

                    pager: '#pagerProc',
                    sortname: 'cup_verdadero',
                    rownumbers: false,
                    viewrecords: true,
                    sortorder: "desc",
                    multiselect: false,
                    loadonce: false,
                    //height: 'auto',
                    height: 175,
                    altRows:true,
                    autoheight:true,
                    autowidth: true, 
                    rownumbers: false,
                    editurl: 'editaCli.php',
                    caption: "Actividades Contratadas Paquete",	
                    ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
                        NuevoCaso2(""+cedula_nit+"");  }
	
                });
                jQuery("#listProc").jqGrid('navGrid','#pagerProc',{add:false,edit:false,del:false,search:true,view: true},
                {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
                {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
                {}, //opciones del
                {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                {width:60} //para el view
            );
            })

            $(document).ready(function(){
                $("#listMed").jqGrid('GridUnload');
                $("#listMed").jqGrid('GridDestroy');
                jQuery("#listMed").jqGrid({
                    url:'cargar_medic_paquete.jsp?q=2',
                    datatype: "json",
                    colNames:['ID','Cum','Atc','Nombre','Concentacion','Unidad de Medida','Forma Farmaceutica','Presentacion','Laboratorio'],
                    colModel:[
                        {name:'id',index:'id', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'cum',index:'m_cum',width:80,editable: false,required : true,editoptions:{maxlength: 63}},
                        {name:'atc',index:'atc', width:80,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'nombre',index:'m_producto', width:300,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'concentracion',index:'m_concentracion', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'unidad',index:'um_descripcion', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'forma',index:'ff_descripcion', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'presentacion',index:'presentacion', width:150,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'laboratorio',index:'laboratorio', width:90,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    
                    ],
                    rowNum:15,
                    rowList:[15,30,45],

                    pager: '#pagerMed',
                    sortname: 'm.cod_atc',
                    rownumbers: false,
                    viewrecords: true,
                    sortorder: "asc",
                    multiselect: false,
                    loadonce: false,
                    height: 'auto',
                    //height: 175,
                    altRows:true,
                    autoheight:true,
                    autowidth: true, 
                    rownumbers: false,
                    
                    editurl: 'editaCli.php',
                    caption: "Medicamentos Contratados Paquete",	
                    ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
                        NuevoCaso2(""+cedula_nit+"");  }
	
                });
                jQuery("#listMed").jqGrid('navGrid','#pagerMed',{add:false,edit:false,del:false,search:true,view: true},
                {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
                {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
                {}, //opciones del
                {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                {width:60} //para el view
            );
            });

            $(document).ready(function(){
                $("#listPaci").jqGrid('GridUnload');
                $("#listPaci").jqGrid('GridDestroy');
                jQuery("#listPaci").jqGrid({
                    url:'cargar_pacientes_paquete.jsp?q=2',
                    datatype: "json",
                    colNames:['id','Cedula','Primer Nombre','Segundo Nombre','Primer Apellido','Segundo Apellido','Activo'],
                    colModel:[
                        {name:'serial',index:'serial', width:80,hidden:true,search:true,editable: true,required : true,editoptions:{readonly:true,maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'id_person',index:'id_person', width:80,search:true,editable: true,required : true,editoptions:{readonly:true,maxlength: 40},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'p_nom',index:'p_nom', width:150,search:true, editable: true,required : true,editoptions: {readonly:true,maxlength: 50},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'s_nom',index:'s_nom', width:150,search:true, editable: true,required : true,editoptions: {readonly:true,maxlength: 50},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'p_ape',index:'p_ape', width:150,search:true, editable: true,required : true,editoptions: {readonly:true,maxlength: 50},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'s_ape',index:'s_ape', width:150,search:true, editable: true,required : true,editoptions: {readonly:true,maxlength: 50},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'activo2',index:'activo2', width:150,editrules:{edithidden:true},hidden:true,align:'left',search:false,sortable:true,editable:true,edittype:"select",editoptions:{value:"1:Activo;0:Inactivo"},searchoptions:{sopt:['cn','eq']}},
                    ],
                    rowNum:5,
                    rowList:[15,30,45],

                    pager: '#pagerPaci',
                    sortname: 'p_ape',
                    rownumbers: false,
                    viewrecords: true,
                    sortorder: "desc",
                    multiselect: false,
                    loadonce: false,
                    height: 'auto',
                    //height: 175,
                    altRows:true,
                    autoheight:true,
                    autowidth: true, 
                    rownumbers: false,
                    editurl: 'edita_activo_paquete.jsp',
                    caption: "Pacientes Activos Paquete ",	
                    ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
                        NuevoCaso2(""+cedula_nit+"");  }
	
                });
                jQuery("#listPaci").jqGrid('navGrid','#pagerPaci',{add:false,edit:true,del:false,search:true,view: true},
                {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
                {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
                {}, //opciones del
                {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                {width:60} //para el view
            );
            });

            $(document).ready(function(){
                $("#listProccont").jqGrid('GridUnload');
                $("#listProccont").jqGrid('GridDestroy');
                jQuery("#listProccont").jqGrid({
                    url:'cargar_proced_cont.jsp?q=2',
                    datatype: "json",
                    colNames:['id','CUP','Mapipo','Nombre','Tarifario','Valor','Porcentaje'],
                    colModel:[
                        {name:'id',index:'id', width:80,search:true,editable: true,hidden:true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'cup_verdadero',index:'cup_verdadero', width:80,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'codigo_maipos',index:'codigo_maipos', width:80,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'nombre',index:'pt_descripcion', width:400,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'tarifario',index:'t_nombre', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 400},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'precio',index:'precio', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'porcentaje',index:'porcentaje', width:100,search:true, editable: true,required : true,editoptions: {maxlength: 400},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    ],
                    rowNum:15,
                    rowList:[15,30,45],

                    pager: '#pagerProccont',
                    sortname: 'cup_verdadero',
                    rownumbers: false,
                    viewrecords: true,
                    sortorder: "desc",
                    multiselect: false,
                    loadonce: false,
                    //height: 'auto',
                    height: 175,
                    altRows:true,
                    autoheight:true,
                    autowidth: true, 
                    rownumbers: false,
                    editurl: 'editaCli.php',
                    caption: "Actividades Contratadas Contrato",	
                    ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
                        NuevoCaso2(""+cedula_nit+"");  }
	
                });
                jQuery("#listProccont").jqGrid('navGrid','#pagerProccont',{add:false,edit:false,del:false,search:true,view: true},
                {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
                {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
                {}, //opciones del
                {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                {width:60} //para el view
            );
            });


            $(document).ready(function(){
                $("#listMedcont").jqGrid('GridUnload');
                $("#listMedcont").jqGrid('GridDestroy');
                jQuery("#listMedcont").jqGrid({
                    url:'cargar_medic_contrato.jsp?q=2',
                    datatype: "json",
                    colNames:['ID','Cum','Atc','Nombre','Concentacion','UnMedida','F Farmaceutica','Presentacion','Laboratorio','Precio','Porcentaje','Tarifario'],
                    colModel:[
                        {name:'id',index:'id', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'cum',index:'m_cum',width:((anchoPantalla*5)/100),editable: false,required : true,editoptions:{maxlength: 63}},
                        {name:'atc',index:'atc', width:((anchoPantalla*5)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'nombre',index:'m_producto', width:((anchoPantalla*13)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'concentracion',index:'m_concentracion', width:((anchoPantalla*10)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'unidad',index:'um_descripcion', width:((anchoPantalla*8)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'forma',index:'ff_descripcion', width:((anchoPantalla*8)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'presentacion',index:'presentacion', width:((anchoPantalla*10)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'laboratorio',index:'laboratorio', width:((anchoPantalla*10)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'precio',index:'precio', width:((anchoPantalla*8)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'porcentaje',index:'porcentaje', width:((anchoPantalla*8)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'tarifario',index:'tarifario', width:((anchoPantalla*8)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                            
                    ],
                    rowNum:15,
                    rowList:[15,30,45],

                    pager: '#pagerMedcont',
                    sortname: 'm.cum',
                    rownumbers: false,
                    viewrecords: true,
                    sortorder: "desc",
                    multiselect: false,
                    loadonce: false,
                    //height: 'auto',
                    height: 175,
                    altRows:true,
                    //autoheight:true,
                    width: anchoPantalla,
                    shrinkToFit: false,
        
                    rownumbers: false,
                    editurl: 'editaCli.php',
                    caption: "Medicamentos Contrato",	
                    ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
                        NuevoCaso2(""+cedula_nit+"");  }
	
                });
                jQuery("#listMedcont").jqGrid('navGrid','#pagerMedcont',{add:false,edit:false,del:false,search:true,view: true},
                {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
                {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
                {}, //opciones del
                {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                {width:60} //para el view
            );
            });

            $(document).ready(function(){
                $("#listPacicont").jqGrid('GridUnload');
                $("#listPacicont").jqGrid('GridDestroy');
                jQuery("#listPacicont").jqGrid({
                    url:'cargar_pacientes_contrato.jsp?q=2',
                    datatype: "json",
                    colNames:['id','Cedula','Primer Nombre','Segundo Nombre','Primer Apellido','Segundo Apellido','Activo'],
                    colModel:[
                        {name:'serial',index:'serial', width:80,hidden:true,search:true,editable: true,required : true,editoptions:{readonly:true, maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'id_person',index:'id_person', width:80,search:true,editable: true,required : true,editoptions:{readonly:true,maxlength: 40},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'p_nom',index:'p_nom', width:150,search:true, editable: true,required : true,editoptions: {readonly:true,maxlength: 50},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'s_nom',index:'s_nom', width:150,search:true, editable: true,editoptions: {readonly:true,maxlength: 50},searchoptions:{sopt:['cn','eq']}},
                        {name:'p_ape',index:'p_ape', width:150,search:true, editable: true,required : true,editoptions: {readonly:true,maxlength: 50},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'s_ape',index:'s_ape', width:150,search:true, editable: true,editoptions: {readonly:true,maxlength: 50},searchoptions:{sopt:['cn','eq']}},
                        {name:'activo',index:'activo', width:150,editrules:{edithidden:true},hidden:false,align:'left',search:false,sortable:true,editable:true,edittype:"select",editoptions:{value:"1:Activo;0:Inactivo"},searchoptions:{sopt:['cn','eq']}},
                    ],
                    gridComplete: function ()
                        {
                            var ids = jQuery("#listPacicont").jqGrid('getDataIDs');
                            for (var i = 0; i < ids.length; i++)
                            {
                                var cl = ids[i];
                                var ret = jQuery("#listPacicont").jqGrid('getRowData',ids[i]);
                                if(ret.activo==1){
                                               be = "<label>Activo </label>";
                                }
                                else if(ret.activo==0){
                                               be = "<label>Inactivo </label>";
                                }
                            //  disabled='true'   be = "<input style='height:22px;width:68px;'  id='aceptar' type='button' value='Atender' onclick=\"atiende('" + cl + "','"+ret.descripcion+"','"+ret.serial+"');\"  />";
                                jQuery("#listPacicont").jqGrid('setRowData', ids[i], { activo: be });
                            }
                        },
                    rowNum:15,
                    rowList:[15,30,45],

                    pager: '#pagerPacicont',
                    sortname: 'p_ape',
                    rownumbers: false,
                    viewrecords: true,
                    sortorder: "desc",
                    multiselect: false,
                    loadonce: false,
                    height: 'auto',
                    //height: 175,
                    altRows:true,
                    autoheight:true,
                    autowidth: true, 
                    rownumbers: false,
                    editurl: 'edit_activo_contrato.jsp',
                    caption: "Pacientes Activos Contrato"	
                });
                jQuery("#listPacicont").jqGrid('navGrid','#pagerPacicont',{add:false,edit:true,del:false,search:true,view: true},
                {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
                {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
                {}, //opciones del
                {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                {width:60} //para el view
            );
            });

            function cargatodo(num){
                if(num==1){
                    var a=document.getElementById("tab1");
                    a.style.display="block";
                    var b=document.getElementById("tab2");
                    b.style.display="none";
                    var c=document.getElementById("tab3");
                    c.style.display="none";  
                    var d=document.getElementById("tab4");
                    d.style.display="none"; 
                    var e=document.getElementById("tab5");
                    e.style.display="none";
                    var f=document.getElementById("tab6");
                    f.style.display="none";  
                    var g=document.getElementById("tab7");
                    g.style.display="none";     
                    var h=document.getElementById("accordion2");
                    h.style.display="none";                                            
                }
                else if(num==2){
                    var a=document.getElementById("tab1");
                    a.style.display="none";
                    var b=document.getElementById("tab2");
                    b.style.display="block";
                    var c=document.getElementById("tab3");
                    c.style.display="none";
                    var d=document.getElementById("tab4");
                    d.style.display="none"; 
                    var e=document.getElementById("tab5");
                    e.style.display="none";
                    var f=document.getElementById("tab6");
                    f.style.display="none";  
                    var g=document.getElementById("tab7");
                    g.style.display="none";     
                    var h=document.getElementById("accordion2");
                    h.style.display="none";         
                }
                else if(num==3){
                    var a=document.getElementById("tab1");
                    a.style.display="none";
                    var b=document.getElementById("tab2");
                    b.style.display="none";
                    var c=document.getElementById("tab3");
                    c.style.display="block";
                    var d=document.getElementById("tab4");
                    d.style.display="none"; 
                    var e=document.getElementById("tab5");
                    e.style.display="none";
                    var f=document.getElementById("tab6");
                    f.style.display="none";  
                    var g=document.getElementById("tab7");
                    g.style.display="none";     
                    var h=document.getElementById("accordion2");
                    h.style.display="none";      
                }
                else if(num==4){
                    var a=document.getElementById("tab1");
                    a.style.display="none";
                    var b=document.getElementById("tab2");
                    b.style.display="none";
                    var c=document.getElementById("tab3");
                    c.style.display="none";
                    var d=document.getElementById("tab4");
                    d.style.display="block"; 
                    var e=document.getElementById("tab5");
                    e.style.display="none";
                    var f=document.getElementById("tab6");
                    f.style.display="none";  
                    var g=document.getElementById("tab7");
                    g.style.display="none";     
                    var h=document.getElementById("accordion2");
                    h.style.display="block";          
                }
                else if(num==5){
                    var a=document.getElementById("tab1");
                    a.style.display="none";
                    var b=document.getElementById("tab2");
                    b.style.display="none";
                    var c=document.getElementById("tab3");
                    c.style.display="none";
                    var d=document.getElementById("tab4");
                    d.style.display="none"; 
                    var e=document.getElementById("tab5");
                    e.style.display="block";
                    var f=document.getElementById("tab6");
                    f.style.display="none";  
                    var g=document.getElementById("tab7");
                    g.style.display="none";     
                    var h=document.getElementById("accordion2");
                    h.style.display="none";       
                }
                else if(num==6){
                    var a=document.getElementById("tab1");
                    a.style.display="none";
                    var b=document.getElementById("tab2");
                    b.style.display="none";
                    var c=document.getElementById("tab3");
                    c.style.display="none";
                    var d=document.getElementById("tab4");
                    d.style.display="none"; 
                    var e=document.getElementById("tab5");
                    e.style.display="none";
                    var f=document.getElementById("tab6");
                    f.style.display="block";  
                    var g=document.getElementById("tab7");
                    g.style.display="none";     
                    var h=document.getElementById("accordion2");
                    h.style.display="none";       
                }		                       
                else if(num==7){
                    var a=document.getElementById("tab1");
                    a.style.display="none";
                    var b=document.getElementById("tab2");
                    b.style.display="none";
                    var c=document.getElementById("tab3");
                    c.style.display="none";
                    var d=document.getElementById("tab4");
                    d.style.display="none"; 
                    var e=document.getElementById("tab5");
                    e.style.display="none";
                    var f=document.getElementById("tab6");
                    f.style.display="none";  
                    var g=document.getElementById("tab7");
                    g.style.display="block";     
                    var h=document.getElementById("accordion2");
                    h.style.display="none";       
                }      
            }
            function oculta(){
                var g=document.getElementById("accordion2");
                g.style.display="none"; 
            }		           
            $(function() {
                $( "#tabs22" ).tabs();
            }
        );
            $(function() {
                $( "#accordion2" ).accordion({
                    collapsible: true
                });
            });

            $(function(){
                $("#fcontratod").datepicker({
                    //inline:true
                    showOn:'both',
                    buttonImageOnly:true,
                    buttonImage:'../imagenes/fotos/calendar.gif',
                    firstDay:1,
                    changeMonth:true,
                    changeYear:true
                });	
                $('#fcontratod').datepicker($.datepicker.regional['es']);
                $('#fcontratod').datepicker("option","showAnim","slideDown");
                $('#fcontratod').datepicker("option","dateFormat","yy-mm-dd");
            });
            $(function(){
                $("#fcontratoh").datepicker({
                    //inline:true
                    showOn:'both',
                    buttonImageOnly:true,
                    buttonImage:'../imagenes/fotos/calendar.gif',
                    firstDay:1,
                    changeMonth:true,
                    changeYear:true
                });	
                $('#fcontratoh').datepicker($.datepicker.regional['es']);
                $('#fcontratoh').datepicker("option","showAnim","slideDown");
                $('#fcontratoh').datepicker("option","dateFormat","yy-mm-dd");
            });
		
            //para modales	

            ///para ocultar y mortar el modal que quiero
            function muestram(dato,pacocon){//alert("sdf "+dato);
                /*   if(pacocon==1){alert("para contrato");}
                                  else{alert("para paquete");}*/
                if(dato==1){
                    var a=document.getElementById("subuno");
                    a.style.display="block"; 
                    var b=document.getElementById("subdos");
                    b.style.display="none"; 
                    var c=document.getElementById("subtres");
                    c.style.display="none"; 
                    var d=document.getElementById("subcuatro");
                    d.style.display="none";    
                } 
                else if(dato==2){
                    var a=document.getElementById("subuno");
                    a.style.display="none"; 
                    var b=document.getElementById("subdos");
                    b.style.display="block"; 
                    var c=document.getElementById("subtres");
                    c.style.display="none"; 
                    var d=document.getElementById("subcuatro");
                    d.style.display="none";    
                } 
                else if(dato==3){
                    var a=document.getElementById("subuno");
                    a.style.display="none"; 
                    var b=document.getElementById("subdos");
                    b.style.display="none"; 
                    var c=document.getElementById("subtres");
                    c.style.display="block"; 
                    var d=document.getElementById("subcuatro");
                    d.style.display="none";    
                }
                else if(dato==4){
                    var a=document.getElementById("subuno");
                    a.style.display="none"; 
                    var b=document.getElementById("subdos");
                    b.style.display="none"; 
                    var c=document.getElementById("subtres");
                    c.style.display="none"; 
                    var d=document.getElementById("subcuatro");
                    d.style.display="block";  
                }           

            }


            ///modal jquery	
            jQuery(function ($) {
                var OSX = {
                    container: null,
                    init: function () {
                        $("input.mas, a.mas, figure.mase").click(function (e) {
                            e.preventDefault();	

                            $("#osx-modal-content").modal({
                                overlayId: 'osx-overlay',
                                containerId: 'osx-container',
                                closeHTML: null,
                                minHeight: 80,
                                opacity: 65, 
                                position: ['0',],
                                overlayClose: true,
                                onOpen: OSX.open,
                                onClose: OSX.close
                            });
                        });
                    },
                    open: function (d) {
                        var self = this;
                        self.container = d.container[0];
                        d.overlay.fadeIn('slow', function () {
                            $("#osx-modal-content", self.container).show();
                            var title = $("#osx-modal-title", self.container);
                            title.show();
                            d.container.slideDown('slow', function () {
                                setTimeout(function () {
                                    var h = $("#osx-modal-data", self.container).height()
                                        + title.height()
                                        + 20; // padding
                                    d.container.animate(
                                    {height: h}, 
                                    200,
                                    function () {
                                        $("div.close", self.container).show();
                                        $("#osx-modal-data", self.container).show();
                                    }
                                );
                                }, 300);
                            });
                        })
                    },
                    close: function (d) {
                        var self = this; // this = SimpleModal object
                        d.container.animate(
                        {top:"-" + (d.container.height() + 20)},
                        500,
                        function () {
                            self.close(); // or $.modal.close();
                        }
                    );
                    }
                };

                OSX.init();

            });	
            
            
            
         $(document).ready(function(){
             $("#aceptar-edit-contrato").on('click',function(){
                  
                  var nom_cont = $("#nom_cont").val();
                  var ideps = $("#ideps").val();
                  var ncontrato = $("#nocontrato").val();
                  var fi = $("#fcontratod").val();
                  var ff = $("#fcontratoh").val();
                  var objeto = $("#objetocontrato").val();
                  var resumencontrato = $("#resumencontrato").val();
                  
                  var factura=0;
                  if($("#contrahabifactu").is(':checked')) {  
                         factura=1; 
                        }   
                  
                  var modalidad = $("#modalidadcontrato").val();
                  var numafiliados = $("#numafiliados").val();
                  var porcentajeupc = $("#porcentajeupc").val();
                  
                  
                  var regimen = $("#regimencontrato").val();
                  
                  var contratovalorcano = $("#contratovalorcano").val();
                  var contratovalorcmes = $("#contratovalorcmes").val();
                  var alaraunocontraen = $("#alaraunocontraen").val();
                  var contratovalorfano = $("#contratovalorfano").val();
                  var contratovalorfmes = $("#contratovalorfmes").val();
                  var alaradoscontraen = $("#alaradoscontraen").val();
                  var idcontra = $("#idcontra").val();
                 
                 
                 
                   $.ajax({
                               type: "POST",
                               dataType: "json",
                               url: "contrato/editar_contrato.jsp",
                               data: { idcontra:idcontra,
                                       ideps:ideps,
                                       nom_cont:nom_cont,
                                       ncontrato:ncontrato,
                                       fi: fi,
                                       ff: ff,
                                       objeto:objeto,
                                       resumencontrato:resumencontrato,
                                       factura:factura,
                                       modalidad:modalidad,
                                       numafiliados:numafiliados,
                                       porcentajeupc:porcentajeupc,
                                       regimen: regimen,
                                       contratovalorcano: contratovalorcano,
                                       contratovalorcmes:contratovalorcmes,
                                       alaraunocontraen:alaraunocontraen,
                                       contratovalorfano:contratovalorfano,
                                       contratovalorfmes:contratovalorfmes,
                                       alaradoscontraen:alaradoscontraen},
                               success: function( response ) 
                               { 
                                  alert( response.msj );   
                               },
                               error: function( error ) { alert(error.msj ); }

                            } );
                 
             });
         });   
            
        </script>
        <title>Sin título 1</title>
    </head>

    <body>

        <% request.setCharacterEncoding("UTF-8");
            if (session.getAttribute("nombre") == null || session.getAttribute("clave") == null || session.getAttribute("id") == null || session.getAttribute("permiso") == null) {
        %>

    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>    

    <%
            out.println("</body></html>");
            return;
        }
        request.setCharacterEncoding("UTF-8");
        HttpSession sesion = request.getSession();
        String dato = request.getParameter("cod");
        sesion.setAttribute("id_contratacion", dato);
        //out.print(sesion.getAttribute("id_contratacion"));
        sesion.setAttribute("id_paq", "0");
      //  out.print(sesion.getAttribute("id_paqm"));
        String idcont = request.getParameter("cod");
        out.print("<input type='hidden' name='idcontra' id='idcontra' value='" + idcont + "'>");

        String nombrecont = "";
        String ideps = "";
        String datos[] = new String[17];
        for (int i = 0; i < 17; i++) {
            datos[i] = "";
        }
        conecta_bd ba = new conecta_bd();
        ba.ConectaDb();
        String sql = "select nombre,cod_eps,f_inicio,f_fin,n_contrato,objeto_cont,resumen_contrato,modalidad,regimen,v_cap_ano,v_cap_mes,alarma_en,v_fac_ano,v_fac_mes,alarma,factura,ruta,num_afiliados,por_upc from contratacion where id_contratacion='" + idcont + "';";

        ResultSet resu0 = null;
        try {
            resu0 = ba.consultas(sql);
            while (resu0.next() && resu0 != null) {
                nombrecont = resu0.getString(1);
                ideps = resu0.getString(2);
                if (resu0.getString(3) != null) {
                    datos[0] = resu0.getString(3);
                }//fecha inicio
                if (resu0.getString(4) != null) {
                    datos[1] = resu0.getString(4);
                }//fecha fin
                if (resu0.getString(5) != null) {
                    datos[2] = resu0.getString(5);
                }//numero contrato
                if (resu0.getString(6) != null) {
                    datos[3] = resu0.getString(6);
                }//objeto contrato
                if (resu0.getString(7) != null) {
                    datos[4] = resu0.getString(7);
                }//resumen contrato
                if (resu0.getString(8) != null) {
                    datos[5] = resu0.getString(8);
                }//modalidad
                if (resu0.getString(9) != null) {
                    datos[6] = resu0.getString(9);
                }//regimen
                if (resu0.getString(10) != null) {
                    datos[7] = resu0.getString(10);
                }//v_cap_ano
                if (resu0.getString(11) != null) {
                    datos[8] = resu0.getString(11);
                }//v_cap_mes
                if (resu0.getString(12) != null) {
                    datos[9] = resu0.getString(12);
                }//alarma en
                if (resu0.getString(13) != null) {
                    datos[10] = resu0.getString(13);
                }//v_fac_Ano
                if (resu0.getString(14) != null) {
                    datos[11] = resu0.getString(14);
                }//v_fac_mes
                if (resu0.getString(15) != null) {
                    datos[12] = resu0.getString(15);
                }//alarma dos
                if (resu0.getString(16) != null) {
                    datos[13] = resu0.getString(16);
                }//factura
                if (resu0.getString(17) != null) {
                    datos[14] = resu0.getString(17);
                }//ruta
                if (resu0.getString(18) != null) {
                    datos[15] = resu0.getString(18);
                }//num afiliados
                if (resu0.getString(19) != null) {
                    datos[16] = resu0.getString(19);
                }//por upc
            }
        } catch (SQLException ex) {
        } catch (Exception exe) {
        }
        ba.cierraResultado(resu0);
    %>


    <table style="width:100%"><tr><td style="text-align:left">
                <table >
                    <tr>
                        <td ><label>Nombre Contrato</label></td>
                        <td><input type="text" id="nom_cont" name="nom_cont" maxlength="250" style="width: 100%" value="<% out.print(nombrecont);%>" readonly></td>
                    </tr>
                    <tr>
                        <td><label>EPS Contratante</label></td>
                        <td>
                            <select  id="ideps" name="ideps"  disabled="disabled" >                     
                                <%



                                    sql = "select ideps,nombre from eps order by nombre;";

                                    ResultSet resu = null;
                                    try {
                                        resu = ba.consultas(sql);
                                        while (resu.next() && resu != null) {
                                            if (ideps.compareTo("" + resu.getString(1) + "") == 0) {
                                                out.print("<option value='" + resu.getString(1) + "' SELECTED>" + resu.getString(2) + "</option>");

                                            } else {
                                                out.print("<option value='" + resu.getString(1) + "'>" + resu.getString(2) + "</option>");
                                            }
                                        }
                                    } catch (SQLException ex) {
                                    } catch (Exception exe) {
                                    }
                                    ba.cierraResultado(resu);
                                %>                       
                            </select>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align:right"><center><input type="button" value="guardar" id="aceptar-edit-contrato" ></center> </td>
</tr>
</table> 		
<div id="tabs22">
    <ul>
        <li><a href="#tab1" onclick="cargatodo(1)">Datos Generales</a></li>
        <li><a href="#tab2" onclick="cargatodo(2)">Clase Contrato</a></li>
        <li><a href="#tab3" onclick="cargatodo(3)">Monto Contratación</a></li>
        <li><a href="#tab4" onclick="cargatodo(4)">Paquete Integral</a></li>
        <li><a href="#tab5" onclick="cargatodo(5)">Actividades</a></li>
        <li><a href="#tab6" onclick="cargatodo(6)">Medicamentos</a></li>
        <li><a href="#tab7" onclick="cargatodo(7)">Pacientes</a></li>
    </ul>

    <div id="tab1">
        <fieldset>
            <table>
                <tr>
                    <td style="padding-top:8px;" valign="middle">
                        <fieldset style="height:40px"> 
                            <table  style="padding-top:8px;" >
                                <tr><td>No. Contrato:</td><td><input type="text" name="nocontrato" id="nocontrato" value="<%  out.print(datos[2]);%>" readonly></td></tr>
                            </table>
                        </fieldset>
                    </td>
                    <td>
                        <fieldset> 
                            <legend>Vigencia</legend>    
                            <table>
                                <tr>
                                    <td>Desde</td><td><input type="text" name="fcontratod" id="fcontratod"  readonly></td>
                                    <td>Hasta</td><td><input type="text" name="fcontratoh" id="fcontratoh"  readonly></td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
            </table>				            
        </fieldset><br>
        <fieldset>
            <table style="width:100%">
                <tr>
                    <td>Objeto del Contrato:</td>
                </tr>
                <tr>    
                    <td style="width:100%">
                        <textarea name="objetocontrato" id="objetocontrato" style="width:100%" readonly rows="3"><%  out.print(datos[3]);%></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Resumen del Contrato:</td>
                </tr>
                <tr>    
                    <td style="width:100%">
                        <textarea name="resumencontrato" id="resumencontrato" style="width:100%" rows="8" readonly><%  out.print(datos[4]);%></textarea>
                    </td>
                </tr>

            </table>				            
        </fieldset>	 <br>
               <input type="checkbox" name="contrahabifactu" id="contrahabifactu"  disabled="disabled" <% if (datos[13].compareTo("1") == 0) {
                out.print("checked");
            }%> >Contrato Habilitado Para Facturación<br>  				            	  
    </div>

    <div id="tab2" style="display:none">
        <table style="width:100%">
            <tr>
                <td style="width:50%">
                    <fieldset  >
                        <legend>Modalidad</legend>
                        <center><br>
                            <table>
                                <tr>                                                                        
                                    <td><input type="radio" name="modalidadcontrato" id="modalidadcontrato" value="1" disabled="disabled" <%  if (datos[5].compareTo("1") == 0) {
                                            out.print("checked");
                                        }%>></td><td>Capacitación&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td><input type="radio" name="modalidadcontrato" id="modalidadcontrato" value="2" disabled="disabled" <%  if (datos[5].compareTo("2") == 0) {
                                            out.print("checked");
                                        }%>></td><td>Evento&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td><input type="radio" name="modalidadcontrato" id="modalidadcontrato" value="3" disabled="disabled" <%  if (datos[5].compareTo("3") == 0) {
                                            out.print("checked");
                                        }%>></td><td>Mixto</td>
                                </tr>			                                        
                            </table>
                        </center>
                        <br>
                    </fieldset>
                </td>				                     
                <td style="padding-top:10px;width:50%;height:60px" >
                    <fieldset style="height:100%">
                        <table style="width:100%;height:100%">
                            <tr>
                                <td style="width:18%">No. Afiliados:</td>
                                <td style="width:32%"><input type="text" name="numafiliados" id="numafiliados" value="<% out.print(datos[15]);%>" readonly></td>
                                <td style="width:10%">&nbsp;&nbsp;&nbsp;%UPC:</td>
                                <td style="width:40%"><input type="text" name="porcentajeupc" id="porcentajeupc"  value="<% out.print(datos[16]);%>" readonly></td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>


            <tr>
                <td colspan="2">
                    <fieldset>
                        <legend>Régimen</legend>
                        <center>
                            <table>
                                <tr>
                                    <%

                                        sql = "select id_tipo_usuario,descripcion from tipo_usuario;";

                                        ResultSet resu4 = null;
                                        try {
                                            resu4 = ba.consultas(sql);
                                            while (resu4.next() && resu4 != null) {
                                                if (datos[6].compareTo(resu4.getString(1)) == 0) {
                                                    out.print("<td><input type='radio' name='regimencontrato' id='regimencontrato' value='" + resu4.getString(1) + "'  disabled='disabled'  checked ></td>");
                                                } else {
                                                    out.print("<td><input type='radio' name='regimencontrato' id='regimencontrato' value='" + resu4.getString(1) + "'  disabled='disabled' ></td>");
                                                }

                                                out.print("<td>" + resu4.getString(2) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>");
                                            }
                                        } catch (SQLException ex) {
                                        } catch (Exception exe) {
                                        }
                                        ba.cierraResultado(resu4);
                                    %> 
                                </tr>
                            </table>
                        </center>
                    </fieldset>
                </td>
            </tr>
        </table>          			  
    </div>

    <div id="tab3" style="display:none">
        <fieldset>
            <center>
                <table>
                    <tr>
                        <td>Vr. Capitado año:</td><td>Vr. Capitado mes:</td><td>Alarma en:</td>
                    </tr>
                    <tr>   
                        <td><input type="text" name="contratovalorcano" id="contratovalorcano" style="text-align:center" value="<% out.print(datos[7]);%>" readonly >
                        </td>
                        <td><input type="text" name="contratovalorcmes" id="contratovalorcmes" style="text-align:center" value="<% out.print(datos[8]);%>" readonly >
                        </td>
                        <td><input type="text" name="alaraunocontraen" id="alaraunocontraen" style="text-align:center" value="<% out.print(datos[9]);%>" readonly >
                        </td>
                    </tr> 
                    <tr>  
                        <td>Vr. Facturado año:</td><td>Vr. Facturado mes:</td><td>Alarma en:</td>
                    </tr>
                    <tr>   
                        <td><input type="text" name="contratovalorfano" id="contratovalorfano" style="text-align:center" value="<% out.print(datos[10]);%>" readonly >
                        </td>
                        <td><input type="text" name="contratovalorfmes" id="contratovalorfmes" style="text-align:center"  value="<% out.print(datos[11]);%>" readonly >
                        </td>
                        <td><input type="text" name="alaradoscontraen" id="alaradoscontraen" style="text-align:center"  value="<% out.print(datos[12]);%>" readonly >
                        </td>
                    </tr> 
                </table>
            </center>
        </fieldset>
    </div>
    <div id="tab4" style="display:none">
        <fieldset >
            <legend>Paquetes</legend>
            <div id="carga_paquetes" name="carga_paquetes">
                <div style="vertical-align:top">
                    <%

                        sql = "select id_paquete_int,nombre,valor_pac from paquete_int where id_contratacion='" + idcont + "' order by nombre;";
                        //  out.print(sql);
                        ResultSet resufi = null;
                        try {
                            resufi = ba.consultas(sql);
                            while (resufi.next() && resufi != null) {
                                out.print(" <figure id='figu' name='figu' style=' display:inline-block;' onclick='cargapac(" + '"' + resufi.getString(1) + '"' + ")' style='width:100px'>");
                                out.print(" <center> <img src='../imagenes/fotos/paq.png' alt='contrato uno' style='width:40px;height:40px'>");
                                out.print("  <figcaption  style='width:60px'>" + resufi.getString(2) + "</figcaption></center> ");
                                out.print("  </figure>");
                     %>
                    
                     <a href="#" id="opener_1" class="opener" data-valor="1" ><span class="ui-icon ui-icon-search"></span> </a>
                       
                        <div id="dialog_<%= resufi.getString(1) %>" title="Basic dialog">
                            <input type="hidden" value="" class="id" />
                            <table>
                                <tr>
                                    <!-- <td><input type="text" value="" class="contrato" /></td> -->
                                    <td><input type="text" value="<%= resufi.getString(2) %>" class="nombre" /></td>
                                    <td><input type="text" value="<%= resufi.getString(3) %>" class="valor" /></td>
                                    <td><input type="button" value="Aceptar" data-id="<%= resufi.getString(1) %>" class="btn-dialog" /></td>
                                </tr>
                            </table>
                        </div>
                         <script>
                            $( function() {
                                $( "#dialog_<%= resufi.getString(1) %>" ).dialog({
                                    autoOpen: false,
                                    show: {
                                      effect: "blind",
                                      duration: 1000
                                    },
                                    hide: {
                                      effect: "explode",
                                      duration: 1000
                                    }
                                });
                            });
                         </script>
                    
                    
                    <%
                            }
                        } catch (SQLException ex) {
                        } catch (Exception exe) {
                        }
                        ba.cierraResultado(resufi);
                    %>    

                    <figure style="display:inline-block;text-align:center" class='mase' id="mase" name='mase'  onclick="muestram(4,1)"  >
                        <img src="../imagenes/fotos/mas.png" alt="agregar" style="width:40px;height:40px">
                        <figcaption>Nuevo Paquete</figcaption>
                    </figure>

                    <script>
                        $( ".opener" ).on( "click", function() { alert("sisas");
                            var id = $(this).data("valor"); alert(id;
                            $( "#dialog_"+id ).dialog( "open" );
                        }); 
                    </script>
                    
                    
                </div>
            </div>
        </fieldset>  

    </div>
    <div id="tab5" style="display:none">
        <!-- <h3>actividades</h3> -->
        <center>
            <div style="width:80%">
                <table id="listProccont" ></table>
                <div id="pagerProccont"></div> 
            </div><br>
            <input type='button' id="mas" name="mas" value="Buscar Procedimiento" onclick="agregar_procont();"></center>
        <div id="div_datos_tariproced2"></div>

    </div>
    <div id="tab6" style="display:none">			                                                                                                
        <!-- <h3>Medicamentos</h3> -->
        <center>
            <div style="width:100%">
                <table id="listMedcont" ></table>
                <div id="pagerMedcont"></div> 
            </div><br>
            <input type='button'  id="mas" name="mas" value="Buscar Medicamento" onclick="agregar_medicont()"></center>
            <div id="div_medicamentos_contrato"></div>
    </div>
    <div id="tab7" style="display:none">
        <!-- <h3>Pacientes</h3> -->
        <center>
            <div style="width:100%">
                <table id="listPacicont" ></table>
                <div id="pagerPacicont"></div> 
            </div><br>
            <center>
                <label>Digite Cedula de Paciente:</label>
                <input type="text" size="15" id="cedula" name="cedula">
                <input type='button'  id="mas" name='mas' value="agregar" onclick="agregar_pacicont();"></center>
            <div id="div_inspacicont" name="div_inspacicont"></div>
    </div>
</div>   

<div id="accordion2" >
    <h3>Actividades Paquete</h3>
    <div>
        <div id="div_sesion_paq" name="div_sesion_paq"> </div>
        <div style="width:95%">
            <table id="listProc" ></table>
            <div id="pagerProc"></div> 
        </div><br>
        <center><input type='button' id="mas" name='mas' value="Buscar Procedimiento" onclick="agregar_propaq();"></center>
        <div id="div_datos_tariproced3" name="div_datos_tariproced3"></div>
    </div>

    <h3>Medicamentos Paquete</h3>
    <div>
        <div style="width:95%">
            <table id="listMed" ></table>
            <div id="pagerMed"></div> 
        </div><br>
        <center><input type='button' id="mas" name='mas' value="Buscar Medicamento" onclick="agregar_medicpaq()"></center>
        <div id="div_medicamentos_paquete" name="div_medicamentos_paquete"></div>
    </div>

    <h3>Pacientes Paquete</h3>
    <div>
        <center><div style="width:70%">
                <table id="listPaci" ></table>
                <div id="pagerPaci"></div> 
            </div><br>
        </center>
        <center>
            <label>Digite Cedula de Paciente:</label>
            <input type="text" size="15" id="cedulapaq" name="cedulapaq">
            <center><input type='button'  id="mas" name='mas' value="agregar" onclick="agregar_pacipaq();"></center>
            <div id="div_inspacipaq" name="div_inspacicont"></div>
    </div>
</div>

<script language="javascript" type="text/javascript">
    oculta(); 		
</script>
<br>
<!--	<center><input type="submit" value="guardar" ></center>--><br>	
<!-- aca bienen los modales -->
<div id='container'>
    <div id='content'>
        <div id="osx-modal-content">
            <div id="osx-modal-title">Agregar</div>
            <div class="close"><a href="#" class="simplemodal-close">x</a></div>
            <div id="osx-modal-data">

                <!-- //div uno -->
                <div id="subuno" style="display:none">
                    <h2>Nueva Actividad</h2>
                    <center>
                        <table>
                            <tr>
                                <td><label>Tarifario</label></td>
                                <td>
                                    <select name="tarifario_acti" id="tarifario_acti" style="width:100%">
                                        <option value="codtarif">nombre tarifario</option>				                                     
                                    </select>                                 
                                </td>
                            </tr>
                            <tr>
                                <td><label>Actividad</label></td>
                                <td>
                                    <select name="actividad_acti" id="actividad_acti" style="width:100%">
                                        <option value="codtarif">nombre actividad</option>				                                     
                                    </select>                                 
                                </td>
                            </tr>
                            <tr>
                                <td><label>Porcentaje</label></td><td>&nbsp;&nbsp;
                                    -<input type="radio" id="poce" name="porce" value="1">&nbsp;
                                    +<input type="radio" id="poce" name="porce" value="2">
                                    <input type="text" name="porc_acti" id="porc_acti" style="width:20px;text-align:center" maxlength="2" value="0"></td>
                            </tr>
                        </table>

                        <input type="hidden" id="casillo" name="casillo" value="0">
                        <input type="button" value="Aceptar" onclick="validando(0)" id="aceptar">

                    </center>
                </div>


                <!-- //////div dos  -->
                <div id="subdos" style="display:none">
                    <h2>Nuevo Medicamento</h2>
                    <center>
                        <table>
                            <tr>
                                <td><label>Tarifario</label></td>
                                <td>
                                    <select name="tarifario_medi" id="tarifario_medi" style="width:100%">
                                        <option value="codtarif">nombre tarifario</option>				                                     
                                    </select>                                 
                                </td>
                            </tr>
                            <tr>
                                <td><label>Medicamento</label></td>
                                <td>
                                    <select name="medicamento_medi" id="medicamento_medi" style="width:100%">
                                        <option value="codmedi">nombre medicamento</option>				                                     
                                    </select>                                 
                                </td>
                            </tr>
                            <tr>
                                <td><label>Porcentaje</label></td><td>&nbsp;&nbsp;
                                    -<input type="radio" id="pocemedi" name="porcemedi" value="1">&nbsp;
                                    +<input type="radio" id="pocemedi" name="porcemedi" value="2">
                                    <input type="text" name="porc_medi" id="porc_medi" style="width:20px;text-align:center" maxlength="2" value="0"></td>
                            </tr>
                        </table>

                    </center>
                </div>

                <!-- //////div tres  -->
                <div id="subtres" style="display:none">
                    <h2>Nuevos Pacientes</h2>
                    <center>

                        <table>
                            <tr>
                                <td>Cedula    </td><td><input type="text" id="cedulapaci" name="cedulapaci"> </td>
                            </tr>
                            <tr>
                                <td>P Nombre  </td><td><input type="text" id="pnompaci" name="pnompaci"></td>
                                <td>S Nombre  </td><td><input type="text" id="snompaci" name="snompaci"></td>
                            </tr>
                            <tr>
                                <td>P Apellido</td><td><input type="text" id="papepaci" name="papepaci"></td>
                                <td>P Apellido</td><td><input type="text" id="sapepaci" name="sapepaci"></td>
                            </tr>
                            <tr>
                                <td>Eps</td><td colspan="3"><input type="text" id="epspaci" name="epspaci" style="width:100%"></td>
                            </tr>
                        </table>

                        <input type="hidden" id="casillo" name="casillo" value="3">
                        <input type="button" value="Aceptar" onclick="validando(2)" id="aceptar">

                    </center>
                </div>


                <!-- //////div cuatro -->
                <div id="subcuatro" style="display:none">
                    <h2>Nuevo Paquete</h2>	
                    <center>

                        <form action="nuevo_paquete.jsp" id="form_nuevo_pac" name="form_nuevo_pac" method="post">   
                            <table>
                                <tr><td>Contrato</td>
                                    <td><input type="text" id="contrato_pac" name="contrato_pac" disabled="disabled" value="<% out.print(nombrecont);%>"></td>
                                </tr>

                                <tr><td>Nombre Paquete</td><td><input type="text" id="paquete_pac" name="paquete_pac" value=""></td></tr>
                                <tr><td>Valor Paquete</td><td><input type="text" id="valor_pac" name="valor_pac" value=""></td></tr>   
                                <tr><td colspan="2"><center><input type="submit" value="aceptar" name="b_nuevo_pac" id="b_nuevo_pac"></center></td></tr>
                            </table>
                            <input type="hidden" name="id_cont" id="id_cont" value="<% out.print(idcont);%>">
                            <input type="hidden" id="ncont_pac" name="ncont_pac" value="<% out.print(nombrecont);%>">
                        </form> 

                    </center> 

                </div>

                <!-- //////div cinco -->
                <div id="subcinco" style="display:none">
                    <br>
                    <center><h1>Seleccione Paquete</h1>	</center>
                    <br>
                </div>

                <!-- //////div seis -->
                <div id="subseis" style="display:none">
                    <br>
                    <center><h1>Seleccione Contrato</h1>	</center>
                    <br>
                </div>
                <!-- fin de modales sigue boton de cerrar -->				
                <p><button class="simplemodal-close" id="aceptar">Cerrar</button> <span></span></p>				
            </div>
        </div>
    </div>
</div>	
<script type="text/javascript" language="javascript">
    ponefecha('<%out.print(datos[0]);%>','<%  out.print(datos[1]);%>');
</script>



<div id="dialog_btariproced" name="dialog_btariproced" title="Nuevo Procedimiento">
    <div>
        <table id="list_btariproced" ></table>
        <div id="pager_btariproced"></div>
    </div>
</div>

<div id="dialog_proc_paq" name="dialog_proc_paq" title="Nuevo Procedimiento">
    <div>
        <table id="list_btariproced2" ></table>
        <div id="pager_btariproced2"></div>
    </div>
</div>

<div id="dialog_med_paq" name="dialog_med_paq" title="Nuevo Medicamento">
    <div>
        <table id="list_medicamentos" ></table>
        <div id="pager_medicamentos"></div>
    </div>
</div>

<div id="dialog_med_cont" name="dialog_med_cont" title="Nuevo Medicamento">
    <div>
        <table id="list_medicamentos2" ></table>
        <div id="pager_medicamentos2"></div>
    </div>
</div>

<div id="dialog_activ_pacicont" name="dialog_activ_pacicont" title="Nuevo Procedimiento">
    <div id="aaa" name="aaa"></div>
    <div>
        <%
            String sql7;
            sql7 = "select activo,id_cont from afiliados_cont where serial_paciente='61' and id_cont='" + sesion.getAttribute("id_contratacion") + "'";
            //out.print(sql7);
            String a = "";
            ResultSet resupc = null;
            try {
                resupc = ba.consultas(sql7);
                while (resupc.next() && resupc != null) {
                    a = resupc.getString(1);
                    int b;
                    b = Integer.parseInt(a);
                    // out.print(a);
                    b = 0;
                    if (b == 1) {
                        out.print("<input type='radio' name='cont_paci' id='cont_paci' value='1' checked >Activado");
                        out.print("<br>");
                        out.print("<input type='radio' name='cont_paci' id='cont_paci' value='0'>Desactivado");
                    }
                }
            } catch (SQLException ex) {
            }
            //catch (Exception exe) {}
            ba.cierraResultado(resupc);
            ba.cerrar();
        %> 
    </div>
</div>
</body>
</html>
