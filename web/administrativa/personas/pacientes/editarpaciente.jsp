<%-- 
    Document   : editarpaciente
    Created on : 29/04/2013, 10:29:31 AM
    Author     : EMMANUEL
--%>
<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>
      
<script type="text/javascript" language="javascript">
  var histo="";
  var histo2="";
    function recargaCreaPac(){
        jQuery("#listaPersoEmple").jqGrid('setCaption',"Buscar persona").trigger('reloadGrid'); 
        document.getElementById("tabs-pacientes").scrollTop = 0;
                            }
    
    function validacreapaciente(){
             if( $("#id").val() == "" ){
                        document.getElementById('validacionemp').innerHTML = 'Primero busque y seleccione a una persona en la tabla';
                        $("#dialogcreaemp").dialog( "open" );
			return false;
		                       } 
               var hoy=new Date();
           
          //La fecha nos llega en este formato (2013-01-31) 
            var fecha=""+$("#calenaci").val()+"";
            array_fecha = fecha.split("-") 
            var dia=array_fecha[2] 
            var mes=(array_fecha[1]-1) 
            var ano=(array_fecha[0]) 
            var nacio = new Date(ano,mes,dia); 
          //depto
            var dep =document.getElementById("dptoemp");
            var depa=dep.options[dep.selectedIndex].value;
            var depatext=dep.options[dep.selectedIndex].text;
          //ciudad
            var ciu =document.getElementById("ciudad");
            var ciud=ciu.options[ciu.selectedIndex].value;
            var ciudtext=ciu.options[ciu.selectedIndex].text; 
          //eps  
            var epsss =document.getElementById("epsemp");
            var epsssd=epsss.options[epsss.selectedIndex].value;
             
            var emailreg = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
            if( $("#nombre1").val() == "" ){			
                        document.getElementById('validacionemp').innerHTML = 'Ingrese primer nombre';
                        $("#dialogcreaemp").dialog( "open" );
                        $("#nombre1").focus();
			return false;
		                           }
            else if( $("#apellido1").val() == "" ){
                        document.getElementById('validacionemp').innerHTML = 'Ingrese su primer apellido';
                        $("#dialogcreaemp").dialog( "open" );
			$("#apellido1").focus();
			return false;
		                           } 
            else if( $("#calenaci").val() == "" ){
                        document.getElementById('validacionemp').innerHTML = 'la fecha de nacimiento es obligatoria';
                        $("#dialogcreaemp").dialog( "open" );
			$("#calenaci").focus();
			return false;
		                           } 
            else if(hoy<nacio){ //alert("dato:"+$("#calenaci").val()+" hoy==>"+hoy+"   nacio==>"+nacio);
			document.getElementById('validacionemp').innerHTML = 'la fecha de nacimiento no puede ser posterior a la actual';
                        $("#dialogcreaemp").dialog( "open" );
                        $("#calenaci").focus();
			return false;
		                          }                              
            else if( $("#id").val() == "" ){
                        document.getElementById('validacionemp').innerHTML = 'Ingrese identificación';
                        $("#dialogcreaemp").dialog( "open" ); 
			$("#id").focus();
			return false;
		                           }                                         
            else if(depa=="nssdu"){
                        document.getElementById('validacionemp').innerHTML = 'Seleccione departamento';
                        $("#dialogcreaemp").dialog( "open" ); 
                        $("#dptoemp").focus();
			return false;  
                                                  }                                
            else if(ciud=="nssdu"){
                        document.getElementById('validacionemp').innerHTML = 'Seleccione ciudad';
                        $("#dialogcreaemp").dialog( "open" ); 
                        $("#ciudad").focus();
			return false;  
                                                  }                                
            else if(epsssd=="ninguna"){
                        document.getElementById('validacionemp').innerHTML = 'Seleccione eps';
                        $("#dialogcreaemp").dialog( "open" ); 
                        $("#epsemp").focus();
			return false;  
                                                  } 
            else if( $("#email").val() != ""  ){
		if( !emailreg.test($("#email").val()) ){                            
                        document.getElementById('validacionemp').innerHTML = 'Ingrese un email valido';
                        $("#dialogcreaemp").dialog( "open" ); 
			$("#email").focus();
			return false;
		                        }
                                    }
               //para historial
             
                // fecha ==> nueva fecha
                // depatext ==> nuevo departamento
                // ciudtext ==> nueva ciudad
                var ti =document.getElementById("tipoid");
                var tipoid=ti.options[ti.selectedIndex].text;
                var se =document.getElementById("sexo");
                var sexo=se.options[se.selectedIndex].text;
                var r =document.getElementById("rh");
                var rh=r.options[r.selectedIndex].text;
                var dep =document.getElementById("dptoemp");
                var departamento=dep.options[dep.selectedIndex].text;
                var c =document.getElementById("ciudad");
                var ciudad=c.options[c.selectedIndex].text;
                var ep =document.getElementById("epsemp");
                var eps=ep.options[ep.selectedIndex].text;
                
                var cambios="usuario ";
                var edito=0;
                
                if($("#nombre1").val()!=$("#nombre1ant").val()){edito=1;cambios=cambios+"cambia primer nombre: "+$("#nombre1ant").val()+" por: "+$("#nombre1").val()+" "; }
                if($("#nombre2").val()!=$("#nombre2ant").val()){edito=1;cambios=cambios+",cambia segundo nombre: "+$("#nombre2ant").val()+" por: "+$("#nombre2").val()+" ";}
                if($("#apellido1").val()!=$("#apellido1ant").val()){edito=1;cambios=cambios+",cambia primer apellido: "+$("#apellido1ant").val()+" por: "+$("#apellido1").val()+" ";}
                if($("#apellido2").val()!=$("#apellido2ant").val()){edito=1;cambios=cambios+",cambia segundo apellido: "+$("#apellido2ant").val()+" por: "+$("#apellido2").val()+" ";}
                if(fecha!=$("#calenaciant").val()){edito=1;cambios=cambios+",cambia fecha de nacimiento: "+$("#calenaciant").val()+" por: "+fecha+" ";}
		if(tipoid!=$("#tipoidant").val()){edito=1;cambios=cambios+",cambia tipo de identificacion: "+$("#tipoidant").val()+" por: "+tipoid+" ";}
                if($("#id").val()!=$("#idant").val()){edito=1;cambios=cambios+",cambia identificacion: "+$("#idant").val()+" por: "+$("#id").val()+" ";}
                if(sexo!=$("#sexoant").val()){edito=1;cambios=cambios+",cambia genero: "+$("#sexoant").val()+" por: "+sexo+" ";}
                if(rh!=$("#rhant").val()){edito=1;cambios=cambios+",cambia tipo de sangre: "+$("#rhant").val()+" por: "+rh+" ";}
                if(departamento!=$("#dptoempant").val()){edito=1;cambios=cambios+",cambia departamento: "+$("#dptoempant").val()+" por: "+departamento+" ";}
                if(ciudad!=$("#ciudadant").val()){edito=1;cambios=cambios+",cambia ciudad: "+$("#ciudadant").val()+" por: "+ciudad+" ";}
                if($("#barrio").val()!=$("#barrioant").val()){edito=1;cambios=cambios+",cambia barrio: "+$("#barrioant").val()+" por: "+$("#barrio").val()+" ";}
                if($("#direcc").val()!=$("#direccant").val()){edito=1;cambios=cambios+",cambia direccion: "+$("#direccant").val()+" por: "+$("#direcc").val()+" ";}
                if($("#telefono").val()!=$("#telefonoant").val()){edito=1;cambios=cambios+",cambia telefono: "+$("#telefonoant").val()+" por: "+$("#telefono").val()+" ";}
                if($("#email").val()!=$("#emailant").val()){edito=1;cambios=cambios+",cambia email: "+$("#emailant").val()+" por: "+$("#email").val()+" ";}
                if(eps!=$("#epsempant").val() && ($("#epsempant").val()!="" && eps!="Seleccione Eps")){edito=1;cambios=cambios+",cambia eps: "+$("#epsempant").val()+" por: "+eps+" ";}
                if($("#filef").val()!=""){edito=1;cambios=cambios+",cambia imagen ";}
              
                if(edito==1){document.getElementById("cambio_datospe").value="1"; }
                var edito2=0; 
                
                var est =document.getElementById("estado_civil");
                var estcivil=est.options[est.selectedIndex].text;
              
                var nive =document.getElementById("nivel_educadivo");
                var niveledu=nive.options[nive.selectedIndex].text;
                
                var nivs =document.getElementById("nivel_sisben");
                var nivelsis=nivs.options[nivs.selectedIndex].text;
                
                var oris =document.getElementById("orientacion_sex");
                var oriensex=oris.options[oris.selectedIndex].text;
               
                var tusu =document.getElementById("tipo_usu");
                var tipousua=tusu.options[tusu.selectedIndex].text;
               
                var zo =document.getElementById("zona");
                var zona=zo.options[zo.selectedIndex].text; 
                
                var vi =document.getElementById("vih");
                var vih=vi.options[vi.selectedIndex].text;
                
                var fosi =document.getElementById("fosiga");
                var fosiga=fosi.options[fosi.selectedIndex].text;
               
                var esfos =document.getElementById("estadofosiga");
                var estfosiga=esfos.options[esfos.selectedIndex].text;
                
                var emb =document.getElementById("embarazo");
                var embarazo=emb.options[emb.selectedIndex].text;
                
                var esta =document.getElementById("estadopaci");
                var estadop=esta.options[esta.selectedIndex].text;
                
                if(estcivil!=$("#estado_civilant").val()){edito2=1;cambios=cambios+", cambia estado civil: "+$("#estado_civilant").val()+" por: "+estcivil+" ";}
		if(niveledu!=$("#nivel_educadivoant").val()){edito2=1;cambios=cambios+", cambia nivel educativo: "+$("#nivel_educadivoant").val()+" por: "+niveledu+" ";}
		if(nivelsis!=$("#nivel_sisbenant").val()){edito2=1;cambios=cambios+", cambia nivel del sisben: "+$("#nivel_sisbenant").val()+" por: "+nivelsis+" ";}
		if(oriensex!=$("#orientacion_sexant").val()){edito2=1;cambios=cambios+",cambia tipo de orientacion sexual: "+$("#orientacion_sexant").val()+" por: "+oriensex+" ";}
		if(tipousua!=$("#tipo_usuant").val()){edito2=1;cambios=cambios+", cambia tipo de usuario: "+$("#tipo_usuant").val()+" por: "+tipousua+" ";}
		if(zona!=$("#zonaant").val()){edito2=1;cambios=cambios+", cambia tipo de zona: "+$("#zonaant").val()+" por: "+zona+" ";}
		if(vih!=$("#vihant").val()){edito2=1;cambios=cambios+", cambia estado vih: "+$("#vihant").val()+" por: "+vih+" ";}
		if(fosiga!=$("#fosigaant").val()){edito2=1;cambios=cambios+", cambia fosiga: "+$("#fosigaant").val()+" por: "+fosiga+" ";}
		if(estfosiga!=$("#estadofosigaant").val()){edito2=1;cambios=cambios+", cambia estado fosiga: "+$("#estadofosigaant").val()+" por: "+estfosiga+" ";}
		if($("#ncarnet").val()!=$("#ncarnetant").val()){edito2=1;cambios=cambios+", cambia numero de carnet: "+$("#ncarnetant").val()+" por: "+$("#ncarnet").val()+" ";}
                if($("#fec_afiliacion").val()!=$("#fec_afiliacionant").val()){edito2=1;cambios=cambios+", cambia fecha afiliación: "+$("#fec_afiliacionant").val()+" por: "+$("#fec_afiliacion").val()+" ";}
                if($("#nomips").val()!=$("#nomipsant").val()){edito2=1;cambios=cambios+", cambia nomips: "+$("#nomipsant").val()+" por: "+$("#nomips").val()+" ";}
                if($("#modalidad").val()!=$("#modalidadant").val()){edito2=1;cambios=cambios+", cambia modalidad: "+$("#modalidadant").val()+" por: "+$("#modalidad").val()+" ";}
                if($("#idtpob").val()!=$("#idtpobant").val()){edito2=1;cambios=cambios+", cambia idtpob: "+$("#idtpobant").val()+" por: "+$("#idtpob").val()+" ";}
                if(embarazo!=$("#embarazoant").val()){edito2=1;cambios=cambios+", cambia estado embarazo: "+$("#embarazoant").val()+" por: "+embarazo+" ";}
                if(estadop!=$("#estadopaciant").val()){edito2=1;cambios=cambios+", cambia estado del paciente: "+$("#estadopaciant").val()+" por: "+estadop+" ";}
                
                if(edito2==1){document.getElementById("cambio_datospa").value="1"; }
                
                if(edito==0 && edito2==0){
                                        document.getElementById('validacionemp').innerHTML = 'No hay cambios que guardar';
                                        $("#dialogcreaemp").dialog( "open" );
                                        return false;
                                       }
               cambios=cambios+" "+histo2;
               document.getElementById("cambia").value=""+cambios;
              
               setTimeout('recargaCreaPac()',800);                            
                                } 
    function calfechaafi(){  
                          var hoy=new Date();            
                        //La fecha nos llega en este formato (2013-01-31) 
                          var fecha=""+$("#fec_afiliacion").val()+"";
                          array_fecha = fecha.split("-") 
                          var dia=array_fecha[2] 
                          var mes=(array_fecha[1]-1) 
                          var ano=(array_fecha[0]) 
                          var nacio = new Date(ano,mes,dia); 
                          if(hoy<nacio){ 
                                        document.getElementById('validacionemp').innerHTML = 'la fecha de afiliacion no puede ser posterior a la actual';
                                        $("#dialogcreaemp").dialog( "open" );
                                        $("#fec_afiliacion").val("");
                                        return false;
		                          }  
                         }                        
    function cambiaMuni(){
                          var semuni =document.getElementById("dptoemp");
                          var semuniii=semuni.options[semuni.selectedIndex].value;
                          $("#divmuniemple").load("personas/comunes/carga_municipios.jsp?dato="+semuniii);  
                          
                          }        
   function activaeps(){
                                
                    }
  function activaestfodi(){
                          var fo=document.getElementById("fosiga");
                          var fosiga=fo.options[fo.selectedIndex].value;
                       //   alert("ss "+fosiga);
                       if(fosiga=="CARGADO AL FOSYGA"){
                            $("#estadofosiga").removeAttr("disabled");
                                  }
                       else{
                            $("#estadofosiga").val("");
                            $("#estadofosiga").attr("disabled",true);                            
                           } 
                          }	
	$(function(){
		     $("#fec_afiliacion").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#fec_afiliacion').datepicker($.datepicker.regional['es']);
		     $('#fec_afiliacion').datepicker("option","showAnim","slideDown");
		     $('#fec_afiliacion').datepicker("option","dateFormat","yy-mm-dd");
		     		
	});
 function ocultaEmb(){
                       var dato=document.getElementById("sexo");
                       var gene=dato.options[dato.selectedIndex].text;
                       if(gene=="Masculino"){
                                            var obj=document.getElementById("labelemb");
                                                obj.style.display="none";
                                            var obj2=document.getElementById("embarazo");
                                                obj2.style.display="none";                                                            
                                            }
                                        else{
                                            var obj=document.getElementById("labelemb");
                                                obj.style.display="block";
                                            var obj2=document.getElementById("embarazo");
                                                obj2.style.display="block";     
                                                $("#embarazo").val("0");
                                            }
                            var ep=document.getElementById("epsemp");
                          var eps=ep.options[ep.selectedIndex].value;
                          var eps2=ep.options[ep.selectedIndex].text;
                          document.getElementById("epsemptext").value;
                       if(eps=="ninguna"){ 
                            $("#ncarnet").val("");
                            $("#fec_afiliacion").val("");
                            $("#tipo_usu").val("");
                            $("#ncarnet").attr("disabled",true);
                            $("#fec_afiliacion").attr("disabled",true);
                            $("#tipo_usu").attr("disabled",true);
                                  }
                       else{
                            $("#ncarnet").removeAttr("disabled");
                            $("#fec_afiliacion").removeAttr("disabled");
                            $("#tipo_usu").removeAttr("disabled");
                           }                     
                     }     
	
 $("#filef").change(function() {

    var val = $(this).val();

    switch(val.substring(val.lastIndexOf('.') + 1).toLowerCase()){
        case 'gif': case 'jpg': case 'png':
          //  alert("an image");
            break;
        default:
            $(this).val('');
            // error message here
            alert("no es una imagen valida");
            break;
    }
});
jQuery("#listaPersoEmple").jqGrid({
   	url:'personas/pacientes/carga_pacientes.jsp?q=2',
	datatype: "json",
   	colNames:['id','Cedula','P nombre','S nombre','P apellido','S apellido'],
   	colModel:[
                {name:'id',index:'id',hidden:true,width:120,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'id_person',index:'id_person',width:120,editable: false,required : true,editoptions:{maxlength: 63}},   		
                {name:'p_nom',index:'p_nom', width:215,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'s_nom',index:'s_nom', width:215,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	        {name:'p_ape',index:'p_ape', width:215,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'s_ape',index:'s_ape', width:215,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	    ],
   	rowNum:3,
   	rowList:[3,5,10,20,40,400],
   	pager: '#pagerPersoEmple',
   	sortname: 'p_nom,s_nom,p_ape,s_ape',
        viewrecords: true,
        sortorder: "asc",
        height:"auto",
        width:1025,
        shrinkToFit: false,//columnas tamaÃ±o dato
        rownumbers: false,
        editurl: 'editaCli.php',
	caption: "Buscar persona",
	onSelectRow: function(id){  
                     $("#divdatos").load("personas/pacientes/editabasepersona4.jsp?dato="+id);
                     var ret = jQuery("#listaPersoEmple").jqGrid('getRowData',id);
                     histo2=" a "+ret.p_nom+" "+ret.s_nom+" "+ret.p_ape+" "+ret.s_ape+" con cedula "+ret.id_person;
                     document.getElementById("id_pers").value=""+id;
                     setTimeout('ocultaEmb()',500);                       
                                 }	
});


jQuery("#listaPersoEmple").jqGrid('navGrid','#pagerPersoEmple',{add:false,edit:false,del:false,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);
            
jQuery('#listaPersoEmple').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
 
  $(function() {
     $( "#dialogcreaemp" ).dialog({
      autoOpen: false,
      modal: false,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1200
      }
    });});  



</script>
<style type="text/css">
    .error{
	background-color: #BC1010;
	padding: 6px 12px;
	border-radius: 4px;
	color: white;
	font-weight: bold;
	margin-left: 16px;
	margin-top: -200px;
	position: absolute;
}
.error:before{
	content: '';
    border-top: 8px solid transparent;
    border-bottom: 8px solid transparent;
    border-right: 8px solid #BC1010;
    border-left: 8px solid transparent;
    left: -16px;
    position: absolute;
    top: 4px;
}
</style>
<title>Sin tÃ­tulo 1</title>

</head>

<body>
    
      <% request.setCharacterEncoding("UTF-8");
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     <% 
        out.println("</body></html>");
        return;
        }
          conecta_bd ba = new conecta_bd();
          ba.ConectaDb(); 
     %> 
     <center>
         
       <table id="listaPersoEmple" ></table>
        <div id="pagerPersoEmple"></div>   
     <iframe  id="upload_target_pac" name="upload_target_pac" src="" style="border-width:0px;width:90%;height:50px">
     </iframe>
     
     
     </center>

<div id="divdatos" name="divdatos">    
<form name="form_crea_pac" id="form_crea_pac" target="upload_target_pac" action="personas/pacientes/edita_paciente.jsp" method="post"  onsubmit="return validacreapaciente();" enctype="multipart/form-data"> 
    
 <input type="hidden" name="serial_per" id="serial_per" value="" >
    <input type="hidden" name="cambia" id="cambia" value="" >
<table style="width:100%;padding-top:2px" align="center" border="0">
<tr>
<td valign="top">
<fieldset>
<legend>
Datos Personales
</legend>
<table style="width:100%">
<tr>
<td style="width:16%">
<label >Primer Nombre: </label>
</td>
<td style="width:16%">
<label >Segundo Nombre: </label>
</td>
<td style="width:16%">
<label >Primer Apellido: </label>
</td>
<td style="width:16%">
<label >Segundo Apellido: </label>
</td>
<td style="width:16%">
<label >Fecha de Nacimiento </label>
</td>
<td rowspan="6" style="width:20%">
<img src="../imagenes/fotos/paciente.png" name="previewer" id="previewer" alt="imagen no encontrada" height="150px" width="auto"  onerror="this.src='../imagenes/fotos/paciente.png'">

</td>
</tr>

<!--------2da Fila------------>

<tr>
<td style="width:16%">
<input type="text" name="nombre1" size="16" id="nombre1" maxlength="74" style="width:90%" readonly>
</td>
<td style="width:16%">
<input type="text" name="nombre2" size="16" id="nombre2" maxlength="74" style="width:90%" readonly>
</td>
<td style="width:16%">
<input type="text" name="apellido1" size="16" id="apellido1" maxlength="74" style="width:90%" readonly>
</td>
<td style="width:16%">
<input type="text" name="apellido2" size="16" id="apellido2" maxlength="74" style="width:90%"  readonly>
</td>
<td style="width:16%">
    <input type="text" id="calenaci" name="calenaci" style="width:70%" readonly>
</td>
</tr>

<!----------3ra fila--------------->

<tr>
<td style="width:16%">
<label for="edad">Edad: </label>
</td>
<td style="width:16%">
<label for="tipoid">Tipo de Identificacion: </label>
</td>
<td style="width:16%">
<label for="id">Identificacion: </label>
</td>
<td style="width:16%">
<label for="sexo">Sexo: </label>
</td>
<td style="width:16%">
<label for="rh">RH: </label>
</td>
</tr>

<!-----------4ta fila-------------->

<tr>
<td style="width:16%">
<div id="divedad" name="divedad" style="width:90%">    
<input type="text" name="edad" size="13" id="edad" maxlength="30" readonly  style="width:100%">
</div>
</td>
<td style="width:16%">
<select name="tipoid" size="1" id="tipoid" style="width:90%" disabled="disabled">
                      <%
                         String sql="select idtipo_id,descripcion from tipo_id;";

                             ResultSet resu=null;
                             try{  resu=ba.consultas(sql);
                                   while (resu.next()&&resu!=null) {  
                                        out.print("<option value='"+resu.getString(1)+"'>"+resu.getString(2)+"</option>");
                                                                    }
                                 }                       
                             catch(SQLException ex){}
                             catch(Exception exe){}
                             ba.cierraResultado(resu);  
                        %>   
</select>
</td>
<td style="width:16%">
<input type="text" name="id" size="16" id="id" maxlength="64" style="width:90%" readonly>
</td>
<td style="width:16%">
<select  name="sexo" size="1" id="sexo" style="width:90%" disabled="disabled">
        <option value="Masculino">Masculino</option>
        <option  value="Femenino">Femenino</option>
</select>
</td>
<td style="width:16%">
<select id="rh" name="rh" style="width:40%;text-align:right" style="width:90%" disabled="disabled">
                      <%
                             String sql2="select id_rh,descripcion from rh;";

                             ResultSet resu2=null;
                             try{  resu2=ba.consultas(sql2);
                                   while (resu2.next()&&resu2!=null) {  
                                        out.print("<option value='"+resu2.getString(1)+"'>"+resu2.getString(2)+"</option>");
                                                                    }
                                 }                       
                             catch(SQLException ex){}
                             catch(Exception exe){}
                             ba.cierraResultado(resu2);  
                        %>  
</select>
</td>
</tr>

<!-----------5ta fila--------------->

<tr>
<td style="width:16%">
<label for="dpto">Departamento: </label>
</td>
<td style="width:16%">
<label for="ciudad">Ciudad: </label>
</td>
<td style="width:16%">
<label for="barrio">Barrio: </label>
</td>
<td style="width:32%" colspan="2">
<label for="direccion">Direccion: </label>
</td>

</tr>

<!-----------6ta fila--------------->

<tr>
<td style="width:16%">
<select name="dptoemp" size="1" id="dptoemp" onchange="cambiaMuni()" style="width:95%" disabled="disabled">
    <option value="nssdu">Seleccionar Departamento</option>
    <%
         String sql3="select id_departo,descripcion from departamento;";

         ResultSet resu3=null;
         try{  resu3=ba.consultas(sql3);
               while (resu3.next()&&resu3!=null) {  
                            out.print("<option value='"+resu3.getString(1)+"'>"+resu3.getString(2)+"</option>");
                                                 }
            }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resu3);  
     %>  
