<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html >
<head>
<meta charset="utf-8">
<title>Ips Isalud Total S.A.S</title>
	
	 <link rel="shortcut icon" href="../../imagenes/fotos/favicon.ico">
        <link rel="stylesheet" type="text/css" media="screen" href="../../jquery/css/flick/jquery-ui-1.9.2.custom.css" >
        <link rel="stylesheet" type="text/css" media="screen" href="../../jquery/jqgrid/css/ui.jqgrid.css" >
        <link rel="stylesheet" type="text/css" media="screen" href="../../jquery/bajados/ui.multiselect.css" >
       	<script src="../../jquery/bajados/jquery.min.js" type="text/javascript"></script> 
        <script type="text/javascript" language="javascript" src="../../jquery/js/jquery-ui.js"></script>
	<script src="../../jquery/jqgrid/js/i18n/grid.locale-es.js" type="text/javascript"></script>
        <script src="../../jquery/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
        <link type='text/css' href='../../jquery/bajados/modal/osx.css' rel='stylesheet' media='screen'>
        <script type='text/javascript' src='../../jquery/bajados/modal/jquery.simplemodal.js'></script>
        <script type="text/javascript" src="../../jquery/bajados/jquery.previewInputFileImage.js"></script> 
        <script type="text/javascript" src="../../jquery/bajados/jquery.ui.datepicker-es.js"></script> 
        
       <script src="../../jquery/apprise/apprise-1.5.min.js" type="text/javascript"></script> 
       <link type='text/css' href='../../jquery/apprise/apprise.min.css' rel='stylesheet' media='screen'>
       
             
     
        
