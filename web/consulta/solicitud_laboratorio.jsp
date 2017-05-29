<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8">
        
<script type="text/javascript" language="javascript">
   $(function() {
     $( "#tabla_lab" ).dialog({
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

function abreDialog_lab(){
                          jQuery("#listLab").jqGrid('setCaption',"Laboratorios").trigger('reloadGrid');	
                          var bb=document.getElementById("display_codigo_lab");
                              bb.style.display="none";
                              $("#tabla_lab").dialog("open");
    }

function pasadatoLab(d1,d2,d3){
                       //d1 = id examen real
                       //d2 = codigo examen visible
                       //d3 descripcion
                       document.getElementById("id_real").value=""+d1;
                       document.getElementById("codigo_lab").value=""+d2;
                       document.getElementById("descripcion_lab").value=""+d3;  
                       var bb=document.getElementById("display_codigo_lab");
                       	   bb.style.display="none";
                              }

   $(document).ready(
   
 function(){
	  $("#codigo_lab").keyup(
			      function(){
					var searchbox = $(this).val();
					var dataString = 'searchword='+ searchbox;
					
                                        if(searchbox==''){
					             var bb=document.getElementById("display_codigo_lab");
                       			             bb.style.display="none";
                                                     document.getElementById("descripcion_lab").value='';
							  }
					else{
					    $.ajax({
					    type: "POST",
					    url: "auto_completa_lab.jsp",
					    data: dataString,
					    cache: false,
					    success: function(html){ $("#display_codigo_lab").html(html).show();
                                                                      var canti=document.getElementById("cantidad").value;
                                                                       if(canti==1){document.getElementById("descripcion_lab").value=""+document.getElementById("nomcbrela").value;
                                                                                    document.getElementById("id_real").value=""+document.getElementById("id_r_lab").value;
                                                                                    document.getElementById("codigo_lab").value=""+document.getElementById("codigolab").value;
                                                                                    var bb=document.getElementById("display_codigo_lab");
                                                                                    bb.style.display="none";
                                                                                   }
                                                                        else{document.getElementById("descripcion_lab").value='';}
                                                                    }
			                     });
                                            
			                  }
			                return false;    
			                    }
                                         
	 	             );
 } );
 
	$(document).ready(function(){
             jQuery("#listLabs").jqGrid({
   	url:'carga_lab_sol.jsp',
	datatype: "json",
   	colNames:['id','idconsulta','Codigo','Descripciom','Observaciones','Fecha'],
   	colModel:[
   		{name:'id',index:'id',hidden:true,width:0,search:false, editable:false,required :false},
   		{name:'id_consulta',index:'id_consulta',hidden:true,width:0,search:false, editable:false,required :false},
                {name:'cup_verdadero',index:'cup_verdadero', width:90,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcion',index:'descripcion', width:200,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descri',index:'descri', width:490,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'fecha_soli',index:'fecha_soli', width:150,search:true, editable: true,required : true,editoptions: {maxlength: 400},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		],
   	rowNum:4,
   	rowList:[4,15,30,45],
   	pager:'#pagerLabs',
   	sortname: 'fecha_soli',
   	rownumbers: false,
    viewrecords: true,
    sortorder: "desc",
	multiselect: false,
	loadonce: false,
	//height: 'auto',
        shrinkToFit: false,
	height:100,
        width:960,
	altRows:true,
    rownumbers: false,
    editurl: 'editaCli.php',
	caption: "Laboratorios Solicitados",	
	ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
	                                     NuevoCaso2(""+cedula_nit+"");  }
	
});
jQuery("#listLabs").jqGrid('navGrid','#pagerLabs',{add:false,edit:false,del:false,search:true,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
							{width:400}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:400} //para el view
 								);
  jQuery("#listLabs").jqGrid('navButtonAdd','#pagerLabs',
     {
      caption:"",
      buttonicon:"ui-icon-trash",
      onClickButton:function(){ 
                                var id = jQuery("#listLabs").jqGrid('getGridParam','selrow');
                                if (id)	{
                                        var ret = jQuery("#listLabs").jqGrid('getRowData',id);
                                        var consu="<% out.print(""+session.getAttribute("serial_consulta")+""); %>";
                                        var consu2=""+ret.id_consulta+"";
                                        if(consu==consu2){
                                                          apprise("¿Esta seguro de eliminar el laboratorio seleccionado: "+ret.cup_verdadero+" ?", {'verify':true}, function(opcion) {
                                                            if(opcion) {  
                                                                         $("#idlabo").val(""+ret.id+"");
                                                                          document.fquitalab.submit();  
                                                                          setTimeout ('recargalab()', 500); 
                                                                    }
                                                           });       
                                                        }
                                       else{alert("Solo se permiten eliminar solicitudes de laboratorio realizadas en esta consulta");}
                                }else { alert("Selecciona el laboratorio a eliminar");}
                                
                              },
      position:"last",
      title:"Elimina laboratorio solicitado",
      cursor: "pointer"});                                                                   
  ////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////
              jQuery("#listLab").jqGrid({
   	url:'carga_laboratorios.jsp?q=2',
	datatype: "json",
   	colNames:['irreal','Codigo','Dercripción'],
   	colModel:[
   		{name:'id_cups',index:'id_cups', width:0,hidden:true,search:false, editable: false,required : false},
   		{name:'cup_verdadero',index:'cup_verdadero', width:80,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcion',index:'descripcion', width:320,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		],
   	rowNum:15,
   	rowList:[15,30,45],
   	height:300,
   	pager: '#pagerLab',
   	sortname: 'cup_verdadero',
   	rownumbers: false,
    viewrecords: true,
    sortorder: "desc",
	multiselect: false,
	loadonce: false,
	//height: 'auto',
	altRows:true,
	autoheight:true,
    width: 760, 
    rownumbers: false,
    editurl: 'editaCli.php',
	caption: "Laboratorios",	
	ondblClickRow: function(id){
                                    var ret = jQuery("#listLab").jqGrid('getRowData',id);
                                    //alert(""+ret.id_subcie10+" "+ret.descripcion+"");   
                                    document.getElementById("descripcion_lab").value=""+ret.descripcion;
                                    document.getElementById("codigo_lab").value=""+ret.cup_verdadero;
                                    document.getElementById("id_real").value=""+ret.id_cups;
                                    $("#tabla_lab").dialog( "close" );
                                  }
	
});
 <%    int valida=Integer.parseInt((String)session.getAttribute("validalab"));
        if(valida==1){
            %>
jQuery("#listLab").jqGrid('navGrid','#pagerLab',{add:false,edit:false,del:false,search:false,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {    } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:60} //para el view
 								);
 <%   
 out.print("jQuery('#listLab').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});");
 session.setAttribute("validalab","2");
        } %>                                                                  
                                                                    
 });
    $('#form_labo').submit(function() {
                           var nom = document.getElementById("descripcion_lab").value; 
                           var des = document.getElementById("observaciones_evol_consu").value; 
                           if( nom == null || nom.length == 0 || /^\s+$/.test(nom) ) {
                                                      alert('El laboratorio a solicitar es obligatorio');
                                                      return false;  
                                                                      }   
                         
                           if( des.length >= 598 ) {
                                                      alert('Las observaciones tienen como máximo 598 caracteres');
                                                       return false;  
                                                                      }                                        

                                
                               des=des.replace(/\r\n|\n|\r/g, " ");
                               document.getElementById("observaciones_evol_consu").value=des;
                    // Enviamos el formulario usando AJAX
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#reltlab').html(data);
                                  //actualiza la tabla
                                  jQuery("#listLabs").jqGrid('setCaption',"Laboratorios Solicitados").trigger('reloadGrid');	
                                  document.getElementById("id_real").value="";
                                  document.getElementById("codigo_lab").value="";
                                  document.getElementById("descripcion_lab").value=""; 
                                  document.getElementById("observaciones_evol_consu").value=""; 
                              }                             
                          })
                     
                          return false;
                      }); 
function recargalab(){jQuery("#listLabs").jqGrid('setCaption',"Laboratorios Solicitados").trigger('reloadGrid');}                      
</script> 

<title>Sin título 1</title>
</head>

<body>
     <%       request.setCharacterEncoding("UTF-8");
        //  out.print("nom "+session.getAttribute("nombre")+" clave "+session.getAttribute("clave")+" id "+session.getAttribute("id")+" permiso "+session.getAttribute("permiso")+" s agenda "+session.getAttribute("serial_agenda" )+" s paciente"+session.getAttribute("serial_pacinete"));
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){
          
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>  
    <% 
              out.println("</body></html>");
              return;
            }
     %> 
 <fieldset>
<legend>Laboratorios:</legend>
<form  id="form_labo" name="form_labo" accept-charset="UTF-8" action="agregalabo.jsp">
<table style="width:100%" border="0" >
    <tr >
        <td style="width:21%"><label>Codigo</label></td>
        <td style="width:5%"><label style="padding-left:10px"></label></td>
        <td style="width:74%"><label style="padding-left:10px">Descripción</label></td>
    </tr>
    <tr>
        <td id="tdsollab"> 
            <input type="text" id="codigo_lab" name="codigo_lab" class="codigo_lab" style="width:100%" >
            <input type="hidden" name="id_real" id="id_real">
             <div id="display_codigo_lab"></div> 
        </td>
        <td >
            <center>  <img src="../imagenes/fotos/buscar.png" id="busca" name="busca" class="mas" alt="falla al cargar imagen" width="18px" height="18px" onclick="abreDialog_lab();" > </center>
        </td>
        <td >
           <input type="text" id="descripcion_lab" name="descripcion_lab" class="descripcion_lab" disabled="true"  style="width:100%"> 
        </td>
    </tr>
     <tr>
         <td colspan="3" >
            <label>Observaciones:</label><br>
            <textarea name="observaciones_evol_consu" id="observaciones_evol_consu" rows="2" style="width:95%"></textarea>
            &nbsp;&nbsp;<input type="image" src="../imagenes/fotos/agregar.png" style="width:25px;height:25px" alt="fallo">
            <br>
        </td>
    </tr>
    </table> 
    </form>
             
<table style="width:100%"> 
    <tr>
        <td ><br>
   <table id="listLabs" ></table>
   <div id="pagerLabs"></div>          
        </td>
    </tr>
</table>
</fieldset>   
    <div id="tabla_lab" name="tabla_lab" style="text-align: center">
        <center>
          <table id="listLab" ></table>
          <div id="pagerLab"></div>  
        </center>  
    </div> 
 <div id="reltlab" name="reltlab" style="display:none"></div> 
 <form id="fquitalab" name="fquitalab" method="post" action="quitalabs.jsp"  target="iframe_quitalab" accept-charset="UTF-8" >
     <input type="hidden" id="idlabo" name="idlabo">
 </form> 
<iframe name="iframe_quitalab" id="iframe_quitalab" style="display:none"></iframe>
 
</body>

</html>