</select>
</td>
<td style="width:16%">
<div id="divmuniemple" name="divmuniemple" style="width:95%">   
    <select name="ciudad" size="1" id="ciudad" style="width:95%" onchange="quita()" disabled="disabled">
     <option value="nssdu">Seleccionar Departamento</option>
</select>
</div>     
</td>
<td style="width:16%">
<input type="text" name="barrio" size="16" id="barrio" maxlength="399" style="width:90%"  readonly>
</td>
<td style="width:32%" colspan="2">
<input type="text" name="direcc" size="16" id="direcc" maxlength="149" style="width:90%"  readonly>
</td>
</tr>

<!---------------7ma fila----------->

<tr>
<td style="width:16%">
<label for="dpto">Telefono: </label>
</td>
<td style="width:16%" colspan="2">
<label for="ciudad">Email: </label>
</td>
<td style="width:32%" colspan="2">
<label for="fechanac">EPS Afiliado </label>
</td>
<td></td>
</tr>

<!---------------8va fila----------->

<tr>
<td style="width:16%">
<input type="text" name="telefono" size="16" id="telefono" maxlength="44" style="width:90%" readonly>
</td>
<td style="width:16%" colspan="2">
<input type="text" name="email" size="40" id="email" maxlength="199" style="width:95%" readonly>
</td>
<td style="width:32%" colspan="2">
    <select name="epsemp" size="1" id="epsemp" style="width:95%" disabled="disabled">
    <option value='ninguna'>Seleccione Eps</option>
    <%
         String sql4="select ideps,nombre from eps order by nombre;";

         ResultSet resu4=null;
         try{  resu4=ba.consultas(sql4);
               while (resu4.next()&&resu4!=null) {  
                            out.print("<option value='"+resu4.getString(1)+"'>"+resu4.getString(2)+"</option>");
                                                 }
            }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resu4);  
     %>  
