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
        $("#divdatos").load("personas/empleados/editabasepersona2.jsp?dato="); 
        document.getElementById("calendariovinculacion").value= "";
        $("#claveemp").val("");
        $("#claveemp2").val("");
        $("#tarjeta_prof").val("");
        $("#registro_prof").val("");
        $("#contrato").val("");
        $("#firma").val("");
        for (i=0;i<document.form_crea_emp.elements.length;i++) { if(document.form_crea_emp.elements[i].type == "checkbox"){document.form_crea_emp.elements[i].checked=0 }}
        document.getElementById("tabs-empleados").scrollTop = 0;         
             }
    
    function validacreaempleado(){
            $(".error").remove();
            var hoy=new Date();
            
           //fecha vinculacion
            var fechav=""+$("#calendariovinculacion").val()+"";
            array_fecha = fechav.split("-") 
            var diav=array_fecha[2] 
            var mesv=(array_fecha[1]-1) 
            var anov=(array_fecha[0]) 
            var vinculo = new Date(anov,mesv,diav); 
           
            var car =document.getElementById("cargo");
            var cargo=car.options[car.selectedIndex].text;
            
            document.getElementById("ced_pers").value=""+histo+" y cargo "+cargo;
                     
            
             if( $("#id").val() == "" ){
                        document.getElementById('validacionemp').innerHTML = 'Primero busque y seleccione a una persona en la tabla';
                        $("#dialogcreaemp").dialog( "open" );
			return false;
		                           } 
             else if( $("#calendariovinculacion").val() == "" ){
                        document.getElementById('validacionemp').innerHTML = 'Ingrese fecha de vinculaci�n';
                        $("#dialogcreaemp").dialog( "open" );
			return false;
		                           } 
          //    alert("vincula:"+vinculo+" hoy:"+hoy);                             
            else if(hoy<vinculo){ //alert("dato:"+$("#calenaci").val()+" hoy==>"+hoy+"   nacio==>"+nacio);
			document.getElementById('validacionemp').innerHTML = 'la fecha de vinculacion no puede ser posterior a la actual';
                        $("#dialogcreaemp").dialog( "open" );
                        $("#calendariovinculacion").val("");
                        return false;
		                          }                                
            else if( $("#claveemp").val() == "" ){
			$("#claveemp").focus();
                        document.getElementById('validacionemp').innerHTML = 'la clave es obligatoria';
                        $("#dialogcreaemp").dialog( "open" );
			return false;
		                           }   
            else if( $("#claveemp2").val() == "" ){
			$("#claveemp2").focus();
			document.getElementById('validacionemp').innerHTML = 'la confirmacion de clave es obligatoria';
                        $("#dialogcreaemp").dialog( "open" );
			return false;
		                       } 
            else if( $("#claveemp2").val() != $("#claveemp").val()){
			$("#claveemp2").focus();
			document.getElementById('validacionemp').innerHTML = 'la clave y su confirmacion deben coincidir';
                        $("#dialogcreaemp").dialog( "open" );
			return false;
		                       } 
            setTimeout('recargaCreaEmp()',1000);                            
                            } 
    function calfechavin(){  $(".error").remove();
                          var hoy=new Date();            
                        //La fecha nos llega en este formato (2013-01-31) 
                          var fecha=""+$("#calendariovinculacion").val()+"";
                          array_fecha = fecha.split("-") 
                          var dia=array_fecha[2] 
                          var mes=(array_fecha[1]-1) 
                          var ano=(array_fecha[0]) 
                          var nacio = new Date(ano,mes,dia); 
                          if(hoy<nacio){ 
                                        document.getElementById('validacionemp').innerHTML = 'la fecha de vinculacion no puede ser posterior a la actual';
                                        $("#dialogcreaemp").dialog( "open" );
                                        $("#calendariovinculacion").val("");
                                        return false;
		                          }  
                       }                        
    function cambiaMuni(){
                          var semuni =document.getElementById("dptoemp");
                          var semuniii=semuni.options[semuni.selectedIndex].value;
                          $("#divmuniemple").load("personas/comunes/carga_municipios.jsp?dato="+semuniii);  
                          
                          }        

	
	$(function(){
		     $("#calendariovinculacion").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#calendariovinculacion').datepicker($.datepicker.regional['es']);
		     $('#calendariovinculacion').datepicker("option","showAnim","slideDown");
		     $('#calendariovinculacion').datepicker("option","dateFormat","yy-mm-dd");
		     		
	});
 
    
	
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
   	url:'personas/empleados/carga_personas_no_empleadas.jsp?q=2',
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
        shrinkToFit: false,//columnas tamaño dato
        rownumbers: false,
        editurl: 'editaCli.php',
	caption: "Buscar persona",
	onSelectRow: function(id){  
                     $("#divdatos").load("personas/empleados/editabasepersona2.jsp?dato="+id);
                     document.getElementById("id_pers").value=""+id;
                     var ret = jQuery("#listaPersoEmple").jqGrid('getRowData',id);
                     histo="Agrega como empleado a "+ret.p_nom+" "+ret.s_nom+" "+ret.p_ape+" "+ret.s_ape+" con cedula "+ret.id_person;
                     
                     //alert("cedula "+ret.id_person);                           
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

 $("#contrato").change(function() {

    var val = $(this).val();

    switch(val.substring(val.lastIndexOf('.') + 1).toLowerCase()){
        case 'doc': case 'docx': case 'pdf': case 'odt': case 'xls': case 'xlsx':
          //  alert("an image");
            break;
        default:
            $(this).val('');
            // error message here
            alert("no es un archivo valido, los formatos permitidos son doc, docx, pdf, odt, xls, xlsx");
            break;
    }
});
 $("#firma").change(function() {

    var val = $(this).val();

    switch(val.substring(val.lastIndexOf('.') + 1).toLowerCase()){
        case 'gif': case 'jpg': case 'png':
          //  alert("an image");
            break;
        default:
            $(this).val('');
            // error message here
            alert("no es una imagen valida, los formatos permitidos son gif, jpg, png");
            break;
    }
});
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
<title>Sin título 1</title>

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
     <iframe onload="respuestacemp()" id="upload_target_emp" name="upload_target_emp" src="" style="border-width:0px;width:90%;height:30px">
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
<img src="../imagenes/fotos/medico.png" name="previewer" id="previewer" alt="imagen no encontrada" height="150px" width="auto"  onerror="this.src='../imagenes/fotos/medico.png'">

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
  
<form name="form_crea_emp" id="form_crea_emp" target="upload_target_emp" action="personas/empleados/nuevoempleado.jsp" method="post"  onsubmit="return validacreaempleado();" enctype="multipart/form-data" > 
    <input type="hidden" id="id_pers" name="id_pers" value="">
    <input type="hidden" id="ced_pers" name="ced_pers" value="">
    <table style="width:100%"> 
        <tr>
            <td>
<fieldset >
<legend>Datos de Contratacion</legend>
<table style="width:100%">

<tr>
<td style="width:25%">
<label >Cargo: </label>
</td>
<td style="width:25%">
<label >Tarjeta Profesional: </label>
</td>
<td style="width:25%">
<label >Registro Profesional: </label>
</td>
<td style="width:25%">
<label >Fecha de Vinculacion </label>
</td>
</tr>

<!-----2da fila----->

<tr>
<td >
<select name="cargo" size="1" id="cargo">
          <%
                         String sql5="select id_cargo,descripcion from cargo;";

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
    <input type="text" name="tarjeta_prof" size="16" id="tarjeta_prof" maxlength="74" style="width:90%">
</td>
<td >
<input type="text" name="registro_prof" size="16" id="registro_prof" maxlength="199" style="width:90%">
</td>
<td >
    <input type="text" id="calendariovinculacion" name="calendariovinculacion" readonly style="width:60%" style="width:90%" onchange="calfechavin()">
</td>
</tr>

<!------3ra fila-------->

<tr>
<td >
<label >clave: </label>
</td>
<td >
<label >confirmar clave: </label>
</td>
<td >
<label >Subir contrato: </label>
</td>
<td >
<label >Firma: </label>
</td>
</tr>

<!-----4ta fila----->

<tr>
<td >
    <input type="password" name="claveemp" size="16" id="claveemp" maxlength="10" style="width:90%">
</td>
<td >
    <input type="password" name="claveemp2" size="16" id="claveemp2" maxlength="10" style="width:90%">
</td>
<td >
<input type="file" value="Subir contrato" name="contrato" size="25" id="contrato" maxlength="30" style="width:90%">
</td>
<td >
<input type="file" value="Subir firma" name="firma" size="25" id="firma" maxlength="30" style="width:90%">
</td>

</tr>
</table>
</fieldset>
</td>
</tr>
<tr>
    <td>
        <fieldset>
         <legend>Permisos</legend>
         <center>
             <table>  
                 <tr><td></td></tr>
             <%
                         String sql6="select id_permi,descripcion from permisos  pe where (pe.id_permi != 9 and pe.id_permi!=8 and pe.id_permi != 14 and pe.id_permi != 15 and pe.id_permi != 13 and pe.id_permi != 11);";
                         int bandc=0;
                         
                             ResultSet resu6=null;
                             try{  resu6=ba.consultas(sql6);
                                   while (resu6.next()&&resu6!=null) { 
                                       
                                        if(bandc==0){out.print("<tr>");}
                                        out.print("<td><input type='checkbox' name='"+resu6.getString(1)+"' id='"+resu6.getString(1)+"' value='"+resu6.getString(2)+"' ><label>"+resu6.getString(2)+"</label></td>");
                                        if(bandc==3){out.print("</tr>");bandc=-1;}                         
                                        bandc++;
                                        
                                                                      }
                                 }                       
                             catch(SQLException ex){}
                             catch(Exception exe){}
                             if(bandc==1||bandc==2||bandc==0){out.print("</tr>");}
                             ba.cierraResultado(resu6);  
            %>  
            </table>
         </center> 
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
