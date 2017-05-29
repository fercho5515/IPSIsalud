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
             jQuery("#list15").jqGrid({
   	url:'carga_muestra_result_lab.jsp',
	datatype: "json",
   	colNames:['id_lab','cod_examen','Codigo','Descripción','Reporte','Fecha','id_soli_lab','id_consulta'],
   	colModel:[
   		{name:'id_lab',index:'id_lab',hidden:true,width:0,search:false,editable: false,required : false},
                {name:'cod_examen',index:'cod_examen',hidden:true,width:0,search:false,editable: false,required : false},
   		{name:'cup_verdadero',index:'cup_verdadero', width:((anchoPantalla*12)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcion',index:'descripcion', width:((anchoPantalla*35)/100),search:true, editable: true,required : true,editoptions: {maxlength: 400},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'reporte',index:'reporte', width:((anchoPantalla*40)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'fecha',index:'fecha', width:((anchoPantalla*8)/100),search:true, editable: true,required : true,editoptions: {maxlength: 400},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	        {name:'id_sol_lab',index:'id_sol_lab',hidden:true,width:0,search:false, editable:false,required :false},
                {name:'id_consulta',index:'id_consulta',hidden:true,width:0,search:false, editable:false,required :false},
        ],
   	rowNum:2,
   	rowList:[2,15,30,45],
   	pager: '#pager15',
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
	caption: "RESULTADOS",
	ondblClickRow: function(id){  
                  var ret = jQuery("#list15").jqGrid('getRowData',id);
                  window.open ("muestra_reportes_lab.jsp?dato="+ret.id_lab+"&"+"dato2="+ret.id_sol_lab+"","Reportes",""); 
                                           }
	
});
jQuery("#list15").jqGrid('navGrid','#pager15',{add:false,edit:false,del:false,search:true,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:60} //para el view
 								);
   jQuery("#list15").jqGrid('navButtonAdd','#pager15',
     {
      caption:"",
      buttonicon:"ui-icon-trash",
      onClickButton:function(){ 
                                var id = jQuery("#list15").jqGrid('getGridParam','selrow');
                                if (id)	{
                                        var ret = jQuery("#list15").jqGrid('getRowData',id);
                                        var consu="<% out.print(""+session.getAttribute("serial_consulta")+""); %>";
                                        var consu2=""+ret.id_consulta+"";
                                        if(consu==consu2){
                                                          apprise("¿Esta seguro de eliminar el resulatado del laboratorio seleccionado: "+ret.cup_verdadero+" ?", {'verify':true}, function(opcion) {
                                                            if(opcion) {                                                                         
                                                                          $("#soli_lab").val(""+ret.id_sol_lab+"");
                                                                          $("#resu_lab").val(""+ret.id_lab+"");
                                                                          document.form_borra_respu_lab.submit();  
                                                                          setTimeout ('recaga_tablas()', 500); 
                                                                    }
                                                           });       
                                                        }
                                       else{alert("Solo se permiten eliminar resultados de laboratorio ingresados en esta consulta");}
                                }else { alert("Selecciona el resultado de laboratorio a eliminar");}
                                
                              },
      position:"last",
      title:"Borrar resultado de laboratorio",
      cursor: "pointer"});                                                                    
/* 								
$("#pager10").click(function(){
	var gr = jQuery("#list10").getGridParam('selrow');
	if( gr != null ) jQuery("#list10").editGridRow(gr,{height:280,reloadAfterSubmit:false});
	else alert("Por Favor Seleccione Un Usuario");
});
*/

 });

            function muestraarchlabbb(arc){
                                         $("#ruta_arch_labbb").val(arc);
                                         document.forms["muestra_arch_labbb"].submit();
                                        }
