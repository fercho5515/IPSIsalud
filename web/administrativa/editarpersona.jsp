<%-- 
    Document   : editarpersona
    Created on : 12/04/2013, 11:04:17 AM
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
    function quita(){$(".error").remove();}
    function validacreaemp(){
            $(".error").remove();
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
            
            var emailreg = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
            if( $("#nombre1").val() == "" ){			
                        document.getElementById('validacioneperso').innerHTML = 'Ingrese primer nombre';
                        $("#dialogperso").dialog( "open" );
                        $("#nombre1").focus();
			return false;
		                           }
            else if( $("#apellido1").val() == "" ){
                        document.getElementById('validacioneperso').innerHTML = 'Ingrese su primer apellido';
                        $("#dialogperso").dialog( "open" );
			$("#apellido1").focus();
			return false;
		                           } 
            else if( $("#calenaci").val() == "" ){
                        document.getElementById('validacioneperso').innerHTML = 'la fecha de nacimiento es obligatoria';
                        $("#dialogperso").dialog( "open" );
			$("#calenaci").focus();
			return false;
		                           } 
            else if(hoy<nacio){ //alert("dato:"+$("#calenaci").val()+" hoy==>"+hoy+"   nacio==>"+nacio);
			document.getElementById('validacioneperso').innerHTML = 'la fecha de nacimiento no puede ser posterior a la actual';
                        $("#dialogperso").dialog( "open" );
                        $("#calenaci").focus();
			return false;
		                          }                              
            else if( $("#id").val() == "" ){
                        document.getElementById('validacioneperso').innerHTML = 'Ingrese identificación';
                        $("#dialogperso").dialog( "open" ); 
			$("#id").focus();
			return false;
		                           }                                         
            else if(depa=="nssdu"){
                        document.getElementById('validacioneperso').innerHTML = 'Seleccione departamento';
                        $("#dialogperso").dialog( "open" ); 
                        $("#dptoemp").focus();
			return false;  
                                                  }                                
            else if(ciud=="nssdu"){
                        document.getElementById('validacioneperso').innerHTML = 'Seleccione ciudad';
                        $("#dialogperso").dialog( "open" ); 
                        $("#ciudad").focus();
			return false;  
                                                  }                             
            else if( $("#email").val() != ""  ){
			if( !emailreg.test($("#email").val()) ){
                            
                        document.getElementById('validacioneperso').innerHTML = 'Ingrese un email valido';
                        $("#dialogperso").dialog( "open" ); 
			$("#email").focus();
			return false;
		                        } }
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
                
                if(edito==0){
                    document.getElementById('validacioneperso').innerHTML = 'No hay cambios para guardar';
                        $("#dialogperso").dialog( "open" ); 
                        return false;
                    
                }
                cambios=cambios+" a "+$("#nombre1").val()+" "+$("#nombre2").val()+" "+$("#apellido1").val()+" "+$("#apellido2").val()+" con identificación "+$("#id").val();
                document.getElementById("cambia").value=""+cambios;
                                        
                    setTimeout('recargaTabla()',1000);                   
                            } 
    function calfecha(){  $(".error").remove();
                          var hoy=new Date();            
                        //La fecha nos llega en este formato (2013-01-31) 
                          var fecha=""+$("#calenaci").val()+"";
                          array_fecha = fecha.split("-") 
                          var dia=array_fecha[2] 
                          var mes=(array_fecha[1]-1) 
                          var ano=(array_fecha[0]) 
                          var nacio = new Date(ano,mes,dia); 
                          if(hoy<nacio){ 
                                        document.getElementById('validacioneperso').innerHTML = 'la fecha de nacimiento no puede ser posterior a la actual';
                                        $("#dialogperso").dialog( "open" ); 
                                        $("#calenaci").val("");
                                        $("#edad").val("");
                                        return false;
		                          }  
                          $("#divedad").load("edad.jsp?dato="+$("#calenaci").val()+"");  
                       }                        
    function cambiaMuni(){quita();
                          var semuni =document.getElementById("dptoemp");
                          var semuniii=semuni.options[semuni.selectedIndex].value;
                          $("#divmuniemple").load("carga_municipios.jsp?dato="+semuniii);  
                          
                          }        
        
    $(function(){
		     $("#calenaci").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#calenaci').datepicker($.datepicker.regional['es']);
		     $('#calenaci').datepicker("option","showAnim","slideDown");
		     $('#calenaci').datepicker("option","dateFormat","yy-mm-dd");
		     		
	});
	

 function recargaTabla(){
      jQuery("#listaPerso").jqGrid('setCaption',"Buscar persona").trigger('reloadGrid');   
      document.getElementById("tabs-personas").scrollTop = 0;
                     }
 
    $(document).ready(function() {
            $('#filef').previewInputFileImage('#previewer');
        });
	//valida tipos de archivo
 $("#filef").change(function() {

    var val = $(this).val();

    switch(val.substring(val.lastIndexOf('.') + 1).toLowerCase()){
        case 'gif': case 'jpg': case 'png':
          //  alert("an image");
            break;
        default:
            $(this).val('');
            // error message here
            document.getElementById('validacioneperso').innerHTML = 'no es una imagen valida';
            $("#dialogperso").dialog( "open" ); 
            break;
    }
});

   jQuery("#listaPerso").jqGrid({
   	url:'carga_personas.jsp?q=2',
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
   	pager: '#pagerPerso',
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
                     $("#divdatos").load("editabasepersona.jsp?dato="+id);                     
                                 }	
});


