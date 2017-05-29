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
	
	<link rel="shortcut icon" href="../imagenes/fotos/favicon.ico">
        <link rel="stylesheet" type="text/css" media="screen" href="../jquery/css/flick/jquery-ui-1.9.2.custom.css" >
        <link rel="stylesheet" type="text/css" media="screen" href="../jquery/jqgrid/css/ui.jqgrid.css" >
        <link rel="stylesheet" type="text/css" media="screen" href="../jquery/bajados/ui.multiselect.css" >
       	<script src="../jquery/bajados/jquery.min.js" type="text/javascript"></script> 
        <script type="text/javascript" language="javascript" src="../jquery/js/jquery-ui.js"></script>
	<script src="../jquery/jqgrid/js/i18n/grid.locale-es.js" type="text/javascript"></script>
        <script src="../jquery/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
        <link type='text/css' href='../jquery/bajados/modal/osx.css' rel='stylesheet' media='screen'>
        <script type='text/javascript' src='../jquery/bajados/modal/jquery.simplemodal.js'></script>
        <script type="text/javascript" src="../jquery/bajados/jquery.previewInputFileImage.js"></script> 
        <script type="text/javascript" src="../jquery/bajados/jquery.ui.datepicker-es.js"></script> 
        
       <script src="../jquery/apprise/apprise-1.5.min.js" type="text/javascript"></script> 
       <link type='text/css' href='../jquery/apprise/apprise.min.css' rel='stylesheet' media='screen'>
       
             
     
        
