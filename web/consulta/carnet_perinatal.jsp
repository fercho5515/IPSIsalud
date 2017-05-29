<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.GregorianCalendar"  %>
<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8">
    <style type="text/css">
      legend{
	         font-family:"Eras Medium ITC";
	         color:#2779aa;
             font-size:8pt;
            }
     fieldset{border:0px #2779aa solid;}
     p{padding:0px 0px 0px 0px;
       font-family:"Eras Medium ITC";
	   color:#2779aa;
       font-size:8pt;

      }
      #tdp{
       font-family:"Eras Medium ITC";
	   color:#2779aa;
       font-size:8pt;
      }

    .etnia,.despla,.lye{
	         padding:0px 0px 0px 0px;
         }
    table,td,tr,input,p{padding:0px 0px 0px 0px;}
    #tablap{border:1px #2779aa solid;
             -webkit-border-radius: 10px;
             -moz-border-radius: 10px;
             border-radius: 10px;}
    #tdp{border:1px #2779aa solid;
        /*   -webkit-border-radius: 10px;
             -moz-border-radius: 10px;
             border-radius: 10px;*/}
   .ui-jqgrid .ui-jqgrid-htable th div 
{ 
   height: auto; 
   padding: 5px 0px;
}
             
         
    </style>   
    <script type="text/javascript" language="javascript">
     
        
      <%  
            	 Calendar CALENDARIO_GREGORIANO= new GregorianCalendar();
		 String FECHA_DIA=Integer.toString(CALENDARIO_GREGORIANO.get(Calendar.DATE));
		 String FECHA_MES=Integer.toString(CALENDARIO_GREGORIANO.get(Calendar.MONTH));
		 String FECHA_ANO=Integer.toString(CALENDARIO_GREGORIANO.get(Calendar.YEAR));  
                 String ff=""+FECHA_ANO+"-"+FECHA_MES+"-"+FECHA_DIA+"";
                 out.print("var hoycpr = new Date("+FECHA_ANO+","+FECHA_MES+","+FECHA_DIA+"); ");
            %>
 
      $(function(){
		     $("#FUM").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true,                            
                            maxDate:hoycpr
		     });	
		     $('#FUM').datepicker($.datepicker.regional['es']);
		     $('#FUM').datepicker("option","showAnim","slideDown");
		     $('#FUM').datepicker("option","dateFormat","yy-mm-dd");
		  });
      	$(function(){
		     $("#FPP").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true,                            
                            maxDate:hoycpr
		     });	
		     $('#FPP').datepicker($.datepicker.regional['es']);
		     $('#FPP').datepicker("option","showAnim","slideDown");
		     $('#FPP').datepicker("option","dateFormat","yy-mm-dd");
		});
      $(function(){
		     $("#fembarazoant").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true,                            
                            maxDate:hoycpr
		     });	
		     $('#fembarazoant').datepicker($.datepicker.regional['es']);
		     $('#fembarazoant').datepicker("option","showAnim","slideDown");
		     $('#fembarazoant').datepicker("option","dateFormat","yy-mm-dd");
		});
		$(function(){
		     $("#frummemb").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true,                            
                            maxDate:hoycpr
		     });	
		     $('#frummemb').datepicker($.datepicker.regional['es']);
		     $('#frummemb').datepicker("option","showAnim","slideDown");
		     $('#frummemb').datepicker("option","dateFormat","yy-mm-dd");
		});
        $(function(){
		     $("#pabortofingreso").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true,                            
                            maxDate:hoycpr
		     });	
		     $('#pabortofingreso').datepicker($.datepicker.regional['es']);
		     $('#pabortofingreso').datepicker("option","showAnim","slideDown");
		     $('#pabortofingreso').datepicker("option","dateFormat","yy-mm-dd");
		});
        $(function(){
		     $("#nacevm").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true,                            
                            maxDate:hoycpr
		     });	
		     $('#nacevm').datepicker($.datepicker.regional['es']);
		     $('#nacevm').datepicker("option","showAnim","slideDown");
		     $('#nacevm').datepicker("option","dateFormat","yy-mm-dd");
		});
       $(function(){
		     $("#fechaegresopostparto").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true,                            
                            maxDate:hoycpr
		     });	
		     $('#fechaegresopostparto').datepicker($.datepicker.regional['es']);
		     $('#fechaegresopostparto').datepicker("option","showAnim","slideDown");
		     $('#fechaegresopostparto').datepicker("option","dateFormat","yy-mm-dd");
		});
  $(function(){
		     $("#fechaegresoneonato").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true,                            
                            maxDate:hoycpr
		     });	
		     $('#fechaegresoneonato').datepicker($.datepicker.regional['es']);
		     $('#fechaegresoneonato').datepicker("option","showAnim","slideDown");
		     $('#fechaegresoneonato').datepicker("option","dateFormat","yy-mm-dd");
		});

	var anchoPantalla=document.body.offsetWidth -((document.body.offsetWidth*24)/100);	
       //---------------------------------------------
	$(document).ready(function(){
             jQuery("#list40").jqGrid({
   	url:'carga_contr_gesta.jsp?q=2',
	datatype: "json",
   	colNames:['id','Fecha','Edad <br> gest','Peso','Presion <br> art','Altura <br> uterina','Presentación','FCF','Mov <br> fetales','Fe','Folatos','Calcio','Estado <br> Nutricional','Signos de alarma, <br> exámenes,tratamiento','Nombre del profesional','Próxima <br> cita','cod_cons'],
   	colModel:[
            {name:'id',index:'id', width:0,search:false,editable: false,required :false,hidden:true},
   	    {name:'fecha',index:'fecha', width:((anchoPantalla*7)/100), search:true,editable: false,required : false,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	    {name:'edad9gest',index:'edad9gest', width:((anchoPantalla*3)/100),search:true, editable: true,required : true,searchoptions:{sopt:['cn','eq']},editable:true, edittype:"text",editoptions:{ size: 20, maxlengh:5, dataInit: function(element) {$(element).keyup(function(){datofloat(element,5)}),$(element).blur(function(){datofloat(element,5)}) }   }},
   	    {name:'peso',index:'peso', width:((anchoPantalla*3)/100), search:true, editable: true,required : true,editoptions: {size: 20, dataInit: function(element) {$(element).keyup(function(){datofloat(element,6)}),$(element).blur(function(){datofloat(element,6)}) }, maxlengh: 5 },editrules: { required: true, maxlengh: 5 },searchoptions:{sopt:['cn','eq']}},
   	    {name:'presion',index:'presion', width:((anchoPantalla*5)/100), search:true, editable: true,required : true,editoptions: {maxlength:7},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
            {name:'altura9uterina',index:'altura9terina', width:((anchoPantalla*5)/100),sorttype:"float", search:true, editable: true,required : true,editoptions: {size: 20, dataInit: function(element) {$(element).keyup(function(){datofloat(element,6)}),$(element).blur(function(){datofloat(element,6)}) }, maxlengh: 5 },editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	    {name:'presentacion',index:'presentacion', width:((anchoPantalla*8)/100),sorttype:"string", search:true, editable: true,required : true,editoptions: {maxlength: 100},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	    {name:'fcf',index:'fcf', width:((anchoPantalla*3)/100),sorttype:"int", search:true, editable: true,required : true,editoptions: {size: 20, dataInit: function(element) {$(element).keyup(function(){datoint(element,6)}),$(element).blur(function(){datofloat(element,6)}) }, maxlengh: 5 },editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	    {name:'movi9fetales',index:'movi9fetales', width:((anchoPantalla*5)/100),sorttype:"float", search:true, editable: true,required : true,editoptions: {maxlength: 44},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	    {name:'fe',index:'fe', width:((anchoPantalla*2)/100),sorttype:"float", search:true, editable: true,required : true,editoptions: {maxlength: 44},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	    {name:'folatos',index:'folatos', width:((anchoPantalla*4)/100),sorttype:"float", search:true, editable: true,required : true,editoptions: {maxlength: 44},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	    {name:'calcio',index:'calcio', width:((anchoPantalla*4)/100),sorttype:"float", search:true, editable: true,required : true,editoptions: {maxlength: 44},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	    {name:'estado9nutricional',index:'estado9nutricional',sorttype:"string", width:((anchoPantalla*5)/100), search:true, editable: true,required : true,editoptions: {maxlength: 200},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
            {name:'sind9exa9trata',index:'sind9exa9trata',sorttype:"string", width:((anchoPantalla*16)/100), search:true, editable: true,required : true,editoptions: {maxlength: 200},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	    {name:'nombre9profesional',index:'nombre9profesional',sorttype:"string", width:((anchoPantalla*15)/100),search:true, editable: true,required : true,editrules: { required: true },searchoptions:{sopt:['cn','eq']},editoptions: { size: 50,dataInit: function(element) {$(element).val('<% out.print(""+(String)session.getAttribute("nombre")+""); %>'),$(element).prop("readonly",true),$(element).focus(function () { $(element).val('<% out.print(""+(String)session.getAttribute("nombre")+""); %>')});}  } },
   	    {name:'proccima9cita', index:'proccima9cita',width:((anchoPantalla*7)/100),editable: true, edittype: 'text', editoptions: {size: 10, maxlengh: 10, dataInit: function(element) { $(element).prop("readonly",true),$(element).datepicker({showOn:'both', buttonImageOnly:true,firstDay:1,changeMonth:true,changeYear:true, maxDate:hoycpr }); $(element).datepicker($.datepicker.regional['es']);  $(element).datepicker("option","showAnim","slideDown");   $(element).datepicker("option","dateFormat","yy-mm-dd"); }}},
            {name:'codcons',index:'codcons', width:0,search:false,editable: false,required :false,hidden:true},
   	 ],
   	rowNum:15,
   	rowList:[15,30,45],
   	//height:300,
   	pager: '#pager40',
   	sortname: 'serial',
   	rownumbers:true,
    viewrecords: true,
    //imgpath: '../imagenes/fotos/1085253944.jpg',
    sortorder: "asc",
	multiselect: false,
	loadonce: false,
	height: 'auto',
        
      width:anchoPantalla,
    shrinkToFit: false,
	//height: 190,
	altRows:true,
	//autoheight:true,
   // autowidth: true, 
    rownumbers: false,
    editurl: 'edita_controles_gestacion.jsp',
	caption: "Gestacion Actual",	
	ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
	                                     NuevoCaso2(""+cedula_nit+"");  }
	
});
var le=(document.body.offsetWidth/2)-200;
jQuery("#list40").jqGrid('navGrid','#pager40',{add:true,edit:true,del:false,search:true,view: true},
                                                        {width:470,top:80,left:le,closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{width:470,top:80,left:le,closeAfterAdd: true, closeOnEscape: true }, //opciones add
							{width:470,top:80,left:le}, //opciones del
 							{width:470,top:80,left:le,multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:470,top:80,left:le} //para el view
 								);
            });
 jQuery("#list40").jqGrid('navButtonAdd','#pager40',
     {
      caption:"",
      buttonicon:"ui-icon-trash",
      onClickButton:function(){ 
                                var id = jQuery("#list40").jqGrid('getGridParam','selrow');
                                if (id)	{
                                        var ret = jQuery("#list40").jqGrid('getRowData',id);
                                        var consu="<% out.print(""+session.getAttribute("serial_consulta")+""); %>";
                                        var consu2=""+ret.codcons+"";
                                        if(consu==consu2 ){
                                                          apprise("¿Esta seguro de eliminar el antecedente personal seleccionado de: "+ret.fecha+" ?", {'verify':true}, function(opcion) {
                                                            if(opcion) {                                                                         
                                                                          $("#borra_cont").load("edita_controles_gestacion.jsp?oper=del&id="+ret.id+"");
                                                                          setTimeout ('recagatdpn()', 500); 
                                                                       }
                                                           });       
                                                        }
                                       else{alert("Solo se permiten eliminar datos ingresados en esta consulta");}
                                }else { alert("Selecciona los datos a eliminar");}
                                
                              },
      position:"last",
      title:"Borrar Antecedente Personal",
      cursor: "pointer"}); 
 
function recagatdpn(){
    jQuery("#list40").jqGrid('setCaption',"Gestacion Actual").trigger('reloadGrid');
} 

function guarda(){
       document.carne_f1.submit();   
       document.carne_f2.submit();  
       document.carne_f3.submit();
       document.carne_f4.submit();
       document.carne_f5.submit();
       document.carne_f6.submit();         
}
/////////////////////////////////
function enf_ninguna(){
  
    //check  
    $("#enfer_diabetes0c").attr('checked', false);
    $("input[name='enfer_diabetes0c']").attr("disabled","disabled");
    //radio 
    $("#enfer_htacronica0").attr('checked', false);
    $("#enfer_htacronica1").attr('checked', false); 
    $("input[name='enfer_htacronica']").attr("disabled","disabled");
     
    $("#enfer_htagestacional0").attr('checked', false);
    $("#enfer_htagestacional1").attr('checked', false); 
    $("input[name='enfer_htagestacional']").attr("disabled","disabled");
     
    $("#enfer_preeclampsia0").attr('checked', false);
    $("#enfer_preeclampsia1").attr('checked', false); 
    $("input[name='enfer_preeclampsia']").attr("disabled","disabled");
     
    $("#enfer_eclampsia0").attr('checked', false);
    $("#enfer_eclampsia1").attr('checked', false); 
    $("input[name='enfer_eclampsia']").attr("disabled","disabled");
    
    $("#enfer_cardiopatia0").attr('checked', false);
    $("#enfer_cardiopatia1").attr('checked', false); 
    $("input[name='enfer_cardiopatia']").attr("disabled","disabled");
     
    $("#enfer_anemia0").attr('checked', false);
    $("#enfer_anemia1").attr('checked', false); 
    $("input[name='enfer_anemia']").attr("disabled","disabled");
    
    $("#enfer_diabetes0").attr('checked', false);
    $("#enfer_diabetes1").attr('checked', false); 
    $("input[name='enfer_diabetes']").attr("disabled","disabled");
   
    $("#enfer_infecurinaria0").attr('checked', false);
    $("#enfer_infecurinaria1").attr('checked', false); 
    $("input[name='enfer_infecurinaria']").attr("disabled","disabled");
     
    $("#enfer_amepartopreter0").attr('checked', false);
    $("#enfer_amepartopreter1").attr('checked', false); 
    $("input[name='enfer_amepartopreter']").attr("disabled","disabled");
      
    $("#enfer_rciu0").attr('checked', false);
    $("#enfer_rciu1").attr('checked', false); 
    $("input[name='enfer_rciu']").attr("disabled","disabled");
      
    $("#enfer_rupturaprem0").attr('checked', false);
    $("#enfer_rupturaprem1").attr('checked', false); 
    $("input[name='enfer_rupturaprem']").attr("disabled","disabled");
     
    $("#enfer_corioamnionitis0").attr('checked', false);
    $("#enfer_corioamnionitis1").attr('checked', false); 
    $("input[name='enfer_corioamnionitis']").attr("disabled","disabled");
    
    $("#enfer_otrasgraves0").attr('checked', false);
    $("#enfer_otrasgraves1").attr('checked', false); 
    $("input[name='enfer_otrasgraves']").attr("disabled","disabled");
     
    $("#hemorragias_1_trim0").attr('checked', false);
    $("#hemorragias_1_trim1").attr('checked', false); 
    $("input[name='hemorragias_1_trim']").attr("disabled","disabled");
    
    $("#hemorragias_2_trim0").attr('checked', false);
    $("#hemorragias_2_trim1").attr('checked', false); 
    $("input[name='hemorragias_2_trim']").attr("disabled","disabled");
      
    $("#hemorragias_3_trim0").attr('checked', false);
    $("#hemorragias_3_trim1").attr('checked', false); 
    $("input[name='hemorragias_3_trim']").attr("disabled","disabled");
    
    $("#hemorragias_infectpuerpe0").attr('checked', false);
    $("#hemorragias_infectpuerpe1").attr('checked', false); 
    $("input[name='hemorragias_infectpuerpe']").attr("disabled","disabled");
     
    $("#hemorragias_bacteriuria0").attr('checked', false);
    $("#hemorragias_bacteriuria1").attr('checked', false); 
    $("input[name='hemorragias_bacteriuria']").attr("disabled","disabled");
    
    $("#hemorragias_postparto0").attr('checked', false);
    $("#hemorragias_postparto1").attr('checked', false); 
    $("input[name='hemorragias_postparto']").attr("disabled","disabled");
    
     document.getElementById("codigo1").value="";
     document.getElementById("codigo2").value="";
     document.getElementById("codigo3").value="";
     document.getElementById("codigo1").disabled = true;
     document.getElementById("codigo2").disabled = true;
     document.getElementById("codigo3").disabled = true;
     
  }
 ////////////////////
 //
 $('[name="enf_ninguna"]').click(function() {
  if($(this).is(':checked')) {  

    //check  
    $("#enfer_diabetes0c").attr('checked', false);
    $("input[name='enfer_diabetes0c']").attr("disabled","disabled");
    //radio 
    $("#enfer_htacronica0").attr('checked', false);
    $("#enfer_htacronica1").attr('checked', false); 
    $("input[name='enfer_htacronica']").attr("disabled","disabled");
     
    $("#enfer_htagestacional0").attr('checked', false);
    $("#enfer_htagestacional1").attr('checked', false); 
    $("input[name='enfer_htagestacional']").attr("disabled","disabled");
     
    $("#enfer_preeclampsia0").attr('checked', false);
    $("#enfer_preeclampsia1").attr('checked', false); 
    $("input[name='enfer_preeclampsia']").attr("disabled","disabled");
     
    $("#enfer_eclampsia0").attr('checked', false);
    $("#enfer_eclampsia1").attr('checked', false); 
    $("input[name='enfer_eclampsia']").attr("disabled","disabled");
    
    $("#enfer_cardiopatia0").attr('checked', false);
    $("#enfer_cardiopatia1").attr('checked', false); 
    $("input[name='enfer_cardiopatia']").attr("disabled","disabled");
     
    $("#enfer_anemia0").attr('checked', false);
    $("#enfer_anemia1").attr('checked', false); 
    $("input[name='enfer_anemia']").attr("disabled","disabled");
    
    $("#enfer_diabetes0").attr('checked', false);
    $("#enfer_diabetes1").attr('checked', false); 
    $("input[name='enfer_diabetes']").attr("disabled","disabled");
   
    $("#enfer_infecurinaria0").attr('checked', false);
    $("#enfer_infecurinaria1").attr('checked', false); 
    $("input[name='enfer_infecurinaria']").attr("disabled","disabled");
     
    $("#enfer_amepartopreter0").attr('checked', false);
    $("#enfer_amepartopreter1").attr('checked', false); 
    $("input[name='enfer_amepartopreter']").attr("disabled","disabled");
      
    $("#enfer_rciu0").attr('checked', false);
    $("#enfer_rciu1").attr('checked', false); 
    $("input[name='enfer_rciu']").attr("disabled","disabled");
      
    $("#enfer_rupturaprem0").attr('checked', false);
    $("#enfer_rupturaprem1").attr('checked', false); 
    $("input[name='enfer_rupturaprem']").attr("disabled","disabled");
     
    $("#enfer_corioamnionitis0").attr('checked', false);
    $("#enfer_corioamnionitis1").attr('checked', false); 
    $("input[name='enfer_corioamnionitis']").attr("disabled","disabled");
    
    $("#enfer_otrasgraves0").attr('checked', false);
    $("#enfer_otrasgraves1").attr('checked', false); 
    $("input[name='enfer_otrasgraves']").attr("disabled","disabled");
     
    $("#hemorragias_1_trim0").attr('checked', false);
    $("#hemorragias_1_trim1").attr('checked', false); 
    $("input[name='hemorragias_1_trim']").attr("disabled","disabled");
    
    $("#hemorragias_2_trim0").attr('checked', false);
    $("#hemorragias_2_trim1").attr('checked', false); 
    $("input[name='hemorragias_2_trim']").attr("disabled","disabled");
      
    $("#hemorragias_3_trim0").attr('checked', false);
    $("#hemorragias_3_trim1").attr('checked', false); 
    $("input[name='hemorragias_3_trim']").attr("disabled","disabled");
    
    $("#hemorragias_infectpuerpe0").attr('checked', false);
    $("#hemorragias_infectpuerpe1").attr('checked', false); 
    $("input[name='hemorragias_infectpuerpe']").attr("disabled","disabled");
     
    $("#hemorragias_bacteriuria0").attr('checked', false);
    $("#hemorragias_bacteriuria1").attr('checked', false); 
    $("input[name='hemorragias_bacteriuria']").attr("disabled","disabled");
    
    $("#hemorragias_postparto0").attr('checked', false);
    $("#hemorragias_postparto1").attr('checked', false); 
    $("input[name='hemorragias_postparto']").attr("disabled","disabled");
    
     document.getElementById("codigo1").value="";
     document.getElementById("codigo2").value="";
     document.getElementById("codigo3").value="";
     document.getElementById("codigo1").disabled = true;
     document.getElementById("codigo2").disabled = true;
     document.getElementById("codigo3").disabled = true;
     
  } else {
    $("input[name='enfer_diabetes0c']").removeAttr("disabled");
    $("input[name='enfer_htacronica']").removeAttr("disabled");
    $("input[name='enfer_eclampsia']").removeAttr("disabled");
    $("input[name='enfer_htagestacional']").removeAttr("disabled");
    $("input[name='enfer_preeclampsia']").removeAttr("disabled");
    $("input[name='enfer_cardiopatia']").removeAttr("disabled");
    $("input[name='enfer_anemia']").removeAttr("disabled");
    $("input[name='enfer_diabetes']").removeAttr("disabled");
    $("input[name='enfer_infecurinaria']").removeAttr("disabled");
    $("input[name='enfer_amepartopreter']").removeAttr("disabled");
    $("input[name='enfer_rciu']").removeAttr("disabled");
    $("input[name='enfer_rupturaprem']").removeAttr("disabled");
    $("input[name='enfer_corioamnionitis']").removeAttr("disabled");
    $("input[name='enfer_otrasgraves']").removeAttr("disabled");
    $("input[name='hemorragias_1_trim']").removeAttr("disabled");
    $("input[name='hemorragias_2_trim']").removeAttr("disabled");
    $("input[name='hemorragias_3_trim']").removeAttr("disabled");
    $("input[name='hemorragias_infectpuerpe']").removeAttr("disabled");
    $("input[name='hemorragias_bacteriuria']").removeAttr("disabled");
    $("input[name='hemorragias_postparto']").removeAttr("disabled");
    
     document.getElementById("codigo1").disabled = false;
     document.getElementById("codigo2").disabled = false;
     document.getElementById("codigo3").disabled = false;
  }
   }  );
///////////////////////////777
function reanininguna(){
      if (document.carne_f6.reanininguna.checked) {
      
    //$("#reaniflujolibre0").attr('checked', true);  
    $("#reaniflujolibre0").attr('checked', false);
    $("#reaniflujolibre1").attr('checked', false); 
    $("input[name='reaniflujolibre']").attr("disabled","disabled");
     
    $("#reaniventilacionp0").attr('checked', false);
    $("#reaniventilacionp1").attr('checked', false); 
    $("input[name='reaniventilacionp']").attr("disabled","disabled");
     
    $("#reaniintubacionot0").attr('checked', false);
    $("#reaniintubacionot1").attr('checked', false); 
    $("input[name='reaniintubacionot']").attr("disabled","disabled");
     
    $("#reanimasajecardi0").attr('checked', false);
    $("#reanimasajecardi1").attr('checked', false); 
    $("input[name='reanimasajecardi']").attr("disabled","disabled");
     
    $("#reaniadrenalina0").attr('checked', false);
    $("#reaniadrenalina1").attr('checked', false); 
    $("input[name='reaniadrenalina']").attr("disabled","disabled");
  } else {
    $("input[name='reaniflujolibre']").removeAttr("disabled");
    $("input[name='reaniventilacionp']").removeAttr("disabled");
    $("input[name='reaniintubacionot']").removeAttr("disabled");
    $("input[name='reanimasajecardi']").removeAttr("disabled");
    $("input[name='reaniadrenalina']").removeAttr("disabled");
  }
   }
$('[name="reanininguna"]').click(function() {
  if($(this).is(':checked')) {
     
    //$("#reaniflujolibre0").attr('checked', true);  
    $("#reaniflujolibre0").attr('checked', false);
    $("#reaniflujolibre1").attr('checked', false); 
    $("input[name='reaniflujolibre']").attr("disabled","disabled");
     
    $("#reaniventilacionp0").attr('checked', false);
    $("#reaniventilacionp1").attr('checked', false); 
    $("input[name='reaniventilacionp']").attr("disabled","disabled");
     
    $("#reaniintubacionot0").attr('checked', false);
    $("#reaniintubacionot1").attr('checked', false); 
    $("input[name='reaniintubacionot']").attr("disabled","disabled");
     
    $("#reanimasajecardi0").attr('checked', false);
    $("#reanimasajecardi1").attr('checked', false); 
    $("input[name='reanimasajecardi']").attr("disabled","disabled");
     
    $("#reaniadrenalina0").attr('checked', false);
    $("#reaniadrenalina1").attr('checked', false); 
    $("input[name='reaniadrenalina']").attr("disabled","disabled");
  } else {
    $("input[name='reaniflujolibre']").removeAttr("disabled");
    $("input[name='reaniventilacionp']").removeAttr("disabled");
    $("input[name='reaniintubacionot']").removeAttr("disabled");
    $("input[name='reanimasajecardi']").removeAttr("disabled");
    $("input[name='reaniadrenalina']").removeAttr("disabled");
  }
});
function enf_reciennacido(){
      if (document.carne_f6.enf_reciennacido.checked) {
     document.getElementById("codenfermedadrecienacido").value="";
     document.getElementById("txtenfermedadrecienacido").value="";
     document.getElementById("codenfermedadrecienacido2").value="";
     document.getElementById("txtenfermedadrecienacido2").value="";
     document.getElementById("codenfermedadrecienacido3").value="";
     document.getElementById("txtenfermedadrecienacido3").value="";
     document.getElementById("codenfermedadrecienacido").disabled = true;
     document.getElementById("txtenfermedadrecienacido").disabled = true;
     document.getElementById("codenfermedadrecienacido2").disabled = true;
     document.getElementById("txtenfermedadrecienacido2").disabled = true;
     document.getElementById("codenfermedadrecienacido3").disabled = true;
     document.getElementById("txtenfermedadrecienacido3").disabled = true;
                                     }
    else {
     document.getElementById("codenfermedadrecienacido").disabled = false;
     document.getElementById("txtenfermedadrecienacido").disabled = false;
     document.getElementById("codenfermedadrecienacido2").disabled = false;
     document.getElementById("txtenfermedadrecienacido2").disabled = false;
     document.getElementById("codenfermedadrecienacido3").disabled = false;
     document.getElementById("txtenfermedadrecienacido3").disabled = false;
         }
   }
$('[name="enf_reciennacido"]').click(function() {
  if($(this).is(':checked')) {
     document.getElementById("codenfermedadrecienacido").value="";
     document.getElementById("txtenfermedadrecienacido").value="";
     document.getElementById("codenfermedadrecienacido2").value="";
     document.getElementById("txtenfermedadrecienacido2").value="";
     document.getElementById("codenfermedadrecienacido3").value="";
     document.getElementById("txtenfermedadrecienacido3").value="";
     document.getElementById("codenfermedadrecienacido").disabled = true;
     document.getElementById("txtenfermedadrecienacido").disabled = true;
     document.getElementById("codenfermedadrecienacido2").disabled = true;
     document.getElementById("txtenfermedadrecienacido2").disabled = true;
     document.getElementById("codenfermedadrecienacido3").disabled = true;
     document.getElementById("txtenfermedadrecienacido3").disabled = true;
  } else {
     document.getElementById("codenfermedadrecienacido").disabled = false;
     document.getElementById("txtenfermedadrecienacido").disabled = false;
     document.getElementById("codenfermedadrecienacido2").disabled = false;
     document.getElementById("txtenfermedadrecienacido2").disabled = false;
     document.getElementById("codenfermedadrecienacido3").disabled = false;
     document.getElementById("txtenfermedadrecienacido3").disabled = false;
  }
});
function datofloat(elemento,num){
    if(isNaN(elemento.value)){elemento.value = elemento.value.replace(/[^0-9]/g,''); }
    if(elemento.value.length>num){elemento.value=elemento.value.substring(0,num);}
};
function datoint(elemento,num){
    elemento.value = elemento.value.replace(/[^0-9]/g,''); 
    if(elemento.value.length>num){elemento.value=elemento.value.substring(0,num);}
};

jQuery('#nrpesoegreso,#egconfiablesem,#egconfiabledias,#apgar1er,#apgar5to,#puerperioloquios1,#puerperioloquios2,#puerperioloquios3,#puerperiopulso2,#puerperiopa2,#puerperiopa22,#puerperioinvoluter2,#puerperiopulso1,#puerperiopa1,#puerperiopa11,#puerperioinvoluter1,#puerperiopulso3,#puerperiopa3,#puerperiopa33,#puerperioinvoluter3,#hospiembdia,#paabomulti,#paabomulti2,#consultaprenata,#edadgestapasem,#edadgestapadias,#hentrerup,#rmasrum,#contantsemaini,#anmn,#gestprev,#abortos,#dvaginales,#nacidosvi,#viven,#m1sem,#md1sem,#apartos,#acesareas,#anacidosm,#pridosisanttitetanica,#segdosisanttitetanica,#cigapordia').keyup(function () {
  this.value = this.value.replace(/[^0-9]/g,'');
});
jQuery('#nrpesoegreso,#egconfiablesem,#egconfiabledias,#apgar1er,#apgar5to,#puerperioloquios1,#puerperioloquios2,#puerperioloquios3,#puerperiopulso2,#puerperiopa2,#puerperiopa22,#puerperioinvoluter2,#puerperiopulso1,#puerperiopa1,#puerperiopa11,#puerperioinvoluter1,#puerperiopulso3,#puerperiopa3,#puerperiopa33,#puerperioinvoluter3,#hospiembdia,#paabomulti,#paabomulti2,#consultaprenata,#edadgestapasem,#edadgestapadias,#hentrerup,#rmasrum,#contantsemaini,#anmn,#gestprev,#abortos,#dvaginales,#nacidosvi,#viven,#m1sem,#md1sem,#apartos,#acesareas,#anacidosm,#pridosisanttitetanica,#segdosisanttitetanica,#cigapordia').blur(function () {
  this.value = this.value.replace(/[^0-9]/g,'');
});

jQuery('#reciennacidotalla,#perimcefalic,#pesoant,#tallacm,#puerperiotc1,#puerperiotc2,#puerperiotc3,#egresopostparto').keyup(function () {
  if(isNaN(this.value)){this.value = this.value.replace(/[^0-9]/g,''); }
});
jQuery('#reciennacidotalla,#perimcefalic,#pesoant,#tallacm,#puerperiotc1,#puerperiotc2,#puerperiotc3,#egresopostparto').blur(function () {
  if(isNaN(this.value)){this.value = this.value.replace(/[^0-9]/g,''); }
});

jQuery('#hbmenor').keyup(function () {
  if(isNaN(this.value)){this.value = this.value.replace(/[^0-9]/g,''); }
  var dato=this.value;
  if(dato < 12.5){$("#nem125").attr("checked","checked");}
  else{$("#nem125").removeAttr("checked");}
});

jQuery('#hbmenor').blur(function () {
  if(isNaN(this.value)){this.value = this.value.replace(/[^0-9]/g,''); } 
  var dato=this.value;
  if(dato < 12.5){$("#nem125").attr("checked","checked");}
  else{$("#nem125").removeAttr("checked");}
});


jQuery('#hbmayor').keyup(function () {
  if(isNaN(this.value)){this.value = this.value.replace(/[^0-9]/g,''); }
  var dato=this.value;
  if(dato < 12){$("#nem125dos").attr("checked","checked");}
  else{$("#nem125dos").removeAttr("checked");}  
});
jQuery('#hbmayor').blur(function () {
  if(isNaN(this.value)){this.value = this.value.replace(/[^0-9]/g,''); }
  var dato=this.value;
  if(dato < 12){$("#nem125dos").attr("checked","checked");}
  else{$("#nem125dos").removeAttr("checked");}
});

jQuery('#pesoalnacer').keyup(function () {
  if(isNaN(this.value)){this.value = this.value.replace(/[^0-9]/g,''); }
  var dato=this.value;
  if(dato < 2500){$("#reciennacidomenos2500").attr("checked","checked");}
  else{$("#reciennacidomenos2500").removeAttr("checked");}  
});
jQuery('#pesoalnacer').blur(function () {
  if(isNaN(this.value)){this.value = this.value.replace(/[^0-9]/g,''); }
  var dato=this.value;
  if(dato < 2500){$("#reciennacidomenos2500").attr("checked","checked");}
  else{$("#reciennacidomenos2500").removeAttr("checked");}
});
jQuery('#rnedaddias').keyup(function () {
  if(isNaN(this.value)){this.value = this.value.replace(/[^0-9]/g,''); }
  var dato=this.value;
  
  if(dato < 1){$("#edaddiascompletos").attr("checked","checked");}
           else{$("#edaddiascompletos").removeAttr("checked");}  
});
jQuery('#rnedaddias').blur(function () {
  if(isNaN(this.value)){this.value = this.value.replace(/[^0-9]/g,''); }
  var dato=this.value;
  if(dato < 1){$("#edaddiascompletos").attr("checked","checked");}
           else{$("#edaddiascompletos").removeAttr("checked");}
});
jQuery('#txtdesgarros').keyup(function () {
  this.value = this.value.replace(/[^0-9]/g,'');
  if(this.value<0 || this.value > 4 ){this.value="";}
});
jQuery('#txtdesgarros').blur(function () {
  this.value = this.value.replace(/[^0-9]/g,'');
  if(this.value<0 || this.value > 4 ){this.value="";}
});
function finaliza_emb(cod_emb){
    document.getElementById("cod_emb_f").value=cod_emb;
    $("#borra_embarazo_consu" ).dialog("open");
           }
            function imprSelec(nombre)

  {

  var ficha = document.getElementById(nombre);

  var ventimp = window.open(' ', 'popimpr');

  ventimp.document.write( ficha.innerHTML );

  ventimp.document.close();

  ventimp.print( );

  ventimp.close();

  } 
    </script>
<title>CARNET</title>
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
          
          String con="select  p.id_person,concat(p_nom,' ',s_ape,' ',p_ape,' ',s_ape) as nombre,concat(p.direccion,' ',barrio) as direcc,concat(dep.descripcion,' - ',mun.descripcion) as localidad,fecha_naci,p.telefono,eps.nombre from personas p,municipio mun,departamento dep,eps where p.id_muni=mun.id_muni and p.id_depto=dep.id_departo and mun.id_depto=dep.id_departo and eps.ideps=p.id_eps and p.serial='"+session.getAttribute("serial_pacinete")+"'";
          String datos[]= new String[7];
          ResultSet resu=null;
          try{  resu=ba.consultas(con);
              while (resu.next()&&resu!=null) {  
                                 datos[0]=""+resu.getString(1);
                                 datos[1]=""+resu.getString(2);
                                 datos[2]=""+resu.getString(3);
                                 datos[3]=""+resu.getString(4);
                                 datos[4]=""+resu.getString(5);
                                 datos[5]=""+resu.getString(6);
                                 datos[6]=""+resu.getString(7);
                                              }
             }                       
          catch(SQLException ex){}
          catch(Exception exe){}
          ba.cierraResultado(resu); 
          
          String codemb="";
          String c="select max(serial) from embarazo where cod_paciente='"+session.getAttribute("serial_pacinete")+"' ;";                   
          ResultSet resuc=null;
          try{  resuc=ba.consultas(c);
              while (resuc.next()&&resuc!=null) {  
                                 codemb=""+resuc.getString(1)+"";
                                              }
             }                       
          catch(SQLException ex){}
          catch(Exception exe){}
          ba.cierraResultado(resuc); 
         
          String df1[]=new String[9];
          df1[0]="";df1[1]="";df1[2]="";df1[3]="";df1[4]="";df1[5]="";df1[6]="";df1[7]="";df1[8]="";
          String sql="select id_etnia,desplazado,lee_y_escribe,estudios,anos_mayor_nivel,estado_civil,control_pre_en,parto_en,regimen from materno_perinatal where idembarazo='"+codemb+"'";
           ResultSet resuc2=null;
         //  out.print("!"+sql+"!");
          try{  resuc2=ba.consultas(sql);
              while (resuc2.next()&&resuc2!=null) {  
                                 df1[0]=""+resuc2.getString(1)+"";
                                 df1[1]=""+resuc2.getString(2)+"";
                                 df1[2]=""+resuc2.getString(3)+"";
                                 df1[3]=""+resuc2.getString(4)+"";
                                 if(resuc2.getString(5)!=null && resuc2.getString(5).compareTo("null")!=0 ){  df1[4]=""+resuc2.getString(5)+"";}
                                 df1[5]=""+resuc2.getString(6)+"";
                                 if(resuc2.getString(7)!=null && resuc2.getString(7).compareTo("null")!=0 ){  df1[6]=""+resuc2.getString(7)+"";}
                                 if(resuc2.getString(8)!=null && resuc2.getString(8).compareTo("null")!=0 ){  df1[7]=""+resuc2.getString(8)+"";}
                                 df1[8]=""+resuc2.getString(9)+"";           
                                  }
             }                       
          catch(SQLException ex){}
          catch(Exception exe){}
          ba.cierraResultado(resuc2); 
     %>
<!--     <center><input type="button" onclick="guarda();" value="  guardar  " name="aceptar" id="aceptar"></center><br> -->
<!-- 
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
-->    
<br>
<center><input type="button" id="aceptar" name="aceptar" value="Finalizar embarazo" style="width:130px" onclick="finaliza_emb('<% out.print(codemb); %>')">
<!-- &nbsp;<input type="button" value="Imprimir" onclick="imprSelec('contiene_todo_el_carnet')" /> -->
</center>   
<div id="contiene_todo_el_carnet">
<br>
<form name="carne_f1" id="carne_f1" method="post" action="carne_f1.jsp" target="if_carne_f1">   
  <table id="tablap" name="tablap" border="1" style="width:100%;">
  <tbody >
      <tr>
          <td colspan="7" id="tdp" name="tdp" style="border-radius: 10px 0px 0px 0px;"><label style="padding-left:10px;"><b>HISTORIA CLÍNICA MATERNO-PERINATAL - CLAP - OPS/OMS</b></label></td>    
            <td id="tdp" name="tdp">Identificacion</td>
            <td id="tdp" name="tdp" style="border-radius: 0px 10px 0px 0px;"><input type="text" id="ide_histo" value="<% out.print(datos[0]); %>" readonly></td>
      </tr>  
      <tr >
         <td style="width:35%" id="tdp" name="tdp" >
             <fieldset >
                      <legend>Nombre</legend>
                      <input type="text" id="nombres" name="nombres"  style="width:100%" value="<% out.print(datos[1]); %>" readonly>
             </fieldset>
         </td>
         <td rowspan="2" id="tdp" name="tdp">
             <table border="0" style="width:100%">
                         <tr><td><center>Fecha Nacimiento</center></td></tr>
                         <tr><td><center><input type="text" id="fechita" name="fechita" style="width:70px"  value="<% out.print(datos[4]); %>" readonly></center>
                             </td>
                         </tr>
             </table>

             
         </td>
         <td rowspan="4" valign="top" id="tdp" name="tdp">
                      <center>
                       <table border="0" style="width:100%;" >
                         <tr><td colspan="2"><center>Etnia</center></td></tr>
                         <tr><td><center><input type="radio" value="0" id="etnia0" name="etnia" class="etnia"></center></td><td><center>blanca</center></td></tr>
                         <tr><td><center><input type="radio" value="1" id="etnia1" name="etnia" class="etnia"></center></td><td><center>indigena</center></td></tr>
                         <tr><td><center><input type="radio" value="2" id="etnia2" name="etnia" class="etnia"></center></td><td><center>mestiza</center></td></tr>
                         <tr><td><center><input type="radio" value="3" id="etnia3" name="etnia" class="etnia"></center></td><td><center>negra</center></td></tr>
                         <tr><td><center><input type="radio" value="4" id="etnia4" name="etnia" class="etnia"></center></td><td><center>otra</center></td></tr>
                      </table>
                      </center>
                 <% 
              //   out.print("<h1>!!"+df1[0]+"!!</h1>");
                   if(df1[0].compareTo("8")!=0){
                              out.print("<script type='text/javascript'>");
                              out.print("document.getElementById('etnia"+df1[0]+"').checked = true;");
                              out.print("</script>");                 
                                               }
                 %>
                   
         </td>
         <td rowspan="4" valign="top" id="tdp" name="tdp" >
                      <table border="0" style="width:100%;">
                         <tr><td><center>Desplazado</center></td></tr>
                         <tr><td><center>si</center></td></tr>
                         <tr><td><center><input type="radio" value="0" id="despla0" name="despla" class="despla"></center></td></tr>
                         <tr><td><center>no</center></td></tr>
                         <tr><td><center><input type="radio" value="1" id="despla1" name="despla" class="despla"></center></td></tr>
                      </table>
                       <% 
              //  out.print("<h1>!!"+df1[1]+"!!</h1>");
                   if(df1[1].compareTo("8")!=0){
                              out.print("<script type='text/javascript'>");
                              out.print("document.getElementById('despla"+df1[1]+"').checked = true;");
                              out.print("</script>");                 
                                               }
                        %>          
         </td>
         <td rowspan="4" valign="top" id="tdp" name="tdp">
                      <table border="0" style="width:100%;">
                         <tr><td><center>Lee y Escribe</center></td></tr>
                         <tr><td><center>si</center></td></tr>
                         <tr><td><center><input type="radio" value='0' id="lye0" name="lye" class="lye"></center></td>  </tr>
                         <tr><td><center>no</center></td></tr>
                         <tr><td><center><input type="radio" value="1" id="lye1" name="lye" class="lye"></center></td></tr>
                      </table>
                 <% 
              //   out.print("<h1>!!"+df1[0]+"!!</h1>");
                   if(df1[2].compareTo("8")!=0){
                              out.print("<script type='text/javascript'>");
                              out.print("document.getElementById('lye"+df1[2]+"').checked = true;");
                              out.print("</script>");                 
                                               }
                 %>  
         </td>
     
         
         <td rowspan="4" valign="top" id="tdp" name="tdp">          <center>
                       <table border="0" style="width:100%;">
                         <tr><td colspan="2"><center>Estudios</center></td></tr>
                         <tr><td style="width:50%"><center><input type="radio" value="0" id="estu0" name="estu" class="estu"></center></td>
                             <td style="width:50%"><center><input type="radio" value="1" id="estu1" name="estu" class="estu"></center></td></tr>
                         <tr><td><center>ninguno</center></td>
                             <td><center>primaria</center></td></tr>
                         <tr><td><center><input type="radio" value="2" id="estu2" name="estu" class="estu"></center></td>
                             <td><center><input type="radio" value="3" id="estu3" name="estu" class="estu"></center></td></tr>
                         <tr><td><center>secund</center></td>
                             <td><center>univers</center></td></tr>
                         <tr><td style="width:50%"><center>años en <br> mayor nivel</center></td>
                 <td style="width:50%"><center><input type="text" id="anmn" name="anmn" maxlength="2" style="width:15px" value="<% out.print(df1[4]); %>"></center></td></tr>
                       </table>
                        <% 
                        //   out.print("<h1>!!"+df1[0]+"!!</h1>");
                             if(df1[3].compareTo("8")!=0){
                                        out.print("<script type='text/javascript'>");
                                        out.print("document.getElementById('estu"+df1[3]+"').checked = true;");
                                        out.print("</script>");                 
                                                         }
                           %>       
                      </center>
          </td>
         <td rowspan="4" valign="top" id="tdp" name="tdp">          <center>
                       <table border="0" style="width:100%;">
                         <tr><td colspan="2"><center><p>Estado Civil</p></center></td></tr>
                        
                          <tr><td><center>casada</center></td>
                             <td><center>union libre</center></td></tr>
                          <tr><td style="width:50%"><center><input type="radio" value="0" id="estc0" name="estc" class="estc"></center></td>
                             <td style="width:50%"><center><input type="radio" value="1" id="estc1" name="estc" class="estc"></center></td></tr>    
                          <tr><td><center>soltera</center></td>
                             <td><center>ninguno</center></td></tr>
                         <tr><td><center><input type="radio" value="2" id="estc2" name="estc" class="estc"></center></td>
                             <td><center><input type="radio" value="3" id="estc3" name="estc" class="estc"></center></td></tr>     
                       </table>
                      </center>
                        <% 
                        //   out.print("<h1>!!"+df1[0]+"!!</h1>");
                             if(df1[5].compareTo("8")!=0){
                                        out.print("<script type='text/javascript'>");
                                        out.print("document.getElementById('estc"+df1[5]+"').checked = true;");
                                        out.print("</script>");                 
                                                         }
                           %> 
          </td>
         <td id="tdp" name="tdp"> 
               Controles<br>Perinatales
         </td>
           <td id="tdp" name="tdp"> 
               <input type="text" id="ipc_controles" name="ipc_controles" value="<% out.print(df1[6]); %>">
         </td>         
       </tr> 
       
       <tr>
           <td id="tdp" name="tdp">
             <fieldset >
                      <legend>Direccion</legend>
                      <input type="text" id="direccion" name="direccion" value="<% out.print(datos[2]); %>"  style="width:100%" readonly>
             </fieldset>

           </td>
           <td id="tdp" name="tdp"> 
               Parto en
         </td>
           <td id="tdp" name="tdp"> 
               <input type="text" id="partoen" name="partoen" value="<% out.print(df1[7]); %>">
         </td> 
       </tr>
       <tr>
           <td id="tdp" name="tdp">
             <fieldset >
                      <legend>localidad</legend>
                      <input type="text" id="localidad" name="localidad" value="<% out.print(datos[3]); %>" style="width:100%" readonly>
             </fieldset>

           </td >
           <td rowspan="2" id="tdp" name="tdp" >
             <fieldset  >
                      <legend>Edad(años)</legend>
                      
                      <table style="width:100%;">
                       <tr>
                         <td style="width:100%" colspan="2" readonly>
                             <%
                               edad s = new edad();
                               String adadcita=s.edad(datos[4]);
                               String[] arr = adadcita.split(" ");
                               int edd=Integer.parseInt(arr[1]);
                               out.println("edd "+edd);
                             %>
                       <center><input type="text" id="edad" style="width:100%" value="<% out.print(adadcita); %>" readonly></center>
                         </td>
                       </tr>  
                       <tr> 
                         <td style="width:50%" align="right"> 
                             <input type="checkbox" value="" id="edadr" name="edadr" class="edadr" <% if(edd<15 || edd>40){out.print("checked");} %> disabled="disabled">
                         </td>
                         <td style="width:50%"> &lt; de 15 <br> &gt; de 40   
                         </td>
                       </tr>
                      </table>
             </fieldset>

           </td>

           <td id="tdp" name="tdp"> 
               Regimen
         </td>
           <td id="tdp" name="tdp"> 
               <center>
                       <table style="width:100%;">
                           <tr>
                               <td><center><input type="radio" value="0" id="regimen0" name="regimen" class="regimen"></center></td>
                               <td><center><input type="radio" value="1" id="regimen1" name="regimen" class="regimen"></center></td>
                               <td><center><input type="radio" value="2" id="regimen2" name="regimen" class="regimen"></center></td>
                               <td><center><input type="radio" value="3" id="regimen3" name="regimen" class="regimen"></center></td>             
                           </tr>
                           <tr>
                               <td><center>CONT</center></td>
                               <td><center>SUB</center></td>
                               <td><center>VIN</center></td>
                               <td><center>OTRO</center></td>             
                           </tr>

                       </table>
               </center>
             <% 
                        //   out.print("<h1>!!"+df1[0]+"!!</h1>");
                             if(df1[8].compareTo("8")!=0){
                                        out.print("<script type='text/javascript'>");
                                        out.print("document.getElementById('regimen"+df1[8]+"').checked = true;");
                                        out.print("</script>");                 
                                                         }
                           %> 
         </td> 
       </tr>
       <tr>
           <td id="tdp" name="tdp" style="border-radius: 0px 0px 0px 10px;">
             <fieldset >
                      <legend>Telefono</legend>
                      <input type="text" id="tele" name="tele"  style="width:100%" value="<% out.print(datos[5]); %>" readonly>
             </fieldset>
           </td >
           <td id="tdp" name="tdp"> 
               Nom EPS ARS
         </td>
           <td id="tdp" name="tdp" style="border-radius: 0px 0px 10px 0px;"> 
               <input type="text" id="nomeps" name="nomeps" value="<% out.print(datos[6]); %>" readonly>
         </td> 

       </tr>
       </tbody>
  </table>
</form>
  <br>
  
  <table border="1" id="tablap" name="tablap" style="width:100%">
   <tr>
    <td  valign="top" id="tdp" name="tdp"  style="width:37%;border-radius: 10px 0px 0px 10px;padding:10px 10px 10px 10px">
      <form name="carne_f2" id="carne_f2" method="post" action="carne_f2.jsp" target="if_carne_f2">   
            <div><label><b>ANTECEDENTES</b></label></div><br><br>
          <table>
              <tr><td valign="top">
               <table border="0">
               <tr> <td colspan="2">Familiares</td> <td></td> <td colspan="4">personales</td> </tr>   
               <tr> <td><center>no</center></td> <td><center>si</center></td> <td></td> <td><center>no</center></td> <td  colspan="3">&nbsp;&nbsp;si</td> </tr>  
               <tr>
                    <td><input type="radio" value="0" id="tbcfami0" name="tbcfami" class="tbcfami"></td> 
                    <td><input type="radio" value="1" id="tbcfami1" name="tbcfami" class="tbcfami"></td> 
                    <td><center>&larr; TBC &rarr;</center></td> 
                    <td>            <input type="radio" value="0" id="tbcperso0" name="tbcperso" class="tbcperso"></td> 
                    <td colspan="3"><input type="radio" value="1" id="tbcperso1" name="tbcperso" class="tbcperso"></td> 
               </tr>
               <tr>
                    <td><input type="radio" value="0" id="diafami0" name="diafami" class="diafami"></td> 
                    <td><input type="radio" value="1" id="diafami1" name="diafami" class="diafami"></td> 
                    <td><center>&larr; diabetes &rarr;</center></td> 
                    <td><input type="radio" value="0" id="diaperso0" name="diaperso" class="diaperso"></td> 
                    <td><input type="radio" value="1" id="diaperso1" name="diaperso" class="diaperso"></td> 
                    <td><input type="radio" value="2" id="diaperso2" name="diaperso" class="diaperso"></td> 
                    <td><input type="radio" value="3" id="diaperso3" name="diaperso" class="diaperso"></td>
               </tr>   
               <tr>
                    <td><input type="radio" value="0" id="hipfami0" name="hipfami" class="hipfami"></td> 
                    <td><input type="radio" value="1" id="hipfami1" name="hipfami" class="hipfami"></td> 
                    <td><center>&larr; hipertencion &rarr;</center></td> 
                    <td><input type="radio" value="0" id="hipperso0" name="hipperso" class="hipperso"></td> 
                    <td colspan="3"><input type="radio" value="1" id="hipperso1" name="hipperso" class="hipperso"></td> 
               </tr>
               <tr>
                    <td><input type="radio" value="0" id="prefami0" name="prefami" class="prefami"></td> 
                    <td><input type="radio" value="1" id="prefami1" name="prefami" class="prefami"></td> 
                    <td>
                         <table><tr><td>&larr;</td><td><center>preeclampsia<br>eclampsia</center></td><td>&rarr;</td></tr></table>
                        
                    </td> 
                    <td><input type="radio" value="0" id="preperso0" name="preperso" class="preperso"></td> 
                    <td colspan="3"><input type="radio" value="1" id="preperso1" name="preperso" class="preperso"></td> 
               </tr> 
               <tr>
                    <td><input type="radio" value="0" id="otrfami0" name="otrfami" class="otrfami"></td> 
                    <td><input type="radio" value="1" id="otrfami1" name="otrfami" class="otrfami"></td> 
                    <td><center>&larr; otros &rarr;</center></td> 
                    <td><input type="radio" value="0" id="otrperso0" name="otrperso" class="otrperso"></td> 
                    <td colspan="3"><input type="radio" value="1" id="otrperso1" name="otrperso" class="otrperso"></td> 
               </tr>
                 
             </table>   
             </td>
             <td valign="top">
                <table border="0" >
                   <tr><td></td><td><center>no</center></td><td><center>si</center></td></tr>
                   
                   <tr><td style="text-align:right">cirugia pelvica</td>
                       <td><input type="radio" value="0" id="cirugiapel0" name="cirugiapel" class="cirugiapel"></td>
                       <td><input type="radio" value="1" id="cirugiapel1" name="cirugiapel" class="cirugiapel"></td>
                   </tr>
                   
                   <tr><td style="text-align:right">infertilidad</td>
                       <td><input type="radio" value="0" id="infertilidad0" name="infertilidad" class="infertilidad"></td>
                       <td><input type="radio" value="1" id="infertilidad1" name="infertilidad" class="infertilidad"></td>
                   </tr>

                   <tr><td style="text-align:right">VIH +</td>
                       <td><input type="radio" value="0" id="vihpos0" name="vihpos" class="vihpos"></td>
                       <td><input type="radio" value="1" id="vihpos1" name="vihpos" class="vihpos"></td>
                   </tr>

                   <tr><td style="text-align:right">cardiop / nefropatia</td>
                       <td><input type="radio" value="0" id="cardionefro0" name="cardionefro" class="cardionefro"></td>
                       <td><input type="radio" value="1" id="cardionefro1" name="cardionefro" class="cardionefro"></td>
                   </tr>

                   <tr><td style="text-align:right">cond medica grave</td>
                       <td><input type="radio" value="0" id="condmedgra0" name="condmedgra" class="condmedgra"></td>
                       <td><input type="radio" value="1" id="condmedgra1" name="condmedgra" class="condmedgra"></td>
                   </tr>

                   

                   <tr><td style="text-align:right">molas</td>
                       <td><input type="radio" value="0" id="molas0" name="molas" class="molas"></td>
                       <td><input type="radio" value="1" id="molas1" name="molas" class="molas"></td>
                   </tr>

                   <tr><td style="text-align:right">ectopicos</td>
                       <td><input type="radio" value="0" id="ectopicos0" name="ectopicos" class="ectopicos"></td>
                       <td><input type="radio" value="1" id="ectopicos1" name="ectopicos" class="ectopicos"></td>
                   </tr>

                </table>
             </td>
             </tr>
             </table>
      </form>
<%
    //para llenar con f2
    String sqlf2="select tbcf,diabetesf,hipertensionf,preclamf,otrosf,tbcp,diabetesp,hipertensionp,preclamp,otrosp,cirujia_pelvica,infertilidad,vihpos,cardio_nefro,cond_med_grave,molas,ectopicos from antecedentes_perinatal where serial_meterno_perinatal=(select serial from materno_perinatal where idembarazo='"+codemb+"')";
    ResultSet resuf2=null;
    resuf2=ba.consultas(sqlf2);
    out.print("<script type='text/javascript'>");
    String dato="8";
    while(resuf2.next()&&resuf2!=null){
                     if(resuf2.getString(1)!=null && resuf2.getString(1).compareTo("null")!=0 && dato.compareTo(""+resuf2.getString(1)+"")!=0){
                              out.print("document.getElementById('tbcfami"+resuf2.getString(1)+"').checked = true;");
                                                                     }
                     
                     if(resuf2.getString(2)!=null && resuf2.getString(2).compareTo("null")!=0 && dato.compareTo(""+resuf2.getString(2)+"")!=0){
                              out.print("document.getElementById('diafami"+resuf2.getString(2)+"').checked = true;");
                                                                     }
                     
                     if(resuf2.getString(3)!=null && resuf2.getString(3).compareTo("null")!=0 && dato.compareTo(""+resuf2.getString(3)+"")!=0){
                              out.print("document.getElementById('hipfami"+resuf2.getString(3)+"').checked = true;");
                                                                     }
                     
                     if(resuf2.getString(4)!=null && resuf2.getString(4).compareTo("null")!=0 && dato.compareTo(""+resuf2.getString(4)+"")!=0){
                              out.print("document.getElementById('prefami"+resuf2.getString(5)+"').checked = true;");
                                                                     }
                     
                     if(resuf2.getString(5)!=null && resuf2.getString(5).compareTo("null")!=0 && dato.compareTo(""+resuf2.getString(5)+"")!=0){
                              out.print("document.getElementById('otrfami"+resuf2.getString(5)+"').checked = true;");
                                                                     }
                     
                     if(resuf2.getString(6)!=null && resuf2.getString(6).compareTo("null")!=0 && dato.compareTo(""+resuf2.getString(6)+"")!=0){
                              out.print("document.getElementById('tbcperso"+resuf2.getString(6)+"').checked = true;");
                                                                     }
                     
                     if(resuf2.getString(7)!=null && resuf2.getString(7).compareTo("null")!=0 && dato.compareTo(""+resuf2.getString(7)+"")!=0){
                              out.print("document.getElementById('diaperso"+resuf2.getString(7)+"').checked = true;");
                                                                     }
                     
                     if(resuf2.getString(8)!=null && resuf2.getString(8).compareTo("null")!=0 && dato.compareTo(""+resuf2.getString(8)+"")!=0){
                              out.print("document.getElementById('hipperso"+resuf2.getString(8)+"').checked = true;");
                                                                     }
                     
                     if(resuf2.getString(9)!=null && resuf2.getString(9).compareTo("null")!=0 && dato.compareTo(""+resuf2.getString(9)+"")!=0){
                              out.print("document.getElementById('preperso"+resuf2.getString(9)+"').checked = true;");
                                                                     }
                     
                     if(resuf2.getString(10)!=null && resuf2.getString(10).compareTo("null")!=0 && dato.compareTo(""+resuf2.getString(10)+"")!=0){
                              out.print("document.getElementById('otrperso"+resuf2.getString(10)+"').checked = true;");
                                                                     }
                     
                     if(resuf2.getString(11)!=null && resuf2.getString(11).compareTo("null")!=0 && dato.compareTo(""+resuf2.getString(11)+"")!=0){
                              out.print("document.getElementById('cirugiapel"+resuf2.getString(11)+"').checked = true;");
                                                                     }
                     
                     if(resuf2.getString(12)!=null && resuf2.getString(12).compareTo("null")!=0 && dato.compareTo(""+resuf2.getString(12)+"")!=0){
                              out.print("document.getElementById('infertilidad"+resuf2.getString(12)+"').checked = true;");
                                                                     }
                     
                     if(resuf2.getString(13)!=null && resuf2.getString(13).compareTo("null")!=0 && dato.compareTo(""+resuf2.getString(13)+"")!=0){
                              out.print("document.getElementById('vihpos"+resuf2.getString(13)+"').checked = true;");
                                                                     }
                     
                     if(resuf2.getString(14)!=null && resuf2.getString(14).compareTo("null")!=0 && dato.compareTo(""+resuf2.getString(14)+"")!=0){
                              out.print("document.getElementById('cardionefro"+resuf2.getString(14)+"').checked = true;");
                                                                     }
                     
                     if(resuf2.getString(15)!=null && resuf2.getString(15).compareTo("null")!=0 && dato.compareTo(""+resuf2.getString(15)+"")!=0){
                              out.print("document.getElementById('condmedgra"+resuf2.getString(15)+"').checked = true;");
                                                                     }
                     
                     if(resuf2.getString(16)!=null && resuf2.getString(16).compareTo("null")!=0 && dato.compareTo(""+resuf2.getString(16)+"")!=0){
                              out.print("document.getElementById('molas"+resuf2.getString(16)+"').checked = true;");
                                                                     }
                     
                     if(resuf2.getString(17)!=null && resuf2.getString(17).compareTo("null")!=0 && dato.compareTo(""+resuf2.getString(17)+"")!=0){
                              out.print("document.getElementById('ectopicos"+resuf2.getString(17)+"').checked = true;");
                                                                     }
                                
                                      }
    ba.cierraResultado(resuf2);
    
                      
     out.print("</script>");
%>
    
       </td>
       
       
       <td id="tdp" name="tdp" style="width:75%;padding:15px 0px 0px 15px;border-radius: 0px 10px 10px 0px;" valign="top" >
            <label ><b>Obstetricos</b></label>
            <%
            String datof3[]=new String[16];
            for(int i=0;i<16;i++){
                                   datof3[i]="";
                                 }
           try{           
            String sqlf3="select gestas_previas,abortos,tres_a_conse,vaginales,nacidos_vivos,viven,ult_previo,partos,cesareas,nacidos_muestos,muertos_1sem,mu_despues_1sem,fin_embarazo_ant,mes_uno_mas_cinco,deseado,fracaso_planifica from obstetrico where materno_perinatal=(select serial from materno_perinatal where idembarazo='"+codemb+"')";
            ResultSet resuf3=null;
            resuf3=ba.consultas(sqlf3);
            
            while(resuf3.next()&&resuf3!=null){
               if(resuf3.getString(1)!=null  && resuf3.getString(1).compareTo("null")!=0){ datof3[0] =resuf3.getString(1); }else{datof3[0] ="";}
               if(resuf3.getString(2)!=null  && resuf3.getString(2).compareTo("null")!=0){ datof3[1] =resuf3.getString(2); }else{datof3[1] ="";}
               if(resuf3.getString(3)!=null  && resuf3.getString(3).compareTo("null")!=0){ datof3[2] =resuf3.getString(3); }else{datof3[2] ="";}
               if(resuf3.getString(4)!=null  && resuf3.getString(4).compareTo("null")!=0){ datof3[3] =resuf3.getString(4); }else{datof3[3] ="";}
               if(resuf3.getString(5)!=null  && resuf3.getString(5).compareTo("null")!=0){ datof3[4] =resuf3.getString(5); }else{datof3[4] ="";}
               if(resuf3.getString(6)!=null  && resuf3.getString(6).compareTo("null")!=0){ datof3[5] =resuf3.getString(6); }else{datof3[5] ="";}
               if(resuf3.getString(7)!=null  && resuf3.getString(7).compareTo("null")!=0){ datof3[6] =resuf3.getString(7); }else{datof3[6] ="";}
               if(resuf3.getString(8)!=null  && resuf3.getString(8).compareTo("null")!=0){ datof3[7] =resuf3.getString(8); }else{datof3[7] ="";}
               if(resuf3.getString(9)!=null  && resuf3.getString(9).compareTo("null")!=0){ datof3[8] =resuf3.getString(9); }else{datof3[8] ="";}
               if(resuf3.getString(10)!=null && resuf3.getString(10).compareTo("null")!=0){datof3[9] =resuf3.getString(10);}else{datof3[9] ="";}
               if(resuf3.getString(11)!=null && resuf3.getString(11).compareTo("null")!=0){datof3[10]=resuf3.getString(11);}else{datof3[10]="";}
               if(resuf3.getString(12)!=null && resuf3.getString(12).compareTo("null")!=0){datof3[11]=resuf3.getString(12);}else{datof3[11]="";}
               if(resuf3.getString(13)!=null && resuf3.getString(13).compareTo("null")!=0){datof3[12]=resuf3.getString(13);}else{datof3[12]="";}
               if(resuf3.getString(14)!=null && resuf3.getString(14).compareTo("null")!=0){datof3[13]=resuf3.getString(14);}else{datof3[13]="";}
               if(resuf3.getString(15)!=null && resuf3.getString(15).compareTo("null")!=0){datof3[14]=resuf3.getString(15);}else{datof3[14]="";}
               if(resuf3.getString(16)!=null && resuf3.getString(16).compareTo("null")!=0){datof3[15]=resuf3.getString(16);}else{datof3[15]="";}
                                              }
            ba.cierraResultado(resuf3);
                          }
           catch (Exception ex){}

           %>
             <form name="carne_f3" id="carne_f3" method="post" action="carne_f3.jsp" target="if_carne_f3">   
            <center>
             <table border="0" background="../imagenes/fotos/linea.png" style="width:413px;height:208px">
                  <!--  <tr><td colspan="6"><label>Obstetricos</label></td></tr> -->
                   <tr> <td></td> <td><center><p>gestas previas</p></center></td><td><center><p>abortos</p></center></td><td><center><p>vaginales</p></center></td><td><center><p>nacidos vivos</p></center></td><td><center><p>viven</p></center></td></tr>
                   <tr> 
                       <td rowspan="4" valign="bottom">
                         <table border="0">
                          <tr><td colspan="2"><center><label>Ultimo Previo</label></center></td></tr>
                          <tr><td style="text-align:right"><p style="text-align:right">2500g</p></td><td><input type="radio" value="0" id="ultimoprevio0" name="ultimoprevio" class="ultimoprevio"></td></tr>
                          <tr><td style="text-align:right"><p style="text-align:right">4000g</p></td><td><input type="radio" value="1" id="ultimoprevio1" name="ultimoprevio" class="ultimoprevio"></td></tr>
                          <tr><td style="text-align:right"><p style="text-align:right">gemelares</p></td><td><input type="radio" value="2" id="ultimoprevio2" name="ultimoprevio" class="ultimoprevio"></td></tr>
                         </table>
                         <% 
                        //   out.print("<h1>!!"+df1[0]+"!!</h1>");
                             if(datof3[6].compareTo("8")!=0){
                                        out.print("<script type='text/javascript'>");
                                        out.print("document.getElementById('ultimoprevio"+datof3[6]+"').checked = true;");
                                        out.print("</script>");                 
                                                             }
                           %> 
                       </td> 
                       <td><center><input type="text" id="gestprev" name="gestprev" class="gestprev" maxlength="2" style="width:22px;text-align:center" value="<% out.print(datof3[0]); %>"></center></td>
                       <td><center><input type="text" id="abortos" name="abortos" class="abortos" maxlength="2" style="width:22px;text-align:center"  value="<% out.print(datof3[1]); %>"></center></td>
                       <td><center><input type="text" id="dvaginales" name="dvaginales" class="dvaginales" maxlength="2" style="width:22px;text-align:center"  value="<% out.print(datof3[3]); %>"></center></td>
                       <td><center><input type="text" id="nacidosvi" name="nacidosvi" class="nacidosvi" maxlength="2" style="width:22px;text-align:center"  value="<% out.print(datof3[4]); %>"></center></td>
                       <td><center><input type="text" id="viven" name="viven" class="viven" maxlength="2" style="width:22px;text-align:center"  value="<% out.print(datof3[5]); %>"></center></td>
                   </tr>   
                   
                   <tr>  
                       <td rowspan="3" valign="bottom"></td>
                       <td><center><p>3 espont <br>consecutivos</p>
                            <%   
                             if(datof3[2].compareTo("1")==0){out.print("<input type='checkbox' id='tesconse' name='tesconse' class='tesconse' checked>");}
                                                        else{out.print("<input type='checkbox' id='tesconse' name='tesconse' class='tesconse'>");}
                            %> 
                            </center></td>
                       <td></td>
                       <td></td>
                       <td rowspan="2">
                           <table border="0">
                           <tr><td style="text-align:right; height: 32px;"><p style="text-align:right">muertos<br>1 sem</p></td>
							   <td style="height: 32px"><input type="text" id="m1sem" name="m1sem" class="m1sem"  maxlength="2" value="<% out.print(datof3[10]); %>" style="width:22px;text-align:center"></td></tr>
                           <tr><td style="text-align:right"><p style="text-align:right">despues<br>1 sem</p></td><td><input type="text" id="md1sem" name="md1sem" class="md1sem"  maxlength="2" value="<% out.print(datof3[11]); %>" style="width:22px;text-align:center"></td></tr>
                           </table>
                           
                       </td>
                   </tr> 
                     
                   <tr>  
                       
                       <td><center><p>partos</p></center></td>
                       <td><center><p>cesareas</p></center></td>
                       <td><center><p>nacidos<br>muertos</p></center></td>

                   </tr>  
                   <tr>  
                       
                       <td><center><input type="text" id="apartos" name="apartos" class="apartos"  maxlength="2" value="<% out.print(datof3[7]); %>" style="width:22px;text-align:center"></center></td>
                       <td><center><input type="text" id="acesareas" name="acesareas" class="acesareas"  maxlength="2" value="<% out.print(datof3[8]); %>" style="width:22px;text-align:center"></center></td>
                       <td><center><input type="text" id="anacidosm" name="anacidosm" class="anacidosm"  maxlength="2" value="<% out.print(datof3[9]); %>" style="width:22px;text-align:center"></center></td>
                       <td></td>
                   </tr> 

             </table>
             
             <table border="0" style="width:85%">
                <tr><td colspan="8" style="width:100%"> <span lang="es-co">&nbsp;&nbsp; </span>EMBARAZO ANTERIOR</td></tr>         
                <tr>
                    <td colspan="8">
                           <table border="0" style="width:100%">
                              <tr><td rowspan="2"><center><input type="text" name="fembarazoant" id="fembarazoant" class="fembarazoant" style="width:70px" readonly></center>
                                      <% 
                                         if(datof3[12]!=null && datof3[12].compareTo("null")!=0 && datof3[12].compareTo("")!=0){
                                                   out.print("<script type='text/javascript'>");
                                                   out.print("$('#fembarazoant').val('"+datof3[12]+"')");
                                                   out.print("</script>");                 
                                                                    }
                                       %>   
                               </td>
                                  <td><center>
                                        <%   
                             if(datof3[13].compareTo("1")==0){out.print("<input type='checkbox' id='menorunanno' name='menorunanno' class='menorunanno' checked>");}
                                                         else{out.print("<input type='checkbox' id='menorunanno' name='menorunanno' class='menorunanno'>");}
                            %> 
                                  </center></td>
                                  <td><center>EMBARAZO PLANEADO/DESEADO</center></td>
                              </tr>
                              <tr>
                                   <td><center>menor 1 año <br> mas de 5 años</center></td>
                                    <td><center>
                                              <table> 
                                                 <tr><td>si</td><td><input type="radio" value="0" id="embplaneado0" name="embplaneado" class="embplaneado"></td>
                                                     <td>no</td><td><input type="radio" value="1" id="embplaneado1" name="embplaneado" class="embplaneado"></td></tr>
                                              </table>
                                      </center>
                                         <% 
                                        //   out.print("<h1>!!"+df1[0]+"!!</h1>");
                                             if(datof3[14].compareTo("8")!=0){
                                                        out.print("<script type='text/javascript'>");
                                                        out.print("document.getElementById('embplaneado"+datof3[14]+"').checked = true;");
                                                        out.print("</script>");                 
                                                                             }
                                           %> 
                                   </td>
                              </tr>
                              <tr>
                               <!-- <td><center><p>EMBARAZO PLANEADO/DESEADO</p></center></td>     
                                   <td><center>
                                              <table> 
                                                 <tr><td><p>si</p></td><td><input type="radio" value="" id="embplaneado" name="embplaneado" class="embplaneado"></td>
                                                     <td><p>no</p></td><td><input type="radio" value="" id="embplaneado" name="embplaneado" class="embplaneado"></td></tr>
                                              </table>
                                      </center>
                                   </td>
                              </tr> -->
                              <tr><td colspan="3"><center>FRACASO DE METODO ANTICONCEPTIVO</center></td></tr> 
                              <tr><td colspan="3">
                                                 <center>
                                                         <table style="width:100%">
                                                               <tr >
                                                                   <td style="width:13%"><center><input type="radio" value="0" id="fracasometodoant0" name="fracasometodoant" class="fracasometodoant"></center></td>
                                                                   <td style="width:12%"><center><input type="radio" value="1" id="fracasometodoant1" name="fracasometodoant" class="fracasometodoant"></center></td>
                                                                   <td style="width:13%"><center><input type="radio" value="2" id="fracasometodoant2" name="fracasometodoant" class="fracasometodoant"></center></td>
                                                                   <td style="width:12%"><center><input type="radio" value="3" id="fracasometodoant3" name="fracasometodoant" class="fracasometodoant"></center></td>
                                                                   <td style="width:13%"><center><input type="radio" value="4" id="fracasometodoant4" name="fracasometodoant" class="fracasometodoant"></center></td>
                                                                   <td style="width:12%"><center><input type="radio" value="5" id="fracasometodoant5" name="fracasometodoant" class="fracasometodoant"></center></td>
                                                                   <td style="width:13%"><center><input type="radio" value="6" id="fracasometodoant6" name="fracasometodoant" class="fracasometodoant"></center></td>
                                                                   <td style="width:12%"><center><input type="radio" value="7" id="fracasometodoant7" name="fracasometodoant" class="fracasometodoant"></center></td>
                                                               </tr>
                                                               <tr>
                                                                   <td><center>no usaba</center></td>
                                                                   <td><center>barrera</center></td>
                                                                   <td><center>DIU</center></td>
                                                                   <td><center>hormonal</center></td>
                                                                   <td><center>emergencia</center></td>
                                                                   <td><center>natural</center></td>
                                                                   <td><center>ligadura</center></td>
                                                                   <td><center>no aplica</center></td>
                                                               </tr>

                                                         </table>                                                 
                                                 </center>
                                          <% 
                                        //   out.print("<h1>!!"+df1[0]+"!!</h1>");
                                             if(datof3[15].compareTo("8")!=0){
                                                        out.print("<script type='text/javascript'>");
                                                        out.print("document.getElementById('fracasometodoant"+datof3[15]+"').checked = true;");
                                                        out.print("</script>");                 
                                                                             }
                                           %> 
                                   </td>
                              </tr> 
                           </table>
                    </td>
                </tr>    
             </table>
              
             </center>
             </form>
       </td>
   </tr>
  </table>
   <br>
   <form name="carne_f4" id="carne_f4" method="post" action="carne_f4.jsp" target="if_carne_f4">   
    <table border="1" id="tablap" name="tablap" style="width:100%">
      <tr>
          <td colspan="2" id="tdp" name="tdp" style="width:90px;padding-left:10px;border-radius: 10px 0px 0px 0px;">
            <b> GESTACION ACTUAL   </b>        
          </td>
          <td style="width:110px;" id="tdp" name="tdp">
                <fieldset >
                                    <legend>FUM</legend>
                                    <input type="text" name="FUM" id="FUM" class="FUM" style="width:70px"  readonly>
                </fieldset >               
          </td>
          <td rowspan="2" id="tdp" name="tdp"><center>
                   <table border="0">
                         <tr><td colspan="3"><center>Eg confiable por</center></td></tr>
                         <tr><td></td><td><center>FUM&nbsp;&nbsp;&nbsp;</center></td><td><center>&nbsp;&nbsp;&nbsp;Eco &lt; 20s</center></td></tr>
                         <tr>
                             <td><center>si</center></td>
                             <td><center><input type="radio" value="0" id="egconfiablefum0" name="egconfiablefum" class="egconfiablefum"></center></td>
                             <td><center><input type="radio" value="0" id="egconfiableeco0" name="egconfiableeco" class="egconfiableeco"></center></td>
                         </tr>
                         <tr>
                             <td><center>no</center></td>
                             <td><center><input type="radio" value="1" id="egconfiablefum1" name="egconfiablefum" class="egconfiablefum"></center></td>
                             <td><center><input type="radio" value="1" id="egconfiableeco1" name="egconfiableeco" class="egconfiableeco"></center></td>
                         </tr>
                   </table>
                   </center>
          </td>
          <td rowspan="2" id="tdp" name="tdp">
                  <center>
                  <table border="0">
                          <tr>
                              <td colspan="2"><center>FUMA</center></td>
                              <td><center>CIGARRILLOS</center></td>
                          </tr>
                          <tr>
                              <td style="text-align:right;">si</td>
                              <td><center><input type="radio" value="0" id="cigafuma0" name="cigafuma" class="cigafuma"></center></td>
                              <td><center>POR DÍA</center></td>
                          </tr>
                          <tr>
                              <td style="text-align:right;">no</td>
                              <td><center><input type="radio" value="1" id="cigafuma1" name="cigafuma" class="cigafuma"></center></td>
                              <td><center><input type="text" id="cigapordia" name="cigapordia" maxlength="2"  style="width:18px"></center></td>
                          </tr>
                          <tr>
                              <td style="text-align:right;">pasiva</td>
                              <td><center><input type="radio" value="2" id="cigafuma2" name="cigafuma" class="cigafuma"></center></td>
                              <td><center>0=no fuma</center></td>
                          </tr>
                  </table>
                </center>
          </td>
          <td rowspan="2" id="tdp" name="tdp">
                   <center>  
                   <table border="0">
                      
                         <tr><td></td><td><center>si</center></td><td><center>no</center></td></tr>
                         <tr>
                             <td><center>Alcohol</center></td>
                             <td><center><input type="radio" value="0" id="alcoholdro0" name="alcoholdro" class="alcoholdro"></center></td>
                             <td><center><input type="radio" value="1" id="alcoholdro1" name="alcoholdro" class="alcoholdro"></center></td>
                         </tr>
                         <tr>
                             <td><center>Drogras</center></td>
                             <td><center><input type="radio" value="0" id="drogasalc0" name="drogasalc" class="drogasalc"></center></td>
                             <td><center><input type="radio" value="1" id="drogasalc1" name="drogasalc" class="drogasalc"></center></td>
                         </tr>
                   </table>
                   </center>
          </td>
          <td rowspan="2" id="tdp" name="tdp">
                   <center>
                   <table border="0">                      
                          <tr>
                              <td colspan="3"><center>ANTITETANICA</center></td>
                          </tr>
                          <tr>
                              <td style="text-align:center;">vigente</td>
                              <td><center>si<input type="radio" value="0" id="antitetanica0" name="antitetanica" class="antitetanica"></center></td>
                              <td><center>no<input type="radio" value="1" id="antitetanica1" name="antitetanica" class="antitetanica"></center></td>
                          </tr>
                          <tr>
                              <td style="text-align:center;">DOSIS</td>
                              <td><center>1<sup>a</sup></center></td>
                              <td><center>2<sup>a</sup></center></td>
                          </tr>
                          <tr>
                              <td style="text-align:center;">Mes<br>Gestacion</td>
                              <td><center><input type="text" id="pridosisanttitetanica" name="pridosisanttitetanica" maxlength="2"  style="width:18px"></center></td>
                              <td><center><input type="text" id="segdosisanttitetanica" name="segdosisanttitetanica" maxlength="2"  style="width:18px"></center></td>
                          </tr>                       
                  </table>
                  </center>    
          </td>
          <td rowspan="2" id="tdp" name="tdp">
                      <center>
                      <table border="0">
                         <tr><td colspan="2"><center>ANTIRUBEOLA</center></td></tr>
                         <tr><td><center>previa</center></td><td><center>no sabe</center></td></tr>
                         <tr>
                             <td><center><input type="radio" value="0" id="antirubeolauno0" name="antirubeolauno" class="antirubeolauno"></center></td>
                             <td><center><input type="radio" value="1" id="antirubeolauno1" name="antirubeolauno" class="antirubeolauno"></center></td>
                         </tr>
                         <tr><td><center>embaraso</center></td><td><center>no</center></td></tr>
                         <tr>
                             <td><center><input type="radio" value="2" id="antirubeolauno2" name="antirubeolauno" class="antirubeolauno"></center></td>
                             <td><center><input type="radio" value="3" id="antirubeolauno3" name="antirubeolauno" class="antirubeolauno"></center></td>
                         </tr>
                   </table>
                   </center>
          </td>
          <td rowspan="2" style="border-radius: 0px 10px 10px 0px;" id="tdp" name="tdp">
                      <center>
                      <table border="0">
                      
                         <tr><td><center>EX NORMAL</center></td><td><center>si</center></td><td><center>no</center></td></tr>
                         <tr>
                             <td><center>Odont</center></td>
                             <td><center><input type="radio" value="0" id="exnormalodont0" name="exnormalodont" class="exnormalodont"></center></td>
                             <td><center><input type="radio" value="1" id="exnormalodont1" name="exnormalodont" class="exnormalodont"></center></td>
                         </tr>
                         <tr>
                             <td><center>Mamas</center></td>
                             <td><center><input type="radio" value="0" id="exnormalmamas0" name="exnormalmamas" class="exnormalmamas"></center></td>
                             <td><center><input type="radio" value="1" id="exnormalmamas1" name="exnormalmamas" class="exnormalmamas"></center></td>
                         </tr>
                         <tr>
                             <td><center>Cervix</center></td>
                             <td><center><input type="radio" value="0" id="exnormalcervix0" name="exnormalcervix" class="exnormalcervix"></center></td>
                             <td><center><input type="radio" value="1" id="exnormalcervix1" name="exnormalcervix" class="exnormalcervix"></center></td>
                         </tr>

                   </table>
                   </center>
          </td>
      </tr>
      <tr>
          <td rowspan="1" style="width:90px;border-radius: 0px 0px 0px 10px;" id="tdp" name="tdp">
                          <fieldset >
                                    <legend>Peso Ant (kg)</legend>
                                    <input type="text" id="pesoant" name="pesoant"  maxlength="6" style="width:100%;text-align:center" >
                         </fieldset>
          </td>
          <td rowspan="1" style="width:70px" id="tdp" name="tdp">
                          <fieldset >
                                    <legend>Talla (cm)</legend>
                                    <input type="text" id="tallacm" name="tallacm" maxlength="6" style="width:100%;text-align:center">
                         </fieldset>
          </td>

          <td id="tdp" name="tdp">
              <fieldset>
                        <legend>FPP</legend>
                        <input type="text" name="FPP" id="FPP" class="FPP" style="width:70px" readonly>
              </fieldset>
          </td>
      </tr> 
      
  </table> 
   
  <table border="1" id="tablap" name="tablap" style="width:100%"> 
  <tr>
      <td  id="tdp" name="tdp" rowspan="2">
           <center>
            <table>
                 <tr><td>GRUPO</td><td>RH</td></tr>
                 <tr>
                     <td>
                         <select name="gruposanguineo" id="gruposanguineo">
                               <option value="0"></option>
                               <option value="1">A</option>
                               <option value="2">B</option>
                               <option value="3">O</option>                               
                               <option value="4">AB</option>
                         </select>
                     </td>
                     <td>
                          <select  name="rh" id="rh">
                               <option value="0"></option>
                               <option value="1">+</option>
                               <option value="2">-</option>
                         </select>
                     </td>
                 </tr>
                 
                 <tr><td>Sensibil.</td>
                     <td>
                          <table>
                            <tr><td><center><input type="radio" value="0" id="sensible0" name="sensible" class="sensible"></center></td>
                                <td><center><input type="radio" value="1" id="sensible1" name="sensible" class="sensible"></center></td>
                             </tr>
                            <tr><td><center>no</center></td><td><center>si</center></td></tr>
                          </table>
                     </td>
                 </tr>
            </table>
            </center>
      </td>
      
      <td  id="tdp" name="tdp" rowspan="1">
               <center>
               <table>
                      <tr><td colspan="6"><center>CITOLOGIA</center></td></tr>
                      <tr>
                          <td>-</td>
                          <td><center><input type="radio" value="0" id="citologia0" name="citologia" class="citologia"></center></td>
                          <td>+</td>
                          <td><center><input type="radio" value="1" id="citologia1" name="citologia" class="citologia"></center></td>
                          <td><center>no se<br>hizo</center></td>
                          <td><center><input type="radio" value="2" id="citologia2" name="citologia" class="citologia"></center></td>
                      </tr>
               </table>
               </center>
      </td>
      
      <td  id="tdp" name="tdp" rowspan="2">
             <center>
              <table>
                    <tr><td colspan="3"><center>VIH</center></td></tr>
                    <tr><td></td><td><center>si</center></td><td><center>no</center></td></tr>
                    <tr><td><center>Consej.</center></td>
                        <td><center><input type="radio" value="0" id="consejvih0" name="consejvih" class="consejvih"></center></td>
                        <td><center><input type="radio" value="1" id="consejvih1" name="consejvih" class="consejvih"></center></td></tr>
                    <tr><td><center>Solicitado</center></td>
                        <td><center><input type="radio" value="0" id="solicivih0" name="solicivih" class="solicivih"></center></td>
                        <td><center><input type="radio" value="1" id="solicivih1" name="solicivih" class="solicivih"></center></td></tr>
              </table>
             </center> 
      </td>
      
      <td  id="tdp" name="tdp" rowspan="2">
             <center>
             <table>
                   <tr><td colspan="3"><center>VDRL/RPR<br>&lt; 20 sem</center></td></tr>
                   <tr><td><center><input type="radio" value="0" id="vdrlrprmenor0" name="vdrlrprmenor" class="vdrlrprmenor"></center></td>
                       <td><center><input type="radio" value="1" id="vdrlrprmenor1" name="vdrlrprmenor" class="vdrlrprmenor"></center></td>
                       <td><center><input type="radio" value="2" id="vdrlrprmenor2" name="vdrlrprmenor" class="vdrlrprmenor"></center></td></tr>
                   <tr><td><center>-</center></td><td><center>+</center></td><td><center>no se<br>hizo</center></td></tr>
             </table>
             </center>
      </td>
      
      <td  id="tdp" name="tdp" rowspan="2">
            <center>
            <table>
                   <tr><td colspan="3"><center>VDRL/RPR<br>&gt;= 20 sem</center></td></tr>
                   <tr><td><center><input type="radio" value="0" id="vdrlrprmayor0" name="vdrlrprmayor" class="vdrlrprmayor"></center></td>
                       <td><center><input type="radio" value="1" id="vdrlrprmayor1" name="vdrlrprmayor" class="vdrlrprmayor"></center></td>
                       <td><center><input type="radio" value="2" id="vdrlrprmayor2" name="vdrlrprmayor" class="vdrlrprmayor"></center></td></tr>
                   <tr><td><center>-</center></td><td><center>+</center></td><td><center>no se<br>hizo</center></td></tr>
             </table>
            </center>
      </td>
      
      <td  id="tdp" name="tdp" rowspan="2">
             <center>
             <table>
                   <tr><td colspan="4"><center>SIFILIS<br>CONFIRMADA<br>POR FTA</center></td></tr>
                   <tr><td><center>si</center></td>
                       <td><center><input type="radio" value="0" id="sifilis0" name="sifilis" class="sifilis"></center></td>
                       <td><center>no</center></td>
                       <td><center><input type="radio" value="1" id="sifilis1" name="sifilis" class="sifilis"></center></td>
                   </tr>
                   <tr><td colspan="4">
                             <center>
                                 <table>
                                   <tr><td><center>no se<br>hizo</center></td>
                                       <td><center><input type="radio" value="2" id="sifilis2" name="sifilis" class="sifilis"></center></td>
                                  </tr>
                                 </table>
                             </center>
                       </td>
                   </tr>
             </table>
             </center>
      </td>
      
      <td  id="tdp" name="tdp" rowspan="2">
              <center>
              <table>
                 <tr><td><center>HB &lt;20 sem</center></td></tr>
                 <tr><td><center><input type="text" name="hbmenor" id="hbmenor" maxlength="6" style="width:40px">g</center></td></tr>
                                          <tr><td><center>&lt; 12.5g <input type="checkbox" name="nem125" id="nem125" value="" disabled="disabled"> </center></td></tr>
              </table>
              </center>
      </td>
      
      <td  id="tdp" name="tdp" rowspan="2">
              <center>
              <table>
                 <tr><td><center>HB &gt;= 20 sem</center></td></tr>
                 <tr><td><center><input type="text" name="hbmayor" id="hbmayor" maxlength="6" style="width:40px">g</center></td></tr>
                 <tr><td><center>&lt; 12.0g <input type="checkbox" name="nem125dos" id="nem125dos" value="" disabled="disabled"> </center></td></tr>
              </table>
              </center>
      </td>
      
      <td  id="tdp" name="tdp" rowspan="2">
             <center>
              <table>
                    <tr><td colspan="2"><center>AgsHB</center></td></tr>                    
                    <tr>
                        <td><center><input type="radio" value="0" id="agshb0" name="agshb" class="agshb">-</center></td>
                        <td><center><input type="radio" value="1" id="agshb1" name="agshb" class="agshb">+</center></td>
                    </tr>
                    <tr><td colspan="2"><center>IgG Toxoplasma</center></td></tr>  
                    <tr>
                        <td><center><input type="radio" value="0" id="iggtoxoplasma0" name="iggtoxoplasma" class="iggtoxoplasma">-</center></td>
                        <td><center><input type="radio" value="1" id="iggtoxoplasma1" name="iggtoxoplasma" class="iggtoxoplasma">+</center></td>
                  </tr>
              </table>
             </center> 

      </td>
      
      <td  id="tdp" name="tdp" rowspan="2">
             <center>
                <table>
                    <tr><td colspan="2">Test o Sullivan</td></tr>
                    <tr><td><input type="radio" value="0" id="testosullivan0" name="testosullivan" class="testosullivan"></td><td>&lt;=135</td></tr>
                    <tr><td><input type="radio" value="1" id="testosullivan1" name="testosullivan" class="testosullivan"></td><td>135 - 199</td></tr>
                    <tr><td><input type="radio" value="2" id="testosullivan2" name="testosullivan" class="testosullivan"></td><td>&gt; 200</td></tr>
                </table>
             </center>
      </td>
      
      <td  id="tdp" name="tdp" rowspan="2">
             <center>
             <table>
                   <tr><td colspan="2"><center>IgG Rubeola</center></td></tr>
                   <tr><td><center>si<input type="radio" value="0" id="iggrubeola0" name="iggrubeola" class="iggrubeola"></center></td>
                       <td><center>no<input type="radio" value="1" id="iggrubeola1" name="iggrubeola" class="iggrubeola"></center></td>
                   </tr>
             </table>
             </center>

      </td>
      
      <td  id="tdp" name="tdp" rowspan="2">
              <center>
             <table>
                   <tr><td colspan="3"><center>Version Cefalica<br>Externa<br>intento a termino</center></td></tr>
                   <tr><td><center><input type="radio" value="0" id="vercefaexte0" name="vercefaexte" class="vercefaexte"></center></td>
                       <td><center><input type="radio" value="1" id="vercefaexte1" name="vercefaexte" class="vercefaexte"></center></td>
                       <td><center><input type="radio" value="2" id="vercefaexte2" name="vercefaexte" class="vercefaexte"></center></td></tr>
                   <tr><td><center>si</center></td><td><center>no</center></td><td><center>n/c</center></td></tr>
             </table>
             </center>

      </td>
    </tr>
    <tr>
      <td  id="tdp" name="tdp" rowspan="1">
               <center>
                <table>
                      <tr><td colspan="6"><center>COLPOSCOPIA</center></td></tr>
                      <tr>
                          <td>-</td>
                          <td><center><input type="radio" value="0" id="colposcopia0" name="colposcopia" class="colposcopia"></center></td>
                          <td>+</td>
                          <td><center><input type="radio" value="1" id="colposcopia1" name="colposcopia" class="colposcopia"></center></td>
                          <td><center>no se<br>hizo</center></td>
                          <td><center><input type="radio" value="2" id="colposcopia2" name="colposcopia" class="colposcopia"></center></td>
                      </tr>
                      
               </table>
               </center>
      </td>
   </tr>
  </table>
   </form>  
   <%
    //para llenar con f4 son 34 datos
    String sqlff3="select peso_ant,tallacm,fum,fpp,eco_fum,eco_20,fuma,cigarros_dia,alcohol,drogas,antite_vigente,dosis_uno,dosis_dos,antirubeola,exnor_odont,exnor_mamas,exnor_cervix,sensibil,grupo_sang,rh_gs,citologia,colposcopia,vih_consej,vih_solicitado,vdrl_menos20,vdrl_mas20,sifilis,hb_menos20,hb_mas20,agshb,igg_toxo,test_suliban,igg_rubeola,version_cefalica from gestacion_actual where materno_perinatal=(select serial from materno_perinatal where idembarazo='"+codemb+"')";
    //out.print("sqlff3: "+sqlff3);  
    ResultSet resuff3=null;
    resuff3=ba.consultas(sqlff3);
    out.print("<script type='text/javascript'>");
    String dato3="8";
    while(resuff3.next()&&resuff3!=null){
                     if(resuff3.getString(1)!=null && resuff3.getString(1).compareTo("null")!=0 && resuff3.getString(1).compareTo("")!=0){
                           out.print("$('#pesoant').val('"+resuff3.getString(1)+"');");
                                                                     }
                     
                     if(resuff3.getString(2)!=null && resuff3.getString(2).compareTo("null")!=0 && resuff3.getString(2).compareTo("")!=0){
                           out.print("$('#tallacm').val('"+resuff3.getString(2)+"');");
                                                                       }  
                               
                     if(resuff3.getString(3)!=null && resuff3.getString(3).compareTo("null")!=0 && resuff3.getString(3).compareTo("")!=0){
                          out.print("$('#FUM').val('"+resuff3.getString(3)+"');");
                                                                      }
                     
                     if(resuff3.getString(4)!=null && resuff3.getString(4).compareTo("null")!=0 && resuff3.getString(4).compareTo("")!=0){
                          out.print("$('#FPP').val('"+resuff3.getString(4)+"');");
                                                                     }
                     
                     if(resuff3.getString(5)!=null && resuff3.getString(5).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(5)+"")!=0){
                          out.print("document.getElementById('egconfiablefum"+resuff3.getString(5)+"').checked = true;");
                                                                     }
                     
                     if(resuff3.getString(6)!=null && resuff3.getString(6).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(6)+"")!=0){
                          out.print("document.getElementById('egconfiableeco"+resuff3.getString(6)+"').checked = true;");
                                                                     }
                     
                     if(resuff3.getString(7)!=null && resuff3.getString(7).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(7)+"")!=0){
                          out.print("document.getElementById('cigafuma"+resuff3.getString(7)+"').checked = true;");
                                                                     }
                     
                     if(resuff3.getString(8)!=null && resuff3.getString(8).compareTo("null")!=0 && resuff3.getString(8).compareTo("")!=0){
                           out.print("$('#cigapordia').val('"+resuff3.getString(8)+"');");
                                                                       }
                     
                     if(resuff3.getString(9)!=null && resuff3.getString(9).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(9)+"")!=0){
                          out.print("document.getElementById('alcoholdro"+resuff3.getString(9)+"').checked = true;");
                                                                     } 
                     
                     if(resuff3.getString(10)!=null && resuff3.getString(10).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(10)+"")!=0){
                          out.print("document.getElementById('drogasalc"+resuff3.getString(10)+"').checked = true;");
                                                                     } 
                     
                     if(resuff3.getString(11)!=null && resuff3.getString(11).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(11)+"")!=0){
                          out.print("document.getElementById('antitetanica"+resuff3.getString(11)+"').checked = true;");
                                                                     }
                     
                     if(resuff3.getString(12)!=null && resuff3.getString(12).compareTo("null")!=0 && resuff3.getString(12).compareTo("")!=0){
                           out.print("$('#pridosisanttitetanica').val('"+resuff3.getString(12)+"');");
                                                                       } 
                     
                     if(resuff3.getString(13)!=null && resuff3.getString(13).compareTo("null")!=0 && resuff3.getString(13).compareTo("")!=0){
                           out.print("$('#segdosisanttitetanica').val('"+resuff3.getString(13)+"');");
                                                                       }
                     
                     if(resuff3.getString(14)!=null && resuff3.getString(14).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(14)+"")!=0){
                          out.print("document.getElementById('antirubeolauno"+resuff3.getString(14)+"').checked = true;");
                                                                     }
                     
                     if(resuff3.getString(15)!=null && resuff3.getString(15).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(15)+"")!=0){
                          out.print("document.getElementById('exnormalodont"+resuff3.getString(15)+"').checked = true;");
                                                                     }
                     
                     if(resuff3.getString(16)!=null && resuff3.getString(16).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(16)+"")!=0){
                          out.print("document.getElementById('exnormalmamas"+resuff3.getString(16)+"').checked = true;");
                                                                     }
                     
                     if(resuff3.getString(17)!=null && resuff3.getString(17).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(17)+"")!=0){
                          out.print("document.getElementById('exnormalcervix"+resuff3.getString(17)+"').checked = true;");
                                                                     }
                     
                     if(resuff3.getString(18)!=null && resuff3.getString(18).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(18)+"")!=0){
                          out.print("document.getElementById('sensible"+resuff3.getString(18)+"').checked = true;");
                                                                     }
                     
                     if(resuff3.getString(19)!=null && resuff3.getString(19).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(19)+"")!=0){
                          out.print("$('#gruposanguineo option[value="+resuff3.getString(19)+"]').attr('selected',true);");
                                                                     }
                     
                     if(resuff3.getString(20)!=null && resuff3.getString(20).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(20)+"")!=0){
                          out.print("$('#rh option[value="+resuff3.getString(20)+"]').attr('selected',true);");
                                                                      }
                     
                     if(resuff3.getString(21)!=null && resuff3.getString(21).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(21)+"")!=0){
                          out.print("document.getElementById('citologia"+resuff3.getString(21)+"').checked = true;");
                                                                     }                     
                     
                     if(resuff3.getString(22)!=null && resuff3.getString(22).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(22)+"")!=0){
                          out.print("document.getElementById('colposcopia"+resuff3.getString(22)+"').checked = true;");
                                                                     }                     
                     
                     if(resuff3.getString(23)!=null && resuff3.getString(23).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(23)+"")!=0){
                          out.print("document.getElementById('consejvih"+resuff3.getString(23)+"').checked = true;");
                                                                     }                 
                     
                     if(resuff3.getString(24)!=null && resuff3.getString(24).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(24)+"")!=0){
                          out.print("document.getElementById('solicivih"+resuff3.getString(24)+"').checked = true;");
                                                                     }             
                     
                     if(resuff3.getString(25)!=null && resuff3.getString(25).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(25)+"")!=0){
                          out.print("document.getElementById('vdrlrprmenor"+resuff3.getString(25)+"').checked = true;");
                                                                     }           
                     
                     if(resuff3.getString(26)!=null && resuff3.getString(26).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(26)+"")!=0){
                          out.print("document.getElementById('vdrlrprmayor"+resuff3.getString(26)+"').checked = true;");
                                                                     }          
                     
                     if(resuff3.getString(27)!=null && resuff3.getString(27).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(27)+"")!=0){
                          out.print("document.getElementById('sifilis"+resuff3.getString(27)+"').checked = true;");
                                                                     }
                     
                     if(resuff3.getString(28)!=null && resuff3.getString(28).compareTo("null")!=0 && resuff3.getString(28).compareTo("")!=0){
                           out.print("$('#hbmenor').val('"+resuff3.getString(28)+"');");
                           float d0=Float.parseFloat(""+resuff3.getString(28)+"");
                           if(d0<12.5){out.print("$('#nem125').attr('checked','checked');");}
                                                                       }
                     
                     if(resuff3.getString(29)!=null && resuff3.getString(29).compareTo("null")!=0 && resuff3.getString(29).compareTo("")!=0){
                           out.print("$('#hbmayor').val('"+resuff3.getString(29)+"');");
                           float d1=Float.parseFloat(""+resuff3.getString(29)+"");
                           if(d1<12.0){out.print("$('#nem125dos').attr('checked','checked');");}
                                                                       }    
                     
                     if(resuff3.getString(30)!=null && resuff3.getString(30).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(30)+"")!=0){
                          out.print("document.getElementById('agshb"+resuff3.getString(30)+"').checked = true;");
                                                                     }    
                     
                     if(resuff3.getString(31)!=null && resuff3.getString(31).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(31)+"")!=0){
                          out.print("document.getElementById('iggtoxoplasma"+resuff3.getString(31)+"').checked = true;");
                                                                     }    
                     
                     if(resuff3.getString(32)!=null && resuff3.getString(32).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(32)+"")!=0){
                          out.print("document.getElementById('testosullivan"+resuff3.getString(32)+"').checked = true;");
                                                                     }    
                     
                     if(resuff3.getString(33)!=null && resuff3.getString(33).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(33)+"")!=0){
                          out.print("document.getElementById('iggrubeola"+resuff3.getString(33)+"').checked = true;");
                                                                     }   
                     
                     if(resuff3.getString(34)!=null && resuff3.getString(34).compareTo("null")!=0 && dato3.compareTo(""+resuff3.getString(34)+"")!=0){
                          out.print("document.getElementById('vercefaexte"+resuff3.getString(34)+"').checked = true;");
                                                                     }
                     
                     
                                        }
    ba.cierraResultado(resuff3);
    
                      
     out.print("</script>");