jQuery("#listaPerso").jqGrid('navGrid','#pagerPerso',{add:false,edit:false,del:false,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);
            
jQuery('#listaPerso').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
 
  $(function() {
     $( "#dialogperso" ).dialog({
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
	margin-top: -47px;
	position: absolute;
}/*
.error:before{
	content: '';
    border-top: 8px solid transparent;
    border-bottom: 8px solid transparent;
    border-right: 8px solid #BC1010;
    border-left: 8px solid transparent;
    left: -16px;
    position: absolute;
    top: 4px;
}*/
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
         
       <table id="listaPerso" ></table>
        <div id="pagerPerso"></div>   
     <iframe id="upload_target_emp" name="upload_target_emp" src="" style="border-width:0px;width:90%;height:30px">
     </iframe>
     
     
     </center>

<div id="divdatos" name="divdatos">     
<form name="form_crea_emp" id="form_crea_emp" target="upload_target_emp" action="edita_persona" method="post"  onsubmit="return validacreaemp();" enctype="multipart/form-data" >     
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
<img src="../imagenes/fotos/medico.png" name="previewer" id="previewer" alt="imagen no encontrada" height="150px" width="100%"  onerror="this.src='../imagenes/fotos/medico.png'">

</td>
</tr>

<!--------2da Fila------------>

<tr>
<td style="width:16%">
<input type="text" name="nombre1" size="16" id="nombre1" maxlength="74" style="width:90%" onkeyup="quita()">
</td>
<td style="width:16%">
<input type="text" name="nombre2" size="16" id="nombre2" maxlength="74" style="width:90%" >
</td>
<td style="width:16%">
<input type="text" name="apellido1" size="16" id="apellido1" maxlength="74" style="width:90%" onkeyup="quita()">
</td>
<td style="width:16%">
<input type="text" name="apellido2" size="16" id="apellido2" maxlength="74" style="width:90%" >
</td>
<td style="width:16%">
    <input type="text" id="calenaci" name="calenaci" style="width:70%" onchange="calfecha()" readonly>
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
<select name="tipoid" size="1" id="tipoid" style="width:90%">
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
<input type="text" name="id" size="16" id="id" maxlength="64" style="width:90%"  onkeyup="quita()">
</td>
<td style="width:16%">
<select  name="sexo" size="1" id="sexo" style="width:90%">
        <option value="Masculino">Masculino</option>
        <option  value="Femenino">Femenino</option>
</select>
</td>
<td style="width:16%">
<select id="rh" name="rh" style="width:40%;text-align:right" style="width:90%">
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
<select name="dptoemp" size="1" id="dptoemp" onchange="cambiaMuni()" style="width:95%">
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
    <select name="ciudad" size="1" id="ciudad" style="width:95%" onchange="quita()">
     <option value="nssdu">Seleccionar Departamento</option>
</select>
</div>     
</td>
<td style="width:16%">
<input type="text" name="barrio" size="16" id="barrio" maxlength="399" style="width:90%">
</td>
<td style="width:32%" colspan="2">
<input type="text" name="direcc" size="16" id="direcc" maxlength="149" style="width:90%">
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
<input type="text" name="telefono" size="16" id="telefono" maxlength="44" style="width:90%">
</td>
<td style="width:16%" colspan="2">
<input type="text" name="email" size="40" id="email" maxlength="199" style="width:95%">
</td>
<td style="width:32%" colspan="2">
<select name="epsemp" size="1" id="epsemp" style="width:95%">
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
<center>  
    <input type="file" value="Subir foto" name="filef" size="25" id="filef" style="width:95%" data-previewer="#previewer"  accept="image/*" >
</center>  
</td>
</tr>
</table>
</fieldset>


</td>
</tr>

<tr>
<td valign="top">
<!-- <br><center><input type="submit" value="Guardar" name="aceptar" size="25" id="aceptar"></center><br> -->
    
</td>
</tr>


</table>
</form>
</div>     
<% ba.cerrar(); %>  
<div id="dialogperso" title="Advertencia!!!" >
     <center><p id="validacioneperso" name="validacioneperso" style="color: red"></p></center>    
</div> 
                                                      
</body>

</html>

