<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8">
        
<script type="text/javascript" language="javascript">
   $(function() {
     $( "#tabla_img" ).dialog({
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

function abreDialog_img(){
                          jQuery("#listimgg").jqGrid('setCaption',"Imagenes").trigger('reloadGrid');	
                          var bb=document.getElementById("display_codigo_img");
                              bb.style.display="none";
                              $("#tabla_img").dialog("open");
    }

function pasadatoimg(d1,d2,d3){
                       //d1 = id examen real
                       //d2 = codigo examen visible
                       //d3 descripcion
                       document.getElementById("id_img_real").value=""+d1;
                       document.getElementById("codigo_img").value=""+d2;
                       document.getElementById("descripcion_img").value=""+d3;  
                       var bb=document.getElementById("display_codigo_img");
                       	   bb.style.display="none";
                              }

   $(document).ready(
   
 function(){
	  $("#codigo_img").keyup(
			      function(){
					var searchbox = $(this).val();
					var dataString = 'searchword='+ searchbox;
					
                                        if(searchbox==''){
					             var bb=document.getElementById("display_codigo_img");
                       			             bb.style.display="none";
                                                     document.getElementById("descripcion_img").value='';
							  }
					else{
					    $.ajax({
					    type: "POST",
					    url: "auto_completa_img.jsp",
					    data: dataString,
					    cache: false,
					    success: function(html){ $("#display_codigo_img").html(html).show();
                                                                       var canti=document.getElementById("cantidad").value;
                                                                       
                                                                     if(canti==1){document.getElementById("descripcion_img").value=""+document.getElementById("nomcbrela").value;
                                                                                    document.getElementById("id_img_real").value=""+document.getElementById("id_r_img").value;
                                                                                    document.getElementById("codigo_img").value=""+document.getElementById("codigoimg").value;
                                                                                    var bb=document.getElementById("display_codigo_img");
                                                                                    bb.style.display="none";
                                                                                   }
                                                                        else{document.getElementById("descripcion_img").value='';}
                                                                    }
			                     });
                                            
			                  }
			                return false;    
			                    }
                                         
	 	             );
 } );
 
	$(document).ready(function(){
             jQuery("#listimg").jqGrid({
   	url:'carga_img_sol.jsp',
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
   	height:100,
   	pager:'#pagerimg',
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
	caption: "Imagenes Solicitadas",	
	ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
	                                     NuevoCaso2(""+cedula_nit+"");  }
	
});
jQuery("#listimg").jqGrid('navGrid','#pagerimg',{add:false,edit:false,del:false,search:true,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
							{width:400}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:400} //para el view
 								);
  jQuery("#listimg").jqGrid('navButtonAdd','#pagerimg',
     {
      caption:"",
      buttonicon:"ui-icon-trash",
      onClickButton:function(){ 
                                var id = jQuery("#listimg").jqGrid('getGridParam','selrow');
                                if (id)	{
                                        var ret = jQuery("#listimg").jqGrid('getRowData',id);
                                        var consu="<% out.print(""+session.getAttribute("serial_consulta")+""); %>";
                                        var consu2=""+ret.id_consulta+"";
                                        if(consu==consu2){
                                                          apprise("¿Esta seguro de eliminar la imagenen seleccionada: "+ret.cup_verdadero+" ?", {'verify':true}, function(opcion) {
                                                            if(opcion) {  
                                                                         $("#idimg").val(""+ret.id+"");
                                                                          document.fquitaimg.submit();  
                                                                          setTimeout ('recargaimg()', 500); 
                                                                    }
                                                           });       
                                                        }
                                       else{alert("Solo se permiten eliminar solicitudes de imagenes realizadas en esta consulta");}
                                }else { alert("Selecciona el imagenes a eliminar");}
                                
                              },
      position:"last",
      title:"Eliminar imagenes solicitadas",
      cursor: "pointer"});                                                                   
  ////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////
              jQuery("#listimgg").jqGrid({
   	url:'carga_imagenes.jsp?q=2',
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
   	pager: '#pagerimgg',
   	sortname: 'cup_verdadero',
   	rownumbers: false,
    viewrecords: true,
    sortorder: "desc",
	multiselect: false,
	loadonce: false,
	//height: 'auto',
	height: 200,
	altRows:true,
	autoheight:true,
    width: 760, 
    rownumbers: false,
 //   editurl: 'editaCli.php',
	caption: "Imagenes",	
	ondblClickRow: function(id){
                                    var ret = jQuery("#listimgg").jqGrid('getRowData',id);
                                    //alert(""+ret.id_subcie10+" "+ret.descripcion+"");   
                                    document.getElementById("descripcion_img").value=""+ret.descripcion;
                                    document.getElementById("codigo_img").value=""+ret.cup_verdadero;
                                    document.getElementById("id_img_real").value=""+ret.id_cups;
                                    $("#tabla_img").dialog( "close" );
                                  }
	
});
<%    int valida=Integer.parseInt((String)session.getAttribute("validaimg"));
        if(valida==1){
            %>
jQuery("#listimgg").jqGrid('navGrid','#pagerimgg',{add:false,edit:false,del:false,search:false,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {    } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:60} //para el view
 								);
  <%  
 out.print("jQuery('#listimgg').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});");  session.setAttribute("validaimg","2");
        } %>                                                                        
 });
    $('#form_img').submit(function() {
                           var nom = document.getElementById("descripcion_img").value; 
                           var des = document.getElementById("observaciones_img_consu").value; 
                           if( nom == null || nom.length == 0 || /^\s+$/.test(nom) ) {
                                                      alert('La imagen a solicitar es obligatoria');
                                                      return false;  
                                                                      }   
                         
                           if( des.length >= 598 ) {
                                                      alert('Las observaciones tienen como máximo 598 caracteres');
                                                       return false;  
                                                                      }                                        
                           
                               des=des.replace(/\r\n|\n|\r/g, " ");
                               document.getElementById("observaciones_img_consu").value=des;
                    // Enviamos el formulario usando AJAX
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#reltimg').html(data);
                                  //actualiza la tabla
                                  jQuery("#listimg").jqGrid('setCaption',"Imagenes Solicitadas").trigger('reloadGrid');	
                                  document.getElementById("id_img_real").value="";
                                  document.getElementById("codigo_img").value="";
                                  document.getElementById("descripcion_img").value=""; 
                                  document.getElementById("observaciones_img_consu").value=""; 
                              }                             
                          })
                     
                          return false;
                      }); 