<script type="text/javascript" language="javascript">
    var pestaña=0;
    if(document.getElementById) {
    window.alert = function(txt) {
        apprise(txt);
    }
}

    function agenda(){
                         apprise("¿Esta seguro de salir sin guardar", {'verify':true}, function(opcion) {
                                                            if(opcion) {                                                                         
                                                                       location.href="../comunes/borra_consula_psico.jsp?tipo=1";
                                                                       }
                                                           }); 
                }
    function cierra(){
                               location.href="../../cierra_sesion.jsp";    
                     }


         $(document).ready(function(){
       
         
      $('#form_recomend').submit(
                       
                       function() {
                            var idr = document.getElementById("id_perm_para").value; 
                            var reco = document.getElementById("recomen_dacion").value; 
                            
                
                           if( idr == 0 ) {
                                                     alert('Seleccione a quien va dirigida la recomendación');
                                                       return false;  
                                                                      }    
                           else if( reco == null || reco.length == 0 || /^\s+$/.test(reco) ) {
                                                     alert('Ingrese la recomendación');
                                                       return false;  
                                                                      } 
                           else if(reco.length >= 400 ){alert('La recomendación tiene como máximo 399 caracteres');
                                                       return false;  
                                                                     }  
                          if(!confirm("¿Está seguro de agregar esta recomendación? ")) {return false;} 
                           document.getElementById("recomen_dacion").value=reco.replace(/\r\n|\n|\r/g, " ");
                                                 
                                  // Enviamos el formulario usando AJAX
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                   $('#rrresul').html(data);
                                   $( "#nueva_recom" ).dialog( "close" );
                                   setTimeout (function(){   jQuery("#list11").jqGrid('setCaption',"RECOMENDACIONES ").trigger('reloadGrid');
                                           },800);
                                      }                             
                                })
                          return false;
                      });        
             
             
             jQuery("#list10").jqGrid({
   	url:'../comunes/carga_alertas.jsp?q=2',
	datatype: "json",
   	colNames:['cod','Descripcion','Fecha','Profesional Genera'],
   	colModel:[
   		{name:'cod',index:'cod', width:0,search:false,hidden:true,editable:false,required :false,editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
   		{name:'alerta',index:'alerta', width:212,search:true, editable: true,required : true,editoptions: {maxlength: 399},editrules: { required: true },searchoptions:{sopt:['cn','eq']},edittype:"textarea",editoptions:{rows:"3",cols:"45"}},
   		{name:'fecha',index:'fecha', width:0,search:true,hidden:true,editable:false,required :false, editrules: { edithidden: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'prof',index:'prof', width:0,search:true,hidden:true,editable:false,required :false, editrules: { edithidden: true },searchoptions:{sopt:['cn','eq']}},
   		 ],
             gridComplete: function ()
                    {
                      var ids = jQuery("#list10").jqGrid('getDataIDs');
                        
                        
                        for (var i = 0; i < ids.length; i++)
                        {
                            var cl = ids[i];
                            var ret = jQuery("#list10").jqGrid('getRowData',ids[i]);
                            
                              
                           be = "<label style='color: red;font-size:13px' >"+ret.alerta+"</label>";
                          
                           jQuery("#list10").jqGrid('setRowData', ids[i], { alerta: be });
                        }
                    },        
   	rowNum:300,
   	rowList:[15,30,45],
   	pager: '#pager10',
   	sortname: 'id_alertas',
        viewrecords: true,
        sortorder: "desc",
        scroll:1,
	height: 'auto',
        shrinkToFit: false,
	//height: 190,
        width:219,
        rownumbers: false,
        editurl: '../comunes/nueva_alerta.jsp',
	caption: "ALERTAS",
	ondblClickRow: function(id){  
                                  var ret = jQuery("#list10").jqGrid('getRowData',id);
                                  
                                  $("#text_desc_alerta").html("Descripción: "+ret.alerta);  
                                  $("#text_prof_alerta").html("Ingresada por: "+ret.prof+"&nbsp;&nbsp; Fecha: "+ret.fecha);                                   
                                  $("#text_id_alerta").val(id);                                   
                                  $("#mensaje_alertas" ).dialog( "open" );
                                  }
	
});
jQuery("#list10").jqGrid('navGrid','#pager10',{add:true,edit:false,del:true,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{width:430,closeAfterAdd: true, closeOnEscape: true,reloadAfterSubmit:true }, //opciones add
							{width:260}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:400} //para el view
 								);
 });

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

         $(document).ready(function(){
             jQuery("#list11").jqGrid({
   	url:'../comunes/carga_recomendaciones.jsp?q=2',
	datatype: "json",
   	colNames:['Tipo','Descripcion','Recomienda','Fecha','Nombre'],
   	colModel:[
   		{name:'id_recom',index:'id_recom', width:0,search:false,hidden:true,editable:false,required :false,editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
   		{name:'d1',index:'d1', width:212,search:true, editable: true,required : true,editoptions: {maxlength: 399},editrules: { required: true },searchoptions:{sopt:['cn','eq']},edittype:"textarea",editoptions:{rows:"3",cols:"45"}},
   		{name:'d2',index:'d2', width:0,search:true,hidden:true,editable:false,required :false, editrules: { edithidden: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'fecha',index:'fecha', width:0,search:true,hidden:true,editable:false,required :false, editrules: { edithidden: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'prof',index:'prof', width:0,search:true,hidden:true,editable:false,required :false, editrules: { edithidden: true },searchoptions:{sopt:['cn','eq']}},
   		
                ],
             gridComplete: function ()
                    {
                      var ids = jQuery("#list11").jqGrid('getDataIDs');
                        
                        
                        for (var i = 0; i < ids.length; i++)
                        {
                            var cl = ids[i];
                            var ret = jQuery("#list11").jqGrid('getRowData',ids[i]);
                            
                              
                           be = "<label style='color: red;font-size:13px' >"+ret.d1+"</label>";
                          
                           jQuery("#list11").jqGrid('setRowData', ids[i], { d1: be });
                        }
                    }, 
   	rowNum:15,
   	rowList:[15,30,45],
   	pager: '#pager11',
   	sortname: 'id_recom',
    viewrecords: true,
    sortorder: "desc",
	//multiselect: false,
        
        shrinkToFit: false,
	scroll:1,
	//gridview: true,
	////loadonce: true,
	height: 'auto',
	//height: 190,
	//height: 'auto',
	width:219,
    //autowidth: true, 
    rownumbers: false,
    editurl: '../comunes/cambia_recom.jsp',
	caption: "RECOMENDACIONES",
	ondblClickRow: function(id){  
                                     var ret = jQuery("#list11").jqGrid('getRowData',id);
                                  
                                  $("#text_desc_recom").html("Descripción: "+ret.d1);  
                                  $("#text_perm_recom").html("Permiso: "+ret.d2); 
                                  $("#text_prof_recom").html("Ingresada por: "+ret.prof+"&nbsp;&nbsp; Fecha: "+ret.fecha);                                   
                                  $("#text_id_perm").val(id);                                   
                                  $("#mensaje_recomend" ).dialog( "open" );
                                    }
	
});

jQuery("#list11").jqGrid('navGrid','#pager11',{add:false,edit:false,del:true,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
							{width:260}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:400} //para el view
 								); 
  jQuery("#list11").jqGrid('navButtonAdd','#pager11',
     {
      caption:"",
      buttonicon:"ui-icon-circle-plus",
      onClickButton:function(){ 
                                   $("#id_perm_para").val("0");
                                   document.getElementById('recomen_dacion').value ="";
                                   $( "#nueva_recom" ).dialog( "open" );
      },
      position:"last",
      title:"Agregar Recomendació",
      cursor: "pointer"});

});

  
  ///////////////////
  $(document).ready(function(){
             jQuery("#list122e").jqGrid({
   	url:'../comunes/carga_consultas_ant.jsp?q=2',
	datatype: "json",
   	colNames:['Cod','Fecha','Tipo',],
   	colModel:[
                {name:'id',index:'id', width:0,hidden:true,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'fecha',index:'fecha', width:61,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'tipo',index:'tipo', width:146,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		],
   	rowNum:3,
   	rowList:[15,30,45],
        pager: jQuery('#pager122e'),
   //	pager: '#pager10',
   	sortname: 'co.fecha',
    viewrecords: true,
    sortorder: "desc",
	//multiselect: false,
	////loadonce: true,
	height: 'auto',
	//height: 190,
    width:219,
    shrinkToFit: false,
    //autowidth: true, 
    rownumbers: false,
    editurl: 'editaCli.php',
	caption: "CONSULTAS ANT",
	ondblClickRow: function(id){             
                                    window.open("../../reportes/reporte_consulta_psico_ant/consulta_psico_ant.jsp?cod_con="+id+"");                                    
                                   }
	
});

 });
/////////////////////////////
//////////tabs///////////////
/////////////////////////////
 $(function() {
        $( "#tabs" ).tabs();
    });
 $(function() {
        $( "#alertas" ).tabs();
    });
   


                 
  function guarda_consulta_psico(){  
      var mot=document.getElementById("motiv_visi_psico").value;
      var evo=document.getElementById("evolu_visi_psico").value; 
      var fam=document.getElementById("familia").value;
      
          mot=mot.replace("'","");
          evo=evo.replace("'","");
          fam=fam.replace("'","");
      
      document.getElementById("motiv_visi_psico").value=mot;
      document.getElementById("evolu_visi_psico").value=evo;
      document.getElementById("familia").value=fam;
      
      if( mot == null || mot.length == 0 || /^\s+$/.test(mot) ) {
                                                      alert('El motivo es obligatorio');
                                                      return false;  
                                                                      } 
      if( evo == null || evo.length == 0 || /^\s+$/.test(evo) ) {
                                                      alert('La evolución es obligatoria');
                                                      return false;  
                                                                      } 
      if( fam == null || fam.length == 0 || /^\s+$/.test(fam) ) {
                                                      alert('Aspectos psicológicos relacionados con la interacción familiar es obligatorio');
                                                      return false;  
                                                                      } 
               //obtener value se select     
               
               
             var ids = jQuery("#listdiag_psico_visi").jqGrid('getDataIDs');
             if(ids.length<1){alert('Agregue al menos un diagnóstico');
                                                       return false; }    
                                                                      
           document.getElementById("estado_civilo_psico").value=document.getElementById("estado_civil").value; 
           document.getElementById("orientacion_psico").value=document.getElementById("orientacion_sex").value; 
   
   
      var r=confirm("¿Está seguro de guardar y finalizar consulta?");
        if (r==true)  {document.form_guarda_visita.submit();  }
        else  {return false; }
                $("#result_guarda_consut" ).dialog( "open" );
                setTimeout("mira_guard()",1500);                          
                                       
                                   }
 function mira_guard(){
     
   $("#result_guarda_consut" ).dialog( "close" );
   var iframe = document.getElementById('if_result_visi_psico');
   var input  = iframe.contentWindow.document.getElementById('guarda_visi_ppsico').value;//consulta
   var input2 = iframe.contentWindow.document.getElementById('guarda_visi_ppsico2').value;//datos per

   if(input==0){alert('Error al guardar consulta');}
   else{location.href="../../agenda_consulta.jsp";}
 }
  
  $(function() {
     $( "#result_guarda_consu" ).dialog({
      autoOpen: false,
      modal: true,
      dialogClass: 'no-close',
      open: function(event, ui) {
  $(this).closest('.ui-dialog').find('.ui-dialog-titlebar-close').hide();
},
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1200
      }
    });});
    
      $(function() { 
     $( "#mensaje_recomend" ).dialog({
      autoOpen: false,
      modal: true,
      width: 500,
      dialogClass: 'no-close',
      /*open: function(event, ui) {
            $(this).closest('.ui-dialog').find('.ui-dialog-titlebar-close').hide();
          },*/
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1200
      }
    });}); 

   $(function() { 
     $( "#mensaje_alertas" ).dialog({
      autoOpen: false,
      modal: true,
      width: 500,
      dialogClass: 'no-close',
      /*open: function(event, ui) {
            $(this).closest('.ui-dialog').find('.ui-dialog-titlebar-close').hide();
          },*/
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1200
      }
    });}); 
    
  $(function() {
     $( "#result_guarda_consut" ).dialog({
      autoOpen: false,
      modal: true,
      dialogClass: 'no-close',
      open: function(event, ui) {
  $(this).closest('.ui-dialog').find('.ui-dialog-titlebar-close').hide();
},
      show: {
        effect: "blind",
        duration: 1
      },
      hide: {
        effect: "explode",
        duration: 1
      }
    });});
    
  $(function() { 
     $( "#borra_embarazo_consu" ).dialog({
      autoOpen: false,
      modal: true,
      dialogClass: 'no-close',
      open: function(event, ui) {
  $(this).closest('.ui-dialog').find('.ui-dialog-titlebar-close').hide();
},
      show: {
        effect: "blind",
        duration: 600
      },
      hide: {
        effect: "explode",
        duration: 600
      }
    });});
      
  $(function() { 
     $( "#nueva_recom" ).dialog({
      autoOpen: false,
      modal: true,
      width:455,
      dialogClass: 'no-close',
    /*  open: function(event, ui) {
  $(this).closest('.ui-dialog').find('.ui-dialog-titlebar-close').hide();
},*/
      show: {
        effect: "blind",
        duration: 600
      },
      hide: {
        effect: "explode",
        duration: 600
      }
    });});
    
function guard(){
                        $("#result_guarda_consu").load("guarda_consulta_m.jsp");
                        setTimeout (function(){ var dat=document.getElementById('acpta_guard_c').value;
                        if(dat==0){location.href="../agenda_consulta.jsp";}
                        else{$("#result_guarda_consut" ).dialog( "close" );
                             $("#result_guarda_consu" ).dialog( "open" );}},800); 
                        }    
function abreDialoGCon(){
                        var dat=document.getElementById('acpta_guard_c').value;
                        if(dat==0){location.href="../agenda_consulta.jsp";}
                        else{$("#result_guarda_consu" ).dialog( "open" );}
                        }
                        
function cierDialoGCon(){
                        $( "#result_guarda_consu" ).dialog( "close" );
                        }   
function cierra_dialog_recom(){$('#mensaje_recomend' ).dialog('close');}

function cierra_dialog_alertas(){$( "#mensaje_alertas" ).dialog( "close" );}

function marc_al_leid(){  
                           if(!confirm("¿Está quitar de la lista la alerta seleccionada? ")) {return false;} 
                                 
                          var ida=document.getElementById('text_id_alerta').value;
                          $("#rrresul").load("../comunes/nueva_alerta.jsp?oper=up&id="+ida);
                          $( "#mensaje_alertas" ).dialog( "close" );
                         setTimeout (function(){   jQuery("#list10").jqGrid('setCaption',"ALERTAS ").trigger('reloadGrid');
                                           },800);
                      }
function marc_re_leid(){  if(!confirm("¿Está quitar de la lista la recomendación seleccionada? ")) {return false;} 
                           var ida=document.getElementById('text_id_perm').value;
                          $("#rrresul").load("../comunes/cambia_recom.jsp?oper=up&id="+ida);
                          $( "#mensaje_recomend" ).dialog( "close" );
                         setTimeout (function(){   jQuery("#list11").jqGrid('setCaption',"RECOMENDACIONES ").trigger('reloadGrid');
                                           },800);
                        }             
 /////////////////////////////////////////////////////
 ////////////// visita ///////////////////////////////
 /////////////////////////////////////////////////////
 var cajapsico1_visi="";
    var cajapsico2_visi="";

     function abreDialogPsico_visi(dato1,dato2){
                               var bb=document.getElementById("display_psico_visi");
                                     bb.style.display="none";
                                     
                               cajapsico1_visi=dato1;
                               cajapsico2_visi=dato2;
                               $("#dilog_cie10_psico_visi").dialog("open");
                                 }
   $(function() {
     $( "#dilog_cie10_psico_visi" ).dialog({
      autoOpen: false,
      modal: true,
      show: {
        effect: "blind",
        duration: 500
      },
      hide: {
       // effect: "explode",
        effect: "drop", 
        duration: 1000
      },
      width:'800px'
    });}); 
                  
 $(document).ready(function(){
 

//////////////////////////////////////////////////7
////////////////////////////////////////////////7
      
    jQuery("#listcie10_psico_visi").jqGrid({
   	url:'../comunes/carga_cie10.jsp?q=2',
	datatype: "json",
   	colNames:['id','Codigo','DescripciÃ³n','grupo'],
   	colModel:[
                {name:'id',index:'id',hidden:true,width:0,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'id_subcie10',index:'id_subcie10', width:60,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcion',index:'d2', width:700,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripciong',index:'d1',hidden:true,width:1,editable: false,required : true,editoptions:{maxlength: 63}},
   	       ],
   	rowNum:11,
   	rowList:[10,20,30,40,400],
   	pager: '#pagercie10_psico_visi',
   	sortname: 's.id_subcie10',
        viewrecords: true,
        sortorder: "asc",
        height: 339,
        width:775,
        shrinkToFit: false,//columnas tamaÃ±o dato
        grouping:true,         
        groupingView : {
   		groupField : ['descripciong']
   	},   
        rownumbers: false,
	caption: "CIE 10",
	ondblClickRow: function(id){
                                    var ret = jQuery("#listcie10_psico_visi").jqGrid('getRowData',id);
                                    //alert(""+ret.id_subcie10+" "+ret.descripcion+"");   
                                    document.getElementById(""+cajapsico1_visi+"").value=""+ret.id_subcie10;
                                    document.getElementById(""+cajapsico2_visi+"").value=""+ret.descripcion;
                                    $("#dilog_cie10_psico_visi").dialog( "close" );
                                  }	
});

 
          jQuery("#listcie10_psico_visi").jqGrid('navGrid','#pagercie10_psico_visi',{add:false,edit:false,del:false,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
			     {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
			     {}, //opciones del
 			     {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 		             {width:420} //para el view
 		);
            
        jQuery('#listcie10_psico_visi').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
        
                         


 });
    function pasadatopsico(nom,nom2,dato){
                      
                                     document.getElementById("diagnosticoppsico_visi").value=nom;
                                     document.getElementById("diagnosticoppsico2_visi").value=nom2;
                                     var bb=document.getElementById("display_psico_visi");
                                     bb.style.display="none";
                                    
                              }
   $(document).ready(
 function(){
	  $("#diagnosticoppsico_visi").keyup(
			      function(){
					var searchbox = $(this).val();
					var dataString = 'searchword='+ searchbox;
					
                                        if(searchbox==''){
					             var bb=document.getElementById("display_psico_visi");
                       			             bb.style.display="none";
                                                     document.getElementById("diagnosticoppsico2_visi").value='';
							  }
					else{
					    $.ajax({
					    type: "POST",
					    url: "../comunes/auto_completa_cie10.jsp?dato=p",
					    data: dataString,
					    cache: false,
					    success: function(html){ $("#display_psico_visi").html(html).show();
                                                                      var canti=document.getElementById("cantidaddp").value;
                                                                       if(canti==1){document.getElementById("diagnosticoppsico2_visi").value=""+document.getElementById("nomcie10p").value;
                                                                                    var bb=document.getElementById("display_psico_visi");
                                                                                    bb.style.display="none";
                                                                                   }
                                                                        else{document.getElementById("diagnosticoppsico2_visi").value='';}
                                                                    }
			                     });
                                            
			                  }
			                return false;    
			                    }
                                         
	 	             );
 } );

    
 /////////////////////////////////////////////////////
 /////////////////////////////////////////////////////
 /////////////////////////////////////////////////////
$(document).ready(function(){      
 var anchoPantallaapsico=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
    jQuery("#listdiag_psico_visi").jqGrid({
   	url:'../comunes/carga_diag_psico.jsp?q=2',
	datatype: "json",
   	colNames:['id','Tipo','Cod','Diagnostico','Tipo Diagnostico','Causa Externa','Observaciones'],
   	colModel:[
                 {name:'id',index:'id',hidden:true,width:0,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'id_subcie10',index:'id_subcie10', width:((anchoPantallaapsico*6)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'id_subcie10',index:'id_subcie10', width:((anchoPantallaapsico*4)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcion',index:'d2', width:((anchoPantallaapsico*34)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcitong',index:'drr1',width:((anchoPantallaapsico*12)/100),editable: false,required : true,editoptions:{maxlength: 63}},
   	        {name:'descripcditong',index:'ddrr1',width:((anchoPantallaapsico*15)/100),editable: false,required : true,editoptions:{maxlength: 63}},
   	        {name:'descriptciong',index:'dr1',width:((anchoPantallaapsico*22)/100),editable: false,required : true,editoptions:{maxlength: 63}},
   	           ],
   	rowNum:11,
   	rowList:[10,20,30,40,400],
   	pager: '#pagerdiag_psico_visi',
   	sortname: 's.id_subcie10',
        viewrecords: true,
        sortorder: "asc",
        height: 92,
        width:(anchoPantallaapsico-40),
        shrinkToFit: false,//columnas tamaño dato
        rownumbers: false,
    /*  grouping:true,         
        groupingView : {
   		groupField : ['descripciong']
   	}, */  
        rownumbers: false,
        editurl: '../comunes/quita_diag_psico.jsp',
	caption: "Diagnosticos",
	ondblClickRow: function(id){   }	
});
  jQuery("#listdiag_psico_visi").jqGrid('navGrid','#pagerdiag_psico_visi',{add:false,edit:false,del:false,search:false,view:true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
			     {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
			     {width:320}, //opciones del
 			     {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 		             {width:420} //para el view
 		);
  jQuery("#listdiag_psico_visi").jqGrid('navButtonAdd','#pagerdiag_psico_visi',
     {
      caption:"",
      buttonicon:"ui-icon-trash",
      onClickButton:function(){ 
                                var id = jQuery("#listdiag_psico_visi").jqGrid('getGridParam','selrow');
                                if (id)	{
                                        var ret = jQuery("#listdiag_psico_visi").jqGrid('getRowData',id);
                                        
                                        apprise("¿Esta seguro de eliminar el diagnostico seleccionado: "+ret.id_subcie10+" ?", {'verify':true}, function(opcion) {
                                            if(opcion) {  $("#qcie_10").val(""+ret.id_subcie10+"");
                                                          document.quitadiag.submit();  
                                                          setTimeout ('recar()', 500);                                                          
                                                    }
                                           });
                                }else { alert("Selecciona la fila a eliminar");}
                                
                              },
      position:"last",
      title:"Quitar diagnostico",
      cursor: "pointer"});                            


 
 $('#nuevo_diag_psico').submit(function() {
                            var nom = document.getElementById("diagnosticoppsico2_visi").value; 
                           if( nom == null || nom.length == 0 || /^\s+$/.test(nom) ) {
                                                      alert('El diagnostico es obligatorio');
                                                      return false;  
                                                                      }   
                            var nom2 = document.getElementById("observaciones_visi").value; 
                      /*     if( nom2 == null || nom2.length == 0 || /^\s+$/.test(nom2) ) {
                                                      alert('La observación es obligatorioa');
                                                      return false;  
                                                                      } */
                           if( nom2.length >= 399 ) {
                                                      alert('La observación tiene como maximo 399 caracteres');
                                                       return false;  
                                                                      }                                        
                           var ids = jQuery("#listdiag_psico_visi").jqGrid('getDataIDs');
                        
                          if(ids.length==4){alert('Solo se permite un diagnostico principal y tres relacionados');
                                                       return false; }
                    // Enviamos el formulario usando AJAX
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#resu_visi_psico').html(data);
                                  //actualiza la tabla
                                  jQuery("#listdiag_psico_visi").jqGrid('setCaption',"Diagnosticos ").trigger('reloadGrid');	
                                  document.getElementById("observaciones_visi").value="";
                                  document.getElementById("diagnosticoppsico2_visi").value="";
                                  document.getElementById("diagnosticoppsico_visi").value="";
                                  $("#tipodiagnostico_visi").val("");
                                  $("#causaexterna_visi").val("");
                               }                             
                          })
                     
                          return false;
                      });  

 });
 function recar(){jQuery("#listdiag_psico_visi").jqGrid('setCaption',"Diagnosticos ").trigger('reloadGrid'); }
</script>        
        

	<style type="text/css">
	body{
		font: 62.5% "Trebuchet MS", sans-serif;
		margin: 5px;
	}
	#dsa{padding: 5px 5px 0px 5px;}
	label,option,select{font-family:"Eras Medium ITC";
	      color:#2779aa;
          font-size:11pt;}
	
	
	#figu:hover{
	       background-color:#3baae3;                                
	       cursor:pointer;                                
	       border-radius: 10px;                           
	       }
    legend{font-family:"Eras Bold ITC";
	       font-size:11pt;
    	   color:#2779aa;}
    fieldset{border:1px #2779aa solid;
             -webkit-border-radius: 10px;
             -moz-border-radius: 10px;
             border-radius: 10px;} 
             
    #aceptar{font-family:"Eras Medium ITC";
   			color:#2779aa;
          font-size:11pt; background:white;
         
          -webkit-border-radius: 10px;
          -moz-border-radius: 10px;
           border-radius: 10px;
         }
    #aceptar:hover {
     	 background: #3baae3;
 	     border-top-color: #3baae3;
         color: #ffffff;
         cursor: pointer;
		}
	h2{
		color:#2779aa;
	}
	
	
	</style>
</head>
<body >
   
       
    <%
             
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || request.getParameter( "s_agenda" )==null || request.getParameter("s_paciente")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="/ISALUD/index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
    
            
            String ced_pacinet=request.getParameter("s_paciente");            
            String cod_agenda=request.getParameter("s_agenda");  
            int id_consulta=-1;
            try{id_consulta=Integer.parseInt(""+request.getParameter("id_consultaaa")+"");}catch(Exception es){id_consulta=-1;}
            
            int hitocreada=0;//para saber si se crea la historia por primera vez
            
            conecta_bd ba = new conecta_bd();
            ba.ConectaDb();
         
          //  System.out.println("INSERT INTO `ips_isalud`.`histo_psicologica` (`serial`, `fecha_apertura`) VALUES ('"+ced_pacinet+"',now());"); 
            if(ba.transaccion("INSERT INTO `ips_isalud`.`histo_psicologica` (`serial`, `fecha_apertura`) VALUES ('"+ced_pacinet+"',now());")){hitocreada=1;}
            
            if(id_consulta == -1 ){
            String cons_a="select max(id_consulta) from consulta_psico where id_tipo='1' and guardado='0' and id_historia='"+ced_pacinet+"' and id_consulta not in (select id_consulta from agenda where (id_permiso='5' or id_permiso='14' ) and id_agenda != '"+cod_agenda+"' and id_consulta != 'null' )";
            
            ResultSet resu2a=ba.consultas(cons_a);
                        try{
                            while (resu2a.next()&&resu2a!=null) {   
                               id_consulta=Integer.parseInt(resu2a.getString(1));                           
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cierraResultado(resu2a);         
             if(id_consulta==-1){
                if(ba.transaccion("INSERT INTO `ips_isalud`.`consulta_psico` (`id_historia`, `id_tipo`, `guardado`) VALUES ('"+ced_pacinet+"', 1, 0);")){
                        ResultSet resu2aa=ba.consultas(cons_a);
                        try{
                            while (resu2aa.next()&&resu2aa!=null) {   
                               id_consulta=Integer.parseInt(resu2aa.getString(1));                           
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cierraResultado(resu2aa); 
                           }
                     else{out.print("<center><h1>Falla al iniciar visita</h1></center>");}          

             }
                                       }        
                ba.transaccion("SET SQL_SAFE_UPDATES=0;");
                ba.transaccion("DELETE FROM `ips_isalud`.`impre_diagno_psico` WHERE `id_consulta_psico`='"+id_consulta+"';");
              //  System.out.println("DELETE FROM `ips_isalud`.`impre_diagno_psico` WHERE `id_consulta_psico`='"+id_consulta+"';");
                ba.transaccion("SET SQL_SAFE_UPDATES=1;");
                
                
               session.setAttribute("serial_pacinete",ced_pacinet);
               session.setAttribute("serial_consulta",id_consulta);               
               session.setAttribute("histocreada_psico",hitocreada);
               session.setAttribute("serial_agenda",cod_agenda);
              String genero="";
              
                ba.transaccion("UPDATE `ips_isalud`.`agenda` SET `id_consulta`='"+id_consulta+"' WHERE `id_agenda`='"+cod_agenda+"' ;");
            
                     
                        String sql="select genero from personas where serial='"+ced_pacinet+"'";    
                        ResultSet resu2=ba.consultas(sql);
                        try{
                            while (resu2.next()&&resu2!=null) {   
                               genero=resu2.getString(1);                           
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cierraResultado(resu2);
    //    System.out.println("nombre "+(String)session.getAttribute("nombre")+" clave "+(String)session.getAttribute("clave")+" id "+session.getAttribute("id")+" permiso "+(String)session.getAttribute("permiso")+" agenda"+(String)session.getAttribute("serial_agenda")+" serial pacinete "+(String)session.getAttribute("serial_pacinete"));
                session.setAttribute("generop",genero);
                  
    %>
    
<table border="0" style="height:100%;width:100%">
<tr style="height:100px">
<td colspan="2">
<center><img src="../../imagenes/fotos/baner.png" alt="imagen no encontrada" height="100px" width="100%"></center>
</td>
</tr>

<tr >
<!-- zona alertas -->
<td style="width:250px" >
<div id="alertas" style="width:250px; height:100%; overflow:auto;">
<table border="0" style="height:100%;width:100%">
<!-- alertas -->
<tr>
<td>
<div id="dsa">
<center>
<table id="list10" ></table>
<div id="pager10"></div> 
</center>
</div>
</td></tr>
<!-- recomedaciones -->
<tr><td>
<div id="dsa">
<center>
<table id="list11" ></table>
<div id="pager11"></div> 
</center>
</div>
</td></tr>
<!-- consultas anteriores -->
<tr><td>
<div id="dsa">
<center>
<table id="list122e" ></table>
<div id="pager122e"></div> 
</center>
</div>
</td></tr>

</table>
</div>
</td>

<td>
<div id="tabs" style="height:100%;width:99%;">
    <ul>    
        <li><a href="#tabs-1" >Datos Personales</a></li>
        <li><a href="#tabs-2" >Visita</a></li>
        <li><a href="#tabs-3" >Consulta Completa Anterior</a></li>
        
    </ul>
    <div id="tabs-1" style="height:400px;width:1012px;overflow:auto;">    </div>
    <div id="tabs-2" style="height:400px;width:1012px;overflow:auto;"> 
    
     <%  
        
         String sqll="select count(idtipodiag) from tipo__diagnostico;";
          int tamañotipodiag=0;  
           ResultSet resuu=null;
          try{  
           resuu=ba.consultas(sqll);
           while (resuu.next()&&resuu!=null) { 
                         tamañotipodiag=Integer.parseInt(""+resuu.getString(1)+"");
                     }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        //System.out.println("tamaño "+tamañotipodiag);
        ////////////////////////////////////////////////777
           
        ba.cierraResultado(resuu); 
         String tipodiag[][]=new String[tamañotipodiag][2];

          sqll="select idtipodiag,descripcion from tipo__diagnostico order by idtipodiag";
       
           ResultSet resuu2=null;
          try{  
           resuu2=ba.consultas(sqll);
           int temp=0;
           while (resuu2.next()&&resuu2!=null) { 
                         tipodiag[temp][0]=""+resuu2.getString(1);
                         tipodiag[temp][1]=""+resuu2.getString(2);
                         temp++;
                     }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        
        ba.cierraResultado(resuu2);  
                             
      /////////////////////////////////////////////////////////////////////////////77  
       int tamañocausaexterna=0;
       String sqqll="select count(idcausa) from causa_externa";
       
           ResultSet ressuu=null;
          try{  
           ressuu=ba.consultas(sqqll);
           while (ressuu.next()&&ressuu!=null) { 
                        tamañocausaexterna=Integer.parseInt(ressuu.getString(1));
                     }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        
        ba.cierraResultado(resuu);
        String causaexterna[][]=new String[tamañocausaexterna][2];
        
         sqqll="select idcausa,descripcion from causa_externa order by idcausa";
       
           ResultSet ressuu2=null;
          try{  
           ressuu2=ba.consultas(sqqll);
           int temp=0;
           while (ressuu2.next()&&ressuu2!=null) { 
                         causaexterna[temp][0]=""+ressuu2.getString(1);
                         causaexterna[temp][1]=""+ressuu2.getString(2);
                         temp++;
                       //  System.out.println("nid:"+causaexterna[temp][0]+" dato"+causaexterna[temp][1]+" temo:"+temp);
                                                 }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        
        ba.cierraResultado(resuu2);                                
     %>
    <iframe  id="if_result_visi_psico" name="if_result_visi_psico" src="" style="border-width:0px;width:90%;height:1px">
     </iframe> 
     
     <form id="form_guarda_visita" name="form_guarda_visita" action="guarda_visita_psico.jsp" target="if_result_visi_psico" >
         
    <!--     <center><input type="submit" value="Guardar" id="aceptar" name="aceptar"></center><br> onsubmit="return guarda_consulta_psico();" -->
            <fieldset>
                <legend>Motivo de la Visita:</legend>
                <textarea id="motiv_visi_psico" name="motiv_visi_psico" rows="5" style="width:100%"></textarea>
            </fieldset>
            <fieldset>
                <legend>Evolucion del Paciente:</legend>
                <textarea id="evolu_visi_psico" name="evolu_visi_psico" rows="5" style="width:100%"></textarea>
            </fieldset>
            <fieldset>
                <legend>Aspectos psicológicos relacionados con la interacción familiar:</legend>
                <textarea id="familia" name="familia" rows="5" style="width:100%"></textarea>
            </fieldset>
    
         <input type="hidden" id="estado_civilo_psico" name="estado_civilo_psico">
         <input type="hidden" id="orientacion_psico" name="orientacion_psico">
       </form>  
    
<fieldset>
<legend>Diagonostico:</legend>
<form method="post" action="../comunes/agrega_diag_psico.jsp" id="nuevo_diag_psico" name="nuevo_diag_psico">
   <table style="width:100%" border="0">
    <tr>
        <td colspan="3"><label>Diagnostico principal</label></td>
        <td><label style="padding-left:10px">Tipo Diagnostico</label></td>
        <td><label style="padding-left:10px">Causa Externa</label></td>
    </tr>
    <tr>
        <td  style="width:40px"> 
            <input type="text" id="diagnosticoppsico_visi" name="diagnosticoppsico_visi" class="diagnosticoppsico_visi"  autocomplete="off"  style="width:100%">
             <div id="display_psico_visi"></div> 
        </td>
        <td  style="width:40px">
    <center>  <img src="../../imagenes/fotos/buscar.png" id="busca" name="busca" class="mas" alt="falla al cargar imagen" width="18px" height="18px" onclick="abreDialogPsico_visi('diagnosticoppsico_visi','diagnosticoppsico2_visi');" > </center>
        </td>
        <td  style="width:50%">
           <input type="text" id="diagnosticoppsico2_visi" name="diagnosticoppsico2_visi" class="diagnosticoppsico2_visi" disabled="true"  style="width:100%"> 
        </td>
        <td><center>
            <select name="tipodiagnostico_visi" id="tipodiagnostico_visi" style="width:90%">

                <%
                   for(int i=0;i<tamañotipodiag;i++){
                   //    System.out.println("<option value='"+tipodiag[i][0]+"'>"+tipodiag[i][1]+"</option>");
                             out.println("<option value='"+tipodiag[i][0]+"'>"+tipodiag[i][1]+"</option>");
                                                    }
                %>
            </select>
            </center>
        </td>
        <td>
            <center> 
           <select name="causaexterna_visi" id="causaexterna_visi" style="width:90%">
                    <%
                    for(int i=0;i<tamañocausaexterna;i++){
                    //    System.out.println("tttt <option value='"+causaexterna[i][0]+"'>"+causaexterna[i][1]+" i==>"+i+"</option>");
                              out.println("<option value='"+causaexterna[i][0]+"'>"+causaexterna[i][1]+"</option>");
                                                     }
                 %>
             </select> 
             </center>
        </td>
    </tr>
    </table>
             <table style="width:100%">  
     <tr>
         <td colspan="5" >
            <label>Observaciones:</label><br>
            <textarea name="observaciones_visi" id="observaciones_visi" rows="2" style="width:95%"></textarea>
            &nbsp;&nbsp;<input type="image" src="../../imagenes/fotos/agregar.png" style="width:25px;height:25px" alt="fallo">
            <br>
        </td>
    </tr>
     </table>
 </form>    
     <table> 
    <tr>
        <td colspan="5"><br>
              <table id="listdiag_psico_visi" ></table>
              <div id="pagerdiag_psico_visi"></div>             
        </td>
    </tr>
</table>
</fieldset>


<br>
<div name="dilog_cie10_psico_visi" id="dilog_cie10_psico_visi" >  
                                 <table id="listcie10_psico_visi" ></table>
                                 <div id="pagercie10_psico_visi"></div> 
</div> 
<div id="resu_visi_psico" name="resu_visi_psico" ></div>
    
    	  <iframe name="el-iframe5" id="el-iframe5" style="display:none"></iframe>
<form id="quitadiag" name="quitadiag" method="post" target="el-iframe5" accept-charset="UTF-8" action="../comunes/quita_diag_psico.jsp">
    <input type="hidden" id="qcie_10" name="qcie_10">
</form>   <!--
          /////////////////////////////////////////////////////
          ///////////////hasta aca visita//////////////////////
          /////////////////////////////////////////////////////
          -->
    </div>
    <div id="tabs-3" style="height:400px;width:1012px;overflow:auto;">    </div>
   
</div>

</td>
</tr>

</table>
<script type="text/javascript" language="javascript">
//document.writeln("<b>Tú resolución es de:</b> " + screen.width + " x " + screen.height +"");
var hoja = document.createElement('style')
  var element = document.getElementById("tabs-1");
  element.style.width= ""+(screen.width-320)+"px";
  element.style.height= ""+(screen.height-330)+"px";
   var element2 = document.getElementById("tabs-2");
  element2.style.width= ""+(screen.width-320)+"px";
  element2.style.height= ""+(screen.height-330)+"px";
   var element3 = document.getElementById("tabs-3");
  element3.style.width= ""+(screen.width-320)+"px";
  element3.style.height= ""+(screen.height-330)+"px";

</script>

<div id="caja2" style="position:absolute;visibility:visible;position:absolute;right:20px;top: 3px;text-align: right;width:615px" >
 <h2><% out.print(""+(String)session.getAttribute("nombre")+""); %></h2>     
<input type="button" value="Agenda" name="aceptar" size="25" id="aceptar" maxlength="30" onclick="agenda()">
<input type="button" value="Guardar" name="aceptar" size="25" id="aceptar" maxlength="30" onclick="guarda_consulta_psico()">
<br> 
<!-- <input type="button" value="Cerrar Sesion" name="aceptar" size="25" id="aceptar" onclick="cierra();" >  -->
</div>



<div id="result_guarda_consu" name="result_guarda_consu"></div>
<div id="result_guarda_consut" name="result_guarda_consut">
     <center> 
        <input type="image" size="25" id="fo" src="../../imagenes/fotos/cargando.gif" alt="cargando"  onerror="this.src='../imagenes/fotos/cargando.gif'" style="height:200px">
    </center>
</div>

        
    <div id="mensaje_alertas" name="mensaje_alertas">
        <center> <h2>Alerta</h2></center><br>
            <label id="text_prof_alerta" name="text_prof_alerta">Ingresada por: </label><br>            
            <label id="text_desc_alerta" name="text_desc_alerta">Descripción: </label><br>
            <input type="hidden" id="text_id_alerta" name="text_id_alerta"><br>
            <center><input type="button" id="aceptar" value="Quitar de la Lista" onclick="marc_al_leid()" >&nbsp<input type="button" id="aceptar" value="Cerrar" onclick="cierra_dialog_alertas()"></center>
    </div> 
     <div id="mensaje_recomend" name="mensaje_recomend">
        <center> <h2>Recomendaciones</h2></center><br>
        
            <label id="text_prof_recom" name="text_prof_recom">Ingresada por: </label><br>
            <label id="text_perm_recom" name="text_perm_recom">Permiso: </label><br> 
            <label id="text_desc_recom" name="text_desc_recom">Descripción: </label><br>
            <input type="hidden" id="text_id_perm" name="text_id_perm"><br>
            <center><input type="button" id="aceptar" value="Quitar de la Lista" onclick="marc_re_leid()" >&nbsp<input type="button" id="aceptar" value="Cerrar" onclick="cierra_dialog_recom()"></center>
    </div>     
    <div id="nueva_recom" name="nueva_recom">
        <center> <h2>Nueva Recomendación</h2></center><br>
        <form id="form_recomend" name="form_recomend" action="../comunes/nueva_recomend.jsp" method="post">
        <table >
            <tr>
                <td style="width:60px"><label>Para: </label></td>
                <td style="text-align:left">
                    <select id="id_perm_para" name="id_perm_para">
                        <option value="0">Seleccione una opción</option>
                        <option value="1">Enfermeria</option>
                        <option value="2">Medicina</option>
                        <option value="3">Medicina Especializada</option>
                        <option value="4">Nutricion</option>
                        <option value="5">Psicologia</option>
                        <option value="6">Trabajo Social</option>
                    </select>                    
                </td>
            </tr>
            <tr >
                <td valign="top"><label>Recomendación: </label></td>
           </tr>
           <tr>
               <td colspan="2">
                   <textarea style="width:420px;" rows="4" maxlength="399" id="recomen_dacion" name="recomen_dacion"></textarea>                    
                </td>
            </tr>
            <tr>
               <td colspan="2">
                  <center><input type="submit" id="aceptar" name="aceptar" value="Guardar"></center>                  
                </td>
            </tr>
        </table>
            </form>
    </div>   
        <div id="rrresul" name="rrresul"></div>   
  <script type="text/javascript">
      $("#tabs-1").load("../comunes/datospersonales.jsp");      
      $("#tabs-3").load("../comunes/consulta_psico_ant.jsp?codpac=<% out.print(ced_pacinet); %>");
    //  $("#tabs-2").load("visitapsicologia.jsp")        
  </script>   
  <% ba.cerrar(); %>
</body>
</html>