%>
   <br>
   
   <table style="width:100%;border-radius: 10px 10px 10px 10px;" id="tdp" name="tdp">
   <tr>
       <td style="width:100%;border-radius: 10px 10px 10px 10px;" id="tdp" name="tdp">
       <center>
                   <table id="list40" ></table>
                   <div id="pager40"></div>  
                   <br> 
      </center>                           
       </td>
  </tr>
  </table>
  <br>
  <form name="carne_f5" id="carne_f5" method="post" action="carne_f5.jsp" target="if_carne_f5">
  <table border="1" id="tablap" name="tablap" style="width:100%"> 
  <tr>
      <td id="tdp" name="tdp" colspan="2" style="border-radius: 10px 0px 0px 0px;" ><b> Parto:</b><input type="radio" name="parabo" id="parabo0" value="0" ><span lang="es-co">&nbsp;</span><b>Aborto:</b><input type="radio" name="parabo" id="parabo1" value="1" ></td>
      <td id="tdp" name="tdp" rowspan="3"><center>Hospitaliz<br>en<br>Embarazo<br>dias<br><input type="text" name="hospiembdia" id="hospiembdia" maxlength="2" style="width:40px;text-align:center"></center></td>
      <td id="tdp" name="tdp" rowspan="3">
                    <table>
                          <tr><td colspan="3" style="height: 17px"><center>Corticoides Antenatales</center></td></tr>
                          <tr><td><center>cliclo<br>unico<br>completo</center></td>
                              <td><center>cliclo<br>unico<br>incompleto</center></td>
                              <td rowspan="2"><center><input type="text" name="contantsemaini" id="contantsemaini" value="" maxlength="2" style="width:40px;text-align:center"><br>semana inicio</center></td>
                          </tr>
                          <tr>
                              <td><center><input type="radio" id="cantenatales0" name="cantenatales" value="0"></center></td>
                              <td><center><input type="radio" id="cantenatales1" name="cantenatales" value="1"></center></td>
                          </tr>
                          <tr>
                              <td><center>múltiples</center></td>
                              <td><center>nimguno</center></td>
                              <td><center>n/c</center></td>
                          </tr>
                          <tr>
                              <td><center><input type="radio" id="cantenatales2" name="cantenatales" value="2"></center></td>
                              <td><center><input type="radio" id="cantenatales3" name="cantenatales" value="3"></center></td>
                              <td><center><input type="radio" id="cantenatales4" name="cantenatales" value="4"></center></td>
                          </tr>

                    </table>
      </td>
      <td rowspan="3" id="tdp" name="tdp" ><center>Inicio<br>T de P<br>espontaneo<br>
                              <input type="radio" name="iniciotdep" id="iniciotdep0" value="0"><br>
                              incluido<br>
                              <input type="radio" name="iniciotdep" id="iniciotdep1" value="1"><br>
                              cesar elect<br>
                              <input type="radio" name="iniciotdep" id="iniciotdep2" value="2">
                     </center>                    
      </td>
      <td rowspan="3" id="tdp" name="tdp" >
                <table>
                       <tr><td colspan="6"><center>Ruptura de Membranas Anteparto</center></td></tr>
                       <tr><td><center>integras<br><input type="radio" name="rmaintegras" id="rmaintegras0" value="0"></center></td>
                           <td colspan="3"><center><input type="text" name="frummemb" id="frummemb" value="" style="width:70px" readonly></center></td>
                           <td rowspan="2">
                                         <table>
                                                 <tr><td style="text-align:right">&lt; 37 sem</td><td><input type="checkbox" name="rmasem37" id="rmasem37"></td></tr>
                                                 <tr><td style="text-align:right">&gt;= 12 hs</td><td><input type="checkbox" name="rmahs12" id="rmahs12"></td></tr>
                                                 <tr><td style="text-align:right">temp &gt;= 38 C</td><td><input type="checkbox" name="rmatemp38" id="rmatemp38"></td></tr>
                                                 <tr><td style="text-align:center">semana<br>ruptura</td><td><input type="text" name="rmasrum" id="rmasrum" value="" maxlength="2" style="width:35px;"></td></tr>
                                         </table>                           
                           </td>
                       </tr>
                       <tr><td><center>rotas<br><input type="radio" name="rmaintegras" id="rmaintegras1" value="1"></center></td>
                           <td><center>hora<br>
                                       <select name="hora_rupt" id="hora_rupt">
                                                  <option value="0">H</option>
                                                  <option value="1">1</option>
                                                  <option value="2">2</option>
                                                  <option value="3">3</option>
                                                  <option value="4">4</option>
                                                  <option value="5">5</option>
                                                  <option value="6">6</option>
                                                  <option value="7">7</option>
                                                  <option value="8">8</option>
                                                  <option value="9">9</option>
                                                  <option value="10">10</option>
                                                  <option value="11">11</option>
                                                  <option value="12">12</option>                                                  
                                       </select> 
                               </center>
                           </td> 
                           <td><center>minuto<br>
                                       <select name="min_rupt" id="min_rupt">
                                                 <option value="60">M</option> 
                                          <%
                                          for(int i=0;i<=59;i++){
                                             String min=""+i;
                                             if(i<=9){min="0"+i;} 
                                                out.print("<option value='"+i+"'>"+min+"</option>");                                          
                                             }                                          
                                          %>                                                   
                                       </select> 
                               </center>
                           </td>
                            <td><center>am/pm<br>
                                       <select name="ampm_rupt" id="ampm_rupt">
                                                  <option value="1">am</option>
                                                  <option value="2">pm</option>                                                 
                                       </select> 
                               </center>
                           </td>

                       </tr>

                </table>
      </td>
      <td rowspan="3" id="tdp" name="tdp" >
                 <center>
                           Horas<br>Entre<br>Ruptura<br>y Parto<br><input type="text" name="hentrerup" id="hentrerup" value="" style="width:45px" maxlength="3">
                 </center>
       </td>
      
      <td rowspan="3" id="tdp" name="tdp" >
                 <center>
                           Edad Gest<br>al parto<br>
                           <table>
                                  <tr>
                                      <td><center>Semanas</center></td>
                                      <td><center>Dias</center></td>
                                   </tr>
                                   <tr>   
                                      <td><center><input type="text" name="edadgestapasem" id="edadgestapasem" maxlength="2" style="width:35px"></center></td>
                                      <td><center><input type="text" name="edadgestapadias" id="edadgestapadias" maxlength="1" style="width:15px"></center></td>
                                   </tr>
                                   <tr>     
                                      <td><center>por Fum</center></td>
                                      <td><center>por Eco</center></td>
                                  </tr>
                                   <tr>     
                                      <td><center><input type="radio" value="0" name="edadgestfumeco" id="edadgestfumeco0"> </center></td>
                                      <td><center><input type="radio" value="1" name="edadgestfumeco" id="edadgestfumeco1"></center></td>
                                  </tr>
                           </table>
                 </center>
       </td>
        <td rowspan="3" id="tdp" name="tdp" ><center>Presentacion<br>cefalica<br>
                              <input type="radio" name="presentacioncefa" id="presentacioncefa0" value="0"><br>
                              pelviana<br>
                              <input type="radio" name="presentacioncefa" id="presentacioncefa1" value="1"><br>
                              transversa<br>
                              <input type="radio" name="presentacioncefa" id="presentacioncefa2" value="2">
                     </center>                    
      </td>
       <td rowspan="3" id="tdp" name="tdp" ><center>Acompañante<br>en T de P<br>
                           <table>
                              <tr><td style="text-align:right">pareja</td><td><input type="radio" name="acompanante" id="acompanante0" value="0"></td></tr>
                              <tr><td style="text-align:right">familiar</td><td><input type="radio" name="acompanante" id="acompanante1" value="1"></td></tr>
                              <tr><td style="text-align:right">otro</td><td><input type="radio" name="acompanante" id="acompanante2" value="2"></td></tr>
                              <tr><td style="text-align:right">ninguno</td><td><input type="radio" name="acompanante" id="acompanante3" value="3"></td></tr>
                            </table>
                              
                     </center>                    
      </td>

  </tr>
  <tr>
    <td id="tdp" name="tdp" ><center> 
                                 Fecha ingreso<br><input type="text" value="" id="pabortofingreso" name="pabortofingreso" style="width:70px" readonly>
                             </center>    
    </td>
    <td id="tdp" name="tdp" rowspan="2">
       <center>
           Consultas<br>Prenatales<br>tolat<br><input type="text" id="consultaprenata" name="consultaprenata" value="" maxlength="2" style="text-align:center;width:35px">
       </center>
    </td>
  </tr>
  <tr>
     <td id="tdp" name="tdp" style="height: 48px" >
        <center>
                 Carné<br>si:<input type="radio" id="carnetsino0" name="carnetsino" value="0" >
                          no:<input type="radio" id="carnetsino1" name="carnetsino" value="1" >
       </center>
     </td>
  </tr>
  </table>
  <table id="tablap" name="tablap" border="1" style="width:100%;">
     <tr>
     <td id="tdp" name="tdp">
               <table>
                      <tr><td>Nacimiento</td><td style="text-align:center" colspan="2">VIVO<input type="radio" id="nacemuerto0" name="nacemuerto" value="0"></td></tr>
                      <tr><td>Muerto<br>anteparto</td><td><br><input type="radio" id="nacemuerto1" name="nacemuerto" value="1">
                                                              parto<input type="radio" id="nacemuerto2" name="nacemuerto" value="2"></td>
                                                       <td>ignora<br>momento<input type="radio" id="nacemuerto3" name="nacemuerto" value="3"></td></tr>
               </table>
     </td>
     
      <td id="tdp" name="tdp">
             <table>
                      <tr><td><center>hora<br>
                                       <select name="hora_nacimiento" id="hora_nacimiento">
                                                  <option value="0">H</option>
                                                  <option value="1">1</option>
                                                  <option value="2">2</option>
                                                  <option value="3">3</option>
                                                  <option value="4">4</option>
                                                  <option value="5">5</option>
                                                  <option value="6">6</option>
                                                  <option value="7">7</option>
                                                  <option value="8">8</option>
                                                  <option value="9">9</option>
                                                  <option value="10">10</option>
                                                  <option value="11">11</option>
                                                  <option value="12">12</option>                                                  
                                       </select> 
                               </center>
                           </td> 
                           <td style="width: 38px"><center>minuto<br>
                                       <select name="min_nacimiento" id="min_nacimiento">
                                          <option value="60">M</option> 
                                          <%
                                          for(int i=0;i<=59;i++){
                                             String min=""+i;
                                             if(i<=9){min="0"+i;} 
                                                out.print("<option value='"+i+"'>"+min+"</option>");                                          
                                             }                                          
                                          %>                                                  
                                       </select> 
                               </center>
                           </td>
                            <td><center>am/pm<br>
                                       <select name="ampm_nacimiento" id="ampm_nacimiento">
                                                  <option value="1">am</option>
                                                  <option value="2">pm</option>                                                 
                                       </select> 
                               </center>
                           </td>

                       </tr>
                       <tr>
                       <td colspan="3" style="text-align:center">
                           <input type="text" value="" id="nacevm" name="nacevm" style="width:70px" readonly>               
                       </td>
                       </tr>
                </table>   
     </td>
     <td  id="tdp" name="tdp">
           <table>
                  <tr><td>Multiple</td><td></td><td>fetos</td></tr>
                  <tr><td>orden</td><td rowspan="2">  <input type="text" name="paabomulti" id="paabomulti" value="" maxlength="2" style="width:20px"></td>
                                    <td rowspan="2">/<input type="text" name="paabomulti2" id="paabomulti2" value="" maxlength="2" style="width:20px"></td></tr>
                  <tr><td>0=unico</td></tr>
           </table>
     
     </td >
     <td  id="tdp" name="tdp">
           <table>
                  <tr><td colspan="4" style="text-align:center">Terminacion</td></tr>
                  <tr><td>espont</td><td><input type="radio" name="terminapar" id="terminapar0" value="0"></td>
                      <td>cesárea</td><td><input type="radio" name="terminapar" id="terminapar1" value="1"></td></tr>
                  <tr><td>forceps</td><td><input type="radio" name="terminapar" id="terminapar2" value="2"></td>
                      <td>espátula</td><td><input type="radio" name="terminapar" id="terminapar3" value="3"></td></tr>
           </table>
     
     </td>
      <td  id="tdp" name="tdp">
           <table>
                  <tr><td>Indicacion principal de<br>induccion o parto operatorio</td>
                      <td rowspan="2" style="padding-left:16px">C<br>o<br>d</td>
                      <td rowspan="2" >
                                        <fieldset >
                      								<legend>Introduccion</legend>
                                                                                <input type="text" id="introduccionparto" name="introduccionparto" maxlength="199" value="" style="width:80px">
            						    </fieldset>                                  
                                  </td>
                      <td rowspan="2" >
                                        <fieldset >
                      								<legend>Operatorio</legend>
                      								<input type="text" id="operatorioparto" name="operatorioparto" maxlength="44" value="" style="width:80px">
            						    </fieldset> 
                                  </td></tr>
                  <tr><td><input type="text" name="indpriindpar" id="indpriindpar" maxlength="44" value=""></td></tr>
           </table>     
     </td>  
     </tr>     
  </table>
  <table id="tablap" name="tablap" border="1" style="width:100%;">
     <tr>
          <td id="tdp" name="tdp" valign="top">
                <table>
                         <tr><td colspan="4" style="text-align:left">Posicion Parto</td></tr>
                         <tr>
                             <td style="text-align:right">sentada</td>
                             <td style="text-align:right"><input type="radio" value="0" name="posicionparto" id="posicionparto0"></td>
                          </tr>
                         <tr>
                            <td style="text-align:right">acostada</td>
                             <td style="text-align:right"><input type="radio" value="1" name="posicionparto" id="posicionparto1"></td>
                         </tr>

                         <tr>
                             <td style="text-align:right">cunclillas</td>
                             <td style="text-align:left"><input type="radio" value="2" name="posicionparto" id="posicionparto2"></td>
                         </tr>
                </table>
          </td>
          <td id="tdp" name="tdp" valign="top">
                           
                            <center>  Episiotomia       
                                      <br>no<br><input type="radio" name="episiotomia" id="episiotomia0" value="0">
                                      <br>si<br><input type="radio" name="episiotomia" id="episiotomia1" value="1">
                           </center>  
          </td>
           <td id="tdp" name="tdp" valign="top">
                        <table>
                           <tr>
                              <td style="width:80px" colspan="2">
                                  <center>Desgarros<br>Grado{1 a 4}</center>
                              </td>
                              <td valign="top">
                                  <center>Ocitocitos en<br>Alumbramiento</center>
                              </td>                                                            
                           </tr>
                           <tr>
                              <td>
                                  <center>
                                          <div><input type="checkbox" name="desgarrosck" id="desgarrosck" ><br>no</div>
                                   </center>
                              </td>
                              <td>
                                  <center>
                                          <input type="text" name="txtdesgarros" id="txtdesgarros" value="" style="width:20px" maxlength="2">
                                  </center>
                              </td>
                              <td>
                                  <center>
                                          si<input type="radio" name="ocitocitos" id="ocitocitos0" value="0">
                                          no<input type="radio" name="ocitocitos" id="ocitocitos1" value="1">
                                  </center>

                              </td>                                                            
                           </tr>

                        </table> 
          </td>
          <td id="tdp" name="tdp"  valign="top">
                           Placenta<br>
                           <table>
                                 <tr> <td></td> <td><center>si</center></td> <td><center>no</center></td> </tr>
                                 <tr> <td>Completa</td> 
                                      <td><center><input type="radio" name="placentacompleta" id="placentacompleta0" value="0"></center></td> 
                                      <td><center><input type="radio" name="placentacompleta" id="placentacompleta1" value="1"></center></td> 
                                 </tr>
                                 <tr> <td>Retenida</td>
                                      <td><center><input type="radio" name="placentaretenida" id="placentaretenida0" value="0"></center></td> 
                                      <td><center><input type="radio" name="placentaretenida" id="placentaretenida1" value="1"></center></td> 
                                 </tr>

                           </table>                           
          </td>    
          <td id="tdp" name="tdp"  valign="top"  valign="top">
                    Ligadura<br>Cordon<br>
                    <table>
                      <tr> <td><center>&lt;30s</center></td> <td><center>30s 1m</center></td> <td><center>&gt;1m</center></td> </tr>
                      <tr> <td><center><input type="radio" name="ligaduracordon" id="ligaduracordon0" value="0"></center></td> 
                           <td><center><input type="radio" name="ligaduracordon" id="ligaduracordon1" value="1"></center></td> 
                           <td><center><input type="radio" name="ligaduracordon" id="ligaduracordon2" value="2"></center></td> 
                      </tr>
                    </table>
          </td>   
          <td id="tdp" name="tdp">
              <fieldset >
                      <legend>Medicacion Recivida</legend>
                      <table>
                            <tr>
                                <td colspan="2" style="height: 30px">Ocitocitos<br>en Tdp</td>
                                <td colspan="2" style="height: 30px">Antibiot</td>
                                <td colspan="2" style="height: 30px">Analgesia<br>Epidural</td>
                                <td colspan="2" style="height: 30px">Anest. Region</td>
                                <td colspan="2" style="height: 30px">Anest. Gral</td>
                                <td colspan="2" style="height: 30px">Transfusion</td>
                                <td colspan="2" style="height: 30px">Otros</td>
                                <td style="height: 30px">Especificar</td>
                            </tr>
                             <tr>
                                <td>no<br>si</td>
                                <td>
                                    <input type="radio" name="medicacionr_ocitocitos" id="medicacionr_ocitocitos0" value="0"><br>
                                    <input type="radio" name="medicacionr_ocitocitos" id="medicacionr_ocitocitos1" value="1">
                                </td>                                                                   
                                
                                <td>no<br>si</td>
                                <td>
                                    <input type="radio" name="medicacionr_antibiot" id="medicacionr_antibiot0" value="0"><br>
                                    <input type="radio" name="medicacionr_antibiot" id="medicacionr_antibiot1" value="1">
                                </td>   
                                
                                <td>no<br>si</td>
                                <td>
                                    <input type="radio" name="medicacionr_epidural" id="medicacionr_epidural0" value="0"><br>
                                    <input type="radio" name="medicacionr_epidural" id="medicacionr_epidural1" value="1">
                                </td>   
                                
                                <td>no<br>si</td>
                                <td>
                                    <input type="radio" name="medicacionr_anestregion" id="medicacionr_anestregion0" value="0"><br>
                                    <input type="radio" name="medicacionr_anestregion" id="medicacionr_anestregion1" value="1">
                                </td>   

                                <td>no<br>si</td>
                                <td>
                                    <input type="radio" name="medicacionr_anestgeneral" id="medicacionr_anestgeneral0" value="0"><br>
                                    <input type="radio" name="medicacionr_anestgeneral" id="medicacionr_anestgeneral1" value="1">
                                </td>  

                                
                                 <td>no<br>si</td>
                                <td>
                                    <input type="radio" name="medicacionr_transfusion" id="medicacionr_transfusion0" value="0"><br>
                                    <input type="radio" name="medicacionr_transfusion" id="medicacionr_transfusion1" value="1">
                                </td>  

                                
                                  <td>no<br>si</td>
                                <td>
                                    <input type="radio" name="medicacionr_otros" id="medicacionr_otros0" value="0"><br>
                                    <input type="radio" name="medicacionr_otros" id="medicacionr_otros1" value="1">
                                </td>
                                
                                <td>
                                   <textarea name="descri0" id="descri0" rows="2" maxlength="199" style="width: 100%"></textarea>
                                </td>
                                
                            </tr>

                      </table>
             </fieldset>
          </td>   
          <td id="tdp" name="tdp"  valign="top">
               
                 <table>
                      <tr><td><center>Se hizo</center></td></tr>
                      <tr><td><center>partograma</center></td></tr>
                      <tr><td><center>si</center></td></tr>
                      <tr><td><center><input type="radio" name="partograma" id="partograma0" value="0"></center></td></tr>
                      <tr><td><center>no</center></td></tr>
                      <tr><td><center><input type="radio" name="partograma" id="partograma1" value="1"></center></td></tr>                 
                 </table>
       
          </td>
     </tr>
     <tr>
         <td colspan="4" id="tdp" name="tdp"  valign="top" >
             <fieldset >
                      <legend><b>Notas</b></legend>
                      <textarea name="descri" id="descri" rows="14" maxlength="299" style="width:100%"></textarea>
             </fieldset>       
         </td>
         <td colspan="3" valign="top" id="tdp" name="tdp"  valign="top">
            <table style="width:100%">
            <tr><td >
             <fieldset >
                      <legend><b>Enfermedades</b>&nbsp;<br><input type="checkbox" id="enf_ninguna" name="enf_ninguna">ninguna </legend>
                          <table id="columnauno" >
			                      <tr><td></td><td><center>si</center></td><td><center>no</center></td><td colspan="3"></td>
									  <td ><center>si</center></td><td><center>no</center></td>
								  </tr>   
			                      <tr>
			                          <td style="text-align:right">HTA Crónica</td>
			                          <td><center><input type="radio" name="enfer_htacronica" id="enfer_htacronica0" value="0"></center></td>
			                          <td><center><input type="radio" name="enfer_htacronica" id="enfer_htacronica1" value="1"></center></td>
			                      
			                          <td style="text-align:right" colspan="3">Infec. Urinaria</td>
			                          <td><center><input type="radio" name="enfer_infecurinaria" id="enfer_infecurinaria0" value="0"></center></td>
			                          <td><center><input type="radio" name="enfer_infecurinaria" id="enfer_infecurinaria1" value="1"></center></td>
			                      </tr> 
 
			                      <tr>
			                          <td style="text-align:right">HTA Gestacional</td>
			                          <td><center><input type="radio" name="enfer_htagestacional" id="enfer_htagestacional0" value="0"></center></td>
			                          <td><center><input type="radio" name="enfer_htagestacional" id="enfer_htagestacional1" value="1"></center></td>
			                          
			                          <td style="text-align:right" colspan="3">Amenaza parto preter</td>
			                          <td><center><input type="radio" name="enfer_amepartopreter" id="enfer_amepartopreter0" value="0"></center></td>
			                          <td><center><input type="radio" name="enfer_amepartopreter" id="enfer_amepartopreter1" value="1"></center></td>
			                      </tr>
			                      <tr>
			                          <td style="text-align:right">Preeclampsia</td>
			                          <td><center><input type="radio" name="enfer_preeclampsia" id="enfer_preeclampsia0" value="0"></center></td>
			                          <td><center><input type="radio" name="enfer_preeclampsia" id="enfer_preeclampsia1" value="1"></center></td>
			                          
			                          <td style="text-align:right" colspan="3">R.C.I.U</td>
			                          <td><center><input type="radio" name="enfer_rciu" id="enfer_rciu0" value="0"></center></td>
			                          <td><center><input type="radio" name="enfer_rciu" id="enfer_rciu1" value="1"></center></td>

			                      </tr>
			                      <tr>
			                          <td style="text-align:right">Eclampsia</td>
			                          <td><center><input type="radio" name="enfer_eclampsia" id="enfer_eclampsia0" value="0"></center></td>
			                          <td><center><input type="radio" name="enfer_eclampsia" id="enfer_eclampsia1" value="1"></center></td>
			                           
			                          <td style="text-align:right" colspan="3">Ruptura prem<br>de membranas</td>
			                          <td><center><input type="radio" name="enfer_rupturaprem" id="enfer_rupturaprem0" value="0"></center></td>
			                          <td><center><input type="radio" name="enfer_rupturaprem" id="enfer_rupturaprem1" value="1"></center></td>
			                      </tr>
			                      <tr>
			                          <td style="text-align:right">Cardiopatía<br>Nefropatía</td>
			                          <td><center><input type="radio" name="enfer_cardiopatia" id="enfer_cardiopatia0" value="0"></center></td>
			                          <td><center><input type="radio" name="enfer_cardiopatia" id="enfer_cardiopatia1" value="1"></center></td>
			                          
			                          <td style="text-align:right" colspan="3">Corio<br>amnionitis</td>
			                          <td><center><input type="radio" name="enfer_corioamnionitis" id="enfer_corioamnionitis0" value="0"></center></td>
			                          <td><center><input type="radio" name="enfer_corioamnionitis" id="enfer_corioamnionitis1" value="1"></center></td>

			                      </tr>
			                     
			                      <tr>
			                          <td style="text-align:right">Anemia</td>
			                          <td><center><input type="radio" name="enfer_anemia" id="enfer_anemia0" value="0"></center></td>
			                          <td><center><input type="radio" name="enfer_anemia" id="enfer_anemia1" value="1"></center></td>
			                          
			                          <td style="text-align:right" colspan="3">otras graves</td>
			                          <td><center><input type="radio" name="enfer_otrasgraves" id="enfer_otrasgraves0" value="0"></center></td>
			                          <td><center><input type="radio" name="enfer_otrasgraves" id="enfer_otrasgraves1" value="1"></center></td>

			                      </tr>
			                       <tr>
			                          <td style="text-align:right">Diabetes</td>
			                          <td><center><input type="checkbox" name="enfer_diabetes0c" id="enfer_diabetes0c"></center></td>
			                          <td><center>I<input type="radio" name="enfer_diabetes" id="enfer_diabetes0" value="0"></center></td>
			                          <td style="width:30px">II<input type="radio" name="enfer_diabetes" id="enfer_diabetes1" value="1"></td>
			                          <td>G<input type="radio" name="enfer_diabetes" id="enfer_diabetes2" value="2"></td>
			                          <td></td>
			                          
			                          
			                      </tr>			
			              </table>     
              </fieldset>   
             
               
             </td>
             <td>
             
                   <fieldset >
                      <legend>Hemorragia</legend>
                          <table id="columnauno"  >
			                      <tr><td></td><td><center>si</center></td>
									  <td style="width: 18px"><center>no</center></td>
									  <td colspan="3"><center>Código</center></td>
								  </tr>   
			                      <tr>
                                      <td style="text-align:right">1<sup>er</sup> Trim</td>
			                          <td><center><input type="radio" name="hemorragias_1_trim" id="hemorragias_1_trim0" value="0"></center></td>
			                          <td><center><input type="radio" name="hemorragias_1_trim" id="hemorragias_1_trim1" value="1"></center></td>
			                          <td colspan="2"><center><input type="text" name="codigo1" id="codigo1" maxlength="4" value=""></center></td>
			                      </tr> 
 
			                       <tr>
                                      <td style="text-align:right">2<sup>er</sup> Trim</td>
			                          <td><center><input type="radio" name="hemorragias_2_trim" id="hemorragias_2_trim0" value="0"></center></td>
			                          <td><center><input type="radio" name="hemorragias_2_trim" id="hemorragias_2_trim1" value="1"></center></td>
			                          <td colspan="2"><center><input type="text" name="codigo2" id="codigo2" maxlength="4" value=""></center></td>

			                      </tr> 
			                      <tr>
                                      <td style="text-align:right">3<sup>er</sup> Trim</td>
			                          <td><center><input type="radio" name="hemorragias_3_trim" id="hemorragias_3_trim0" value="0"></center></td>
			                          <td ><center><input type="radio" name="hemorragias_3_trim" id="hemorragias_3_trim1" value="1"></center></td>
			                          <td colspan="2"><center><input type="text" name="codigo3" id="codigo3" maxlength="4" value=""></center></td>

			                      </tr>
			                      <tr>
			                          <td style="text-align:right">Postparto</td>
			                          <td><center><input type="radio" name="hemorragias_postparto" id="hemorragias_postparto0" value="0"></center></td>
			                          <td><center><input type="radio" name="hemorragias_postparto" id="hemorragias_postparto1" value="1"></center></td>
			                      </tr>
			                      <tr>
			                           <td style="text-align:right">Infeccion<br>puerperal</td>
			                          <td><center><input type="radio" name="hemorragias_infectpuerpe" id="hemorragias_infectpuerpe0" value="0"></center></td>
			                          <td ><center><input type="radio" name="hemorragias_infectpuerpe" id="hemorragias_infectpuerpe1" value="1"></center></td>
			                       </tr>
			                     
			                      <tr>
			                         <td style="text-align:right">Bacteriuria</td>
			                          <td><center><input type="radio" name="hemorragias_bacteriuria" id="hemorragias_bacteriuria0" value="0"></center></td>
			                          <td><center><input type="radio" name="hemorragias_bacteriuria" id="hemorragias_bacteriuria1" value="1"></center></td>
                                                   <td style="width:30px">no se<br>hizo</td> 
			                          <td><input type="radio" name="hemorragias_bacteriuria" id="hemorragias_bacteriuria2" value="2"></td> 
			                      </tr>
	
			              </table>     
              </fieldset>   

             
             </td>
             </tr>
            </table>              
       
        </td>

     </tr>
  </table>
  </form>   
 <%
    //para llenar con f4 son 34 datos
    String sqlff4="select parabo,fecha_ingreso,carne,con_prenatales_tot,hospit_en_embara_dias,corticoides_antenatales,semana_inicio,inicio_tdp_espont,rup_meb_antp_inte_rot,rup_meb_antp_fecha,rup_meb_antp_hora,rup_meb_antp_min,rup_meb_antp_ampm,rup_meb_antp_me37sem,rup_meb_antp_mayig12h,rmatemp38,rup_meb_antp_semanarup,horas_entre_ruptypart,edad_gest_al_parto,edad_gest_al_parto_dias,edad_gest_al_parto_porecofum,presentacion_cefalica,acompañante_tdep,nacimiento_vivo,hora_naci,min_naci,am_pm,fecha_naci,multiple_orden_uno,multiple_orden_dos,terminacion,indicacion_prin_p_o,cod_introduccion,cod_operativo,posicion_parto,episiotomia,desgarros_no,desgarros_grados,ocitocitos_en_alumbramiento,placenta_completa,placenta_retenida,ligadura_cordon,ocitocitos_tdp,antibiot,analgesia_epidural,anest_region,anest_gnral,transfusion,otros,especific_otros,hizo_partograma from parto_aborto where id_materno_perinatal=(select serial from materno_perinatal where idembarazo='"+codemb+"')";
   //out.print("sqlff4: "+sqlff4);  
    ResultSet resuff4=null;
    resuff4=ba.consultas(sqlff4);
    out.print("<script type='text/javascript'>");
    String dato4="8";
    try{
    while(resuff4.next()&&resuff4!=null){
                         // out.print("$('#cigapordia').val('"+resuff3.getString(8)+"');");
                         //  out.print("document.getElementById('sensible"+resuff3.getString(18)+"').checked = true;");
                         //  out.print("$('#gruposanguineo option[value="+resuff3.getString(19)+"]').attr('selected',true);");
                     if(resuff4.getString(1)!=null && resuff4.getString(1).compareTo("null")!=0 && resuff4.getString(1).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(1)+"")!=0){
                          out.print("document.getElementById('parabo"+resuff4.getString(1)+"').checked = true;");
                                                                     }
                     if(resuff4.getString(2)!=null && resuff4.getString(2).compareTo("null")!=0 && resuff4.getString(2).compareTo("")!=0){
                           out.print("$('#pabortofingreso').val('"+resuff4.getString(2)+"');");
                                                                     } 
                     if(resuff4.getString(3)!=null && resuff4.getString(3).compareTo("null")!=0 && resuff4.getString(3).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(3)+"")!=0){
                          out.print("document.getElementById('carnetsino"+resuff4.getString(3)+"').checked = true;");
                                                                     }
                     if(resuff4.getString(4)!=null && resuff4.getString(4).compareTo("null")!=0 && resuff4.getString(4).compareTo("")!=0){
                           out.print("$('#consultaprenata').val('"+resuff4.getString(4)+"');");
                                                                     }  
                     if(resuff4.getString(5)!=null && resuff4.getString(5).compareTo("null")!=0 && resuff4.getString(5).compareTo("")!=0){
                           out.print("$('#hospiembdia').val('"+resuff4.getString(5)+"');");
                                                                     }                        
                     if(resuff4.getString(6)!=null && resuff4.getString(6).compareTo("null")!=0 && resuff4.getString(6).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(6)+"")!=0){
                           out.print("document.getElementById('cantenatales"+resuff4.getString(6)+"').checked = true;");
                                                                     }                          
                     if(resuff4.getString(7)!=null && resuff4.getString(7).compareTo("null")!=0 && resuff4.getString(7).compareTo("")!=0){
                           out.print("$('#contantsemaini').val('"+resuff4.getString(7)+"');");
                                                                     }                     
                     if(resuff4.getString(8)!=null && resuff4.getString(8).compareTo("null")!=0 && resuff4.getString(8).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(8)+"")!=0){
                           out.print("document.getElementById('iniciotdep"+resuff4.getString(8)+"').checked = true;");
                                                                     }                       
                     if(resuff4.getString(9)!=null && resuff4.getString(9).compareTo("null")!=0 && resuff4.getString(9).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(9)+"")!=0){
                           out.print("document.getElementById('rmaintegras"+resuff4.getString(9)+"').checked = true;");
                                                                     }                       
                     if(resuff4.getString(10)!=null && resuff4.getString(10).compareTo("null")!=0 && resuff4.getString(10).compareTo("")!=0){
                           out.print("$('#frummemb').val('"+resuff4.getString(10)+"');");
                                                                     }                              
                     if(resuff4.getString(11)!=null && resuff4.getString(11).compareTo("null")!=0 && resuff4.getString(11).compareTo("")!=0){
                           out.print("$('#hora_rupt option[value="+resuff4.getString(11)+"]').attr('selected',true);");
                                                                     }                     
                     if(resuff4.getString(12)!=null && resuff4.getString(12).compareTo("null")!=0 && resuff4.getString(12).compareTo("")!=0){
                           out.print("$('#min_rupt option[value="+resuff4.getString(12)+"]').attr('selected',true);");
                                                                     }                     
                     if(resuff4.getString(13)!=null && resuff4.getString(13).compareTo("null")!=0 && resuff4.getString(13).compareTo("")!=0){
                           out.print("$('#ampm_rupt option[value="+resuff4.getString(13)+"]').attr('selected',true);");
                                                                     }                         
                     if(resuff4.getString(14)!=null && resuff4.getString(14).compareTo("null")!=0 && resuff4.getString(14).compareTo("")!=0){
                           if(resuff4.getString(14).compareTo("1")==0){out.print("$('#rmasem37').attr('checked','checked');");}
                                                                     }
                     if(resuff4.getString(15)!=null && resuff4.getString(15).compareTo("null")!=0 && resuff4.getString(15).compareTo("")!=0){
                            if(resuff4.getString(15).compareTo("1")==0){out.print("$('#rmahs12').attr('checked','checked');");}
                                                                     }                     
                     if(resuff4.getString(16)!=null && resuff4.getString(16).compareTo("null")!=0 && resuff4.getString(16).compareTo("")!=0){
                            if(resuff4.getString(16).compareTo("1")==0){out.print("$('#rmatemp38').attr('checked','checked');");}
                                                                     }                        
                     if(resuff4.getString(17)!=null && resuff4.getString(17).compareTo("null")!=0 && resuff4.getString(17).compareTo("")!=0){
                           out.print("$('#rmasrum').val('"+resuff4.getString(17)+"');");
                                                                     }  
                     if(resuff4.getString(18)!=null && resuff4.getString(18).compareTo("null")!=0 && resuff4.getString(18).compareTo("")!=0){
                           out.print("$('#hentrerup').val('"+resuff4.getString(18)+"');");
                                                                     }
                     if(resuff4.getString(19)!=null && resuff4.getString(19).compareTo("null")!=0 && resuff4.getString(19).compareTo("")!=0){
                           out.print("$('#edadgestapasem').val('"+resuff4.getString(19)+"');");
                                                                     }
                     if(resuff4.getString(20)!=null && resuff4.getString(20).compareTo("null")!=0 && resuff4.getString(20).compareTo("")!=0){
                           out.print("$('#edadgestapadias').val('"+resuff4.getString(20)+"');");
                                                                     }   
                     if(resuff4.getString(21)!=null && resuff4.getString(21).compareTo("null")!=0 && resuff4.getString(21).compareTo("")!=0  && dato4.compareTo(""+resuff4.getString(21)+"")!=0){
                          out.print("document.getElementById('edadgestfumeco"+resuff4.getString(21)+"').checked = true;");
                                                                     }
                     if(resuff4.getString(22)!=null && resuff4.getString(22).compareTo("null")!=0 && resuff4.getString(22).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(22)+"")!=0){
                           out.print("document.getElementById('presentacioncefa"+resuff4.getString(22)+"').checked = true;");
                                                                     }
                     if(resuff4.getString(23)!=null && resuff4.getString(23).compareTo("null")!=0 && resuff4.getString(23).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(23)+"")!=0){
                           out.print("document.getElementById('acompanante"+resuff4.getString(23)+"').checked = true;");
                                                                     }
                     if(resuff4.getString(24)!=null && resuff4.getString(24).compareTo("null")!=0 && resuff4.getString(24).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(24)+"")!=0){
                           out.print("document.getElementById('nacemuerto"+resuff4.getString(24)+"').checked = true;");
                                                                    }
                     if(resuff4.getString(25)!=null && resuff4.getString(25).compareTo("null")!=0 && resuff4.getString(25).compareTo("")!=0){
                            out.print("$('#hora_nacimiento option[value="+resuff4.getString(25)+"]').attr('selected',true);");
                                                                     }
                     if(resuff4.getString(26)!=null && resuff4.getString(26).compareTo("null")!=0 && resuff4.getString(26).compareTo("")!=0){
                            out.print("$('#min_nacimiento option[value="+resuff4.getString(26)+"]').attr('selected',true);");
                                                                     }
                     if(resuff4.getString(27)!=null && resuff4.getString(27).compareTo("null")!=0 && resuff4.getString(27).compareTo("")!=0){
                            out.print("$('#ampm_nacimiento option[value="+resuff4.getString(27)+"]').attr('selected',true);");
                                                                     }
                     if(resuff4.getString(28)!=null && resuff4.getString(28).compareTo("null")!=0 && resuff4.getString(28).compareTo("")!=0){
                           out.print("$('#nacevm').val('"+resuff4.getString(28)+"');");
                                                                     }
                     if(resuff4.getString(29)!=null && resuff4.getString(29).compareTo("null")!=0 && resuff4.getString(29).compareTo("")!=0){
                           out.print("$('#paabomulti').val('"+resuff4.getString(29)+"');");
                                                                     }
                     if(resuff4.getString(30)!=null && resuff4.getString(30).compareTo("null")!=0 && resuff4.getString(30).compareTo("")!=0){
                           out.print("$('#paabomulti2').val('"+resuff4.getString(30)+"');");
                                                                     }   
                     if(resuff4.getString(31)!=null && resuff4.getString(31).compareTo("null")!=0 && resuff4.getString(31).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(31)+"")!=0){
                           out.print("document.getElementById('terminapar"+resuff4.getString(31)+"').checked = true;");
                                                                     }
                     if(resuff4.getString(32)!=null && resuff4.getString(32).compareTo("null")!=0 && resuff4.getString(32).compareTo("")!=0){
                           out.print("$('#indpriindpar').val('"+resuff4.getString(32)+"');");
                                                                     }
                     if(resuff4.getString(33)!=null && resuff4.getString(33).compareTo("null")!=0 && resuff4.getString(33).compareTo("")!=0){
                           out.print("$('#introduccionparto').val('"+resuff4.getString(33)+"');");
                                                                     }
                     if(resuff4.getString(34)!=null && resuff4.getString(34).compareTo("null")!=0 && resuff4.getString(34).compareTo("")!=0){
                           out.print("$('#operatorioparto').val('"+resuff4.getString(34)+"');");
                                                                     }
                     if(resuff4.getString(35)!=null && resuff4.getString(35).compareTo("null")!=0 && resuff4.getString(35).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(35)+"")!=0){
                            out.print("document.getElementById('posicionparto"+resuff4.getString(35)+"').checked = true;");
                                                               }
                     if(resuff4.getString(36)!=null && resuff4.getString(36).compareTo("null")!=0 && resuff4.getString(36).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(36)+"")!=0){
                             out.print("document.getElementById('episiotomia"+resuff4.getString(36)+"').checked = true;");
                                                               }
                     if(resuff4.getString(37)!=null && resuff4.getString(37).compareTo("null")!=0 && resuff4.getString(37).compareTo("")!=0){
                           if(resuff4.getString(37).compareTo("1")==0){out.print("$('#desgarrosck').attr('checked','checked');");}
                                                                     }
                     if(resuff4.getString(38)!=null && resuff4.getString(38).compareTo("null")!=0 && resuff4.getString(38).compareTo("")!=0){
                           out.print("$('#txtdesgarros').val('"+resuff4.getString(38)+"');");
                                                                     }    
                     if(resuff4.getString(39)!=null && resuff4.getString(39).compareTo("null")!=0 && resuff4.getString(39).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(39)+"")!=0){
                           out.print("document.getElementById('ocitocitos"+resuff4.getString(39)+"').checked = true;");
                                                              }
                     if(resuff4.getString(40)!=null && resuff4.getString(40).compareTo("null")!=0 && resuff4.getString(40).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(40)+"")!=0){
                           out.print("document.getElementById('placentacompleta"+resuff4.getString(40)+"').checked = true;");
                                                                     }
                     if(resuff4.getString(41)!=null && resuff4.getString(41).compareTo("null")!=0 && resuff4.getString(41).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(41)+"")!=0){
                           out.print("document.getElementById('placentaretenida"+resuff4.getString(41)+"').checked = true;");
                                                                     }
                     if(resuff4.getString(42)!=null && resuff4.getString(42).compareTo("null")!=0 && resuff4.getString(42).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(42)+"")!=0){
                          out.print("document.getElementById('ligaduracordon"+resuff4.getString(42)+"').checked = true;");
                                                                     }
                     if(resuff4.getString(43)!=null && resuff4.getString(43).compareTo("null")!=0 && resuff4.getString(43).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(43)+"")!=0){
                         out.print("document.getElementById('medicacionr_ocitocitos"+resuff4.getString(43)+"').checked = true;");
                                                                     }
                     if(resuff4.getString(44)!=null && resuff4.getString(44).compareTo("null")!=0 && resuff4.getString(44).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(44)+"")!=0){
                         out.print("document.getElementById('medicacionr_antibiot"+resuff4.getString(44)+"').checked = true;");
                                                                     }
                     if(resuff4.getString(45)!=null && resuff4.getString(45).compareTo("null")!=0 && resuff4.getString(45).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(45)+"")!=0){
                         out.print("document.getElementById('medicacionr_epidural"+resuff4.getString(45)+"').checked = true;");
                                                                     }
                     if(resuff4.getString(46)!=null && resuff4.getString(46).compareTo("null")!=0 && resuff4.getString(46).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(46)+"")!=0){
                         out.print("document.getElementById('medicacionr_anestregion"+resuff4.getString(46)+"').checked = true;");
                                                                     }
                     if(resuff4.getString(47)!=null && resuff4.getString(47).compareTo("null")!=0 && resuff4.getString(47).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(47)+"")!=0){
                         out.print("document.getElementById('medicacionr_anestgeneral"+resuff4.getString(47)+"').checked = true;");
                                                                     }
                     if(resuff4.getString(48)!=null && resuff4.getString(48).compareTo("null")!=0 && resuff4.getString(48).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(48)+"")!=0){
                         out.print("document.getElementById('medicacionr_transfusion"+resuff4.getString(48)+"').checked = true;");
                                                                     }
                     if(resuff4.getString(49)!=null && resuff4.getString(49).compareTo("null")!=0 && resuff4.getString(49).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(49)+"")!=0){
                         out.print("document.getElementById('medicacionr_otros"+resuff4.getString(49)+"').checked = true;");
                                                                     }
                     if(resuff4.getString(50)!=null && resuff4.getString(50).compareTo("null")!=0 && resuff4.getString(50).compareTo("")!=0){
                           out.print("$('#descri0').val('"+resuff4.getString(50)+"');");
                                                                     }
                     if(resuff4.getString(51)!=null && resuff4.getString(51).compareTo("null")!=0 && resuff4.getString(51).compareTo("")!=0 && dato4.compareTo(""+resuff4.getString(51)+"")!=0){
                           out.print("document.getElementById('partograma"+resuff4.getString(51)+"').checked = true;");
                                                                     }
                                   }
                     }catch(Exception ex){}
    ba.cierraResultado(resuff4);
    //////////////////////////7
    ///////////////////////////////
   String sqlff5="select nota,ninguna,hta_cronica,hta_gestacional,preeclampsia,eclampsia,cardiopatia_nefropatia,anemia,diabetes,diabetes2,infec_urinaria,amen_parto_preterm,rciu,ruptura_prem_memb,corio_anmi,otras_graves,hemorragia_1er_trim,cod_hemorragia_1er_trim,hemorragia_2er_trim,cod_hemorragia_2er_trim,hemorragia_3er_trim,cod_hemorragia_3er_trim,infec_puerperal,bacteriuria,postparto from enfermedades where materno_perinatal=(select serial from materno_perinatal where idembarazo='"+codemb+"')";
    ResultSet resuff5=null;
    resuff5=ba.consultas(sqlff5);
     try{
    while(resuff5.next()&&resuff5!=null){
                         // out.print("$('#cigapordia').val('"+resuff3.getString(8)+"');");
                         //  out.print("document.getElementById('sensible"+resuff3.getString(18)+"').checked = true;");
                         //  out.print("$('#gruposanguineo option[value="+resuff3.getString(19)+"]').attr('selected',true);");
                       if(resuff5.getString(1)!=null && resuff5.getString(1).compareTo("null")!=0 && resuff5.getString(1).compareTo("")!=0){
                           out.print("$('#descri').val('"+resuff5.getString(1)+"');");
                                                                     }
                       if(resuff5.getString(3)!=null && resuff5.getString(3).compareTo("null")!=0 && resuff5.getString(3).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(3)+"")!=0){
                         out.print("document.getElementById('enfer_htacronica"+resuff5.getString(3)+"').checked = true;");
                                                                     }    
                       if(resuff5.getString(4)!=null && resuff5.getString(4).compareTo("null")!=0 && resuff5.getString(4).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(4)+"")!=0){
                         out.print("document.getElementById('enfer_htagestacional"+resuff5.getString(4)+"').checked = true;");
                                                                     }   
                       if(resuff5.getString(5)!=null && resuff5.getString(5).compareTo("null")!=0 && resuff5.getString(5).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(5)+"")!=0){
                         out.print("document.getElementById('enfer_preeclampsia"+resuff5.getString(5)+"').checked = true;");
                                                                     }  
                       if(resuff5.getString(6)!=null && resuff5.getString(6).compareTo("null")!=0 && resuff5.getString(6).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(6)+"")!=0){
                         out.print("document.getElementById('enfer_eclampsia"+resuff5.getString(6)+"').checked = true;");
                                                                     } 
                       if(resuff5.getString(7)!=null && resuff5.getString(7).compareTo("null")!=0 && resuff5.getString(7).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(7)+"")!=0){
                         out.print("document.getElementById('enfer_cardiopatia"+resuff5.getString(7)+"').checked = true;");
                                                                     }   
                       if(resuff5.getString(8)!=null && resuff5.getString(8).compareTo("null")!=0 && resuff5.getString(8).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(8)+"")!=0){
                         out.print("document.getElementById('enfer_anemia"+resuff5.getString(8)+"').checked = true;");
                                                                     } 
                       if(resuff5.getString(9)!=null && resuff5.getString(9).compareTo("null")!=0 && resuff5.getString(9).compareTo("")!=0){
                           if(resuff5.getString(9).compareTo("1")==0){out.print("$('#enfer_diabetes0c').attr('checked','checked');");}
                                                                     }    
                       if(resuff5.getString(10)!=null && resuff5.getString(10).compareTo("null")!=0 && resuff5.getString(10).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(10)+"")!=0){
                         out.print("document.getElementById('enfer_diabetes"+resuff5.getString(10)+"').checked = true;");
                                                                     }   
                       if(resuff5.getString(11)!=null && resuff5.getString(11).compareTo("null")!=0 && resuff5.getString(11).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(11)+"")!=0){
                         out.print("document.getElementById('enfer_infecurinaria"+resuff5.getString(11)+"').checked = true;");
                                                                     }   
                       if(resuff5.getString(12)!=null && resuff5.getString(12).compareTo("null")!=0 && resuff5.getString(12).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(12)+"")!=0){
                         out.print("document.getElementById('enfer_amepartopreter"+resuff5.getString(12)+"').checked = true;");
                                                                     }   
                       if(resuff5.getString(13)!=null && resuff5.getString(13).compareTo("null")!=0 && resuff5.getString(13).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(13)+"")!=0){
                         out.print("document.getElementById('enfer_rciu"+resuff5.getString(13)+"').checked = true;");
                                                                     }   
                       if(resuff5.getString(14)!=null && resuff5.getString(14).compareTo("null")!=0 && resuff5.getString(14).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(14)+"")!=0){
                         out.print("document.getElementById('enfer_rupturaprem"+resuff5.getString(14)+"').checked = true;");
                                                                     }  
                       if(resuff5.getString(15)!=null && resuff5.getString(15).compareTo("null")!=0 && resuff5.getString(15).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(15)+"")!=0){
                         out.print("document.getElementById('enfer_corioamnionitis"+resuff5.getString(15)+"').checked = true;");
                                                                     }  
                       if(resuff5.getString(16)!=null && resuff5.getString(16).compareTo("null")!=0 && resuff5.getString(16).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(16)+"")!=0){
                         out.print("document.getElementById('enfer_otrasgraves"+resuff5.getString(16)+"').checked = true;");
                                                                     }   
                       if(resuff5.getString(17)!=null && resuff5.getString(17).compareTo("null")!=0 && resuff5.getString(17).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(17)+"")!=0){
                         out.print("document.getElementById('hemorragias_1_trim"+resuff5.getString(17)+"').checked = true;");
                                                                     } 
                       if(resuff5.getString(18)!=null && resuff5.getString(18).compareTo("null")!=0 && resuff5.getString(18).compareTo("")!=0){
                           out.print("$('#codigo1').val('"+resuff5.getString(18)+"');");
                                                                     }
                       if(resuff5.getString(19)!=null && resuff5.getString(19).compareTo("null")!=0 && resuff5.getString(19).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(19)+"")!=0){
                         out.print("document.getElementById('hemorragias_2_trim"+resuff5.getString(19)+"').checked = true;");
                                                                     } 
                       if(resuff5.getString(20)!=null && resuff5.getString(20).compareTo("null")!=0 && resuff5.getString(20).compareTo("")!=0){
                           out.print("$('#codigo2').val('"+resuff5.getString(20)+"');");
                                                                     }       
                       if(resuff5.getString(21)!=null && resuff5.getString(21).compareTo("null")!=0 && resuff5.getString(21).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(21)+"")!=0){
                         out.print("document.getElementById('hemorragias_3_trim"+resuff5.getString(21)+"').checked = true;");
                                                                     } 
                       if(resuff5.getString(22)!=null && resuff5.getString(22).compareTo("null")!=0 && resuff5.getString(22).compareTo("")!=0){
                           out.print("$('#codigo3').val('"+resuff5.getString(22)+"');");
                                                                     }
                       
                       if(resuff5.getString(23)!=null && resuff5.getString(23).compareTo("null")!=0 && resuff5.getString(23).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(23)+"")!=0){
                         out.print("document.getElementById('hemorragias_infectpuerpe"+resuff5.getString(23)+"').checked = true;");
                                                                     }   
                       if(resuff5.getString(24)!=null && resuff5.getString(24).compareTo("null")!=0 && resuff5.getString(24).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(24)+"")!=0){
                         out.print("document.getElementById('hemorragias_bacteriuria"+resuff5.getString(24)+"').checked = true;");
                                                                     }   
                       if(resuff5.getString(25)!=null && resuff5.getString(25).compareTo("null")!=0 && resuff5.getString(25).compareTo("")!=0 && dato4.compareTo(""+resuff5.getString(25)+"")!=0){
                         out.print("document.getElementById('hemorragias_postparto"+resuff5.getString(25)+"').checked = true;");
                                                                     }
                       if(resuff5.getString(2)!=null && resuff5.getString(2).compareTo("null")!=0 && resuff5.getString(2).compareTo("")!=0){
                           if(resuff5.getString(2).compareTo("1")==0){out.print("$('#enf_ninguna').attr('checked','checked');enf_ninguna();");}
                                                                     }                       
                                                                 
                                        }
         }
     catch(Exception ex){}
     ba.cierraResultado(resuff5);
   
    
    
                      
     out.print("</script>");