function recargaimg(){jQuery("#listimg").jqGrid('setCaption',"Imagenes Solicitadas").trigger('reloadGrid');}                      
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
<legend>Imagenes:</legend>
<form  id="form_img" name="form_img" accept-charset="UTF-8" action="agregaima.jsp">
<table style="width:100%" border="0" >
    <tr >
        <td style="width:21%"><label>Codigo</label></td>
        <td style="width:5%"><label style="padding-left:10px"></label></td>
        <td style="width:74%"><label style="padding-left:10px">Descripción</label></td>
    </tr>
    <tr>
        <td id="tdsollab"> 
            <input type="text" id="codigo_img" name="codigo_img" class="codigo_img" style="width:100%" >
            <input type="hidden" name="id_img_real" id="id_img_real">
             <div id="display_codigo_img"></div> 
        </td>
        <td >
            <center>  <img src="../imagenes/fotos/buscar.png" id="busca" name="busca" class="mas" alt="falla al cargar imagen" width="18px" height="18px" onclick="abreDialog_img();" > </center>
        </td>
        <td >
           <input type="text" id="descripcion_img" name="descripcion_img" class="descripcion_img" disabled="true"  style="width:100%"> 
        </td>
    </tr>
     <tr>
         <td colspan="3" >
            <label>Observaciones:</label><br>
            <textarea name="observaciones_img_consu" id="observaciones_img_consu" rows="2" style="width:95%"></textarea>
            &nbsp;&nbsp;<input type="image" src="../imagenes/fotos/agregar.png" style="width:25px;height:25px" alt="fallo">
            <br>
        </td>
    </tr>
    </table> 
    </form>
             
<table style="width:100%"> 
    <tr>
        <td ><br>
   <table id="listimg" ></table>
   <div id="pagerimg"></div>          
        </td>
    </tr>
</table>
</fieldset>   
    <div id="tabla_img" name="tabla_img" style="text-align: center">
        <center>
          <table id="listimgg" ></table>
          <div id="pagerimgg"></div>  
        </center>  
    </div> 
 <div id="reltimg" name="reltimg" style="display:none"></div> 
 <form id="fquitaimg" name="fquitaimg" method="post" action="quitaimgs.jsp"  target="iframe_quitaimg" accept-charset="UTF-8" >
     <input type="hidden" id="idimg" name="idimg">
 </form> 
<iframe name="iframe_quitaimg" id="iframe_quitaimg" style="display:none"></iframe>
 
</body>

</html>
