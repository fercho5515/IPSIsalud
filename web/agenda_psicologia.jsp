<%-- 
    Document   : agenda_psicologia
    Created on : 7/09/2013, 08:24:44 PM
    Author     : Emmanuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html> 
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="shortcut icon" href="imagenes/fotos/favicon.ico">
      	
	 <link rel="shortcut icon" href="imagenes/fotos/favicon.ico">
        <link rel="stylesheet" type="text/css" media="screen" href="jquery/css/flick/jquery-ui-1.9.2.custom.css" >
        <link rel="stylesheet" type="text/css" media="screen" href="jquery/jqgrid/css/ui.jqgrid.css" >
        <link rel="stylesheet" type="text/css" media="screen" href="jquery/bajados/ui.multiselect.css" >
       	<script src="jquery/bajados/jquery.min.js" type="text/javascript"></script> 
        <script type="text/javascript" language="javascript" src="jquery/js/jquery-ui.js"></script>
	<script src="jquery/jqgrid/js/i18n/grid.locale-es.js" type="text/javascript"></script>
        <script src="jquery/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
        <link type='text/css' href='jquery/bajados/modal/osx.css' rel='stylesheet' media='screen'>
        <script type='text/javascript' src='jquery/bajados/modal/jquery.simplemodal.js'></script>
        <script type="text/javascript" src="jquery/bajados/jquery.previewInputFileImage.js"></script> 
        <script type="text/javascript" src="jquery/bajados/jquery.ui.datepicker-es.js"></script> 
        
       <script src="jquery/apprise/apprise-1.5.min.js" type="text/javascript"></script> 
       <link type='text/css' href='jquery/apprise/apprise.min.css' rel='stylesheet' media='screen'>
       
<style type="text/css">
	body{
		font: 62.5% "Trebuchet MS", sans-serif;
		margin: 5px;
	}
	#dsa{padding: 5px 5px 0px 5px;}
	label,option,select{font-family:"Eras Medium ITC";
	      color:#2779aa;
          font-size:11pt;}
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




<script type="text/javascript" language="javascript">
  var anchoPantalla;
   $(function() {
    $( "#dialog1" ).dialog({
      autoOpen: false,
      modal: true,
       buttons: {
        Ok: function() {
          $( this ).dialog( "close" );
        }
      },
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });});
    
     $(function() {
    $( "#dialog2" ).dialog({
      autoOpen: false,
      modal: true,
       buttons: {
        Ok: function() {
          $( this ).dialog( "close" );
        }
      },
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });});
    
    
    $(function() {
    $( "#dialog3" ).dialog({
      autoOpen: false,
      modal: true,
      width:400,
      /* buttons: {
        Ok: function() {
          $( this ).dialog( "close" );
        }
      },*/
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });});
  function cierra(){
                               location.href="cierra_sesion.jsp";    
                            }  
   function inicio(){
                               location.href="ingreso.jsp";    
                            }                            
   function atiende(dato,dato2,dato3,dato4,dato5){
                                  // alert("id agenda: "+dato+" descripcion: "+dato2+" cedula persona: "+dato3+" id consulta: "+dato4);
                                   if(dato2=="Programada"){$( "#dialog1" ).dialog( "open" );}
                                   else if(dato2=="Atendida"){$( "#dialog2" ).dialog( "open" );}
                                   else{
                                   document.getElementById("s_agenda").value=dato;
                                   document.getElementById("s_paciente").value=dato3;
                                   document.getElementById("id_consultaaa").value=dato4;
                                   document.getElementById("autorizacion").value=dato5;
                                
                                  // $("#dialog3").dialog( "open" );
                                   
                                    document.forms.form1.action='psicologia/consulta/contenedorpsicologia.jsp';                                   
                                    document.forms.form1.submit();   
                                // alert("idconsulta "+dato4);
                                      }                             
                         }   
    function atiende2(dato){
      
                         if(dato==1){                           
                                    document.forms.form1.action='psicologia/consulta/contenedorpsicologia.jsp';                                   
                                    document.forms.form1.submit();   
                                    }  
                               else{                           
                                    document.forms.form1.action='psicologia/control/contenedorpsicologia.jsp';                                   
                                    document.forms.form1.submit();                                      
                                   }
                     }                        
                            