<script type="text/javascript" language="javascript">
    var pestaña=-1;
    if(document.getElementById) {
    window.alert = function(txt) {
        apprise(txt);
    }
}

    function agenda(){
                         apprise("¿Esta seguro de salir sin guardar", {'verify':true}, function(opcion) {
                                                            if(opcion) {                                                                         
                                                                       location.href="borra_consulta.jsp";
                                                                       }
                                                           }); 
                }
    function cierra(){
                               location.href="../cierra_sesion.jsp";    
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
   	url:'carga_alertas.jsp?q=2',
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
        editurl: 'nueva_alerta.jsp',
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
   	url:'carga_recomendaciones.jsp?q=2',
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
    editurl: 'cambia_recom.jsp',
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
   	url:'carga_consultas_ant.jsp?q=2',
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
                                    window.open("../reportes/reporte_consulta_med_ant/consulta_medica_ant.jsp?cod_con="+id+"");                                    
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
   

function enviaf1(){document.consulta_f1.submit();return true;}  
function enviaf2(){document.consulta_f2.submit();return true;} 

function cambiaPestanaconsu(pstana){
    
                      
                       if(pstana!=pestaña){
                               if(pestaña==1){                                   
                                   document.modifdatosp.submit();
                                   <%
                                   request.setCharacterEncoding("UTF-8");
                                    conecta_bd ba = new conecta_bd();
                                    
                                    ba.ConectaDb();
                                    String genero1="";                                    
                                    String sqlconsu="select genero from personas where serial='"+request.getParameter("s_paciente")+"'";
                                    ResultSet re=ba.consultas(sqlconsu);
                                                try{
                                                    while (re.next()&&re!=null) {   
                                                       genero1=re.getString(1);                           
                                                    }
                                                }
                                                catch(SQLException e){}
                                                catch(Exception ex){}
                                                ba.cierraResultado(re);
                            
                                   if(genero1.compareTo("Femenino")==0){
                                                 out.print("document.modifdatoanto.submit();");
                                                                      }
                                   %>
                                              }
                               else if(pestaña==2){                                   
                                   document.consulta_f1.submit();
                                   document.consulta_f2.submit();
                                   <%
                                   request.setCharacterEncoding("UTF-8");
                                    String per=""+session.getAttribute("permiso");
                                   if(per.compareTo("3")==0){
                                   out.print("document.consulta_f3.submit();");
                                   out.print("document.consulta_f4.submit();");
                                                             }
                                   %>
                                              }//forms guardar
                               else if(pestaña==9){                
                                 //  document.carne_f1.submit();
                                    document.carne_f1.submit();   
                                    document.carne_f2.submit();  
                                    document.carne_f3.submit();
                                    document.carne_f4.submit();
                                    document.carne_f5.submit();
                                    document.carne_f6.submit();  
                                              }
                             if(pstana==0){document.getElementById('tabs-2').style.display = 'none';
                                         document.getElementById('tabs-1').style.display = 'block';
                                         $("#tabs-1").load("datospersonales.jsp?c=0");pestaña=1;}
                           else if(pstana==1){document.getElementById('tabs-2').style.display = 'none';
                                         document.getElementById('tabs-1').style.display = 'block';
                                         $("#tabs-1").load("datospersonales.jsp?c=1");pestaña=1;}
                           else if(pstana==2){document.getElementById('tabs-2').style.display = 'none';
                                              document.getElementById('tabs-1').style.display = 'block';
                                              $("#tabs-1").load("consultamedicageneral.jsp");pestaña=2;}
                           else if(pstana==3){document.getElementById('tabs-2').style.display = 'none';
                                              document.getElementById('tabs-1').style.display = 'block';
                                              $("#tabs-1").load("formulamedica.jsp");pestaña=3;}
                           else if(pstana==4){document.getElementById('tabs-2').style.display = 'none';
                                              document.getElementById('tabs-1').style.display = 'block';
                                              $("#tabs-1").load("solicitud_laboratorio.jsp");pestaña=4;}
                           else if(pstana==5){document.getElementById('tabs-2').style.display = 'none';
                                              document.getElementById('tabs-1').style.display = 'block';
                                              $("#tabs-1").load("remision_especialista.jsp");pestaña=5;}
                           else if(pstana==6){document.getElementById('tabs-2').style.display = 'none';
                                              document.getElementById('tabs-1').style.display = 'block';
                                              $("#tabs-1").load("imagenes.jsp");pestaña=6;}
                           else if(pstana==7){document.getElementById('tabs-2').style.display = 'none';
                                              document.getElementById('tabs-1').style.display = 'block';
                                              $("#tabs-1").load("reportes_laboratorios.jsp");pestaña=7;}
                           else if(pstana==8){document.getElementById('tabs-2').style.display = 'none';
                                              document.getElementById('tabs-1').style.display = 'block';
                                              $("#tabs-1").load("reportes_imagenes.jsp");pestaña=8;}
                           else if(pstana==9){document.getElementById('tabs-2').style.display = 'none';
                                              document.getElementById('tabs-1').style.display = 'block';
                                              $("#tabs-1").load("carnet_perinatal.jsp");pestaña=9;}
                           else if(pstana==10){document.getElementById('tabs-1').style.display = 'none';
                                               document.getElementById('tabs-2').style.display = 'block';
               <% String d0=""+session.getAttribute("permiso")+""; if(d0.compareTo("1")!=0){ %>  $("#soli_labo").load("solicitud_laboratorio.jsp"); <% }  %>
                                                $("#resu_labo").load("reportes_laboratorios.jsp");
                                               pestaña=10;nada();}
                           else if(pstana==11){document.getElementById('tabs-1').style.display = 'none';
                                               document.getElementById('tabs-2').style.display = 'block';
                <% if(d0.compareTo("1")!=0){ %> $("#soli_labo").load("imagenes.jsp"); <% } %>
                                                $("#resu_labo").load("reportes_imagenes.jsp");
                                               pestaña=11;nada();}
                           else if(pstana==12){document.getElementById('tabs-2').style.display = 'none';
                                               document.getElementById('tabs-1').style.display = 'block';
                                               $("#tabs-1").load("soli_no_pos.jsp");pestaña=12;}
                           else if(pstana==13){document.getElementById('tabs-2').style.display = 'none';
                                               document.getElementById('tabs-1').style.display = 'block';
                                               $("#tabs-1").load("soli_no_pos_med_gen.jsp");pestaña=5;}
                                              }
                          }    
function carga(){
  // $("#soli_labo").load("solicitud_laboratorio.jsp");
  // $("#resu_labo").load("reportes_laboratorios.jsp");
   
 //  $("#soli_imag").load("imagenes.jsp");
 //  $("#resu_imag").load("reportes_imagenes.jsp");
  // setTimeout ('nada ()', 1000); 
}
  function nada(){
       $( "#accordionadmincm" ).accordion({
      heightStyle: "content",     //lo de abajo no es falla ta bien
    <% if(d0.compareTo("1")!=0){ %>   active: false, <% } %>
                
      collapsible: true 
    });
    
    //$("#soli_labo").hide();
  }                          
  function nada2(){
    
    
    //$("#soli_labo").hide();
  } 
  /*               
 $(function() {
    $( "#accordionadmincm" ).accordion({
      heightStyle: "content",
      collapsible: true
    });
  });       */                  
  function guarda_consulta(){  
      apprise("¿Está seguro de guardar y finalizar consulta?", {'verify':true}, function(opcion) {
                                                            if(opcion) {guarda_consulta2();}
                                                           }); 
  }
 function guarda_consulta2(){                                                            
    if(pestaña==1){                                   
                                   document.modifdatosp.submit();
                                   <%
                                   request.setCharacterEncoding("UTF-8");
                                   
                                    genero1="";                                    
                                    sqlconsu="select genero from personas where serial='"+request.getParameter("s_paciente")+"'";
                                    ResultSet re2=ba.consultas(sqlconsu);
                                                try{
                                                    while (re2.next()&&re2!=null) {   
                                                       genero1=re2.getString(1);                           
                                                    }
                                                }
                                                catch(SQLException e){}
                                                catch(Exception ex){}
                                                ba.cierraResultado(re2);
                            
                                   if(genero1.compareTo("Femenino")==0){
                                                 out.print("document.modifdatoanto.submit();");
                                                                      }
                                   %>
                                              }
                               else if(pestaña==2){                                   
                                   document.consulta_f1.submit();
                                   document.consulta_f2.submit();
                                   <%
                                   request.setCharacterEncoding("UTF-8");
                                   per=""+session.getAttribute("permiso");
                                   if(per.compareTo("3")==0){
                                   out.print("document.consulta_f3.submit();");
                                   out.print("document.consulta_f4.submit();");
                                                             }
                                   %>
                                              }//forms guardar
                               else if(pestaña==9){                
                                 //  document.carne_f1.submit();
                                    document.carne_f1.submit();   
                                    document.carne_f2.submit();  
                                    document.carne_f3.submit();
                                    document.carne_f4.submit();
                                    document.carne_f5.submit();
                                    document.carne_f6.submit();  
                                              }
       $("#result_guarda_consut" ).dialog( "open" );
       setTimeout ('guard()',2000); 
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
                $.ajax({
                         type: 'POST',
                         url: 'guarda_consulta_m.jsp',
                         dataType : 'json',      
                        success: function(data) {    
                                  
                                if(data.estado==0){location.href="imprime_reportes_fin_consulta.jsp";}
                                else{$("#result_guarda_consut" ).dialog( "close" );
                                     $("#result_guarda_consu").html(data.mensaje);
                                     $("#result_guarda_consu" ).dialog( "open" );
                                 }    
                                   }                             
                          });
                   }    
function abreDialoGCon(){
                        var dat=document.getElementById('acpta_guard_c').value;
                        //if(dat==0){location.href="../agenda_consulta.jsp";}
                          if(dat==0){location.href="imprime_reportes_fin_consulta.jsp";}                        
                        else{$("#result_guarda_consu" ).dialog( "open" );}
                        }
                        
function cierDialoGCon(){
                        $( "#result_guarda_consu" ).dialog( "close" );
                        }
function cierra_dialog_f_e(){$('#borra_embarazo_consu' ).dialog('close');}    
function cierra_dialog_recom(){$('#mensaje_recomend' ).dialog('close');}
function finaliza_embar(){
                      var dat=document.getElementById("cod_emb_f").value;
                      var est=document.getElementById("finaliza_emb_ra").value;
                      var age=document.getElementById("seri_ag_emb_f").value;
                    //  alert("dat: "+dat);
                     location.href="finaliza_embarazo.jsp?con_em="+dat+"&estad="+est+"&age="+age+"";
                    // $("#reslt_finaliza_emb").load("finaliza_embarazo.jsp?con_em="+dat+"&estad="+est+"&age="+age+"");
                   //  setTimeout ("recargando()", 1000);
                     // finaliza_embarazo
                         }
function recargando(){window.location.reload();}
function cierra_dialog_alertas(){$( "#mensaje_alertas" ).dialog( "close" );}
function marc_al_leid(){  
                           if(!confirm("¿Está quitar de la lista la alerta seleccionada? ")) {return false;} 
                                 
                          var ida=document.getElementById('text_id_alerta').value;
                          $("#rrresul").load("nueva_alerta.jsp?oper=up&id="+ida);
                          $( "#mensaje_alertas" ).dialog( "close" );
                         setTimeout (function(){   jQuery("#list10").jqGrid('setCaption',"ALERTAS ").trigger('reloadGrid');
                                           },800);
                      }
function marc_re_leid(){  if(!confirm("¿Está quitar de la lista la recomendación seleccionada? ")) {return false;} 
                           var ida=document.getElementById('text_id_perm').value;
                          $("#rrresul").load("cambia_recom.jsp?oper=up&id="+ida);
                          $( "#mensaje_recomend" ).dialog( "close" );
                         setTimeout (function(){   jQuery("#list11").jqGrid('setCaption',"RECOMENDACIONES ").trigger('reloadGrid');
                                           },800);
                        }             
                   
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
   #display_consu_evol,#display_codigo_lab,#display_codigo_img {   
        position: absolute;
        top: 20px;
        background-color: rgb(248, 248, 255);
        z-index: 10;
        }


  #tddiag,#tdsollab{  
       /* width: 40px;*/
        position: relative;    
    }	
	
	</style>