//---------------------------------------------
	$(document).ready(function(){
             jQuery("#list16").jqGrid({
   	url:'carga_resul_lab.jsp',
	datatype: "json",
   	colNames:['id','id_lab','Codigo','Descripción','Observaciones','Fecha','medico que la pidio','arc1','Archivo'],
   	colModel:[
   		{name:'serial',index:'serial',hidden:true,width:0,search:false,editable: false,required : false},
   		{name:'id_lab',index:'id_lab',hidden:true,width:0,search:false,editable: false,required : false},
   		{name:'cup_verdadero',index:'cup_verdadero', width:((anchoPantalla*9)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcion',index:'descripcion', width:((anchoPantalla*38)/100),search:true, editable: true,required : true,editoptions: {maxlength: 400},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descri',index:'descri', width:((anchoPantalla*29)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'fecha_soli',index:'fecha_soli', width:((anchoPantalla*13)/100),search:true, editable: true,required : true,editoptions: {maxlength: 400},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'nmed',index:'nmed',hidden:true,width:0,search:false,editable: false,required : false},
   	        {name:'arc1',index:'arc1',hidden:true,width:0,search:false,editable: false,required : false},
   		{name:'arc',index:'arc',width:((anchoPantalla*5)/100),align:"center",search:false,editable: false},
   		],
   	rowNum:2,
   	rowList:[2,15,30,45],
   	height:300,
   	pager: '#pager16',
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
        editurl: 'editaCli.php',
	caption: "PENDIENTES CARGAR RESULTADO",	
        gridComplete: function () {
                                        var ids = jQuery("#list16").jqGrid('getDataIDs');
                                        for (var i = 0; i < ids.length; i++)
                                        {
                                            var ret = jQuery("#list16").jqGrid('getRowData',ids[i]);

                                            if(ret.arc1!="nada"){
                                                           be = "<img id='lab_a' src='../imagenes/fotos/arc.png' onclick='muestraarchlabbb(\""+ret.arc1+"\")'>";
                                               }
                                               else{be="";}
                                            jQuery("#list16").jqGrid('setRowData', ids[i], { arc: be });
                                        }                  
                                  },
	ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
	                                     NuevoCaso2(""+cedula_nit+"");  }
	
});
jQuery("#list16").jqGrid('navGrid','#pager16',{add:false,edit:false,del:false,search:true,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:300} //para el view
 								);
  jQuery("#list16").jqGrid('navButtonAdd','#pager16',
     {
      caption:"",
      buttonicon:"ui-icon-clipboard",
      onClickButton:function(){ 
                                var id = jQuery("#list16").jqGrid('getGridParam','selrow');
                                if (id)	{
                                         var ret = jQuery("#list16").jqGrid('getRowData',id);
                                         
                                         document.getElementById("cod_lab").innerHTML=""+ret.cup_verdadero+"";
                                         document.getElementById("nom_lab").innerHTML=""+ret.descripcion+"";
                                         var fech=""+ret.fecha_soli+"";
                                         var num=fech.indexOf(" ");
                                         var fe = fech.substr(0,num);
                                        // var fe= substr(""+ret.fecha_soli+"", 0, indexOf(""+ret.fecha_soli+"", ' ')); 
                                         document.getElementById("fec_lab").innerHTML=""+fe+"";
                                         document.getElementById("lad_ordeno").innerHTML=""+ret.nmed+"";
                                         document.getElementById("id_lab_sol").value=""+ret.serial+"";
                                         document.getElementById("cod_exam").value=""+ret.id_lab+"";                            
                                         document.getElementById("result_labor").value="";
                                         document.getElementById("arch").value="";
                                         $("#diag_nuevo_lab").dialog("open");                                         
                                        }
                                else { alert("Selecciona laboratorio a cargar resultados");}                                
                              },
      position:"last",
      title:"Agregar Resultado Laboratorio",
      cursor: "pointer"}); 

 });

//---------------------------------------------
      $(function() {
     $( "#diag_nuevo_lab" ).dialog({
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
                           var nom = document.getElementById("result_labor").value; 
                           if( nom == null || nom.length == 0 || /^\s+$/.test(nom) ) {
                                             alert('La descripción del resultado es obligatoria');
                                             return false;  
                                                                      } 
                           
                               nom=nom.replace(/\r\n|\n|\r/g, " ");
                               document.getElementById("result_labor").value=nom;                                               
                           $("#diag_nuevo_lab").dialog("close");         
                           setTimeout ('recaga_tablas()',600);
                          return true;
                   }
function recaga_tablas(){
jQuery("#list15").jqGrid('setCaption',"REALIZADOS").trigger('reloadGrid');
jQuery("#list16").jqGrid('setCaption',"PENDIENTES CARGAR RESULTADO ").trigger('reloadGrid');
jQuery("#listLabs").jqGrid('setCaption',"Laboratorios Solicitados").trigger('reloadGrid');
} 

</script>        
        
        

<title>Reportes</title>
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
     <fieldset >
    <br>
    <iframe id="resultaaa" name="resultaaa" style="height:30px;width:90%;border: 0"></iframe>    
    <br>
<legend>Laboratorios</legend>

<table style="height:100%;width:100%">
<tr><td>
<table id="list15" ></table>
 <div id="pager15"></div> 
</td></tr>

<tr><td><br>
        <%   String per=""+session.getAttribute("permiso");
            if(per.compareTo("1")!=0){ %>
<div>
<table id="list16" ></table>
 <div id="pager16" style="height:35px"></div> 
 </div>
        <% } %>
</td></tr>

</table> 
</fieldset>
<br>
<div id="diag_nuevo_lab" name="diag_nuevo_lab">
    <fieldset>
        <legend>Laboratorio</legend>
        <br>
        <table style="width:100%" border="0"><tr><td style="width:8% "><label><b>Codigo:</b></label></td><td style="width:12%;padding-left:10px;text-align:left"><label id="cod_lab" name="cod_lab"></label></td><td style="width:15%;padding-left:10px;text-align:right"><label><b>Descripción:</b></label></td><td style="width:65%;padding-left:10px;text-align:left"><label  id="nom_lab" name="nom_lab"></label></td></tr></table>
        <table style="width:100%" border="0"><tr><td style="width:16% "><label><b>Odenado por:</b></label></td><td style="width:59%;padding-left:10px;text-align:left"><label id="lad_ordeno" name="lad_ordeno"></label></td><td style="width:10%;padding-left:10px;text-align:right"><label><b>Fecha:</b></label></td><td style="width:15%;padding-left:10px;text-align:left"><label  id="fec_lab" name="fec_lab"></label></table>
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
        <form id="form_reportes_lab_hoy" name="form_reportes_lab_hoy" method="post" action="ingresa_report.jsp" target="resultaaa" onsubmit="return valida();" enctype="multipart/form-data"  >
                <input type="hidden" id="id_lab_sol" name="id_lab_sol" value="">
                <input type="hidden" id="cod_exam" name="cod_exam" value="">
                <textarea rows="5" id="result_labor" name="result_labor" style="width:100%"></textarea><br>
                <center><input type="file" id="arch" name="arch" value="Archivo"></center><br><br>        
                <center><input type="submit" value="Guardar"></center>  
        </form>
    </fieldset>
</div>
        <iframe name="iframe_b_r_l" id="iframe_b_r_l" style="display: none" > </iframe> 
<form id="form_borra_respu_lab" name="form_borra_respu_lab" action="borra_respu_lab.jsp" target="resultaaa" method="post">
    <input type="hidden" name="soli_lab" id="soli_lab">
    <input type="hidden" name="resu_lab" id="resu_lab">
</form>  
        
        
     <form id="muestra_arch_labbb" name="muestra_arch_labbb" method="post" action="muestra_arch_lab.jsp" target="_blank" >
            <input type="hidden" id="ruta_arch_labbb" name="ruta_arch_labbb">
        </form>        
</body>

</html>