%>                                    
  <br>
  <form name="carne_f6" id="carne_f6" method="post" action="carne_f6.jsp" target="if_carne_f6">
  <table id="tablap" name="tablap" border="1" style="width:100%;">
     <tr>
          <td id="tdp" name="tdp" colspan="3" valign="top"><b>Recien nacido</b><br>.<br>.</td>
          <td id="tdp" name="tdp" rowspan="2"  valign="top" ><fieldset >
                                   <legend>Per. Cefalico</legend>
                                              <input type="text" maxlength="5" id="perimcefalic" name="perimcefalic" style="width:35px"><sub>cm</sub>
                                   </fieldset>
          </td>
          <td id="tdp" name="tdp" rowspan="4"  valign="top"><center>E.G Confiable
                                                       <table>
                                                               <tr>
                                                                   <td><center>sem</center></td>
                                                                   <td><center>dias</center></td>
                                                               </tr>
                                                               <tr>
                                                                   <td><center><input type="text" name="egconfiablesem" id="egconfiablesem" style="width:20px" maxlength="2"></center></td>
                                                                   <td><center><input type="text" name="egconfiabledias" id="egconfiabledias" style="width:10px" maxlength="1"></center></td>
                                                               </tr>
                                                               <tr>
                                                                   <td><center><input type="radio" name="egconfiablefumecoest" id="egconfiablefumecoest0" value="0">FUM</center></td>
                                                                   <td><center><input type="radio" name="egconfiablefumecoest" id="egconfiablefumecoest1" value="1">ECO</center></td>
                                                               </tr>
                                                               <tr>
                                                                   <td colspan="2"><center><input type="radio" name="egconfiablefumecoest" id="egconfiablefumecoest3"  value="3">Estimada</center></td>
                                                               </tr>

                                                       </table>          
                                             </center>          
          </td>
          <td id="tdp" name="tdp" rowspan="4" valign="top">
                                              <table>
                                                     <tr><td colspan="2"><center>Peso<br>E.G.</center></td></tr>
                                                     <tr><td style="text-align:right;">adec</td>
                                                         <td><input type="radio" name="pesoegedec" id="pesoegedec0" value="0"></td>
                                                     </tr>
                                                     <tr><td style="text-align:right;">peq</td>
                                                         <td><input type="radio" name="pesoegedec" id="pesoegedec1" value="1"></td>
                                                     </tr>
                                                     <tr><td style="text-align:right;">gde</td>
                                                         <td><input type="radio" name="pesoegedec" id="pesoegedec2" value="2"></td>
                                                     </tr>
                                              </table>
          </td>  
          <td id="tdp" name="tdp" rowspan="4" valign="top">
                                              <table>
                                                     <tr><td><center>Apgar</center></td></tr>
                                                     <tr><td><fieldset>
                                                              <legend>1<sup>er</sup> min</legend>
                                                                 <center> <input type="text" maxlength="1" name="apgar1er" id="apgar1er" style="width:10px;"></center> 
                                                             </fieldset>
                                                         </td>
                                                     </tr>
                                                     <tr><td><fieldset>
                                                              <legend>5<sup>to</sup> min</legend>
                                                                <center><input type="text" maxlength="2" name="apgar5to" id="apgar5to" style="width:20px;"></center> 
                                                             </fieldset>
                                                         </td>
                                                     </tr>

                                              </table>
          </td> 
           <td id="tdp" name="tdp" rowspan="4">
                    <table>
                       <tr><td><center>Reanimacion</center></td><td><center>no</center></td><td><center>si</center></td></tr>  
                       <tr><td style="text-align:right">Flujo libre O<sub>2</sub></td>
                           <td><center><input type="radio" name="reaniflujolibre" id="reaniflujolibre0" value="0"></center></td>
                           <td><center><input type="radio" name="reaniflujolibre" id="reaniflujolibre1" value="1"></center></td>
                       </tr>  
                       
                       <tr><td style="text-align:right">Ventilacion<br>presion<sup>+</sup></td>
                           <td><center><input type="radio" name="reaniventilacionp" id="reaniventilacionp0" value="0"></center></td>
                           <td><center><input type="radio" name="reaniventilacionp" id="reaniventilacionp1" value="1"></center></td>
                       </tr>    
                        
                       <tr><td style="text-align:right">Intubación OT</td>
                           <td><center><input type="radio" name="reaniintubacionot" id="reaniintubacionot0" value="0"></center></td>
                           <td><center><input type="radio" name="reaniintubacionot" id="reaniintubacionot1" value="1"></center></td>
                       </tr>      
                        
                       <tr><td style="text-align:right">Masaje cardiaco</td>
                           <td><center><input type="radio" name="reanimasajecardi" id="reanimasajecardi0" value="0"></center></td>
                           <td><center><input type="radio" name="reanimasajecardi" id="reanimasajecardi1" value="1"></center></td>
                       </tr>  
                       
                       <tr><td style="text-align:right">Adrenalina</td>
                           <td><center><input type="radio" name="reaniadrenalina" id="reaniadrenalina0" value="0"></center></td>
                           <td><center><input type="radio" name="reaniadrenalina" id="reaniadrenalina1" value="1"></center></td>
                       </tr>           
                    </table>
               <center>ninguna <input type="checkbox" name="reanininguna" id="reanininguna"></center>
           </td>
           <td id="tdp" name="tdp" valign="top" rowspan="2" colspan="2" ><center>
                 <table>
                        <tr><td colspan="2"><center>Fallece en<br>sala de parto</center></td></tr>
                        <tr><td><center>si</center></td><td><center>no</center></td></tr>
                        <tr><td><input type="radio" name="falleceenparto" id="falleceenparto0" value="0"></td>
                            <td><input type="radio" name="falleceenparto" id="falleceenparto1" value="1"></td>
                         </tr>
                 </table></center>
           </td>
           <td id="tdp" name="tdp" valign="bottom" >
                 <table>
                        <tr>
                            <td style="width:50px;">Atendido</td>
                            <td style="width:30px;"><center>Médico</center></td>
                            <td style="width:30px;"><center>Enf</center></td>
                            <td style="width:30px;"><center>Auxil</center></td>
                            <td style="width:30px;"><center>Estud</center></td>
                            <td style="width:30px;"><center>Emp</center></td>
                            <td style="width:30px;"><center>otro</center></td>
                            <td style="width:100px;"><center>Nombre Profesional</center></td>

                        </tr>
                 </table>
           </td>
           

     </tr>  
     <tr>
          <td id="tdp" name="tdp"  rowspan="3">
             <table> 
                  <tr><td colspan="2"><center>Sexo</center></td></tr>
                  <tr><td><center>f</center></td><td><center>m</center></td></tr>
                  <tr>
                      <td><center><input type="radio" name="reciennacidosexo" id="reciennacidosexo0" value="0"> </center></td>
                      <td><center><input type="radio" name="reciennacidosexo" id="reciennacidosexo1" value="1"></center></td>
                  </tr>
                  <tr>
                      <td style="text-align:right">no<br>definido</td>
                      <td><center><input type="radio" name="reciennacidosexo" id="reciennacidosexo2" value="2"></center></td>
                  </tr>

             </table>
          </td> 
            <td id="tdp" name="tdp"  rowspan="3" colspan="2">
             <table> 
                  <tr><td ><center>Peso al nacer</center></td></tr>
                  <tr><td style="height: 29px"><center><input type="text" maxlength="4" name="pesoalnacer" id="pesoalnacer" style="width:40px"><sub>g</sub></center></td></tr>
                  <tr>
                      <td><center>menor de 2500<sub>g</sub><input type="checkbox" name="reciennacidomenos2500" id="reciennacidomenos2500"> </center></td>
                  </tr>
             </table>
          </td> 
            <td id="tdp" name="tdp" valign="top"  >
                 <table>
                        <tr>
                            <td style="width:50px;">Parto</td>
                            <td style="width:30px;"><center><input type="radio" name="partoatendido" id="partoatendido0" value="0"></center></td>
                            <td style="width:30px;"><center><input type="radio" name="partoatendido" id="partoatendido1" value="1"></center></td>
                            <td style="width:30px;"><center><input type="radio" name="partoatendido" id="partoatendido2" value="2"></center></td>
                            <td style="width:30px;"><center><input type="radio" name="partoatendido" id="partoatendido3" value="3"></center></td>
                            <td style="width:30px;"><center><input type="radio" name="partoatendido" id="partoatendido4" value="4"></center></td>
                            <td style="width:30px;"><center><input type="radio" name="partoatendido" id="partoatendido5" value="5"></center></td>
                            <td style="width:60px;"><center><input type="text" name="partoatendidopor" id="partoatendidopor" maxlength="150" style="width:150px"></center></td>

                        </tr>
                 </table>
           </td>         
     </tr>  
     <tr> 
          <td id="tdp" name="tdp" rowspan="2" ><fieldset >
                                   <legend>Talla</legend>
                                              <input type="text" maxlength="4" id="reciennacidotalla" name="reciennacidotalla" style="width:35px"><sub>cm</sub>
                                   </fieldset>
          </td>
           <td id="tdp" name="tdp" valign="top" rowspan="2" colspan="2" >
                 <table>
                        <tr><td colspan="3"><center>Referido</center></td></tr>
                        <tr><td><center>Madre-Hijo</center></td><td><center>Hosp</center></td><td><center>otro<br>hosp</center></td></tr>
                        <tr><td><input type="radio" name="reciennacidoreferido" id="reciennacidoreferido0" value="0"></td>
                            <td><input type="radio" name="reciennacidoreferido" id="reciennacidoreferido1" value="1"></td>
                            <td><input type="radio" name="reciennacidoreferido" id="reciennacidoreferido2" value="2"></td>
                         </tr>
                 </table>
           </td>
             <td id="tdp" name="tdp" valign="top"  >
                 <table>
                        <tr>
                            <td style="width:50px;">Neonato</td>
                            <td style="width:30px;"><center><input type="radio" name="neonatoatendido" id="neonatoatendido0" value="0"></center></td>
                            <td style="width:30px;"><center><input type="radio" name="neonatoatendido" id="neonatoatendido1" value="1"></center></td>
                            <td style="width:30px;"><center><input type="radio" name="neonatoatendido" id="neonatoatendido2" value="2"></center></td>
                            <td style="width:30px;"><center><input type="radio" name="neonatoatendido" id="neonatoatendido3" value="3"></center></td>
                            <td style="width:30px;"><center><input type="radio" name="neonatoatendido" id="neonatoatendido4" value="4"></center></td>
                            <td style="width:30px;"><center><input type="radio" name="neonatoatendido" id="neonatoatendido5" value="5"></center></td>
                            <td style="width:60px;"><center><input type="text" name="neonatoatendidopor" id="neonatoatendidopor" value="" maxlength="150" style="width:150px"></center></td>

                        </tr>
                 </table>
           </td>         

     </tr> 
     <tr>
          <td id="tdp" name="tdp" valign="bottom">
                 <center><b>PUERPERIO</b></center>  
         </td>         
     </tr>
     <tr>
         <td id="tdp" name="tdp" colspan="2" style="height: 158px">
                 <center>Defectos Congénitos 
                 <table>
                       <tr><td rowspan="2"><center><input type="radio" name="defectoscongenitos" id="defectoscongenitos0" value="0">no</center></td>
                           <td><center><input type="radio" name="defectoscongenitos" id="defectoscongenitos1" value="1">menor</center></td></tr>
                       <tr><td><center><input type="radio" name="defectoscongenitos" id="defectoscongenitos2" value="2">mayor</center></td></tr>
                 </table>
                
                 <fieldset style="width:30px;">
                   <legend>codigo</legend>
                   <center><input type="text" name="defectoscongenitoscod" id="defectoscongenitoscod" maxlength="4" style="width:40px"></center>   
                 </fieldset>
                  </center> 
         </td>         
         <td id="tdp" name="tdp" colspan="3" style="height: 158px">
                <fieldset >
                    <legend><b>Enfermedades</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ninguna<input type="checkbox" id="enf_reciennacido" name="enf_reciennacido" onchange="enf_reciennacido()" onclick="enf_reciennacido()"></legend>
                           <table>
                               <tr><td><center>cod</center></td><td></td></tr>
                               <tr><td><input type="text" id="codenfermedadrecienacido" name="codenfermedadrecienacido"  maxlength="4" style="text-align:center;width:40px" ></td><td><input type="text" id="txtenfermedadrecienacido" name="txtenfermedadrecienacido"  maxlength="100"  ></td></tr>
                               <tr><td><input type="text" id="codenfermedadrecienacido2" name="codenfermedadrecienacido2"  maxlength="4" style="text-align:center;width:40px" ></td><td><input type="text" id="txtenfermedadrecienacido2" name="txtenfermedadrecienacido2"  maxlength="100"  ></td></tr>
                               <tr><td><input type="text" id="codenfermedadrecienacido3" name="codenfermedadrecienacido3"  maxlength="4" style="text-align:center;width:40px" ></td><td><input type="text" id="txtenfermedadrecienacido3" name="txtenfermedadrecienacido3"  maxlength="100"  ></td></tr>
                          </table>
              </fieldset>
         </td>     
          <td id="tdp" name="tdp" colspan="5" valign="top" style="height: 158px">
             <fieldset>
                <legend>Tamizacion neonatal normal</legend> 
                      <center>  
                     <table>
                           <tr>
                               <td><center></center></td>
                               <td><center>VDRL</center></td>
                               <td><center>TSH</center></td>
                               <td><center>Hbpatía</center></td>
                               <td><center>Audición</center></td>
                               <td><center>Hiper<br>Bilir</center></td>                               
                               <td><center>Meconio<br>1<sup>er</sup> día</center></td>
                               <td><center>Boca<br>arriba</center></td>
                          </tr>
                          <tr>
                               <td style="text-align:right">si</td>
                               <td><center><input type="radio" name="tamineonatalvdrl" id="tamineonatalvdrl0" value="0"></center></td>
                               <td><center><input type="radio" name="tamineonataltsh" id="tamineonataltsh0" value="0"></center></td>
                               <td><center><input type="radio" name="tamineonatalhbpatia" id="tamineonatalhbpatia0" value="0"></center></td>
                               <td><center><input type="radio" name="tamineonatalaudicion" id="tamineonatalaudicion0" value="0"></center></td>
                               <td><center><input type="radio" name="tamineonatalhiper" id="tamineonatalhiper0" value="0"></center></td>                               
                               <td><center><input type="radio" name="tamineonatalmeconio" id="tamineonatalmeconio0" value="0"></center></td>
                               <td><center><input type="radio" name="tamineonatalbocaarriba" id="tamineonatalbocaarriba0" value="0"></center></td>
                          </tr>
                         <tr>
                               <td style="text-align:right">no</td>
                               <td><center><input type="radio" name="tamineonatalvdrl" id="tamineonatalvdrl1" value="1"></center></td>
                               <td><center><input type="radio" name="tamineonataltsh" id="tamineonataltsh1" value="1"></center></td>
                               <td><center><input type="radio" name="tamineonatalhbpatia" id="tamineonatalhbpatia1" value="1"></center></td>
                               <td><center><input type="radio" name="tamineonatalaudicion" id="tamineonatalaudicion1" value="1"></center></td>
                               <td><center><input type="radio" name="tamineonatalhiper" id="tamineonatalhiper1" value="1"></center></td>                               
                               <td><center><input type="radio" name="tamineonatalmeconio" id="tamineonatalmeconio1" value="1"></center></td>
                               <td><center><input type="radio" name="tamineonatalbocaarriba" id="tamineonatalbocaarriba1" value="1"></center></td>
                          </tr>
                          <tr>
                               <td style="text-align:right">no se<br>hizo</td>
                               <td><center><input type="radio" name="tamineonatalvdrl" id="tamineonatalvdrl2" value="2"></center></td>
                               <td><center><input type="radio" name="tamineonataltsh" id="tamineonataltsh2" value="2"></center></td>
                               <td><center><input type="radio" name="tamineonatalhbpatia" id="tamineonatalhbpatia2" value="2"></center></td>
                               <td><center><input type="radio" name="tamineonatalaudicion" id="tamineonatalaudicion2" value="2"></center></td>
                               <td><center><input type="radio" name="tamineonatalhiper" id="tamineonatalhiper2" value="2"></center></td>                               
                          </tr>
                          <tr>
                               <td style="text-align:right">pend<br>result</td>
                               <td><center><input type="radio" name="tamineonatalvdrl" id="tamineonatalvdrl3" value="3"></center></td>
                               <td><center><input type="radio" name="tamineonataltsh" id="tamineonataltsh3" value="3"></center></td>
                               <td><center><input type="radio" name="tamineonatalhbpatia" id="tamineonatalhbpatia3" value="3"></center></td>
                               <td><center><input type="radio" name="tamineonatalaudicion" id="tamineonatalaudicion3" value="3"></center></td>
                               <td><center><input type="radio" name="tamineonatalhiper" id="tamineonatalhiper3" value="3"></center></td>                               
                          </tr>

                     </table>
                      </center>         
             </fieldset>    
          
          </td>
          <td  id="tdp" name="tdp" >
                 <center>
                <table >
                   <tr>
                       <td id="tdp" name="tdp" ><center>Hora</center></td>
                       <td id="tdp" name="tdp" ><center>Min</center></td>
                       <td id="tdp" name="tdp" ><center>am/pm</center></td>
                       <td id="tdp" name="tdp" ><center>T<sup>°</sup>C</center></td>
                       <td id="tdp" name="tdp" ><center>Pulso</center></td>
                       <td id="tdp" name="tdp" ><center>PA</center></td>
                       <td id="tdp" name="tdp" ><center>invol uter</center></td>
                       <td id="tdp" name="tdp" ><center>loquios</center></td>
                   </tr>
                   <tr>
                       <td id="tdp" name="tdp" ><center>
                                     <select name="hora_puerperio1" id="hora_puerperio1">
                                                  <option value="0">H</option>
                                                  <option value="1">1</option>
                                                  <option value="2">2</option>
                                                  <option value="3">3</option>
                                                  <option value="4">4</option>
                                                  <option value="5">5</option>
                                                  <option value="6">6</option>
                                                  <option value="7">7</option>
                                                  <option value="8">8</option>
                                                  <option value="9">9</option>
                                                  <option value="10">10</option>
                                                  <option value="11">11</option>
                                                  <option value="12">12</option>                                                  
                                       </select>
                           </center>
                       </td>
                       <td id="tdp" name="tdp" >
                           <center>
                                    <select name="min_puerperio1" id="min_puerperio1">
                                        <option value="60">M</option> 
                                          <%
                                          for(int i=0;i<=59;i++){
                                             String min=""+i;
                                             if(i<=9){min="0"+i;} 
                                                out.print("<option value='"+i+"'>"+min+"</option>");                                          
                                             }                                          
                                          %>                                                   
                                       </select> 
                           </center>
                       </td>
                       <td id="tdp" name="tdp" >
                           <center>
                                   <select name="ampm_puerperio1" id="ampm_puerperio1">
                                                  <option value="1">am</option>
                                                  <option value="2">pm</option>                                                 
                                       </select> 

                           </center>
                       </td>
                       <td id="tdp" name="tdp" ><center><input type="text" maxlength="4" style="width:40px;text-align:center" name="puerperiotc1" id="puerperiotc1"></center></td>
                       <td id="tdp" name="tdp" ><center><input type="text" maxlength="3" style="width:30px;text-align:center" name="puerperiopulso1" id="puerperiopulso1"></center></td>
                       <td id="tdp" name="tdp" ><center>
                                   <table>
                                          <tr>
                                              <td><input type="text" maxlength="3" style="width:30px;text-align:center" name="puerperiopa1" id="puerperiopa1"></td>
                                              <td><input type="text" maxlength="3" style="width:30px;text-align:center" name="puerperiopa11" id="puerperiopa11"></td>
                                           </tr>
                                   </table>                                     
                           </center>
                       </td>
                       <td id="tdp" name="tdp" ><center><input type="text" maxlength="4" style="width:40px" name="puerperioinvoluter1" id="puerperioinvoluter1"></center></td>
                       <td id="tdp" name="tdp" ><center><input type="text" maxlength="4" style="width:40px" name="puerperioloquios1" id="puerperioloquios1"></center></td>
                   </tr>
                       <tr>
                       <td id="tdp" name="tdp" ><center>
                                     <select name="hora_puerperio2" id="hora_puerperio2">
                                                  <option value="0">H</option>
                                                  <option value="1">1</option>
                                                  <option value="2">2</option>
                                                  <option value="3">3</option>
                                                  <option value="4">4</option>
                                                  <option value="5">5</option>
                                                  <option value="6">6</option>
                                                  <option value="7">7</option>
                                                  <option value="8">8</option>
                                                  <option value="9">9</option>
                                                  <option value="10">10</option>
                                                  <option value="11">11</option>
                                                  <option value="12">12</option>                                                  
                                       </select>
                           </center>
                       </td>
                       <td id="tdp" name="tdp" >
                           <center>
                                    <select name="min_puerperio2" id="min_puerperio2">
                                                  <option value="60">M</option> 
                                          <%
                                          for(int i=0;i<=59;i++){
                                             String min=""+i;
                                             if(i<=9){min="0"+i;} 
                                                out.print("<option value='"+i+"'>"+min+"</option>");                                          
                                             }                                          
                                          %>                                                  
                                       </select> 
                           </center>
                       </td>
                       <td id="tdp" name="tdp" >
                           <center>
                                   <select name="ampm_puerperio2" id="ampm_puerperio2">
                                                  <option value="1">am</option>
                                                  <option value="2">pm</option>                                                 
                                       </select> 

                           </center>
                       </td>
                       <td id="tdp" name="tdp" ><center><input type="text" maxlength="4" style="width:40px;text-align:center" name="puerperiotc2" id="puerperiotc2"></center></td>
                       <td id="tdp" name="tdp" ><center><input type="text" maxlength="3" style="width:30px;text-align:center" name="puerperiopulso2" id="puerperiopulso2"></center></td>
                       <td id="tdp" name="tdp" ><center>
                                   <table>
                                          <tr>
                                              <td><input type="text" maxlength="3" style="width:30px;text-align:center" name="puerperiopa2" id="puerperiopa2"></td>
                                              <td><input type="text" maxlength="3" style="width:30px;text-align:center" name="puerperiopa22" id="puerperiopa22"></td>
                                           </tr>
                                   </table>                                     
                           </center>
                       </td>
                       <td id="tdp" name="tdp" ><center><input type="text" maxlength="4" style="width:40px" name="puerperioinvoluter2" id="puerperioinvoluter2"></center></td>
                       <td id="tdp" name="tdp" ><center><input type="text" maxlength="4" style="width:40px" name="puerperioloquios2" id="puerperioloquios2"></center></td>
                   </tr>
                      <tr>
                       <td id="tdp" name="tdp" ><center>
                                     <select name="hora_puerperio3" id="hora_puerperio3">
                                                  <option value="0">H</option>
                                                  <option value="1">1</option>
                                                  <option value="2">2</option>
                                                  <option value="3">3</option>
                                                  <option value="4">4</option>
                                                  <option value="5">5</option>
                                                  <option value="6">6</option>
                                                  <option value="7">7</option>
                                                  <option value="8">8</option>
                                                  <option value="9">9</option>
                                                  <option value="10">10</option>
                                                  <option value="11">11</option>
                                                  <option value="12">12</option>                                                  
                                       </select>
                           </center>
                       </td>
                       <td id="tdp" name="tdp" >
                           <center>
                                    <select name="min_puerperio3" id="min_puerperio3">
                                                   <option value="60">M</option> 
                                          <%
                                          for(int i=0;i<=59;i++){
                                             String min=""+i;
                                             if(i<=9){min="0"+i;} 
                                                out.print("<option value='"+i+"'>"+min+"</option>");                                          
                                             }                                          
                                          %>                                                 
                                       </select> 
                           </center>
                       </td>
                       <td id="tdp" name="tdp" >
                           <center>
                                   <select name="ampm_puerperio3" id="ampm_puerperio3">
                                                  <option value="1">am</option>
                                                  <option value="2">pm</option>                                                 
                                       </select> 

                           </center>
                       </td>
                       <td id="tdp" name="tdp" ><center><input type="text" maxlength="4" style="width:40px;text-align:center" name="puerperiotc3" id="puerperiotc3"></center></td>
                       <td id="tdp" name="tdp" ><center><input type="text" maxlength="3" style="width:30px;text-align:center" name="puerperiopulso3" id="puerperiopulso3"></center></td>
                       <td id="tdp" name="tdp" ><center>
                                   <table>
                                          <tr>
                                              <td><input type="text" maxlength="3" style="width:30px;text-align:center" name="puerperiopa3" id="puerperiopa3"></td>
                                              <td><input type="text" maxlength="3" style="width:30px;text-align:center" name="puerperiopa33" id="puerperiopa33"></td>
                                           </tr>
                                   </table>                                     
                           </center>
                       </td>
                       <td id="tdp" name="tdp" ><center><input type="text" maxlength="4" style="width:40px" name="puerperioinvoluter3" id="puerperioinvoluter3"></center></td>
                       <td id="tdp" name="tdp" ><center><input type="text" maxlength="4" style="width:40px" name="puerperioloquios3" id="puerperioloquios3"></center></td>
                   </tr>

                </table>
                </center>
          </td>
     </tr>
     <tr>
         <td id="tdp" name="tdp" valign="top">
             <center>
             <table>
                    <tr><td colspan="2"><center>Vitamina k</center></td></tr>
                    <tr><td><center>si</center></td><td><center><input type="radio" name="rnvitaminak" id="rnvitaminak0" value="0"></center></td></tr>
                    <tr><td><center>no</center></td><td><center><input type="radio" name="rnvitaminak" id="rnvitaminak1" value="1"></center></td></tr>
             </table>
             </center>
        </td> 
            <td id="tdp" name="tdp" valign="top" colspan="3">

           <center>
            <table>
                 <tr><td>GRUPO</td><td>RH</td></tr>
                 <tr>
                     <td>
                         <select name="gruposanguineorn" id="gruposanguineorn">
                               <option value="0"></option>
                               <option value="1">A</option>
                               <option value="2">B</option>
                               <option value="3">O</option>                               
                               <option value="4">AB</option>
                         </select>
                     </td>
                     <td>
                          <select name="rhrn" id="rhrn">
                               <option value="0"></option>
                               <option value="1">+</option>
                               <option value="2">-</option>
                         </select>
                     </td>
                 </tr>
                 
                 <tr><td>Sensibil.</td>
                     <td>
                          <table>
                            <tr><td><center><input type="radio" value="0" id="reciennacidosensible0" name="reciennacidosensible" class="reciennacidosensible"></center></td>
                                <td><center><input type="radio" value="1" id="reciennacidosensible1" name="reciennacidosensible" class="reciennacidosensible"></center></td>
                             </tr>
                            <tr><td><center>no</center></td><td><center>si</center></td></tr>
                          </table>
                     </td>
                 </tr>
            </table>
            </center>
      </td>
      <td  id="tdp" name="tdp" >
             <center>
              <table>
                    <tr><td colspan="2"><center>Profilaxis<br>oftálmica</center></td></tr>  
                    <tr>
                        <td><center>si</center></td>
                        <td><center>no</center></td>
                   </tr>
                    <tr>
                        <td><center><input type="radio" value="0" id="profilaxisoftalmica0" name="profilaxisoftalmica" class="profilaxisoftalmica"></center></td>
                        <td><center><input type="radio" value="1" id="profilaxisoftalmica1" name="profilaxisoftalmica" class="profilaxisoftalmica"></center></td>
                  </tr>
              </table>
             </center> 
      </td>
       <td colspan="4" id="tdp" name="tdp"  valign="top" >
             <fieldset >
                      <legend>Notas</legend>
                      <textarea name="reciennacidonota" id="reciennacidonota" rows="4" maxlength="600" style="width:100%"></textarea>
             </fieldset>       
         </td>
         <td colspan="2" rowspan="2" id="tdp" name="tdp"  valign="top">
                  <table  >
                       <tr>
                            <td id="tdp" name="tdp" ><b>Egreso Materno</b></td>
                            <td id="tdp" name="tdp" rowspan="2" colspan="2">
                              <center>
                                     <table>
                                            <tr>
                                                <td style="text-align:right; height: 22px;">viva</td>
                                                <td style="height: 22px"><input type="radio" name="egresomaternoestado" id="egresomaternoestado0" value="0"> </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right; height: 22px;">viva después de translado</td>
                                                <td style="height: 22px"><input type="radio" name="egresomaternoestado" id="egresomaternoestado1" value="1"> </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right; height: 22px;">fallece</td>
                                                <td style="height: 22px"><input type="radio" name="egresomaternoestado" id="egresomaternoestado2" value="2"> </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right">fallece después de transalado</td>
                                                <td><input type="radio" name="egresomaternoestado" id="egresomaternoestado3" value="3"> </td>
                                            </tr>


                                     </table>
                              </center>
                           </td>
                            <td id="tdp" name="tdp" rowspan="2" colspan="3">
                            <center>
								   <table>
					                      <tr> <td colspan="6"><center>Anticoncepción</center></td> </tr>
					                      <tr> 
					                           <td style="text-align:right"></td>
					                           <td><center></center></td> 
					                           <td style="text-align:right">barrera</td>
					                           <td><center><input type="radio" name="egresoanticoncepcion" id="egresoanticoncepcion0" value="0"></center></td> 
					                           <td style="text-align:right">ligadura<br>tubárica</td>
					                           <td><center><input type="radio" name="egresoanticoncepcion" id="egresoanticoncepcion1" value="1"></center></td> 
					                      </tr>
					                       <tr> 
					                           <td style="text-align:right">no se<br>informa</td>
					                           <td><center><input type="radio" name="egresoanticoncepcion" id="egresoanticoncepcion2" value="2"></center></td> 
					                           <td style="text-align:right">DIU</td>
					                           <td><center><input type="radio" name="egresoanticoncepcion" id="egresoanticoncepcion3" value="3"></center></td> 
					                           <td style="text-align:right">natural</td>
					                           <td><center><input type="radio" name="egresoanticoncepcion" id="egresoanticoncepcion4" value="4"></center></td> 
					                      </tr>
                                           <tr> 
					                           <td style="text-align:right">referida</td>
					                           <td><center><input type="radio" name="egresoanticoncepcion" id="egresoanticoncepcion5" value="5"></center></td> 
					                           <td style="text-align:right">hormonal</td>
					                           <td><center><input type="radio" name="egresoanticoncepcion" id="egresoanticoncepcion6" value="6"></center></td> 
					                           <td style="text-align:right">otro</td>
					                           <td><center><input type="radio" name="egresoanticoncepcion" id="egresoanticoncepcion7" value="7"></center></td> 
					                      </tr>
			                    </table>
		                 </center>
                           </td>
                       </tr>
                       <tr>
                           <td id="tdp" name="tdp" >
                                    <center>
                                    <table>
                                           <tr>
                                                <td><center><input type="text" name="fechaegresopostparto" id="fechaegresopostparto" style="width:70px" readonly></center></td>
                                           </tr>
                                            <tr>
                                                <td><center>Horas egreso<br>postparto</center></td>
                                           </tr>

                                           <tr>
                                                <td><center><input type="text" name="egresopostparto" id="egresopostparto" maxlength="3" style="width:30px" ></center></td>
                                           </tr>
                                    </table>
                                    </center>
                           </td>
                           
                       </tr>
                       <tr>
                           <td id="tdp" name="tdp" >
				                 <table>
				                        <tr><td colspan="3"><center>Antirubeola<br>post parto</center></td></tr>
				                        <tr><td ><center>Vigente</center></td><td><center>no</center></td><td><center>si</center></td></tr>
				                        <tr><td><center><input type="radio" name="egresomaternoantirubeola" id="egresomaternoantirubeola0" value="0"></center></td>
				                            <td><center><input type="radio" name="egresomaternoantirubeola" id="egresomaternoantirubeola1" value="1"></center></td>
				                            <td><center><input type="radio" name="egresomaternoantirubeola" id="egresomaternoantirubeola2" value="2"></center></td>
				                         </tr>
				                 </table>
				           </td>
				           <td id="tdp" name="tdp" >
				                 <center>
				                 <table>
				                        <tr><td colspan="2"><center>Referida<br>post parto</center></td></tr>
				                        <tr><td><center>no</center></td><td><center>si</center></td></tr>
				                        <tr><td><center><input type="radio" name="egresomaternoreferida" id="egresomaternoreferida0" value="0"></center></td>
				                            <td><center><input type="radio" name="egresomaternoreferida" id="egresomaternoreferida1" value="1"></center></td>
				                        </tr>
				                 </table>
				                 </center>
				           </td>
                            <td id="tdp" name="tdp" >
                                 <center>
				                 <table>
				                        <tr><td colspan="2"><center>Hemorragia<br>post parto</center></td></tr>
				                        <tr><td><center>no</center></td>
											<td style="width: 26px"><center>si</center></td></tr>
				                        <tr><td><center><input type="radio" name="egresomaternohemorragia" id="egresomaternohemorragia0" value="0"></center></td>
				                            <td style="width: 26px"><center><input type="radio" name="egresomaternohemorragia" id="egresomaternohemorragia1" value="1"></center></td>
				                        </tr>
				                 </table>
				                 </center>
				           </td>
                            <td id="tdp" name="tdp" >
                                 <center>
				                 <table>
				                        <tr><td colspan="2"><center>infección<br>puerperal</center></td></tr>
				                        <tr><td><center>no</center></td><td style="width: 26px"><center>si</center></td></tr>
				                        <tr><td><center><input type="radio" name="egresomaternoinfeccion" id="egresomaternoinfeccion0" value="0"></center></td>
				                            <td style="width: 26px"><center><input type="radio" name="egresomaternoinfeccion" id="egresomaternoinfeccion1" value="1"></center></td>
				                        </tr>
				                 </table>
				                 </center>
				           </td>
				           <td id="tdp" name="tdp" >
				              <fieldset>
				              <legend>Responsable</legend>
				                     <input type="text" name="egresomaternoresponsable" id="egresomaternoresponsable" maxlength="200">
				              </fieldset>
				           </td>
                       </tr>
                  </table>         
         </td>
         
     </tr> 
     <tr>
        <td colspan="9" id="tdp" name="tdp"  valign="top">
                        <table  >
                       <tr>
                            <td id="tdp" name="tdp" ><b>Egreso RN</b></td>
                            <td id="tdp" name="tdp" rowspan="2" colspan="2">
                              <center>
                                     <table>
                                            <tr>
                                                <td style="text-align:right; height: 22px;">vivo</td>
                                                <td style="height: 22px"><input type="radio" name="egresornestado" id="egresornestado0" value="0"> </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right; height: 22px;">vivo después de translado</td>
                                                <td style="height: 22px"><input type="radio" name="egresornestado" id="egresornestado1" value="1"> </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right; height: 22px;">fallece</td>
                                                <td style="height: 22px"><input type="radio" name="egresornestado" id="egresornestado2" value="2"> </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right">fallece después de<br>transalado</td>
                                                <td><input type="radio" name="egresornestado" id="egresornestado3" value="3"> </td>
                                            </tr>


                                     </table>
                              </center>
                           </td>
                            <td id="tdp" name="tdp" rowspan="2" >
                              <center>
                              <table>
                                    <tr><td colspan="2"><center>Edad<br>días completos</center></td></tr>
                                    <tr><td><center><input type="text" maxlength="3" style="width:20px" id="rnedaddias" name="rnedaddias"></center></td>
                                        <td><center>&lt;1 día<br>
                                            <input type="checkbox" name="edaddiascompletos" id="edaddiascompletos" disabled="disabled" > 
                                            </center>
                                        </td>
                                    </tr>
                              </table>
                              </center>
                            </td>
                             <td id="tdp" name="tdp" rowspan="2" colspan="2">
                              <center>
                                     <table>
                                            <tr>
                                                <td colspan="2"><center>Lactancia</center></td>

                                            </tr>

                                            <tr>
                                                <td style="text-align:right; ">exclusiva</td>
                                                <td style="height: 22px"><input type="radio" name="egresornlactancia" id="egresornlactancia0" value="0"> </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right; ">parcial</td>
                                                <td style="height: 22px"><input type="radio" name="egresornlactancia" id="egresornlactancia1" value="1"> </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right; ">fórmula</td>
                                                <td style="height: 22px"><input type="radio" name="egresornlactancia" id="egresornlactancia2" value="2"> </td>
                                            </tr>
                                     </table>
                              </center>
                           </td>
                           <td id="tdp" name="tdp" rowspan="2" colspan="2">
                              <center>
                                     <table>
                                            <tr>
                                                <td colspan="3"><center>Vacuna</center></td>

                                            </tr>
                                             <tr>
                                                <td style="text-align:right; "></td>
                                                <td >si</td>
                                                <td >no</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right; ">Polio</td>
                                                <td style="height: 22px"><input type="radio" name="egresornpolio" id="egresornpolio0" value="0"> </td>
                                                <td style="height: 22px"><input type="radio" name="egresornpolio" id="egresornpolio1" value="1"> </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right; ">BCG</td>
                                                <td style="height: 22px"><input type="radio" name="egresornbcg" id="egresornbcg0" value="0"> </td>
                                                <td style="height: 22px"><input type="radio" name="egresornbcg" id="egresornbcg1" value="1"> </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:right; ">Hepat. B</td>
                                                <td style="height: 22px"><input type="radio" name="egresornhepatb" id="egresornhepatb0" value="0"> </td>
                                                <td style="height: 22px"><input type="radio" name="egresornhepatb" id="egresornhepatb1" value="1"> </td>
                                            </tr>
                                     </table>
                              </center>
                           </td>
                           <td id="tdp" name="tdp" rowspan="2" colspan="2">
                              <center>
                                     <table>
                                            <tr>
                                                <td ><center>Peso al<br>egreso(g)</center></td>
                                            </tr>
                                            <tr>    
                                                <td ><center><input type="text" name="nrpesoegreso" id="nrpesoegreso" maxlength="4" style="width:40px"></center></td>
                                            </tr>
                                    </table>
                               </center>
                            </td>
                       </tr>    
                            
                       <tr>
                           <td id="tdp" name="tdp" >
                                    <center>
                                    <table>
                                           <tr>
                                                <td><center><input type="text" name="fechaegresoneonato" id="fechaegresoneonato" style="width:70px" readonly></center></td>
                                           </tr>
                                    </table>
                                    </center>
                           </td>
                           
                       </tr>
                       <tr>
				           <td id="tdp" name="tdp" colspan="2" >
				             <fieldset>
				                <legend>NUIP/certific.  nacido vivo </legend>
				                <input type="text" name="rnnuip" id="rnnuip" style="width:100%">
				             </fieldset>
				           </td>
				           <td id="tdp" name="tdp" colspan="3" >
				             <fieldset>
				                <legend>Nombre recien nacido </legend>
				                <input type="text" name="rnnombre" id="rnnombre" style="width:100%">
				             </fieldset>
				           </td>
                           <td id="tdp" name="tdp" colspan="5" >
				             <fieldset>
				                <legend>Responsable </legend>
				                <input type="text" name="rnresponsable" id="rnresponsable" style="width:100%">
				             </fieldset>
				           </td>
                       </tr>
                  </table>        
         </td>    
     </tr>     
  </table> 
  </form>     
  <%

    //////////////////////////7
    ///////////////////////////////
   String sqlff6="select fecha,horas_egreso_postpar,estado_egreso,anticoncepcion,antirubeola_post_parto,referida_post_parto, hemorragia_post_parto, infeccion_puerperal,responsable from egreso_materno where id_materno_perinatal=(select serial from materno_perinatal where idembarazo='"+codemb+"');";
    ResultSet resuff6=null;
   // out.print(sqlff6);
    out.print("<script type='text/javascript'>");
    resuff6=ba.consultas(sqlff6);
     try{
    while(resuff6.next()&&resuff6!=null){
                       if(resuff6.getString(1)!=null && resuff6.getString(1).compareTo("null")!=0 && resuff6.getString(1).compareTo("")!=0){
                           out.print("$('#fechaegresopostparto').val('"+resuff6.getString(1)+"');");
                                                                     }
                       if(resuff6.getString(2)!=null && resuff6.getString(2).compareTo("null")!=0 && resuff6.getString(2).compareTo("")!=0){
                           out.print("$('#egresopostparto').val('"+resuff6.getString(2)+"');");
                                                                     }  
                       if(resuff6.getString(3)!=null && resuff6.getString(3).compareTo("null")!=0 && resuff6.getString(3).compareTo("")!=0 && dato4.compareTo(""+resuff6.getString(3)+"")!=0){
                          out.print("document.getElementById('egresomaternoestado"+resuff6.getString(3)+"').checked = true;");
                                                                     }   
                       if(resuff6.getString(4)!=null && resuff6.getString(4).compareTo("null")!=0 && resuff6.getString(4).compareTo("")!=0 && dato4.compareTo(""+resuff6.getString(4)+"")!=0){
                          out.print("document.getElementById('egresoanticoncepcion"+resuff6.getString(4)+"').checked = true;");
                                                                     }      
                       if(resuff6.getString(5)!=null && resuff6.getString(5).compareTo("null")!=0 && resuff6.getString(5).compareTo("")!=0 && dato4.compareTo(""+resuff6.getString(5)+"")!=0){
                          out.print("document.getElementById('egresomaternoantirubeola"+resuff6.getString(5)+"').checked = true;");
                                                                     }    
                       if(resuff6.getString(6)!=null && resuff6.getString(6).compareTo("null")!=0 && resuff6.getString(6).compareTo("")!=0 && dato4.compareTo(""+resuff6.getString(6)+"")!=0){
                          out.print("document.getElementById('egresomaternoreferida"+resuff6.getString(6)+"').checked = true;");
                                                                     }    
                       if(resuff6.getString(7)!=null && resuff6.getString(7).compareTo("null")!=0 && resuff6.getString(7).compareTo("")!=0 && dato4.compareTo(""+resuff6.getString(7)+"")!=0){
                          out.print("document.getElementById('egresomaternohemorragia"+resuff6.getString(7)+"').checked = true;");
                                                                     }    
                       if(resuff6.getString(8)!=null && resuff6.getString(8).compareTo("null")!=0 && resuff6.getString(8).compareTo("")!=0 && dato4.compareTo(""+resuff6.getString(8)+"")!=0){
                          out.print("document.getElementById('egresomaternoinfeccion"+resuff6.getString(8)+"').checked = true;");
                                                                     }
                       if(resuff6.getString(9)!=null && resuff6.getString(9).compareTo("null")!=0 && resuff6.getString(9).compareTo("")!=0){
                           out.print("$('#egresomaternoresponsable').val('"+resuff6.getString(9)+"');");
                                                                     }    
                      
                                                                     
                                                                
                                        }
         }
     catch(Exception ex){}
     ba.cierraResultado(resuff6);
     out.print("</script>");
     
     
    String sqlff7="select `hora_uno`, `min_uno`, `am_pm_uno`, `tc_uno`, `pulso_uno`, `pa_uno_uno`, `pa_dos_uno`, `invol_uter_uno`, `loquios_uno`, `hora_dos`, `min_dos`, `am_pm_dos`, `tc_dos`, `pulso_dos`, `pa_uno_dos`, `pa_dos_dos`, `invol_uter_dos`, `loquios_dos`, `hora_tres`, `min_tres`, `am_pm_tres`, `tc_tres`, `pulso_tres`, `pa_uno_tres`, `pa_dos_tres`, `invol_uter_tres`, `loquios_tres` from `puerperio` where `id_materno_perinatal`=(select serial from materno_perinatal where idembarazo='"+codemb+"');";
    ResultSet resuff7=null;
    // out.print(sqlff6);
    out.print("<script type='text/javascript'>");
    resuff7=ba.consultas(sqlff7);
     try{
    while(resuff7.next()&&resuff7!=null){
              if(resuff7.getString(1)!=null && resuff7.getString(1).compareTo("null")!=0 && resuff7.getString(1).compareTo("")!=0){
                           out.print("$('#hora_puerperio1 option[value="+resuff7.getString(1)+"]').attr('selected',true);");
                                                                     }
              if(resuff7.getString(2)!=null && resuff7.getString(2).compareTo("null")!=0 && resuff7.getString(2).compareTo("")!=0){
                           out.print("$('#min_puerperio1 option[value="+resuff7.getString(2)+"]').attr('selected',true);");
                                                                     }
              if(resuff7.getString(3)!=null && resuff7.getString(3).compareTo("null")!=0 && resuff7.getString(3).compareTo("")!=0){
                           out.print("$('#ampm_puerperio1 option[value="+resuff7.getString(3)+"]').attr('selected',true);");
                                                                     }  
              if(resuff7.getString(4)!=null && resuff7.getString(4).compareTo("null")!=0 && resuff7.getString(4).compareTo("")!=0){
                           out.print("$('#puerperiotc1').val('"+resuff7.getString(4)+"');");
                                                                     }   
              if(resuff7.getString(5)!=null && resuff7.getString(5).compareTo("null")!=0 && resuff7.getString(5).compareTo("")!=0){
                           out.print("$('#puerperiopulso1').val('"+resuff7.getString(5)+"');");
                                                                     }   
              if(resuff7.getString(6)!=null && resuff7.getString(6).compareTo("null")!=0 && resuff7.getString(6).compareTo("")!=0){
                           out.print("$('#puerperiopa1').val('"+resuff7.getString(6)+"');");
                                                                     }   
              if(resuff7.getString(7)!=null && resuff7.getString(7).compareTo("null")!=0 && resuff7.getString(7).compareTo("")!=0){
                           out.print("$('#puerperiopa11').val('"+resuff7.getString(7)+"');");
                                                                     }   
              if(resuff7.getString(8)!=null && resuff7.getString(8).compareTo("null")!=0 && resuff7.getString(8).compareTo("")!=0){
                           out.print("$('#puerperioinvoluter1').val('"+resuff7.getString(8)+"');");
                                                                     }   
              if(resuff7.getString(9)!=null && resuff7.getString(9).compareTo("null")!=0 && resuff7.getString(9).compareTo("")!=0){
                           out.print("$('#puerperioloquios1').val('"+resuff7.getString(9)+"');");
                                                                     }   
              if(resuff7.getString(10)!=null && resuff7.getString(10).compareTo("null")!=0 && resuff7.getString(10).compareTo("")!=0){
                           out.print("$('#hora_puerperio2 option[value="+resuff7.getString(10)+"]').attr('selected',true);");
                                                                     }
              if(resuff7.getString(11)!=null && resuff7.getString(11).compareTo("null")!=0 && resuff7.getString(11).compareTo("")!=0){
                           out.print("$('#min_puerperio2 option[value="+resuff7.getString(11)+"]').attr('selected',true);");
                                                                     }
              if(resuff7.getString(12)!=null && resuff7.getString(12).compareTo("null")!=0 && resuff7.getString(12).compareTo("")!=0){
                           out.print("$('#ampm_puerperio2 option[value="+resuff7.getString(12)+"]').attr('selected',true);");
                                                                     }   
              if(resuff7.getString(13)!=null && resuff7.getString(13).compareTo("null")!=0 && resuff7.getString(13).compareTo("")!=0){
                           out.print("$('#puerperiotc2').val('"+resuff7.getString(13)+"');");
                                                                     }   
              if(resuff7.getString(14)!=null && resuff7.getString(14).compareTo("null")!=0 && resuff7.getString(14).compareTo("")!=0){
                           out.print("$('#puerperiopulso2').val('"+resuff7.getString(14)+"');");
                                                                     }   
              if(resuff7.getString(15)!=null && resuff7.getString(15).compareTo("null")!=0 && resuff7.getString(15).compareTo("")!=0){
                           out.print("$('#puerperiopa2').val('"+resuff7.getString(15)+"');");
                                                                     }   
              if(resuff7.getString(16)!=null && resuff7.getString(16).compareTo("null")!=0 && resuff7.getString(16).compareTo("")!=0){
                           out.print("$('#puerperiopa22').val('"+resuff7.getString(16)+"');");
                                                                     }   
              if(resuff7.getString(17)!=null && resuff7.getString(17).compareTo("null")!=0 && resuff7.getString(17).compareTo("")!=0){
                           out.print("$('#puerperioinvoluter2').val('"+resuff7.getString(17)+"');");
                                                                     }   
              if(resuff7.getString(18)!=null && resuff7.getString(18).compareTo("null")!=0 && resuff7.getString(18).compareTo("")!=0){
                           out.print("$('#puerperioloquios2').val('"+resuff7.getString(18)+"');");
                                                                     } 
              if(resuff7.getString(19)!=null && resuff7.getString(19).compareTo("null")!=0 && resuff7.getString(19).compareTo("")!=0){
                           out.print("$('#hora_puerperio3 option[value="+resuff7.getString(19)+"]').attr('selected',true);");
                                                                     }
              if(resuff7.getString(20)!=null && resuff7.getString(20).compareTo("null")!=0 && resuff7.getString(20).compareTo("")!=0){
                           out.print("$('#min_puerperio3 option[value="+resuff7.getString(20)+"]').attr('selected',true);");
                                                                     }
              if(resuff7.getString(21)!=null && resuff7.getString(21).compareTo("null")!=0 && resuff7.getString(21).compareTo("")!=0){
                           out.print("$('#ampm_puerperio3 option[value="+resuff7.getString(21)+"]').attr('selected',true);");
                                                                     }   
              if(resuff7.getString(22)!=null && resuff7.getString(22).compareTo("null")!=0 && resuff7.getString(22).compareTo("")!=0){
                           out.print("$('#puerperiotc3').val('"+resuff7.getString(22)+"');");
                                                                     }   
              if(resuff7.getString(23)!=null && resuff7.getString(23).compareTo("null")!=0 && resuff7.getString(23).compareTo("")!=0){
                           out.print("$('#puerperiopulso3').val('"+resuff7.getString(23)+"');");
                                                                     }   
              if(resuff7.getString(24)!=null && resuff7.getString(24).compareTo("null")!=0 && resuff7.getString(24).compareTo("")!=0){
                           out.print("$('#puerperiopa3').val('"+resuff7.getString(24)+"');");
                                                                     }   
              if(resuff7.getString(25)!=null && resuff7.getString(25).compareTo("null")!=0 && resuff7.getString(25).compareTo("")!=0){
                           out.print("$('#puerperiopa33').val('"+resuff7.getString(25)+"');");
                                                                     }   
              if(resuff7.getString(26)!=null && resuff7.getString(26).compareTo("null")!=0 && resuff7.getString(26).compareTo("")!=0){
                           out.print("$('#puerperioinvoluter3').val('"+resuff7.getString(26)+"');");
                                                                     }   
              if(resuff7.getString(27)!=null && resuff7.getString(27).compareTo("null")!=0 && resuff7.getString(27).compareTo("")!=0){
                           out.print("$('#puerperioloquios3').val('"+resuff7.getString(27)+"');");
                                                                     }                                   
                                        }
         }
      
     catch(Exception ex){}
     ba.cierraResultado(resuff7);        
     out.print("</script>");              
     
     String sqlff8="select `sexo`, `peso_al_nacer`, `menor_domilqui`, `pre_cefalico`, `talla`, `eg_confi_sem`, `eg_confi_dias`, `eg_confi_fum_eco_esti`, `peso_eg`, `apgar_primer_min`, `apgar_cinco_min`, `flujo_libre`, `ventilacion`, `intubacion`, `masaje_cardiaco`, `adrenalina`, `ninguna`, `fallece_en_sala_parto`, `referido`, `atendio_parto`, `nom_atendio_parto`, `atendio_neonato`, `nom_atendio_neonato`, `defectos_congenitos`, `cod_defectos_cong`, `enfermedades_ninguna`, `cod_enf_uno`, `nom_enf_uno`, `cod_enf_dos`, `nom_enf_dos`, `cod_enf_tres`, `mon_enf_tres`, `vdrl`, `tsh`, `hbpatia`, `audicion`, `hiper_bilir`, `meconio_primer_dia`, `boca_arriba`, `vitamina_k`, `grupo_sang`, `factor_rh`, `sensibil`, `profilaxis_oftalmica`, `notas` from recien_nacido where materno_perinatal=(select serial from materno_perinatal where idembarazo='"+codemb+"');";
      ResultSet resuff8=null;
    // out.print(sqlff6);
    out.print("<script type='text/javascript'>");
    resuff8=ba.consultas(sqlff8);
     try{
    while(resuff8.next()&&resuff8!=null){
              if(resuff8.getString(1)!=null && resuff8.getString(1).compareTo("null")!=0 && resuff8.getString(1).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(1)+"")!=0){
                          out.print("document.getElementById('reciennacidosexo"+resuff8.getString(1)+"').checked = true;");
                                                                     } 
              if(resuff8.getString(2)!=null && resuff8.getString(2).compareTo("null")!=0 && resuff8.getString(2).compareTo("")!=0){
                           out.print("$('#pesoalnacer').val('"+resuff8.getString(2)+"');");
                           try{
                           float datof=Float.parseFloat(resuff8.getString(2));
                           if(datof<2500){out.print("$('#reciennacidomenos2500').attr('checked','checked');");}
                                }catch(Exception exee){}
                                                                     }   
              if(resuff8.getString(4)!=null && resuff8.getString(4).compareTo("null")!=0 && resuff8.getString(4).compareTo("")!=0){
                           out.print("$('#perimcefalic').val('"+resuff8.getString(4)+"');");
                                                                     }   
              if(resuff8.getString(5)!=null && resuff8.getString(5).compareTo("null")!=0 && resuff8.getString(5).compareTo("")!=0){
                           out.print("$('#reciennacidotalla').val('"+resuff8.getString(5)+"');");
                                                                     }    
              if(resuff8.getString(6)!=null && resuff8.getString(6).compareTo("null")!=0 && resuff8.getString(6).compareTo("")!=0){
                           out.print("$('#egconfiablesem').val('"+resuff8.getString(6)+"');");
                                                                     }    
              if(resuff8.getString(7)!=null && resuff8.getString(7).compareTo("null")!=0 && resuff8.getString(7).compareTo("")!=0){
                           out.print("$('#egconfiabledias').val('"+resuff8.getString(7)+"');");
                                                                     } 
              if(resuff8.getString(8)!=null && resuff8.getString(8).compareTo("null")!=0 && resuff8.getString(8).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(8)+"")!=0){
                          out.print("document.getElementById('egconfiablefumecoest"+resuff8.getString(8)+"').checked = true;");
                                                                     }   
              if(resuff8.getString(9)!=null && resuff8.getString(9).compareTo("null")!=0 && resuff8.getString(9).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(9)+"")!=0){
                          out.print("document.getElementById('pesoegedec"+resuff8.getString(9)+"').checked = true;");
                                                                     }     
              if(resuff8.getString(10)!=null && resuff8.getString(10).compareTo("null")!=0 && resuff8.getString(10).compareTo("")!=0){
                           out.print("$('#apgar1er').val('"+resuff8.getString(10)+"');");
                                                                     }    
              if(resuff8.getString(11)!=null && resuff8.getString(11).compareTo("null")!=0 && resuff8.getString(11).compareTo("")!=0){
                           out.print("$('#apgar5to').val('"+resuff8.getString(11)+"');");
                                                                     }  
              if(resuff8.getString(12)!=null && resuff8.getString(12).compareTo("null")!=0 && resuff8.getString(12).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(12)+"")!=0){
                          out.print("document.getElementById('reaniflujolibre"+resuff8.getString(12)+"').checked = true;");
                                                                     }  
              if(resuff8.getString(13)!=null && resuff8.getString(13).compareTo("null")!=0 && resuff8.getString(13).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(13)+"")!=0){
                          out.print("document.getElementById('reaniventilacionp"+resuff8.getString(13)+"').checked = true;");
                                                                     }  
              if(resuff8.getString(14)!=null && resuff8.getString(14).compareTo("null")!=0 && resuff8.getString(14).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(14)+"")!=0){
                          out.print("document.getElementById('reaniintubacionot"+resuff8.getString(14)+"').checked = true;");
                                                                     }  
              if(resuff8.getString(15)!=null && resuff8.getString(15).compareTo("null")!=0 && resuff8.getString(15).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(15)+"")!=0){
                          out.print("document.getElementById('reanimasajecardi"+resuff8.getString(15)+"').checked = true;");
                                                                     }  
              if(resuff8.getString(16)!=null && resuff8.getString(16).compareTo("null")!=0 && resuff8.getString(16).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(16)+"")!=0){
                          out.print("document.getElementById('reaniadrenalina"+resuff8.getString(16)+"').checked = true;");
                                                                     }      
              if(resuff8.getString(17)!=null && resuff8.getString(17).compareTo("null")!=0 && resuff8.getString(17).compareTo("")!=0){
                           if(resuff8.getString(17).compareTo("1")==0){out.print("$('#reanininguna').attr('checked','checked');reanininguna();");}
                                                                     }   
              if(resuff8.getString(18)!=null && resuff8.getString(18).compareTo("null")!=0 && resuff8.getString(18).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(18)+"")!=0){
                          out.print("document.getElementById('falleceenparto"+resuff8.getString(18)+"').checked = true;");
                                                                     }    
              if(resuff8.getString(19)!=null && resuff8.getString(19).compareTo("null")!=0 && resuff8.getString(19).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(19)+"")!=0){
                          out.print("document.getElementById('reciennacidoreferido"+resuff8.getString(19)+"').checked = true;");
                                                                     }     
              if(resuff8.getString(20)!=null && resuff8.getString(20).compareTo("null")!=0 && resuff8.getString(20).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(20)+"")!=0){
                          out.print("document.getElementById('partoatendido"+resuff8.getString(20)+"').checked = true;");
                                                                     }        
              if(resuff8.getString(21)!=null && resuff8.getString(21).compareTo("null")!=0 && resuff8.getString(21).compareTo("")!=0){
                           out.print("$('#partoatendidopor').val('"+resuff8.getString(21)+"');");
                                                                     }       
              if(resuff8.getString(22)!=null && resuff8.getString(22).compareTo("null")!=0 && resuff8.getString(22).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(22)+"")!=0){
                          out.print("document.getElementById('neonatoatendido"+resuff8.getString(22)+"').checked = true;");
                                                                     }        
              if(resuff8.getString(23)!=null && resuff8.getString(23).compareTo("null")!=0 && resuff8.getString(23).compareTo("")!=0){
                           out.print("$('#neonatoatendidopor').val('"+resuff8.getString(23)+"');");
                                                                     }      
              if(resuff8.getString(24)!=null && resuff8.getString(24).compareTo("null")!=0 && resuff8.getString(24).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(24)+"")!=0){
                          out.print("document.getElementById('defectoscongenitos"+resuff8.getString(24)+"').checked = true;");
                                                                     }        
              if(resuff8.getString(25)!=null && resuff8.getString(25).compareTo("null")!=0 && resuff8.getString(25).compareTo("")!=0){
                           out.print("$('#defectoscongenitoscod').val('"+resuff8.getString(25)+"');");
                                                                     }        
              if(resuff8.getString(27)!=null && resuff8.getString(27).compareTo("null")!=0 && resuff8.getString(27).compareTo("")!=0){
                           out.print("$('#codenfermedadrecienacido').val('"+resuff8.getString(27)+"');");
                                                                     }        
              if(resuff8.getString(28)!=null && resuff8.getString(28).compareTo("null")!=0 && resuff8.getString(28).compareTo("")!=0){
                           out.print("$('#txtenfermedadrecienacido').val('"+resuff8.getString(28)+"');");
                                                                     }        
              if(resuff8.getString(29)!=null && resuff8.getString(29).compareTo("null")!=0 && resuff8.getString(29).compareTo("")!=0){
                           out.print("$('#codenfermedadrecienacido2').val('"+resuff8.getString(29)+"');");
                                                                     }        
              if(resuff8.getString(30)!=null && resuff8.getString(30).compareTo("null")!=0 && resuff8.getString(30).compareTo("")!=0){
                           out.print("$('#txtenfermedadrecienacido2').val('"+resuff8.getString(30)+"');");
                                                                     }        
              if(resuff8.getString(31)!=null && resuff8.getString(31).compareTo("null")!=0 && resuff8.getString(31).compareTo("")!=0){
                           out.print("$('#codenfermedadrecienacido3').val('"+resuff8.getString(31)+"');");
                                                                     }        
              if(resuff8.getString(32)!=null && resuff8.getString(32).compareTo("null")!=0 && resuff8.getString(32).compareTo("")!=0){
                           out.print("$('#txtenfermedadrecienacido3').val('"+resuff8.getString(32)+"');");
                                                                     }    
              if(resuff8.getString(26)!=null && resuff8.getString(26).compareTo("null")!=0 && resuff8.getString(26).compareTo("")!=0){
                           if(resuff8.getString(26).compareTo("1")==0){out.print("$('#enf_reciennacido').attr('checked','checked');enf_reciennacido();");}
                                                                     } 
              if(resuff8.getString(33)!=null && resuff8.getString(33).compareTo("null")!=0 && resuff8.getString(33).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(33)+"")!=0){
                          out.print("document.getElementById('tamineonatalvdrl"+resuff8.getString(33)+"').checked = true;");
                                                                     }     
              if(resuff8.getString(34)!=null && resuff8.getString(34).compareTo("null")!=0 && resuff8.getString(34).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(34)+"")!=0){
                          out.print("document.getElementById('tamineonataltsh"+resuff8.getString(34)+"').checked = true;");
                                                                     }   
              if(resuff8.getString(35)!=null && resuff8.getString(35).compareTo("null")!=0 && resuff8.getString(35).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(35)+"")!=0){
                          out.print("document.getElementById('tamineonatalhbpatia"+resuff8.getString(35)+"').checked = true;");
                                                                     }   
              if(resuff8.getString(36)!=null && resuff8.getString(36).compareTo("null")!=0 && resuff8.getString(36).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(36)+"")!=0){
                          out.print("document.getElementById('tamineonatalaudicion"+resuff8.getString(36)+"').checked = true;");
                                                                     }   
              if(resuff8.getString(37)!=null && resuff8.getString(37).compareTo("null")!=0 && resuff8.getString(37).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(37)+"")!=0){
                          out.print("document.getElementById('tamineonatalhiper"+resuff8.getString(37)+"').checked = true;");
                                                                     }   
              if(resuff8.getString(38)!=null && resuff8.getString(38).compareTo("null")!=0 && resuff8.getString(38).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(38)+"")!=0){
                          out.print("document.getElementById('tamineonatalmeconio"+resuff8.getString(38)+"').checked = true;");
                                                                     }   
              if(resuff8.getString(39)!=null && resuff8.getString(39).compareTo("null")!=0 && resuff8.getString(39).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(39)+"")!=0){
                          out.print("document.getElementById('tamineonatalbocaarriba"+resuff8.getString(39)+"').checked = true;");
                                                                     }   
              if(resuff8.getString(40)!=null && resuff8.getString(40).compareTo("null")!=0 && resuff8.getString(40).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(40)+"")!=0){
                          out.print("document.getElementById('rnvitaminak"+resuff8.getString(40)+"').checked = true;");
                                                                     }  
               if(resuff8.getString(41)!=null && resuff8.getString(41).compareTo("null")!=0 && resuff8.getString(41).compareTo("")!=0){
                           out.print("$('#gruposanguineorn option[value="+resuff8.getString(41)+"]').attr('selected',true);");
                                                                     }    
               if(resuff8.getString(42)!=null && resuff8.getString(42).compareTo("null")!=0 && resuff8.getString(42).compareTo("")!=0){
                           out.print("$('#rhrn option[value="+resuff8.getString(42)+"]').attr('selected',true);");
                                                                     }   
              if(resuff8.getString(43)!=null && resuff8.getString(43).compareTo("null")!=0 && resuff8.getString(43).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(43)+"")!=0){
                          out.print("document.getElementById('reciennacidosensible"+resuff8.getString(43)+"').checked = true;");
                                                                     }   
              if(resuff8.getString(44)!=null && resuff8.getString(44).compareTo("null")!=0 && resuff8.getString(44).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(44)+"")!=0){
                          out.print("document.getElementById('profilaxisoftalmica"+resuff8.getString(44)+"').checked = true;");
                                                                     }      
              if(resuff8.getString(45)!=null && resuff8.getString(45).compareTo("null")!=0 && resuff8.getString(45).compareTo("")!=0){
                           out.print("$('#reciennacidonota').val('"+resuff8.getString(45)+"');");
                                                                     }    
              }
         }
      
     catch(Exception ex){}
     ba.cierraResultado(resuff8);     
     out.print("</script>");
     
     
     String sqlff9="select `fecha`, `estado_egreso`, `edad_dias`, `lactancia`, `vacuna_polio`, `vacuna_bcg`, `vacuna_hepat_b`, `pero_al_egreso`, `nuip`, `nombre_recien_nacido`, `responsable` from egreso_rn where id_materno_perinatal=(select serial from materno_perinatal where idembarazo='"+codemb+"');";
      ResultSet resuff9=null;
    // out.print(sqlff6);
    out.print("<script type='text/javascript'>");
    resuff9=ba.consultas(sqlff9);
     try{
    while(resuff9.next()&&resuff9!=null){  
                
              if(resuff9.getString(1)!=null && resuff9.getString(1).compareTo("null")!=0 && resuff9.getString(1).compareTo("")!=0){
                           out.print("$('#fechaegresoneonato').val('"+resuff9.getString(1)+"');");
                                                                     }      
              if(resuff9.getString(2)!=null && resuff9.getString(2).compareTo("null")!=0 && resuff9.getString(2).compareTo("")!=0 && dato4.compareTo(""+resuff9.getString(2)+"")!=0){
                          out.print("document.getElementById('egresornestado"+resuff9.getString(2)+"').checked = true;");
                                                                     } 
              if(resuff9.getString(3)!=null && resuff9.getString(3).compareTo("null")!=0 && resuff9.getString(3).compareTo("")!=0){
                           out.print("$('#rnedaddias').val('"+resuff9.getString(3)+"');");
                           float dd=Float.parseFloat(""+resuff9.getString(3)+"");
                           if(dd<1){out.print("$('#edaddiascompletos').attr('checked','checked');");}
                                                                     }      
              if(resuff9.getString(4)!=null && resuff9.getString(4).compareTo("null")!=0 && resuff9.getString(4).compareTo("")!=0 && dato4.compareTo(""+resuff9.getString(4)+"")!=0){
                          out.print("document.getElementById('egresornlactancia"+resuff9.getString(4)+"').checked = true;");
                                                                     }      
              if(resuff9.getString(5)!=null && resuff9.getString(5).compareTo("null")!=0 && resuff9.getString(5).compareTo("")!=0 && dato4.compareTo(""+resuff9.getString(5)+"")!=0){
                          out.print("document.getElementById('egresornpolio"+resuff9.getString(5)+"').checked = true;");
                                                                     }      
              if(resuff9.getString(6)!=null && resuff9.getString(6).compareTo("null")!=0 && resuff9.getString(6).compareTo("")!=0 && dato4.compareTo(""+resuff9.getString(6)+"")!=0){
                          out.print("document.getElementById('egresornbcg"+resuff9.getString(6)+"').checked = true;");
                                                                     }      
              if(resuff9.getString(7)!=null && resuff9.getString(7).compareTo("null")!=0 && resuff9.getString(7).compareTo("")!=0 && dato4.compareTo(""+resuff9.getString(7)+"")!=0){
                          out.print("document.getElementById('egresornhepatb"+resuff9.getString(7)+"').checked = true;");
                                                                     }  
              if(resuff9.getString(8)!=null && resuff9.getString(8).compareTo("null")!=0 && resuff9.getString(1).compareTo("")!=0){
                           out.print("$('#nrpesoegreso').val('"+resuff9.getString(8)+"');");
                                                                     }  
              if(resuff9.getString(9)!=null && resuff9.getString(9).compareTo("null")!=0 && resuff9.getString(9).compareTo("")!=0){
                           out.print("$('#rnnuip').val('"+resuff9.getString(9)+"');");
                                                                     }  
              if(resuff9.getString(10)!=null && resuff9.getString(10).compareTo("null")!=0 && resuff9.getString(10).compareTo("")!=0){
                           out.print("$('#rnnombre').val('"+resuff9.getString(10)+"');");
                                                                     }  
              if(resuff9.getString(11)!=null && resuff9.getString(11).compareTo("null")!=0 && resuff9.getString(11).compareTo("")!=0){
                           out.print("$('#rnresponsable').val('"+resuff9.getString(11)+"');");
                                                                     }  
              /*
 *               //////////////////////////radio
               if(resuff8.getString(5)!=null && resuff8.getString(5).compareTo("null")!=0 && resuff8.getString(5).compareTo("")!=0 && dato4.compareTo(""+resuff8.getString(5)+"")!=0){
                          out.print("document.getElementById('egresomaternoantirubeola"+resuff8.getString(5)+"').checked = true;");
                                                                     } 
 *                //////////////////////////check
              if(resuff8.getString(9)!=null && resuff8.getString(9).compareTo("null")!=0 && resuff8.getString(9).compareTo("")!=0){
                           if(resuff8.getString(9).compareTo("1")==0){out.print("$('#enfer_diabetes0c').attr('checked','checked');");}
                                                                     }
                //////////////////////////select
               if(resuff8.getString(12)!=null && resuff8.getString(12).compareTo("null")!=0 && resuff8.getString(12).compareTo("")!=0){
                           out.print("$('#ampm_puerperio2 option[value="+resuff8.getString(12)+"]').attr('selected',true);");
                                                                     } */                                      
                                        }
         }
      
     catch(Exception ex){}
     ba.cierraResultado(resuff9);     
     out.print("</script>");
%>   </div>  <br>
      <center><input type="button" onclick="finaliza_emb();" value="  Finalizar  " name="aceptar" id="aceptar"></center><br> 

  <br>
  <div name="borra_cont" id="borra_cont" style="display:none"></div>
  <iframe name="if_carne_f1" id="if_carne_f1" style="display:none"></iframe>
  <iframe name="if_carne_f2" id="if_carne_f2" style="display:none"></iframe>
  <iframe name="if_carne_f3" id="if_carne_f3" style="display:none"></iframe>
  <iframe name="if_carne_f4" id="if_carne_f4" style="display:none"></iframe>
  <iframe name="if_carne_f5" id="if_carne_f5" style="display:none"></iframe>
  <iframe name="if_carne_f6" id="if_carne_f6" style="display:none"></iframe>
  <% ba.cerrar(); %>
</body>

</html>