</head>
<body onload="carga()">
    
    <%
             
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || request.getParameter( "s_agenda" )==null || request.getParameter("s_paciente")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
    
            String permisillo=""+session.getAttribute("permiso");
            String agenda=request.getParameter( "s_agenda" ); 
            String ced_pacinet=request.getParameter("s_paciente");
            String cod_consulta=request.getParameter("id_consultaaa");
            String id_contrato=request.getParameter("id_contrato");
            String autorizacion=request.getParameter("autorizacion");
            if(autorizacion.compareTo("null")!=0){autorizacion="'"+autorizacion+"'";}
           //    out.print("|"+ced_pacinet+"|");
            int hitocreada=0;//para saber si se crea la historia por primera vez
            
            
            if(cod_consulta==null || cod_consulta.compareTo("null")==0 || cod_consulta.compareTo("")==0){
            if(ba.transaccion("INSERT INTO `ips_isalud`.`historia_clinica` (`serial_peciente`, `fecha_creacion`) VALUES ('"+ced_pacinet+"',now());")){hitocreada=1;}
            //aca crear la consulata para ponerla en variable de sesion
              String inser="INSERT INTO `ips_isalud`.`consulta_medica` (`serial_historia`, `id_medico`, `num_autorizacion`, `id_estado_consulta`, `id_permiso_profecional`, `fecha`,`id_agenda`) VALUES ('"+ced_pacinet+"','"+session.getAttribute("id")+"',"+autorizacion+",'1','"+permisillo+"',now(),'"+agenda+"');";
              if(ba.transaccion(inser)){
                   
              String cons="select max(id_consulta) from consulta_medica where serial_historia='"+ced_pacinet+"'  and id_consulta not in (select id_consulta from agenda where id_permiso='"+session.getAttribute("permiso")+"' and id_agenda != '"+agenda+"' and id_consulta != 'null' )";
              ResultSet resuu=ba.consultas(cons);
                        try{
                            while (resuu.next()&&resuu!=null) {   
                               cod_consulta=resuu.getString(1);                           
                            }
                        }
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cierraResultado(resuu);
               String cons2="select p.id_rh,pa.cod_estado_civil,pa.id_orientacion,pa.embarazo_activo,pa.vih from personas p, pacientes pa where pa.serial_persona=p.serial and p.serial='"+ced_pacinet+"';";           
                        String  dt[] = new String[5];
                        dt[0]="";dt[1]="";dt[2]="";dt[3]="";dt[4]="";
                 ResultSet resuu2=ba.consultas(cons2);
                        try{
                            while (resuu2.next()&&resuu2!=null) {   
                               dt[0]=resuu2.getString(1);    
                               dt[1]=resuu2.getString(2);
                               dt[2]=resuu2.getString(3);
                               dt[3]=resuu2.getString(4);
                               dt[4]=resuu2.getString(5);                                                                                                                                               
                            }
                        }
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cierraResultado(resuu2);        
                String tra="INSERT INTO `ips_isalud`.`datos_ori_consult` (`id_consult`, `id_rh`, `id_ori_sex`, `vih`, `id_embarazo`, `id_estado_civil`) VALUES ('"+cod_consulta+"','"+dt[0]+"','"+dt[2]+"','"+dt[4]+"','"+dt[3]+"','"+dt[1]+"');";        
                //  System.out.println("==> "+tra);               
                ba.transaccion(tra);               
                  }
               String cons="UPDATE `ips_isalud`.`agenda` SET `id_consulta`='"+cod_consulta+"' WHERE `id_agenda`='"+agenda+"';";
               ba.transaccion(cons);
            }     
            
                String genr="";    
                String cons2hh="select genero from personas where serial='"+ced_pacinet+"';";           
                       
                 ResultSet resuu2hh=ba.consultas(cons2hh);
                        try{
                            while (resuu2hh.next()&&resuu2hh!=null) {   
                               genr=resuu2hh.getString(1);                                                                                                                                               
                            }
                        }
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cierraResultado(resuu2hh);         
                      
               
               String d="0";
               if(genr.trim().compareTo("Masculino")==0){d="1";}
               if(genr.trim().compareTo("Femenino")==0){d="2";}
               else{d="0";}    
             
               session.setAttribute("cod_autoriza",autorizacion);
               session.setAttribute("genero_paciente",d); 
               session.setAttribute("serial_agenda",agenda); 
               session.setAttribute("serial_pacinete",ced_pacinet);
               session.setAttribute("id_contrato",id_contrato);
           //    out.print("<h1> id "+id_contrato+"</h1>");
               session.setAttribute("serial_consulta",cod_consulta);// codigo de la consulta que se esta atendiendo
               session.setAttribute("histocreada",hitocreada);//este es para saber si la historia clinica se creo por primera ves
               session.setAttribute("valida","1");
               session.setAttribute("validafor","1");
               session.setAttribute("validaimg","1");
               session.setAttribute("validalab","1");
             //session.getAttribute("permiso");
      
              String genero="";
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
                
            String emba="0";
            String sqlemb="select count(p.serial) as seri from personas p,pacientes pa where p.serial=pa.serial_persona and p.genero='Femenino' and pa.embarazo_activo='1' and p.serial='"+ced_pacinet+"'";                   
             ResultSet resue=ba.consultas(sqlemb);
                        try{
                            while (resue.next()&&resue!=null) {   
                               emba=resue.getString(1);                           
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cierraResultado(resue);
                        ba.cerrar();
%>
    
    
<table border="0" style="height:100%;width:100%">
<tr style="height:100px">
<td colspan="2">
<center><img src="../imagenes/fotos/baner.png" alt="imagen no encontrada" height="100px" width="100%"></center>
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
        <li><a href="#tabs-1" onclick="cambiaPestanaconsu(1)">Datos Personales</a></li>
        <li><a href="#tabs-1" onclick="cambiaPestanaconsu(2)">Consulta</a></li>
<% String dd=""+session.getAttribute("permiso")+""; if(dd.compareTo("1")!=0){ %>  <li><a href="#tabs-1" onclick="cambiaPestanaconsu(3)">Formula</a></li><% } %>
<% if(dd.compareTo("1")!=0){ %><li><a href="#tabs-1" onclick="cambiaPestanaconsu(5)">Remision Esp</a></li><% } %>






        <li><a href="#tabs-2" onclick="cambiaPestanaconsu(10)">Laboratorios</a></li>
        <li><a href="#tabs-2" onclick="cambiaPestanaconsu(11)">Imagenges</a></li>
<% if(dd.compareTo("3")==0){ %>  <li><a href="#tabs-1" onclick="cambiaPestanaconsu(12)">Solicitud no POS-S</a></li><% } %>
<% if(dd.compareTo("2")==0){ %>  <li><a href="#tabs-1" onclick="cambiaPestanaconsu(13)">Solicitud no POS-S</a></li><% } %>
<!--    <li><a href="#tabs-1" onclick="cambiaPestanaconsu(4)">Solicitud Lab</a></li> -->
<!--    <li><a href="#tabs-1" onclick="cambiaPestanaconsu(6)">Solicitud Img</a></li> -->
<!--    <li><a href="#tabs-1" onclick="cambiaPestanaconsu(7)">Reportes Lab</a></li>  -->
<!-- 	<li><a href="#tabs-1" onclick="cambiaPestanaconsu(8)">Reportes Img</a></li>  -->
        <li id="carnet_materno" name="carnet_materno" <% if(emba.compareTo("0")==0){out.print("style='display:none'");} %> ><a href="#tabs-1" onclick="cambiaPestanaconsu(9)">Carnet emb</a></li>
    </ul>
    <div id="tabs-1" style="height:400px;width:1012px;overflow:auto;"> </div>
    <div id="tabs-2" style="height:437px;width:1042px;overflow:auto;">
            <div id="accordionadmincm"  >
     <% if(d0.compareTo("1")!=0){ %>            
                <h3>Solicitar</h3>
                <div id="soli_labo"></div>
                              <% } %>
                <h3>Resultados</h3>
                <div id="resu_labo"></div>
            </div>
    </div>
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
  cambiaPestanaconsu(0);
  

</script>

<div id="caja2" style="position:absolute;visibility:visible;position:absolute;right:20px;top: 3px;text-align: right;width:615px" >
 <h2><% out.print(""+(String)session.getAttribute("nombre")+""); %></h2>     
<input type="button" value="Agenda" name="aceptar" size="25" id="aceptar" maxlength="30" onclick="agenda()">
<input type="button" value="Guardar" name="aceptar" size="25" id="aceptar" maxlength="30" onclick="guarda_consulta()">
<br> 
<!-- <input type="button" value="Cerrar Sesion" name="aceptar" size="25" id="aceptar" onclick="cierra();" >  -->
</div>



<div id="result_guarda_consu" name="result_guarda_consu"></div>
<div id="result_guarda_consut" name="result_guarda_consut">
     <center> 
        <input type="image" size="25" id="fo" src="../imagenes/fotos/cargando.gif" alt="cargando"  onerror="this.src='../imagenes/fotos/cargando.gif'" style="height:200px">
    </center>
</div>
<div id="borra_embarazo_consu" name="borra_embarazo_consu">
    <center>
        <h2>Si está seguro de finalizar embarazo selecciones una opción</h2>
        <br>
                    <select id="finaliza_emb_ra" name="finaliza_emb_ra">
                        <option value="0">Embarazo realmente finalizo</option>
                        <option value="1">Embarazo iniciado por error</option>
                    </select>
        <input type="hidden" id="cod_emb_f" name="cod_emb_f"> 
        <input type="hidden" id="seri_ag_emb_f" name="seri_ag_emb_f" value="<% out.print(agenda); %>"> 
        <input type="text" value="Aceptar" id="aceptar" name="aceptar" onclick="finaliza_embar()" style="width:70px;text-align: center">
        <br>
        <input type="text" value="Cancelar" id="aceptar" name="aceptar" onclick="cierra_dialog_f_e()" style="width:70px;text-align: center">
    </center>
</div>
        <div id="reslt_finaliza_emb" name="reslt_finaliza_emb"></div>
        
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
        <form id="form_recomend" name="form_recomend" action="nueva_recomend.jsp" method="post">
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
</body>
</html>