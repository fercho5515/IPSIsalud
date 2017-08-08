<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html >

<head>
<meta charset="utf-8" >
       
<script type="text/javascript" language="javascript">
    
    var caja1="";
    var caja2="";
    var anchoPantalla=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
        anchoPantalla=(anchoPantalla/2);
        
      $(function() {
     $( "#dilog_cie10" ).dialog({
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


 function abreDialogConsu_evol(dato1,dato2){
                               var bb=document.getElementById("display_consu_evol");
                               bb.style.display="none";
                                     
                               caja1=dato1;
                               caja2=dato2;
                               jQuery("#listcie10").jqGrid('setCaption',"CIE 10").trigger('reloadGrid');
                               $("#dilog_cie10").dialog("open");
                                 }
    function pasadatoConsu(nom,nom2,dato){
                      
                                     document.getElementById("diagnosticoconsu_evol").value=nom;
                                     document.getElementById("diagnosticoconsu2_evol").value=nom2;
                                     var bb=document.getElementById("display_consu_evol");
                                     bb.style.display="none";
                                    
                              }
   $(document).ready(
 function(){
	  $("#diagnosticoconsu_evol").keyup(
			      function(){
					var searchbox = $(this).val();
					var dataString = 'searchword='+ searchbox;
					
                                        if(searchbox==''){
					             var bb=document.getElementById("display_consu_evol");
                       			             bb.style.display="none";
                                                     document.getElementById("diagnosticoconsu2_evol").value='';
							  }
					else{
					    $.ajax({
					    type: "POST",
					    url: "auto_completa_cie10.jsp?dato=p",
					    data: dataString,
					    cache: false,
					    success: function(html){ $("#display_consu_evol").html(html).show();
                                                                      var canti=document.getElementById("cantidaddp").value;
                                                                       if(canti==1){document.getElementById("diagnosticoconsu2_evol").value=""+document.getElementById("nomcie10p").value;
                                                                                    document.getElementById("diagnosticoconsu_evol").value=""+document.getElementById("codicie10p").value;
                                                                                    var bb=document.getElementById("display_consu_evol");
                                                                                    bb.style.display="none";
                                                                                   }
                                                                        else{document.getElementById("diagnosticoconsu2_evol").value='';}
                                                                    }
			                     });
                                            
			                  }
			                return false;    
			                    }
                                         
	 	             );
 } );







    $('#form_parte').submit(function() {
                            var nom = document.getElementById("afectacion").value; 
                           if(document.getElementById("parte").value=="") { 
                                                      alert('La parte es obligatoria');
                                                      return false;  
                                                                      } 
                           else if( nom == null || nom.length == 0 || /^\s+$/.test(nom) ) {
                                                      alert('La afectación es obligatoria');
                                                      return false;  
                                                                      }   
                         
                           if( nom.length >= 490 ) {
                                                      alert('La afectación tiene como maximo 490 caracteres');
                                                       return false;  
                                                                      }                                        
                               nom=nom.replace(/\r\n|\n|\r/g, " ");
                               document.getElementById("afectacion").value=nom;
                    // Enviamos el formulario usando AJAX
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#resu').html(data);
                                  //actualiza la tabla
                                  jQuery("#list19").jqGrid('setCaption',"AFECTACIONES ").trigger('reloadGrid');	
                                  $("#div_parte").load("carga_div_parte.jsp");
                                  document.getElementById("afectacion").value="";
                              }                             
                          })
                     
                          return false;
                      });  
 ///////////////////////////
 /////////////////////////////////////////
 /////////////////////////////////////////////
    $('#form_diag').submit(function() {
                            var nom = document.getElementById("diagnosticoconsu2_evol").value; 
                           if( nom == null || nom.length == 0 || /^\s+$/.test(nom) ) {
                                                      alert('El diagnostico es obligatorio');
                                                      return false;  
                                                                      }   
                            var nom2 = document.getElementById("observaciones_evol_consu").value; 
                      /*     if( nom2 == null || nom2.length == 0 || /^\s+$/.test(nom2) ) {
                                                      alert('La observación es obligatorioa');
                                                      return false;  
                                                                      } */
                           if( nom2.length >= 399 ) {
                                                      alert('La observación tiene como maximo 390 caracteres');
                                                       return false;  
                                                                      }  
                              nom2=nom2.replace(/\r\n|\n|\r/g, " ");
                              document.getElementById("observaciones_evol_consu").value=nom2;
                           var ids = jQuery("#listdiag_consu_evol").jqGrid('getDataIDs');
                        
                          if(ids.length==4){alert('Solo se permite un diagnostico principal y tres relacionados');
                                                       return false; }
                    // Enviamos el formulario usando AJAX
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#resu').html(data);
                                  //actualiza la tabla
                                  jQuery("#listdiag_consu_evol").jqGrid('setCaption',"Diagnosticos ").trigger('reloadGrid');	
                                  document.getElementById("observaciones_evol_consu").value="";
                                  document.getElementById("diagnosticoconsu2_evol").value="";
                                  document.getElementById("diagnosticoconsu_evol").value="";
                                  $("#tipodiagnostico_consu_evol").val("");
                                  $("#causaexterna_consu_evol").val("");
                               }                             
                          })
                     
                          return false;
                      });          
 $(document).ready(function(){
 
        jQuery("#list19").jqGrid({
   	url:'carga_afectaciones_consulta.jsp?q=2',
	datatype: "json",
   	colNames:['id_parte','Parte','Afectación'],
   	colModel:[
   		{name:'e.id_parte_cuerpo',index:'e.id_parte_cuerpo',hidden:true,width:30,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'p.descripcion',index:'p.descripcion', width:50,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'e.dolencia',index:'e.dolencia', width:250,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	       ],
   	rowNum:15,
   	rowList:[15,30,45],
   	pager: '#pager19',
   	sortname: 'e.id_parte',
        viewrecords: true,
        sortorder: "desc",
        autowidth: true, 
        rownumbers: false,
        editurl: 'borra_afectaciones_consulta.jsp',
	caption: "AFECTACIONES",
	ondblClickRow: function(cedula_nit){
            
                                         }	
});
jQuery("#list19").jqGrid('navGrid','#pager19',{add:false,edit:false,del:true,search:true,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() { } }, //opciones add
							{top:250,left:anchoPantalla,width:420,onClose:function() { $("#div_parte").load("carga_div_parte.jsp");}}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 								);
                                                                 
///////////////////////////////////////////7
//////////////////////////////////////////////////7
////////////////////////////////////////////////7
      
    jQuery("#listcie10").jqGrid({
   	url:'carga_cie10.jsp?q=2',
	datatype: "json",
   	colNames:['id','Codigo','Descripción','grupo'],
   	colModel:[
                {name:'id',index:'id',hidden:true,width:0,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'id_subcie10',index:'id_subcie10', width:60,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcion',index:'d2', width:700,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripciong',index:'d1',hidden:true,width:1,editable: false,required : true,editoptions:{maxlength: 63}},
   	       ],
   	rowNum:11,
   	rowList:[10,20,30,40,400],
   	pager: '#pagercie10',
   	sortname: 's.id_subcie10',
        viewrecords: true,
        sortorder: "asc",
        height: 339,
        width:775,
        shrinkToFit: false,//columnas tamaño dato
        grouping:true,         
        groupingView : {
   		groupField : ['descripciong']
   	},   
        rownumbers: false,
        editurl: 'editaCli.php',
	caption: "CIE 10",
	ondblClickRow: function(id){
                                    var ret = jQuery("#listcie10").jqGrid('getRowData',id);
                                    //alert(""+ret.id_subcie10+" "+ret.descripcion+"");   
                                    document.getElementById(""+caja1+"").value=""+ret.id_subcie10;
                                    document.getElementById(""+caja2+"").value=""+ret.descripcion;
                                    $("#dilog_cie10").dialog( "close" );
                                  }	
});

  <%    int valida=Integer.parseInt((String)session.getAttribute("valida"));
        if(valida==1){
            %>
          jQuery("#listcie10").jqGrid('navGrid','#pagercie10',{add:false,edit:false,del:false,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);
               <%
        out.print("jQuery('#listcie10').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});");
        session.setAttribute("valida","2");
        }
  %>                           


 });
$(document).ready(function(){      
 var anchoPantallaaconsu=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
    jQuery("#listdiag_consu_evol").jqGrid({
   	url:'carga_diagcie10.jsp?q=2',
	datatype: "json",
   	colNames:['id','Tipo','Cod','Diagnostico','Tipo Diagnostico','Causa Externa','Observaciones'],
   	colModel:[
                {name:'id',index:'id',hidden:true,width:0,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'id_subcie10',index:'id_subcie10', width:((anchoPantallaaconsu*6)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'id_subcie10',index:'id_subcie10', width:((anchoPantallaaconsu*4)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcion',index:'d2', width:((anchoPantallaaconsu*34)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcitong',index:'drr1',width:((anchoPantallaaconsu*12)/100),editable: false,required : true,editoptions:{maxlength: 63}},
   	        {name:'descripcditong',index:'ddrr1',width:((anchoPantallaaconsu*15)/100),editable: false,required : true,editoptions:{maxlength: 63}},
   	        {name:'descriptciong',index:'dr1',width:((anchoPantallaaconsu*22)/100),editable: false,required : true,editoptions:{maxlength: 63}},
   	          ],
   	rowNum:11,
   	rowList:[10,20,30,40,400],
   	pager: '#pagerdiag_consu_evol',
   	sortname: 'imp.control',
        viewrecords: true,
        sortorder: "asc",
        height: 92,
        width:(anchoPantallaaconsu-40),
        shrinkToFit: false,//columnas tamaño dato
        rownumbers: false,
    /*  grouping:true,         
        groupingView : {
   		groupField : ['descripciong']
   	}, */  
        rownumbers: false,
        editurl: 'quitadiag.jsp',
	caption: "Diagnosticos",
	ondblClickRow: function(id){   }	
});

jQuery("#listdiag_consu_evol").jqGrid('navGrid','#pagerdiag_consu_evol',{add:false,edit:false,del:false,search:false,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() { } }, //opciones add
							{top:250,left:anchoPantalla,width:420}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{top:250,left:anchoPantalla,width:420} //para el view
 								);                    

 jQuery("#listdiag_consu_evol").jqGrid('navButtonAdd','#pagerdiag_consu_evol',
     {
      caption:"",
      buttonicon:"ui-icon-trash",
      onClickButton:function(){ 
                                var id = jQuery("#listdiag_consu_evol").jqGrid('getGridParam','selrow');
                                if (id)	{
                                        var ret = jQuery("#listdiag_consu_evol").jqGrid('getRowData',id);
                                        
                                        apprise("¿Esta seguro de eliminar el diagnostico seleccionado: "+ret.id_subcie10+" ?", {'verify':true}, function(opcion) {
                                            if(opcion) {  $("#qcie_10").val(""+ret.id_subcie10+"");
                                                          document.quitadiag.submit();  
                                                          setTimeout ('recar()', 500);                                                          
                                                    }
                                           });
                                }else { alert("Selecciona la fila a eliminar");}
                                
                              },
      position:"last",
      title:"Quitar diagnostico",
      cursor: "pointer"});
 });
function recar(){jQuery("#listdiag_consu_evol").jqGrid('setCaption',"Diagnosticos ").trigger('reloadGrid'); }
/*
 *jQuery('#talla').keyup(function () {
  this.value = this.value.replace(/[^0-9]/g,''); 
});
     */
jQuery('#talla').keyup(function () {
      
  if(isNaN(this.value)){this.value = this.value.replace(/[^0-9]/g,''); }
  else{
      if(this.value>=999){alert("talla no puede ser mayor a 998 ");this.value="";}
      else{
     // alert("pe: "+pe+" leng pe:"+$('#peso').length+" ta: "+ta+" leng ta:"+$('#talla').length);
      if($('#peso').val().length > 0 && $('#talla').val().length > 0) {
                    var pe=$('#peso').val();
                    var ta=$('#talla').val();
                    var imc=pe/((ta/100)*(ta/100));
                    var est="";
                     if(imc < 16){   est="Delgadez severa";}
                    else if(imc < 16.99){est="Delgadez moderada";}
                    else if(imc < 18.49){est="Delgadez no muy pronunciada";}
                    else if(imc < 24.99){est="Normal";}
                    else if(imc < 29.99){est="Preobeso";}
                    else if(imc < 34.99){est="Obeso tipo I";}
                    else if(imc < 39.99){est="Obeso tipo II";}
                    else if(imc >= 40){est="Obeso tipo III";}
                    
                    $('#estadonutricional').val(""+est+"");
                    $('#icm').val(""+imc+"");
                    
                                         }
                   else{$('#estadonutricional').val("");
                        $('#icm').val("");}
      }
    }
});

jQuery('#peso').keyup(function () {
    
  if(isNaN(this.value)){this.value = this.value.replace(/[^0-9]/g,''); }
  else{
      if(this.value>=999){alert("peso no puede ser mayor a 998 ");this.value="";}
      else{
     // alert("pe: "+pe+" leng pe:"+$('#peso').length+" ta: "+ta+" leng ta:"+$('#talla').length);
      if($('#peso').val().length > 0 && $('#talla').val().length > 0) {
                    var pe=$('#peso').val();
                    var ta=$('#talla').val();
                    var imc=pe/((ta/100)*(ta/100));
                    var est="";
                     if(imc < 16){   est="Delgadez severa";}
                    else if(imc < 16.99){est="Delgadez moderada";}
                    else if(imc < 18.49){est="Delgadez no muy pronunciada";}
                    else if(imc < 24.99){est="Normal";}
                    else if(imc < 29.99){est="Preobeso";}
                    else if(imc < 34.99){est="Obeso tipo I";}
                    else if(imc < 39.99){est="Obeso tipo II";}
                    else if(imc >= 40){est="Obeso tipo III";}
                    
                    $('#estadonutricional').val(""+est+"");
                    $('#icm').val(""+imc+"");
                    
                                         }
                   else{$('#estadonutricional').val("");
                        $('#icm').val("");}
      }
    }
});
/////////
jQuery('#talla').blur(function () {
      
  if(isNaN(this.value)){this.value = this.value.replace(/[^0-9]/g,''); }
  else{
      if(this.value>=999){alert("talla no puede ser mayor a 998 ");this.value="";}
      else{
     // alert("pe: "+pe+" leng pe:"+$('#peso').length+" ta: "+ta+" leng ta:"+$('#talla').length);
      if($('#peso').val().length > 0 && $('#talla').val().length > 0) {
                    var pe=$('#peso').val();
                    var ta=$('#talla').val();
                    var imc=pe/((ta/100)*(ta/100));
                    var est="";
                     if(imc < 16){   est="Delgadez severa";}
                    else if(imc < 16.99){est="Delgadez moderada";}
                    else if(imc < 18.49){est="Delgadez no muy pronunciada";}
                    else if(imc < 24.99){est="Normal";}
                    else if(imc < 29.99){est="Preobeso";}
                    else if(imc < 34.99){est="Obeso tipo I";}
                    else if(imc < 39.99){est="Obeso tipo II";}
                    else if(imc >= 40){est="Obeso tipo III";}
                    
                    $('#estadonutricional').val(""+est+"");
                    $('#icm').val(""+imc+"");
                    
                                         }
                   else{$('#estadonutricional').val("");
                        $('#icm').val("");}
      }
    }
});

jQuery('#peso').blur(function () {
    
  if(isNaN(this.value)){this.value = this.value.replace(/[^0-9]/g,''); }
  else{
      if(this.value>=999){alert("peso no puede ser mayor a 998 ");this.value="";}
      else{
     // alert("pe: "+pe+" leng pe:"+$('#peso').length+" ta: "+ta+" leng ta:"+$('#talla').length);
      if($('#peso').val().length > 0 && $('#talla').val().length > 0) {
                    var pe=$('#peso').val();
                    var ta=$('#talla').val();
                    var imc=pe/((ta/100)*(ta/100));
                    var est="";
                     if(imc < 16){   est="Delgadez severa";}
                    else if(imc < 16.99){est="Delgadez moderada";}
                    else if(imc < 18.49){est="Delgadez no muy pronunciada";}
                    else if(imc < 24.99){est="Normal";}
                    else if(imc < 29.99){est="Preobeso";}
                    else if(imc < 34.99){est="Obeso tipo I";}
                    else if(imc < 39.99){est="Obeso tipo II";}
                    else if(imc >= 40){est="Obeso tipo III";}
                    
                    $('#estadonutricional').val(""+est+"");
                    $('#icm').val(""+imc+"");
                    
                                         }
                   else{$('#estadonutricional').val("");
                        $('#icm').val("");}
      }
    }
});
////////////////////////
jQuery('#temperatura').keyup(function () {
  if(isNaN(this.value)){this.value = this.value.replace(/[^0-9]/g,'');       }
 else{  if(this.value>=99){alert("Temperatura no puede ser mayor a 98 ");this.value="";}  }                      
});
jQuery('#temperatura').blur(function () {
  if(isNaN(this.value)){this.value = this.value.replace(/[^0-9]/g,'');       }
  else{  if(this.value>=99){alert("Temperatura no puede ser mayor a 98 ");this.value="";}   }                     
});

jQuery('#tensionarterial1,#tensionarterial2,#frecuanciacardiaca,#frecuneciarespiratoria').keyup(function () {
  this.value = this.value.replace(/[^0-9]/g,''); 
});
jQuery('#tensionarterial1,#tensionarterial2,#frecuanciacardiaca,#frecuneciarespiratoria').blur(function () {
  this.value = this.value.replace(/[^0-9]/g,''); 
});


 
    

</script>        
 
<style type="text/css">
/*    
#diagnosticop{
width:250px;
border:solid 1px #000;
padding:3px;

}*/body{z-index: 1;}
#display,#display1,#display2,#display3
{
width:40px;
display:none;
/*float:right; margin-right:30px;*/
border-left:solid 1px #dedede;
border-right:solid 1px #dedede;
border-bottom:solid 1px #dedede;
overflow:hidden;
position: relative;
z-index: 4;
    
}
.display_box
{
padding:4px; border-top:solid 1px #dedede; font-size:12px; height:10px;
}

.display_box:hover
{
background:#3b5998;
color:#FFFFFF;
}       
#busca:hover{
            background-color:#3baae3;
            cursor:pointer;
            border-radius: 5px;
}
</style>
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
    
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb(); 
         String datosc[]= new String[37];
         //para los daro   
         
         String  sqlc="select anamnesis,enf_actual,revision_por_sistemas,tension_alta,tension_baja,f_cardiaca,f_respiratoria,temperatura,peso,talla,conducta_recomen,paraclinicos,subjetivo,plan,cod_finalidad_consulta,sr,sp,pdd_fecha,pdd_resultado,vih_fecha_diag,vih_estadio_inicial,vih_estadio_actual,vih_infecciones_oportunistas,rcv,recomienda_autocuidado,recomienda_alimentacion,recomienda_signos_alarma,recomienda_cuidados_gen,recomienda_adherencia,incapacidad,incapacidad_tiempo,incapacidad_texto,acompana_nombre,acompana_telefono,sintomaticopiel,sintomaticorepi,conducta from consulta_medica where id_consulta='"+session.getAttribute("serial_consulta")+"'";
      
           ResultSet result=null;
          try{  
           result=ba.consultas(sqlc);
           String nu="null";
           while (result.next()&&result!=null) { 
                         if(result.getString(1)!=null && nu.compareTo(""+result.getString(1)+"")!=0    ){ datosc[0]=result.getString(1); }else{ datosc[0]="";}
                         if(result.getString(2)!=null && nu.compareTo(""+result.getString(2)+"")!=0    ){ datosc[1]=result.getString(2); }else{ datosc[1]="";}
                         if(result.getString(3)!=null && nu.compareTo(""+result.getString(3)+"")!=0    ){ datosc[2]=result.getString(3); }else{ datosc[2]="";}
                         if(result.getString(4)!=null && nu.compareTo(""+result.getString(4)+"")!=0    ){ datosc[3]=result.getString(4); }else{ datosc[3]="";}
                         if(result.getString(5)!=null && nu.compareTo(""+result.getString(5)+"")!=0    ){ datosc[4]=result.getString(5); }else{ datosc[4]="";}
                         if(result.getString(6)!=null && nu.compareTo(""+result.getString(6)+"")!=0    ){ datosc[5]=result.getString(6); }else{ datosc[5]="";}
                         if(result.getString(7)!=null && nu.compareTo(""+result.getString(7)+"")!=0    ){ datosc[6]=result.getString(7); }else{ datosc[6]="";}
                         if(result.getString(8)!=null && nu.compareTo(""+result.getString(8)+"")!=0    ){ datosc[7]=result.getString(8); }else{ datosc[7]="";}
                         if(result.getString(9)!=null && nu.compareTo(""+result.getString(9)+"")!=0    ){ datosc[8]=result.getString(9); }else{ datosc[8]="";}
                         if(result.getString(10)!=null && nu.compareTo(""+result.getString(10)+"")!=0  ){ datosc[9]=result.getString(10);}else{ datosc[9]="";}
                         if(result.getString(11)!=null && nu.compareTo(""+result.getString(11)+"")!=0  ){datosc[10]=result.getString(11);}else{datosc[10]="";}
                         if(result.getString(12)!=null && nu.compareTo(""+result.getString(12)+"")!=0  ){datosc[11]=result.getString(12);}else{datosc[11]="";}
                         if(result.getString(13)!=null && nu.compareTo(""+result.getString(13)+"")!=0  ){datosc[12]=result.getString(13);}else{datosc[12]="";}
                         if(result.getString(14)!=null && nu.compareTo(""+result.getString(14)+"")!=0  ){datosc[13]=result.getString(14);}else{datosc[13]="";}
                         if(result.getString(15)!=null && nu.compareTo(""+result.getString(15)+"")!=0  ){datosc[14]=result.getString(15);}else{datosc[14]="";}
                                         
                         if(result.getString(16)!=null && nu.compareTo(""+result.getString(16)+"")!=0  ){datosc[15]=result.getString(16);}else{datosc[15]="";}// sr
                         if(result.getString(17)!=null && nu.compareTo(""+result.getString(17)+"")!=0  ){datosc[16]=result.getString(17);}else{datosc[16]="";}// sp
                         if(result.getString(18)!=null && nu.compareTo(""+result.getString(18)+"")!=0  ){datosc[17]=result.getString(18);}else{datosc[17]="";}// pdd_fecha
                         if(result.getString(19)!=null && nu.compareTo(""+result.getString(19)+"")!=0  ){datosc[18]=result.getString(19);}else{datosc[18]="";}// pdd_resultado
                         if(result.getString(20)!=null && nu.compareTo(""+result.getString(20)+"")!=0  ){datosc[19]=result.getString(20);}else{datosc[19]="";}// vih_fecha_diag
                         if(result.getString(21)!=null && nu.compareTo(""+result.getString(21)+"")!=0  ){datosc[20]=result.getString(21);}else{datosc[20]="";}// vih_estadio_inicial
                         if(result.getString(22)!=null && nu.compareTo(""+result.getString(22)+"")!=0  ){datosc[21]=result.getString(22);}else{datosc[21]="";}// vih_estadio_actual
                         if(result.getString(23)!=null && nu.compareTo(""+result.getString(23)+"")!=0  ){datosc[22]=result.getString(23);}else{datosc[22]="";}// vih_infecciones_oportunistas
                         if(result.getString(24)!=null && nu.compareTo(""+result.getString(24)+"")!=0  ){datosc[23]=result.getString(24);}else{datosc[23]="";}// rcv
                         if(result.getString(25)!=null && nu.compareTo(""+result.getString(25)+"")!=0  ){datosc[24]=result.getString(25);}else{datosc[24]="";}// recomienda_autocuidado
                         if(result.getString(26)!=null && nu.compareTo(""+result.getString(26)+"")!=0  ){datosc[25]=result.getString(26);}else{datosc[25]="";}// recomienda_alimentacion
                         if(result.getString(27)!=null && nu.compareTo(""+result.getString(27)+"")!=0  ){datosc[26]=result.getString(27);}else{datosc[26]="";}// recomienda_signos_alarma
                         if(result.getString(28)!=null && nu.compareTo(""+result.getString(28)+"")!=0  ){datosc[27]=result.getString(28);}else{datosc[27]="";}// recomienda_cuidados_gen
                         if(result.getString(29)!=null && nu.compareTo(""+result.getString(29)+"")!=0  ){datosc[28]=result.getString(29);}else{datosc[28]="";}// recomienda_adherencia
                         if(result.getString(30)!=null && nu.compareTo(""+result.getString(30)+"")!=0  ){datosc[29]=result.getString(30);}else{datosc[29]="";}// incapacidad
                         if(result.getString(31)!=null && nu.compareTo(""+result.getString(31)+"")!=0  ){datosc[30]=result.getString(31);}else{datosc[30]="";}// incapacidad_tiempo
                         if(result.getString(32)!=null && nu.compareTo(""+result.getString(32)+"")!=0  ){datosc[31]=result.getString(32);}else{datosc[31]="";}// incapacidad_texto
                         if(result.getString(33)!=null && nu.compareTo(""+result.getString(33)+"")!=0  ){datosc[32]=result.getString(33);}else{datosc[32]="";}// acompa;a nombre
                         if(result.getString(34)!=null && nu.compareTo(""+result.getString(34)+"")!=0  ){datosc[33]=result.getString(34);}else{datosc[33]="";}//acompa;a telefono
                         if(result.getString(35)!=null && nu.compareTo(""+result.getString(35)+"")!=0  ){datosc[34]=result.getString(35);}else{datosc[34]="";}// piel
                         if(result.getString(36)!=null && nu.compareTo(""+result.getString(36)+"")!=0  ){datosc[35]=result.getString(36);}else{datosc[35]="";}// respi
                         if(result.getString(37)!=null && nu.compareTo(""+result.getString(37)+"")!=0  ){datosc[36]=result.getString(37);}else{datosc[36]="";}// respi

                               }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        
        ba.cierraResultado(result); 
                    
    
        

           
                             
      /////////////////////////////////////////////////////////////////////////////77  
  
        
                                        
     %>
     <form id="consulta_f1" name="consulta_f1" action="consulta_f1.jsp" method="post" accept-charset="UTF-8" target="el-iframe1"> 
          
 <fieldset>

<!--Anamnesis-->

<legend>Acompañante</legend>

<table style="width:100%">
    <tr>
        <td style="width:66.6%" >
           <label> Nombre:</label>
           <input type="text" id="acompana_nombre" name="acompana_nombre"  value="<% out.print(datosc[32]); %>"  style="width: 64%;" >
        </td>
        <td style="width:33.3%">
            <label>Telefono:</label> <input type="text" id="acompana_telefono" name="acompana_telefono"  value="<% out.print(datosc[33]); %>">
        </td>
    </tr>
</table>

</fieldset>    
         
         
 <fieldset>

<!--Anamnesis-->

<legend>Antecedentes VIH</legend>

<table style="width:100%">
    <tr>
        <td style="width:33.3%" >
           <label> VIH  Fecha diagnostico:</label>
           <input type="text" id="vih_fecha_diag" name="vih_fecha_diag"  value="<% out.print(datosc[19]); %>" readonly="" style="width: 75px;" >
        </td>
        <td style="width:33.3%">
            <label>Estadio inicial:</label> <input type="text" id="vih_estadio_inicial" name="vih_estadio_inicial"  value="<% out.print(datosc[20]); %>">
        </td>
        <td style="width:33.3%">
            <label>Estadio Actual:</label> <input type="text" id="vih_estadio_actual" name="vih_estadio_actual"  value="<% out.print(datosc[21]); %>">
        </td>
    </tr>
    <tr>    
        <td colspan="3">            
            <label for="motivoconsulta">Infecciones Oportunistas:</label><br>
            <textarea name="vih_infecciones_oportunistas" rows="3" style="width:99%" ><% out.print(datosc[22]); %></textarea>
        </td>
    </tr>
</table>

</fieldset>        
         
<fieldset>

<!--Anamnesis-->

<legend>Anamnesis</legend>
<label for="motivoconsulta">Motivo de la Consulta:</label><br>
<textarea name="motivoconsulta" rows="3" style="width:99%" ><% out.print(datosc[0]); %></textarea>
<br>
<label for="enfermedadactual">Enfermedad Actual:</label><br>
<textarea name="enfermedadactual" rows="3" style="width:99%"><% out.print(datosc[1]); %></textarea>
</fieldset>

<!--Revision por Sistemas-->

<fieldset>
<legend>Revision Por Sistemas</legend>
<table style="width:100%">
    <tr>
        <td style="width:70%" rowspan="3">
            <textarea name="revisionsistemas" rows="4" style="width:99%"><% out.print(datosc[2]); %></textarea>
        </td>
        <td style="width:30%">
            <!--
            <label>SR</label> <select id="sr" name="sr" >
                <option value="0" <% if(datosc[15].equals("0")){out.print("selected");} %> >No</option>
                  <option value="1" <% if(datosc[15].equals("1")){out.print("selected");} %>>Si</option>
               </select> 
            <label>SP</label> <select id="sp" name="sp" >
                  <option value="0" <% if(datosc[16].equals("0")){out.print("selected");} %>>No</option>
                  <option value="1" <% if(datosc[16].equals("1")){out.print("selected");} %>>Si</option>
               </select>
               -->
               <input type="hidden" name="sr" value="0">
               <input type="hidden" name="sp" value="0">
        </td>
    </tr>
    <tr>    
        <td>
            <label>PPD</label> <input type="text" name="pdd_fecha" id="pdd_fecha" value="<% out.print(datosc[17]); %>" readonly="" style="width: 75px;" > 
        </td>
    </tr>
    <tr>    
        <td>
            <label>Resultado</label> <input type="text" name="pdd_resultado" id="pdd_resultado" value="<% out.print(datosc[18]); %>">
        </td>
    </tr>
</table>

</fieldset>

<fieldset>
<legend>Finalidad de la consulta</legend>
  <select name="finalidad_conculta_c_med" id="finalidad_conculta_c_med" style="width:90%">
    
                    <%
                  String  sqqllfin="select id_finalidad_consulta,descripcion from finalidad_consulta";
       
           ResultSet ressuu2fin=null;
           int control=0;
           
          try{  
           ressuu2fin=ba.consultas(sqqllfin);
          
           while (ressuu2fin.next()&&ressuu2fin!=null) { 
               
                  if(ressuu2fin.getString(1).compareTo(datosc[14])==0){ 
                      out.println("<option value='"+ressuu2fin.getString(1)+"' SELECTED>"+ressuu2fin.getString(2)+"</option>");
                      control=1;
                  }else{ 
                      String selected2="";
                      if(ressuu2fin.getString(1).equals("10") && control==0){
                        selected2="selected";
                      }
                      
                      out.println("<option value='"+ressuu2fin.getString(1)+"' "+selected2+">"+ressuu2fin.getString(2)+"</option>");}
                                                         }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        
        ba.cierraResultado(ressuu2fin); 
                    
                 %>
             </select> 
             <% if(control == 0){ %>
             <script type="text/javascript">
                 $("#finalidad_conculta_c_med").val(10);
             </script>
             <% } %>
</fieldset>

<fieldset>
<legend>RECOMENDACIONES</legend>
<table style="width:100%">
    <tr>
        <td style="width:33.3%">
            <label>Auto cuidado</label> 
            <select id="recomienda_autocuidado" name="recomienda_autocuidado" >
                  <option value="0"  <% if(datosc[24].equals("0")){out.print("selected");} %>>No</option>
                  <option value="1"  <% if(datosc[24].equals("1")){out.print("selected");} %>>Si</option>
            </select> 
        </td>
        <td style="width:33.3%">
            <label>Alimentación</label> 
            <select id="recomienda_alimentacion" name="recomienda_alimentacion" >
                  <option value="0" <% if(datosc[25].equals("0")){out.print("selected");} %>>No</option>
                  <option value="1" <% if(datosc[25].equals("1")){out.print("selected");} %>>Si</option>
            </select> 
        </td>
        <td style="width:33.3%">    
            <label>Signos de Alarma</label> 
            <select id="recomienda_signos_alarma" name="recomienda_signos_alarma" >
                  <option value="0" <% if(datosc[26].equals("0")){out.print("selected");} %>>No</option>
                  <option value="1" <% if(datosc[26].equals("1")){out.print("selected");} %>>Si</option>
            </select>
        </td>
    </tr><tr>
        <td style="width:33.3%" >
            <label>Cuidados generales</label> 
            <select id="recomienda_cuidados_gen" name="recomienda_cuidados_gen" >
                  <option value="0" <% if(datosc[27].equals("0")){out.print("selected");} %>>No</option>
                  <option value="1" <% if(datosc[27].equals("1")){out.print("selected");} %>>Si</option>
            </select> 
        </td>
        <td style="width:33.3%">
            <label>Adherencia</label> 
            <select id="recomienda_adherencia" name="recomienda_adherencia" >
                  <option value="0"  <% if(datosc[28].equals("0")){out.print("selected");} %>>No</option>
                  <option value="1"  <% if(datosc[28].equals("1")){out.print("selected");} %>>Si</option>
            </select> 
        </td>
        <td style="width:33.3%">
        </td>
    </tr>
</table>

</fieldset>



<fieldset>
<legend>Incapacidad</legend>
    <table style="width:100%">
        <tr>
            <td style="">
                <select id="incapacidad" name="incapacidad" >
                      <option value="0" <% if(datosc[29].equals("0")){out.print("selected");} %>>No</option>
                      <option value="1" <% if(datosc[29].equals("1")){out.print("selected");} %>>Si</option>
                </select> 
            </td>
        </tr>
        <tr>
            <td style=""  >
                <textarea name="incapacidad_texto" rows="4" style="width:99%"><% out.print(datosc[31]); %></textarea>
            </td>
        </tr>
    </table>

</fieldset>
            
      <fieldset>

<!--Anamnesis-->

<legend>Sintomatico</legend>

<table style="width:100%">
    <tr>
        <td style="width:66.6%" >
           <label> Sintomático de piel:</label>
           <select  id="sintomaticopiel" name="sintomaticopiel" >
               <option value="0" <% if(datosc[34].equals("0")){out.print("selected");} %>>No</option>
               <option value="1" <% if(datosc[34].equals("1")){out.print("selected");} %>>Si</option>
           </select>
        </td>
        <td style="width:33.3%">
           <label>Sintomático respiratorio:</label>
           <select  id="sintomaticorepi" name="sintomaticorepi" >
               <option value="0" <% if(datosc[35].equals("0")){out.print("selected");} %>>No</option>
               <option value="1" <% if(datosc[35].equals("1")){out.print("selected");} %>>Si</option>
           </select>
        </td>
    </tr>
</table>

</fieldset>         
            
 
<fieldset>
<legend>Conducta</legend>

<table style="width:100%">
    <tr>
        <td style="width:66.6%" >
           <textarea id="conducta" name="conducta" style="width:99%" rows="5"><% out.print(datosc[36]); %></textarea>
        </td>
    </tr>
</table>

</fieldset>             
      
</form>
<!--Examen Fisico-->
 
        
<fieldset>
<legend>Examen Fisico</legend>
<form  id="consulta_f2" name="consulta_f2" action="consulta_f2.jsp" accept-charset="UTF-8" method="post" target="el-iframe2">
<table>
<tr align="right">
<td>
<label for="tensionarterial">Tension Arterial:</label>
</td>
<td>
    <input type="text" name="tensionarterial1" size="3" id="tensionarterial1" maxlength="3" value="<% out.print(datosc[3]); %>">
    <input type="text" name="tensionarterial2" size="3" id="tensionarterial2" maxlength="3" value="<% out.print(datosc[4]); %>">
</td>
<td>
<label for="frecuenciacardiaca">Frecuencia Cardiaca:</label>
</td>
<td>
    <input type="text" name="frecuenciacardica" size="3" id="frecuanciacardiaca" maxlength="3" value="<% out.print(datosc[5]); %>">
</td>
<td>
<label for="frecuenciarespiratoria">Frecuancia Respiratoria:</label>
</td>
<td>
    <input type="text" name="frecuenciarespiratoria" size="3" id="frecuneciarespiratoria" maxlength="3" value="<% out.print(datosc[6]); %>">
</td>
<td>
<label for="icm">ICM:</label>
</td>
<td style="text-align:left">
    <input type="text" name="icm" size="4" id="icm" disabled="disabled" style="background-color:white;"> <label>kg/m<sup>2</sup></label>
</td>
</tr>

<!--2da fila-->


<tr align="right">
<td>
<label for="temperatura">Temperatura(°C):</label>
</td>
<td>
    <input type="text" name="temperatura" size="5" id="temperatura" maxlength="5" value="<% out.print(datosc[7]); %>">
</td>
<td>
<label for="peso">Peso(Kg):</label>
</td>
<td>
<input type="text" name="peso" size="3" id="peso" maxlength="5" value="<% out.print(datosc[8]); %>">
</td>
<td>
<label for="talla">Talla(Cm):</label>
</td>
<td>
    <input type="text" name="talla" size="3" id="talla" maxlength="5" value="<% out.print(datosc[9]); %>" onkeydown="">
</td>
<td>
<label for="estadonutricional">Estado Nutricional:</label>
</td>
<td>
<input type="text" name="estadonutricional" size="30" id="estadonutricional" disabled="disabled" style="background-color:white">
</td>
</tr>
<tr align="right">
<td>
<label for="temperatura">RCV:</label>
</td>
<td>
    <input type="text" name="rcv" size="5" id="rcv" maxlength="5"  value="<% out.print(datosc[23]); %>">
</td>
</tr>
</table>
<br>
<% if("3".compareTo(""+(String)session.getAttribute("permiso")+"")!=0){ 
//out.print("<label for='aspectogeneral'>Aspecto General:</label><br>");
//out.print("<textarea name='aspectogeneral' rows='3' style='width:99%'>"+datosc[10]+"</textarea>");
 } %>

 
 
 
 
 
 
 
</form>
<form id="form_parte" name="form_parte" accept-charset="UTF-8" action="nuevo_exame_cefalo.jsp">
<table>
<tr>
    <td><label>Area</label></td>
    <td>
       <div id="div_parte" name="div_parte">
    <select id="parte" name="parte">
        <%
        
              
         String sql="select id_parte,descripcion from partes_cuerpo where id_parte not in (select id_parte from ex_cefalocaudal where id_consulta='"+session.getAttribute("serial_consulta")+"') order by orden asc;";
       
         ResultSet resu=null;
          try{  
              
           resu=ba.consultas(sql);
           while (resu.next()&&resu!=null) {   
                         out.print(" <option value='"+resu.getString(1)+"'>"+resu.getString(2)+"</option>");
                     }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        
        ba.cierraResultado(resu);  
        %>
          
    </select>
      </div>
</td>
<td><label>Descripción</label><input type="text" name="afectacion" id="afectacion" size="90" maxlength="490"></td>
<td><div id="figu" name="figu">
        
        <center>
            <input type="image" src="../imagenes/fotos/agregar.png" style="width:25px;height:25px" alt="fallo">
        </center>
        
         </div>
</td>
</tr>
</table>
</form>        

<table id="list19" ></table>
 <div id="pager19"></div> 
</fieldset>
 
        
        
        
        
<!-- 
   ////////////////////////////////////
-->
<% if("3".compareTo(""+(String)session.getAttribute("permiso")+"")==0){ %>
<form  id="consulta_f3" name="consulta_f3" action="consulta_f3.jsp" method="post" target="el-iframe3">
<fieldset>
<legend>Especialista</legend>
<label>Paraclinicos</label><br>
<textarea rows="4" name="paraclinicos" id="paraclinicos" style="width:100%" ><% out.print(datosc[11]); %></textarea>
<label>Subjetivo</label><br>
<textarea rows="4" name="subjetivo" id="subjetivo" style="width:100%"><% out.print(datosc[12]); %></textarea>
</fieldset>
</form>    
<% } %>
<!--Diagnosticos-->
<fieldset>

<% if("1".compareTo(""+(String)session.getAttribute("permiso")+"")==0){ %>
  <legend>Impresión diagnostica:</legend>
<% }else{%>
<legend>Diagonostico:</legend>
<%}%>
<form  id="form_diag" name="form_diag" accept-charset="UTF-8" action="agregadiag.jsp">
<table style="width:100%" border="0">
    <tr>
        <td colspan="3"><label>Diagnostico principal</label></td>
        <td><label style="padding-left:10px">Tipo Diagnostico</label></td>
        <td><label style="padding-left:10px">Causa Externa</label></td>
    </tr>
    <tr>
        <td  style="width:40px" id="tddiag"> 
            <input type="text" id="diagnosticoconsu_evol" name="diagnosticoconsu_evol" class="diagnosticoconsu_evol" autocomplete="off"  style="width:100%">
             <div id="display_consu_evol"></div> 
        </td>
        <td  style="width:40px">
    <center>  <img src="../imagenes/fotos/buscar.png" id="busca" name="busca" class="mas" alt="falla al cargar imagen" width="18px" height="18px" onclick="abreDialogConsu_evol('diagnosticoconsu_evol','diagnosticoconsu2_evol');" > </center>
        </td>
        <td  style="width:50%">
           <input type="text" id="diagnosticoconsu2_evol" name="diagnosticoconsu2_evol" class="diagnosticoconsu2_evol" disabled="true"  style="width:100%"> 
        </td>
        <td><center>
            <select name="tipodiagnostico_consu_evol" id="tipodiagnostico_consu_evol" style="width:90%">

                <%
                 String sqll="select idtipodiag,descripcion from tipo__diagnostico order by idtipodiag";
       
           ResultSet resuu2=null;
          try{  
           resuu2=ba.consultas(sqll);
           while (resuu2.next()&&resuu2!=null) { 
                         out.println("<option value='"+resuu2.getString(1)+"'>"+resuu2.getString(2)+"</option>");
                     }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        
        ba.cierraResultado(resuu2);
                %>
            </select>
            </center>
        </td>
        <td>
            <center> 
           <select name="causaexterna_consu_evol" id="causaexterna_consu_evol" style="width:90%">
                    <%
                  String  sqqll="select idcausa,descripcion from causa_externa order by idcausa";
       
           ResultSet ressuu2=null;
          try{  
           ressuu2=ba.consultas(sqqll);
           while (ressuu2.next()&&ressuu2!=null) { 
                         String selected="";
                         if(ressuu2.getString(1).equals("15")){selected="selected";}
                         out.println("<option value='"+ressuu2.getString(1)+"' "+selected+">"+ressuu2.getString(2)+"</option>");
                                                  }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        
        ba.cierraResultado(ressuu2); 
                    
                 %>
             </select> 
             </center>
        </td>
    </tr>
     <tr>
         <td colspan="5" >
            <label>Observaciones:</label><br>
            <textarea name="observaciones_evol_consu" id="observaciones_evol_consu" rows="2" style="width:95%"></textarea>
            &nbsp;&nbsp;<input type="image" src="../imagenes/fotos/agregar.png" style="width:25px;height:25px" alt="fallo">
            <br>
        </td>
    </tr>
    </table> 
    </form>
             
    <table> 
    <tr>
        <td colspan="5"><br>
              <table id="listdiag_consu_evol" ></table>
              <div id="pagerdiag_consu_evol"></div>             
        </td>
    </tr>
</table>
</fieldset>

<% if("3".compareTo(""+(String)session.getAttribute("permiso")+"")==0){ %>
<form  id="consulta_f4" name="consulta_f4" action="consulta_f4.jsp" accept-charset="UTF-8" method="post" target="el-iframe4">
<fieldset>
<legend>plan</legend>
<textarea rows="4" id="plan" name="plan"style="width:100%"><% out.print(datosc[13]); %></textarea>
</fieldset>

</form>    
<% } %>











<br>
<div id="resu" name="resu"></div>

<div name="dilog_cie10" id="dilog_cie10" >  
              <table id="listcie10" ></table>
              <div id="pagercie10"></div> 
</div> 
                            
<iframe name="el-iframe1" id="el-iframe1" style="display:none"></iframe>
<iframe name="el-iframe2" id="el-iframe2" style="display:none"></iframe>
<iframe name="el-iframe3" id="el-iframe3" style="display:none"></iframe>
<iframe name="el-iframe4" id="el-iframe4" style="display:none"></iframe>
<iframe name="el-iframe5" id="el-iframe5" style="display:none"></iframe>
<form id="quitadiag" name="quitadiag" method="post" target="el-iframe5" accept-charset="UTF-8" action="quitadiag.jsp">
    <input type="hidden" id="qcie_10" name="qcie_10">
</form>


<% ba.cerrar(); %>
<script type="text/javascript" language="javascript">
     
       if($('#peso').val().length > 0 && $('#talla').val().length > 0) {
                    var pe=$('#peso').val();
                    var ta=$('#talla').val();
                    var imc=pe/((ta/100)*(ta/100));
                    var est="";
                     if(imc < 16){   est="Delgadez severa";}
                    else if(imc < 16.99){est="Delgadez moderada";}
                    else if(imc < 18.49){est="Delgadez no muy pronunciada";}
                    else if(imc < 24.99){est="Normal";}
                    else if(imc < 29.99){est="Preobeso";}
                    else if(imc < 34.99){est="Obeso tipo I";}
                    else if(imc < 39.99){est="Obeso tipo II";}
                    else if(imc >= 40){est="Obeso tipo III";}
                    
                    $('#estadonutricional').val(""+est+"");
                    $('#icm').val(""+imc+"");
                    
                                         }
       
		     $("#vih_fecha_diag").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#vih_fecha_diag').datepicker($.datepicker.regional['es']);
		     $('#vih_fecha_diag').datepicker("option","showAnim","slideDown");
		     $('#vih_fecha_diag').datepicker("option","dateFormat","yy-mm-dd");                                  
                    
    
		     $("#pdd_fecha").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#pdd_fecha').datepicker($.datepicker.regional['es']);
		     $('#pdd_fecha').datepicker("option","showAnim","slideDown");
		     $('#pdd_fecha').datepicker("option","dateFormat","yy-mm-dd");     
    
    document.getElementById("vih_fecha_diag").value="<% out.print(datosc[19]); %>"; 
    document.getElementById("pdd_fecha").value="<% out.print(datosc[17]); %>";
</script>                                         
</body>

</html>