$(document).ready(function(){
                         
                     anchoPantalla=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
                     //alert(document.body.offsetWidth+" t "+anchoPantalla+" p "+((document.body.offsetWidth*24)/100));
jQuery("#list1").jqGrid({
   	url:'carga_agenda_dia.jsp?q=2',
	datatype: "json",
   	colNames:['Atender','Serial persona','Hora','Documento','Primer Nombre','Segundo Nombre','Primer Apellido','Segundo Apellido','Estado','consu','autoriza','am_pm'],
   	colModel:[
   	        {name:'id_agenda',index:'a.id_agenda', hidden:true,width:0,search:false,editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false }},
   	        {name:'serial',index:'p.serial', hidden:true,width:0,search:false,editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false }},
   	        {name:'horaconsulta',index:'horaconsulta', width:((anchoPantalla*7)/100),search:false,editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
   		{name:'id_person',index:'p.id_person', width:((anchoPantalla*8)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'p.p_nom',index:'p.p_nom', width:((anchoPantalla*16)/100),search:true, editable: true,required : true,editoptions: {maxlength: 200},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
		{name:'p.s_nom',index:'p.s_nom', width:((anchoPantalla*16)/100),search:true, editable: true,required : true,editoptions: {maxlength: 200},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
		{name:'p.p_ape',index:'p.p_ape', width:((anchoPantalla*16)/100),search:true, editable: true,required : true,editoptions: {maxlength: 200},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
		{name:'p.s_ape',index:'p.s_ape', width:((anchoPantalla*16)/100),search:true, editable: true,required : true,editoptions: {maxlength: 200},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'descripcion',index:'descripcion', width:((anchoPantalla*8)/100),search:false, editable: false,required : false,editoptions: {maxlength: 200},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
   		{name:'idconsu',index:'idconsu', width:(0), hidden:true,search:false, editable: false,required : false,editoptions: {maxlength: 200},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
   		{name:'num_autorizacion',index:'num_autorizacion', width:(0), hidden:true,search:false, editable: false,required : false,editoptions: {maxlength: 200},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
   		{name:'am_pm',index:'am_pm', hidden:false, width:((anchoPantalla*8)/100),search:false,editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false }},
   	         ],
          gridComplete: function ()
                    {
                        var ids = jQuery("#list1").jqGrid('getDataIDs');
                        
                        
                        for (var i = 0; i < ids.length; i++)
                        {
                            var cl = ids[i];
                            var ret = jQuery("#list1").jqGrid('getRowData',ids[i]);
                            
                              if(ret.descripcion=="Atendida"){
                                           be = "<input style='height:22px;width:75px;color: red'  id='aceptar' type='button'   value='Atendida' onclick=\"atiende('" + cl + "','"+ret.descripcion+"','"+ret.serial+"','"+ret.idconsu+"','"+ret.num_autorizacion+"');\"  />";
                           
                          }
                              else if(ret.descripcion=="Programada"){
                                           be = "<input style='height:22px;width:75px;color: blue'  id='aceptar' type='button'   value='Atender' onclick=\"atiende('" + cl + "','"+ret.descripcion+"','"+ret.serial+"','"+ret.idconsu+"','"+ret.num_autorizacion+"');\"  />";
                              }
                           else{ be = "<input style='height:22px;width:75px;color:green'  id='aceptar' type='button' value='Atender' onclick=\"atiende('" + cl + "','"+ret.descripcion+"','"+ret.serial+"','"+ret.idconsu+"','"+ret.num_autorizacion+"');\"  />";} 
                           
                        //   be = "<input style='height:22px;width:68px;'  id='aceptar' type='button' value='Atender' onclick=\"atiende('" + cl + "','"+ret.descripcion+"','"+ret.serial+"');\"  />";
                           
                          jQuery("#list1").jqGrid('setRowData', ids[i], { am_pm: be });
                        }
                    },
            grouping:true,         
            groupingView : {
                 groupField :['am_pm']
            },         
            rowNum:30,
            rowList:[5,15,30,45,500],
            pager: '#pager1',
            sortname: 'am_pm,hora,min',
            viewrecords: true,
            //sortorder: "desc",
            sortorder: "asc",
            //multiselect: false,
            ////loadonce: true,
            //height: 'auto',
            width:anchoPantalla,
            //height: 190,
            height: 'auto',
            // autowidth: true, 
            shrinkToFit: false,//columanas fijas aunque tenga autowith
            // rownumbers: true,
            editurl: 'editaCli.php',
            caption: "AGENDA DEL DIA"
});
jQuery("#list1").jqGrid('navGrid','#pager1',{add:false,edit:false,del:false,search:true,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:400} //para el view
 								);
/////////////////////////////77


 });


</script>   
    </head>
    <body>
        <% 
      
               request.setCharacterEncoding("UTF-8");
             session.setAttribute("serial_agenda",null); 
             session.setAttribute("serial_pacinet",null); 
                      
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || (request.getParameter( "permiso" )==null&&session.getAttribute("permiso")==null)){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
              String permisos="";
             
              if(request.getParameter( "permiso" )==null){
                 permisos=(String)session.getAttribute("permiso");
               }
              else{permisos=request.getParameter( "permiso" );
                  session.setAttribute("permiso",permisos);
                  }                          
                         
               String nombre=(String)session.getAttribute("nombre");
               String clave=(String)session.getAttribute("clave");
               String id=(String)session.getAttribute("id");
               String cedula=(String)session.getAttribute("cedula");
               String imagen=(String)session.getAttribute("imagen");
        %>
        <table style="height:100%;width:80%;background:#deedf7;padding-top:5px" align="center">
<tbody valign="top">
<tr style="height:150px">
<td>
<center><img src="imagenes/fotos/baner.png" alt="imagen no encontrada" height="150px" width="auto"></center>
</td>
</tr>

<tr style="height:150px">
<td>

<table style="padding-top:5px;width:100%">
<tbody valign="top">
<tr>
<td style="width:30%">
<img src="imagenes/fotos/<%out.print(imagen);%>" alt="imagen no encontrada" onerror="this.src='imagenes/fotos/medico.png'" height="150px" width="auto">
</td>
<td style="text-align:right;width:70%">
<h2 align="right">Bienvenid@ <% out.print(nombre);%></h2>
<input type="button" value="Inicio" name="aceptar" size="25" id="aceptar" onclick="inicio();" ><br>
<input type="button" value="Cerrar Sesion" name="aceptar" size="25" id="aceptar" onclick="cierra();" >
</td>
</tr>
</tbody>
</table>
</td>
</tr>

<tr>
<td>
    
       <center>
         <table id="list1" ></table>
         <div id="pager1"></div> 
       </center>
  
 


</td>
</tr>



</tbody>
</table>

<div id="dialog1" title="Advertencia">
  <center><h3>Cita aun no cumplida por el paciente</h3></center>
</div>
<div id="dialog2" title="Advertencia">
    <center><h3 >Cita ya fue atendida</h3></center>
</div>
<div id="dialog3" title="Mensaje">
    <center><h2>Tipo de consulta</h2><br>
        <input type="button" id="aceptar" name="aceptar" value="Consulta Completa" onclick="atiende2(1)">&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" id="aceptar" name="aceptar" value="Consulta Control" onclick="atiende2(2)">
    </center>
</div>

<form name="form1" id="form1" method="post">
    <input type="hidden" name="s_paciente" id="s_paciente">    
    <input type="hidden" name="s_agenda" id="s_agenda">     
    <input type="hidden" name="id_consultaaa" id="id_consultaaa">
    <input type="hidden" name="autorizacion" id="autorizacion">
</form>


    </body>
</html>
