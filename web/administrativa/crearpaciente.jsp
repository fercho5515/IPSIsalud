<%-- 
    Document   : crearpaciente
    Created on : 25/04/2013, 11:46:31 AM
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
    function recargaCreaEmp(){
        jQuery("#listaPersoEmple").jqGrid('setCaption',"Buscar persona").trigger('reloadGrid'); 
        $("#divdatos").load("editabasepersona2.jsp?dato="); 
        
        
        document.getElementById("fec_afiliacion").value= "";
        $("#id_pers").val("");
        $("#para_histo").val("");
        $("#estado_civil").val("");
        $("#nivel_educadivo").val("");
        $("#nivel_sisben").val("");
        $("#orientacion_sex").val("");
        $("#nivel_sisben").val("");
        $("#orientacion_sex").val("");
        $("#epsemptext").val("");
        $("#ncarnet").val("");
        $("#tipo_usu").val("");
        $("#zona").val("");
        $("#vih").val("");
        $("#fosiga").val("0");
        $("#estadofosiga").val("");
        $("#nomips").val("");
        $("#modalidad").val("");
        $("#idtpob").val("");
        $("#embarazo").val("");
        document.getElementById("tabs-pacientes").scrollTop = 0;
                            }
    
    function validacreapaciente(){
             if( $("#id").val() == "" ){
                        document.getElementById('validacionemp').innerHTML = 'Primero busque y seleccione a una persona en la tabla';
                        $("#dialogcreaemp").dialog( "open" );
			return false;
		                       } 
             setTimeout('recargaCreaEmp()',1000);                            
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
                          $("#divmuniemple").load("carga_municipios.jsp?dato="+semuniii);  
                          
                          }        
   function activaeps(){
                         var ep=document.getElementById("epspaciente");
                          var eps=ep.options[ep.selectedIndex].value;
                       if(eps=="##4#&"){ 
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
                          document.getElementById("epsemptext").value=""+eps2;
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
   	url:'carga_personas_no_pacientes.jsp?q=2',
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
                     $("#divdatos").load("editabasepersona3.jsp?dato="+id);
                     var ret = jQuery("#listaPersoEmple").jqGrid('getRowData',id);
                     document.getElementById('para_histo').value="Agrega como paciente a "+ret.p_nom+" "+ret.s_nom+" "+ret.p_ape+" "+ret.s_ape+" con cedula "+ret.id_person;
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
     <iframe onload="respuestacemp()" id="upload_target_emp" name="upload_target_emp" src="" style="border-width:0px;width:90%;height:50px">
     </iframe>
     
     
     </center>

<div id="divdatos" name="divdatos">     
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
<img src="../imagenes/fotos/paciente.png" name="previewer" id="previewer" alt="imagen no encontrada" height="150px" width="100%"  onerror="this.src='../imagenes/fotos/paciente.png'">

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
</div>     
<div id="dialogcreaemp" title="Advertencia!!!" >
     <center><p id="validacionemp" name="validacionemp" style="color: red"></p></center>    
</div> 
    
<!--segundo fieldset-->
  
<form name="form_crea_emp" id="form_crea_emp" target="upload_target_emp" action="nuevopaciente.jsp" method="post"  onsubmit="return validacreapaciente();"> 
    <input type="hidden" id="id_pers" name="id_pers" value="">
    <input type="hidden" id="para_histo" name="para_histo" value="">
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
            <input type="text" id="epsemptext" name="epsemptext" style="width:90%" readonly >
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
        <td><label>Fosyga</label></td>
        <td><label>Estado Fosyga</label></td>
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
<center><input type="submit" value="Guardar" name="aceptar" size="25" id="aceptar"><br></center>
</td>
</tr>


</table>
</form>            
<% ba.cerrar(); %>  

</body>

</html>