</select>
</td>
<td  style="width:16%"> 
</td>
</tr>
</table>
</fieldset>



<tr>
<td valign="top">
<!-- <br><center><input type="submit" value="Guardar" name="aceptar" size="25" id="aceptar"></center><br> -->
    
</td>
</tr>


</table>

    
    <table style="width:100%"> 
    <tr>
        <td>
<fieldset>
<legend>Datos de Afiliación </legend>

<table style="width:100%" >
    <tr >
        <td style="width:25%"><label>Estado Civil</label></td>
        <td style="width:25%"><label>Nivel Educativo</label></td>
        <td style="width:25%"><label>Nivel Sisben</label></td>
        <td style="width:25%"><label>Orientacion Sexual</label></td>
    </tr>
    <tr >
        <td>
         <select id="estado_civil" name="estado_civil" style="width:90%" >
          <% 
            String sql5="select idestado_civil,descripcion from estado_civil;";

            ResultSet resu5=null;
            try{  resu5=ba.consultas(sql5);
                  while (resu5.next()&&resu5!=null) {  
                               out.print("<option value='"+resu5.getString(1)+"'>"+resu5.getString(2)+"</option>");
                                                    }
               }                       
            catch(SQLException ex){}
            catch(Exception exe){}
            ba.cierraResultado(resu5);  
         %>
         </select> 
        </td>
     <td >
              <select id="nivel_educadivo" name="nivel_educadivo" style="width:90%" >
          <% 
            String sql6="select id_nivel,descripcion from nivel_educativo;";

            ResultSet resu6=null;
            try{  resu6=ba.consultas(sql6);
                  while (resu6.next()&&resu6!=null) {  
                               out.print("<option value='"+resu6.getString(1)+"'>"+resu6.getString(2)+"</option>");
                                                    }
               }                       
            catch(SQLException ex){}
            catch(Exception exe){}
            ba.cierraResultado(resu6);  
         %>
         </select>             
       </td>
       <td>
           <select id="nivel_sisben" name="nivel_sisben" style="width:90%">
               <option value="N">No Aplica</option>
               <option value="1">1</option>
               <option value="2">2</option>
               <option value="3">3</option>
           </select>
       </td>
       <td>
              <select id="orientacion_sex" name="orientacion_sex" style="width:90%" >
          <% 
            String sql7="select id_sex,descripcion from oreintacion_sex;";

            ResultSet resu7=null;
            try{  resu7=ba.consultas(sql7);
                  while (resu7.next()&&resu7!=null) {  
                               out.print("<option value='"+resu7.getString(1)+"'>"+resu7.getString(2)+"</option>");
                                                    }
               }                       
            catch(SQLException ex){}
            catch(Exception exe){}
            ba.cierraResultado(resu7);  
         %>
         </select> 
       </td>
    </tr>
    <tr>
        <td><label>EPS</label></td>
        <td><label>Numero Carnet</label></td>
        <td><label>Fecha Afiliación</label></td>
        <td><label>Tipo Usuario</label></td>
    </tr>
    <tr>
        <td>
            <input type="epsemptext" name="epsemptext" value="">
        </td>
        <td><input type="text" id="ncarnet" name="ncarnet" value="" style="width:90%" disabled="disabled" ></td>
        <td><input type="text" id="fec_afiliacion" name="fec_afiliacion" value="" style="width:80%" onchange="calfechaafi()" disabled="disabled" readonly ></td>
        <td>
            <select id="tipo_usu" name="tipo_usu" style="width:90%" disabled="disabled">
          <% 
            String sql9="select id_tipo_usuario,descripcion from tipo_usuario;";

            ResultSet resu9=null;
            try{  resu9=ba.consultas(sql9);
                  while (resu9.next()&&resu9!=null) {  
                               out.print("<option value='"+resu9.getString(1)+"'>"+resu9.getString(2)+"</option>");
                                                    }
               }                       
            catch(SQLException ex){}
            catch(Exception exe){}
            ba.cierraResultado(resu9);  
         %>
            </select>
        </td>
    </tr>
    <tr>
        <td><label>Zona</label></td>
        <td><label>VIH</label></td>
        <td><label>Fosiga</label></td>
        <td><label>Estado Fosiga</label></td>
    </tr>
    <tr>
        <td>
             <select id="zona" name="zona" style="width:90%">
           <% 
            String sql10="select idzona,descrizona from zona;";

            ResultSet resu10=null;
            try{  resu10=ba.consultas(sql10);
                  while (resu10.next()&&resu10!=null) {  
                               out.print("<option value='"+resu10.getString(1)+"'>"+resu10.getString(2)+"</option>");
                                                    }
               }                       
            catch(SQLException ex){}
            catch(Exception exe){}
            ba.cierraResultado(resu10);  
         %>
            </select>
        </td>
        <td>
             <select id="vih" name="vih" style="width:90%">
               <option value="Negativo">Negativo</option>
               <option value="Positivo">Positivo</option>
           </select>
        </td>
        <td>
            <select id="fosiga" name="fosiga" style="width:90%" onchange="activaestfodi()">
               <option value="0">No Aplica</option> 
               <option value="CARGADO AL FOSYGA">CARGADO AL FOSYGA</option>
               <option value="NO CARGADO AL FOSYGA">NO CARGADO AL FOSYGA</option>
           </select>
        </td>
        <td>
            <select id="estadofosiga" name="estadofosiga"  style="width:90%" disabled="disabled">
               <!-- <option value="0">No Aplica</option> -->
               <option value="Activo">Activo</option>
               <option value="Pendiente cargar al fosyga">Pendiente cargar al fosyga</option>
           </select>
        </td>
    </tr>
    <tr>
        <td><label>NOMIPS</label></td>
        <td><label>Modalidad</label></td>
        <td><label>IDTPOB</label></td>
        <td><label id="labelemb" name="labelemb" style="display:none" >Embarazo</label></td>
    </tr>
    <tr>
        <td><input type="text" id="nomips" name="nomips"></td>
        <td><input type="text" id="modalidad" name="modalidad"></td>
        <td><input type="text" id="idtpob" name="idtpob"></td>
        <td>
             <select id="embarazo" name="embarazo"  style="width:90%;display:none" >
               <option value="0">Inactivo</option>
               <option value="1">Activo</option>
             </select>
        </td>
    </tr>
</table>
</fieldset>
</td>
</tr>
<tr>
<td valign="top">
</td>
</tr>


</table>
</form> 
</div>     
<div id="dialogcreaemp" title="Advertencia!!!" >
     <center><p id="validacionemp" name="validacionemp" style="color: red"></p></center>    
</div>          
<% ba.cerrar(); %>  

</body>

</html>
