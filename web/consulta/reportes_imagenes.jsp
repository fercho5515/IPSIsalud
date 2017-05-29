<%@page import="java.util.Calendar" session="true" %>
<%@page import="java.util.GregorianCalendar" session="true" %>
<%@page import="java.util.Date" session="true" %>
<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8">
        
<script type="text/javascript" language="javascript">
 anchoPantalla=980;

         $(document).ready(function(){
             jQuery("#list15i").jqGrid({
   	url:'carga_muestra_result_img.jsp',
	datatype: "json",
   	colNames:['id_ima','cod_examen','Codigo','Descripción','Reporte','Fecha','codilgo_siliimg','id_consulta'],
   	colModel:[
   		{name:'id_ima',index:'id_ima',hidden:true,width:0,search:false,editable: false,required : false},
                {name:'cod_examen',index:'cod_examen',hidden:true,width:0,search:false,editable: false,required : false},
   		{name:'cup_verdadero',index:'cup_verdadero', width:((anchoPantalla*12)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcion',index:'descripcion', width:((anchoPantalla*35)/100),search:true, editable: true,required : true,editoptions: {maxlength: 400},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'reporte',index:'reporte', width:((anchoPantalla*40)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'fecha',index:'fecha', width:((anchoPantalla*8)/100),search:true, editable: true,required : true,editoptions: {maxlength: 400},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	   	{name:'id_sol_ima',index:'id_sol_ima',hidden:true,width:0,search:false, editable:false,required :false},
                {name:'id_consulta',index:'id_consulta',hidden:true,width:0,search:false, editable:false,required :false},
            ],
   	rowNum:2,
   	rowList:[2,15,30,45],
   	pager: '#pager15i',
   	sortname: 'fecha',
    viewrecords: true,
    sortorder: "desc",    
        shrinkToFit: false,
	//multiselect: false,
	////loadonce: true,
	height:50,
     width:anchoPantalla-13,
    rownumbers: false,
    editurl: 'editaCli.php',
	caption: "REALIZADOS",
	ondblClickRow: function(id){  
                  var ret = jQuery("#list15i").jqGrid('getRowData',id);
                  window.open ("muestra_reportes_img.jsp?dato="+ret.id_ima+"&"+"dato2="+ret.id_sol_ima+"","Reportes",""); 
                                           }	
});
jQuery("#list15i").jqGrid('navGrid','#pager15i',{add:false,edit:false,del:false,search:true,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:60} //para el view
 								);
jQuery("#list15i").jqGrid('navButtonAdd','#pager15i',
     {
      caption:"",
      buttonicon:"ui-icon-trash",
      onClickButton:function(){ 
                                var id = jQuery("#list15i").jqGrid('getGridParam','selrow');
                                if (id)	{
                                        var ret = jQuery("#list15i").jqGrid('getRowData',id);
                                        var consu="<% out.print(""+session.getAttribute("serial_consulta")+""); %>";
                                        var consu2=""+ret.id_consulta+"";
                                        
                                        if(consu==consu2){
                                                          apprise("¿Esta seguro de eliminar el resulatado de la imagen seleccionada: "+ret.cup_verdadero+" ?", {'verify':true}, function(opcion) {
                                                            if(opcion) {                                                                         
                                                                          $("#soli_img").val(""+ret.id_sol_ima+"");
                                                                          $("#resu_img").val(""+ret.id_ima+"");
                                                                          document.form_borra_respu_img.submit();  
                                                                          setTimeout ('recaga_tablas()', 500); 
                                                                       }
                                                           });       
                                                        }
                                       else{alert("Solo se permiten eliminar resultados de imagenes ingresados en esta consulta");
                                           //alert("coltulta session "+consu+" consulta tabla:"+consu2);
                                           }
                                }else { alert("Selecciona el resultado de imagen a eliminar");}
                                
                              },
      position:"last",
      title:"Borrar resultado de imagen",
      cursor: "pointer"}); 

/* 								
$("#pager10").click(function(){
	var gr = jQuery("#list10").getGridParam('selrow');
	if( gr != null ) jQuery("#list10").editGridRow(gr,{height:280,reloadAfterSubmit:false});
	else alert("Por Favor Seleccione Un Usuario");
});
*/

 });
            function muestraarchimggg(arc){
                                         $("#ruta_arch_imggg").val(arc);
                                         document.forms["muestra_arch_imggg"].submit();
                                        }
                                        
//---------------------------------------------

	$(document).ready(function(){
             jQuery("#list16i").jqGrid({
   	url:'carga_resul_img.jsp',
	datatype: "json",
   	colNames:['id','id_img','Codigo','Descripción','Observaciones','Fecha','medico que la pidio','arc1','Archivo'],
   	colModel:[
   		{name:'serial',index:'serial',hidden:true,width:0,search:false,editable: false,required : false},
   		{name:'id_img',index:'id_img',hidden:true,width:0,search:false,editable: false,required : false},
   		{name:'cup_verdadero',index:'cup_verdadero', width:((anchoPantalla*9)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcion',index:'descripcion', width:((anchoPantalla*38)/100),search:true, editable: true,required : true,editoptions: {maxlength: 400},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descri',index:'descri',width:((anchoPantalla*29)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'fecha_soli',index:'fecha_soli', width:((anchoPantalla*13)/100),search:true, editable: true,required : true,editoptions: {maxlength: 400},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'nmed',index:'nmed',hidden:true,width:0,search:false,editable: false,required : false},
   	        {name:'arcc1',index:'arcc1',hidden:true,width:0,search:false,editable: false,required : false},
   		{name:'arcc',index:'arcc',width:((anchoPantalla*5)/100),align:"center",search:false,editable: false},   		    
            ],
   	rowNum:2,
   	rowList:[2,15,30,45],
   	height:300,
   	pager: '#pager16i',
   	sortname: 'fecha_soli',
   	rownumbers: false,
        viewrecords: true,
        sortorder: "desc",
	multiselect: false,
	loadonce: false,
	 width:anchoPantalla-13,
	//height: 190,
	height:50,
   // autowidth: true, 
        shrinkToFit: false,
	//height: 190,
	//altRows:true, una fila de un color y otra de otro
	autoheight:true,
       // autowidth: true, 
        rownumbers: false,
	caption: "PENDIENTES CARGAR RESULTADO",	
        gridComplete: function () {
                                        var ids = jQuery("#list16i").jqGrid('getDataIDs');
                                        for (var i = 0; i < ids.length; i++)
                                        {
                                            var ret = jQuery("#list16i").jqGrid('getRowData',ids[i]);

                                            if(ret.arcc1!="nada"){
                                                           be = "<img id='lab_a' src='../imagenes/fotos/arc.png' onclick='muestraarchimggg(\""+ret.arcc1+"\")'>";
                                               }
                                               else{be="";}
                                            jQuery("#list16i").jqGrid('setRowData', ids[i], { arcc: be });
                                        }                  
                                  },
	ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
	                                     NuevoCaso2(""+cedula_nit+"");  }
	
});
jQuery("#list16i").jqGrid('navGrid','#pager16i',{add:false,edit:false,del:false,search:true,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:300} //para el view
 								);
  jQuery("#list16i").jqGrid('navButtonAdd','#pager16i',
     {
      caption:"",
      buttonicon:"ui-icon-clipboard",
      onClickButton:function(){ 
                                var id = jQuery("#list16i").jqGrid('getGridParam','selrow');
                                if (id)	{
                                         var ret = jQuery("#list16i").jqGrid('getRowData',id);
                                         
                                         document.getElementById("cod_img").innerHTML=""+ret.cup_verdadero+"";
                                         document.getElementById("nom_img").innerHTML=""+ret.descripcion+"";
                                         var fech=""+ret.fecha_soli+"";
                                         var num=fech.indexOf(" ");
                                         var fe = fech.substr(0,num);
                                        // var fe= substr(""+ret.fecha_soli+"", 0, indexOf(""+ret.fecha_soli+"", ' ')); 
                                         document.getElementById("fec_img").innerHTML=""+fe+"";
                                         document.getElementById("lad_ordeno2").innerHTML=""+ret.nmed+"";
                                         document.getElementById("id_img_sol").value=""+ret.serial+"";
                                         document.getElementById("cod_exam2").value=""+ret.id_img+"";                                         
                                         
                                         document.getElementById("result2").value="";
                                         document.getElementById("arch2").value="";
                                         $("#diag_nuevo_img").dialog("open");                                         
                                        }
                                else { alert("Selecciona laboratorio a cargar resultados");}                                
                              },
      position:"last",
      title:"Agregar Resultado Laboratorio",
      cursor: "pointer"}); 

 });

//---------------------------------------------
      $(function() {
     $( "#diag_nuevo_img" ).dialog({
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

  function valida(){
                           var nom = document.getElementById("result2").value; 
                           if( nom == null || nom.length == 0 || /^\s+$/.test(nom) ) {
                                             alert('La descripción del resultado es obligatoria');
                                             return false;  
                                                                      } 
                           
                               nom=nom.replace(/\r\n|\n|\r/g, " ");
                               document.getElementById("result2").value=nom;                                           
                                                                      
                                                                      
                           $("#diag_nuevo_img").dialog("close");         
                           setTimeout ('recaga_tablas()',600);
                          return true;
                   }
function recaga_tablas(){
jQuery("#list15i").jqGrid('setCaption',"REALIZADOS").trigger('reloadGrid');
jQuery("#list16i").jqGrid('setCaption',"PENDIENTES CARGAR RESULTADO ").trigger('reloadGrid');
jQuery("#listimg").jqGrid('setCaption',"Imagenes Solicitadas").trigger('reloadGrid');
}                      
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
    <br>
    <iframe id="resultaaa" name="resultaaa" style="height:30px;width:90%;border: 0"></iframe>    
    <br>
<legend>Imagenes</legend>

<table style="height:100%;width:100%">
<tr><td>
<table id="list15i" ></table>
 <div id="pager15i"></div> 
</td></tr>

<tr><td><br>
<div>
            <%   String per=""+session.getAttribute("permiso");
            if(per.compareTo("1")!=0){ %>
<table id="list16i" ></table>
 <div id="pager16i" style="height:35px"></div> 
       <% } %>
 </div>
</td></tr>

</table> 
</fieldset>
<br>
<div id="diag_nuevo_img" name="diag_nuevo_img">
    <fieldset>
        <legend>Imagenes</legend>
        <br>
        <table style="width:100%" border="0"><tr><td style="width:8% "><label><b>Codigo:</b></label></td><td style="width:12%;padding-left:10px;text-align:left"><label id="cod_img" name="cod_img"></label></td><td style="width:15%;padding-left:10px;text-align:right"><label><b>Descripción:</b></label></td><td style="width:65%;padding-left:10px;text-align:left"><label  id="nom_img" name="nom_img"></label></td></tr></table>
        <table style="width:100%" border="0"><tr><td style="width:16% "><label><b>Odenado por:</b></label></td><td style="width:59%;padding-left:10px;text-align:left"><label id="lad_ordeno2" name="lad_ordeno2"></label></td><td style="width:10%;padding-left:10px;text-align:right"><label><b>Fecha:</b></label></td><td style="width:15%;padding-left:10px;text-align:left"><label  id="fec_img" name="fec_img"></label></table>
        <br><br>
        <label><b> Resultado</b></label><br>
        <%
                   Calendar cal1 = Calendar.getInstance();
	            String dia=""+cal1.get(Calendar.DATE)+"";
	                   dia=dia.trim();
	            String mes=""+(1+Integer.parseInt(""+cal1.get(Calendar.MONTH)+""))+"";
	                   mes=mes.trim();
	            if(dia.length()==1){dia="0"+dia;} 
	            if(mes.length()==1){mes="0"+mes;} 	      
                String fecha=""+cal1.get(Calendar.YEAR)+"-"+mes+"-"+dia; 
        %>
        <table style="width:100%" border="0"><tr><td style="width:16% "><label><b>Ingresado por:</b></label></td><td style="width:59%;padding-left:10px;text-align:left"><label><% out.println((String)session.getAttribute("nombre")); %></label></td><td style="width:10%;padding-left:10px;text-align:right"><label><b>Fecha:</b></label></td><td style="width:15%;padding-left:10px;text-align:left"><label><% out.print(fecha); %></label></table>
        <form id="form_reportes_lab_hoy" name="form_reportes_lab_hoy" method="post" action="ingresa_report_img.jsp" target="resultaaa" onsubmit="return valida();" enctype="multipart/form-data"  >
                <input type="hidden" id="id_img_sol" name="id_img_sol" value="">
                <input type="hidden" id="cod_exam2" name="cod_exam2" value="">
                <textarea rows="5" id="result2" name="result2" style="width:100%"></textarea><br>
                <center><input type="file" id="arch2" name="arch2" value="Archivo"></center><br><br>        
                <center><input type="submit" value="Guardar"></center>  
        </form>
    </fieldset>
</div>
<iframe name="iframe_b_r_i" id="iframe_b_r_i" style="display: none" > </iframe> 
<form id="form_borra_respu_img" name="form_borra_respu_img" action="borra_respu_img.jsp" target="resultaaa" method="post">
    <input type="hidden" name="soli_img" id="soli_img">
    <input type="hidden" name="resu_img" id="resu_img">
</form> 

<form id="muestra_arch_imggg" name="muestra_arch_imggg" method="post" action="muestra_arch_img.jsp" target="_blank" >
            <input type="hidden" id="ruta_arch_imggg" name="ruta_arch_imggg">
        </form> 
</body>

</html>
