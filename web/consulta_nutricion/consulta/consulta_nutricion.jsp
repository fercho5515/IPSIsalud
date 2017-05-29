
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="es">
<head>
<meta charset="utf-8"/>
<title>Sin título 1</title>
    <%
     request.setCharacterEncoding("UTF-8");
    conecta_bd ba = new conecta_bd();
         ba.ConectaDb();
    
         
         String d="";
         if(session.getAttribute("serial_pacinete")!=null){d=""+session.getAttribute("serial_pacinete");}
         
          String sqlfech="select fecha_naci,genero from personas pe where pe.serial='"+d+"' ;";
            ResultSet resufech=null;
            
          
        try{  resufech=ba.consultas(sqlfech);}
        catch(Exception e){}
           
          String fnac="2015-02-02";
          String genero="M";
	try{
	    while (resufech.next()&&resufech!=null) {  
                         if(resufech.getString(1)!=null){fnac=resufech.getString(1);}
                         if(resufech.getString(2)!=null && resufech.getString(2).compareTo("Femenino")==0 ){genero="F";}
                     }
        }
        catch(SQLException ex){ }
	catch(Exception exe){ }
        ba.cierraResultado(resufech);

        edad s = new edad();
        int[] edadn =s.edad_num(fnac);
        
        int graficas=0;
        
             if(edadn[0]==0){graficas=1;/*out.print("<h1>dias "+edadn[1]+"</h1>");*/}
        else if(edadn[0]==1){graficas=1;/*out.print("<h1>meses "+edadn[1]+"</h1>");*/}
        else{  if(edadn[1]<=5){graficas=1;}   }
      //  if(graficas==1){out.print("si toca genero"+genero);/*0 masculino 1 femenino*/}
%>    
<script type="text/javascript" language="javascript">
     var caja1_nutri="";
     var caja2_nutri="";
    
      $(function() {
     $( "#dilog_cie10_nutri" ).dialog({
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
    });
  $("#dialog_grafic" ).dialog({
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
      width:'260px'
    });

}); 

 function abreDialogConsu_Nutri(dato1,dato2){
                               var bb=document.getElementById("display_consu_nutri");
                                   bb.style.display="none";
                               var bb1=document.getElementById("display_consu_nutri_r1");
                                   bb1.style.display="none";
                               var bb2=document.getElementById("display_consu_nutri_r2");
                                   bb2.style.display="none";
                               var bb3=document.getElementById("display_consu_nutri_r3");
                                   bb3.style.display="none";
                                   
                               caja1_nutri=dato1;
                               caja2_nutri=dato2;
                               $("#dilog_cie10_nutri").dialog("open");
                                 }
    function pasadatoConsuNutri(nom,nom2,dato){
                      
                             if(dato=='p'){ 
                                                   document.getElementById("diagnosticoconsu_nutri").value=nom;
                                                   document.getElementById("diagnosticoconsu2_nutri").value=nom2;
                                            var bb=document.getElementById("display_consu_nutri");
                                            bb.style.display="none";
                                           }
                             else if(dato=='1'){ 
                                                   document.getElementById("diagnosticoconsu_nutri_r1").value=nom;
                                                   document.getElementById("diagnosticoconsu2_nutri_r1").value=nom2;
                                            var bb=document.getElementById("display_consu_nutri_r1");
                                            bb.style.display="none";
                                           }
                             else if(dato=='2'){ 
                                                   document.getElementById("diagnosticoconsu_nutri_r2").value=nom;
                                                   document.getElementById("diagnosticoconsu2_nutri_r2").value=nom2;
                                            var bb=document.getElementById("display_consu_nutri_r2");
                                            bb.style.display="none";
                                           }    
                            else if(dato=='3'){ 
                                                   document.getElementById("diagnosticoconsu_nutri_r3").value=nom;
                                                   document.getElementById("diagnosticoconsu2_nutri_r3").value=nom2;
                                            var bb=document.getElementById("display_consu_nutri_r3");
                                            bb.style.display="none";
                                           }               
                              }
   $(document).ready(
 function(){
	  $("#diagnosticoconsu_nutri").keyup(
			      function(){
					var searchbox = $(this).val();
					var dataString = 'searchword='+ searchbox;
					
                                        if(searchbox==''){
					             var bb=document.getElementById("display_consu_nutri");
                       			             bb.style.display="none";
                                                     document.getElementById("diagnosticoconsu2_nutri").value='';
							  }
					else{
					    $.ajax({
					    type: "POST",
					    url: "auto_completa_cie10.jsp?dato=p",
					    data: dataString,
					    cache: false,
					    success: function(html){ $("#display_consu_nutri").html(html).show();
                                                                      var canti=document.getElementById("cantidaddp").value;
                                                                       if(canti==1){document.getElementById("diagnosticoconsu2_nutri").value=""+document.getElementById("nomcie10p").value;
                                                                                    var bb=document.getElementById("display_consu_nutri");
                                                                                    bb.style.display="none";
                                                                                   }
                                                                        else{document.getElementById("diagnosticoconsu2_nutri").value='';}
                                                                    }
			                     });
                                            
			                  }
			                return false;    
			                    }
                                         
	 	             );
 } );
   $(document).ready(
 function(){
	  $("#diagnosticoconsu_nutri_r1").keyup(
			      function(){
					var searchbox = $(this).val();
					var dataString = 'searchword='+ searchbox;
					
                                        if(searchbox==''){
					             var bb=document.getElementById("display_consu_nutri_r1");
                       			             bb.style.display="none";
                                                     document.getElementById("diagnosticoconsu2_nutri_r1").value='';
							  }
					else{
					    $.ajax({
					    type: "POST",
					    url: "auto_completa_cie10.jsp?dato=1",
					    data: dataString,
					    cache: false,
					    success: function(html){ $("#display_consu_nutri_r1").html(html).show();
                                                                      var canti=document.getElementById("cantidadd1").value;
                                                                       if(canti==1){document.getElementById("diagnosticoconsu2_nutri_r1").value=""+document.getElementById("nomcie101").value;
                                                                                    var bb=document.getElementById("display_consu_nutri_r1");
                                                                                    bb.style.display="none";
                                                                                   }
                                                                        else{document.getElementById("diagnosticoconsu2_nutri_r1").value='';}
                                                                    }
			                     });
                                            
			                  }
			                return false;    
			                    }
                                         
	 	             );
 } );

 $(document).ready(
 function(){
	  $("#diagnosticoconsu_nutri_r2").keyup(
			      function(){
					var searchbox = $(this).val();
					var dataString = 'searchword='+ searchbox;
					
                                        if(searchbox==''){
					             var bb=document.getElementById("display_consu_nutri_r2");
                       			             bb.style.display="none";
                                                     document.getElementById("diagnosticoconsu2_nutri_r2").value='';
							  }
					else{
					    $.ajax({
					    type: "POST",
					    url: "auto_completa_cie10.jsp?dato=2",
					    data: dataString,
					    cache: false,
					    success: function(html){ $("#display_consu_nutri_r2").html(html).show();
                                                                      var canti=document.getElementById("cantidadd2").value;
                                                                       if(canti==1){document.getElementById("diagnosticoconsu2_nutri_r2").value=""+document.getElementById("nomcie102").value;
                                                                                    var bb=document.getElementById("display_consu_nutri_r2");
                                                                                    bb.style.display="none";
                                                                                   }
                                                                        else{document.getElementById("diagnosticoconsu2_nutri_r2").value='';}
                                                                    }
			                     });
                                            
			                  }
			                return false;    
			                    }
                                         
	 	             );
 } );
  $(document).ready(
 function(){
	  $("#diagnosticoconsu_nutri_r3").keyup(
			      function(){
					var searchbox = $(this).val();
					var dataString = 'searchword='+ searchbox;
					
                                        if(searchbox==''){
					             var bb=document.getElementById("display_consu_nutri_r3");
                       			             bb.style.display="none";
                                                     document.getElementById("diagnosticoconsu2_nutri_r3").value='';
							  }
					else{
					    $.ajax({
					    type: "POST",
					    url: "auto_completa_cie10.jsp?dato=3",
					    data: dataString,
					    cache: false,
					    success: function(html){ $("#display_consu_nutri_r3").html(html).show();
                                                                      var canti=document.getElementById("cantidadd3").value;
                                                                       if(canti==1){document.getElementById("diagnosticoconsu2_nutri_r3").value=""+document.getElementById("nomcie103").value;
                                                                                    var bb=document.getElementById("display_consu_nutri_r3");
                                                                                    bb.style.display="none";
                                                                                   }
                                                                        else{document.getElementById("diagnosticoconsu2_nutri_r3").value='';}
                                                                    }
			                     });
                                            
			                  }
			                return false;    
			                    }
                                         
	 	             );
 } );
 $('#fsignos').submit(function() {
                            var reco = document.getElementById("obs").value; 
                            var sig  = document.getElementById("cambis").value;   
                            var subs = document.getElementById("cambiasigno").value;             

                           
                          if(sig == -1){
                                               alert('Seleccione parte');
                                               return false;  
                                            }          
                           else if(subs == -1){
                                               alert('Seleccione signo físico');
                                               return false;  
                                            } 
                           else if( reco == null || reco.length == 0 || /^\s+$/.test(reco) ) {
                                                     alert('Ingrese la observacion');
                                                       return false;  
                                                                      } 
                           else if(reco.length >= 500 ){alert('La recomendación tiene como máximo 499 caracteres');
                                                       return false;  
                                                                     }                   
                            reco=reco.replace(/\r\n|\n|\r/g, " ");
                            reco=reco.replace("'", " ");  
                         //   reco=replaceAll2( reco,"" ," " );
                           // reco=replaceAll( reco,"'", " ")
                           document.getElementById("obs").value=reco;
                            //document.forms.f1.submit();                                                
                        
            
                    // Enviamos el formulario usando AJAX
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#divsignos').html(data);
                                  jQuery("#list4").jqGrid('setCaption',"").trigger('reloadGrid');                                  
                                  document.getElementById("obs").value=""; 
                                  document.getElementById("cambis").value=-1;   
                                  document.getElementById("cambiasigno").value=-1;  
                                 
                                  }                             
                          })
                     
                          return false;
                      }); 
 
 
 
 function cambia_signo_desnu(){
     var cambiarsigno=document.getElementById("cambis");
     var cambiarsigno2=cambiarsigno.options[cambiarsigno.selectedIndex].value
     $("#cambiasigno").load("cambia_signo_desnu.jsp?dato="+cambiarsigno2+"");
     
      }
    
        var anchoPantallaaa=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
                
  $(document).ready(function(){
             jQuery("#list4").jqGrid({
   	url:'carga_tabla_signos.jsp?q=2',
	datatype: "json",
   	colNames:['Id','subsig','Parte','Signo Físico','Observaciones',],
   	colModel:[
                {name:'serial',index:'id', width:0,hidden:true,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},  
   		{name:'id_sub_sih',index:'id_sub_sih', width:0,hidden:true,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},  
   		{name:'partenutricion',index:'sd.descripcion', width:((anchoPantallaaa*10)/100),search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'signofisiconutricion',index:'ss.decripcion', width:((anchoPantallaaa*14)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'observacionesnutricion',index:'hst.coment', width:((anchoPantallaaa*70)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		],
   	rowNum:10,
   	rowList:[5,10,15,30,45],
   	pager: '#pager4',
   	sortname: 'sd.descripcion',
    viewrecords: true,
    sortorder: "desc",
	//multiselect: false,
	////loadonce: true,
	//height: 'auto',
      width:anchoPantallaaa-20,
      height: 'auto',
        
   // height: 190,
   // autowidth: true, 
    shrinkToFit: false,
    rownumbers: false,
    editurl: 'editaCli.php',
	caption: "",
	ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
	                                     NuevoCaso2(""+cedula_nit+"");  }
	
});
jQuery("#list4").jqGrid('navGrid','#pager4',{add:false,edit:false,del:false,search:true,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:60} //para el view
 								);
jQuery("#list4").jqGrid('navButtonAdd','#pager4',
     {
      caption:"",
      buttonicon:"ui-icon-trash",
      onClickButton:function(){ 
                                var id = jQuery("#list4").jqGrid('getGridParam','selrow');
                                if (id)	{
                                        var ret = jQuery("#list4").jqGrid('getRowData',id);
                                        apprise("¿Esta seguro de eliminar la parte seleccionada: "+ret.partenutricion+" - "+ret.signofisiconutricion+" ?", {'verify':true}, function(opcion) {
                                                            if(opcion) {  
                                                                           
                                                                        $("#resu_b").load("quita_signo_fisico.jsp?idsbs="+ret.id_sub_sih+"");
                                                                        setTimeout ('recagatsubs()',700); 
                                                                       }
                                                           });       
                                                        
                                }else { alert("Selecciona la fila a eliminar");}
                                
                              },
      position:"last",
      title:"Borrar Antecedente Personal",
      cursor: "pointer"});                                                                    
/* 								
$("#pager10").click(function(){
	var gr = jQuery("#list10").getGridParam('selrow');
	if( gr != null ) jQuery("#list10").editGridRow(gr,{height:280,reloadAfterSubmit:false});
	else alert("Por Favor Seleccione Un Usuario");
});
*/

 });

$(document).ready(function(){
 
      
    jQuery("#listcie10_nutri").jqGrid({
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
   	pager: '#pagercie10_nutri',
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
                                    var ret = jQuery("#listcie10_nutri").jqGrid('getRowData',id);
                                    //alert(""+ret.id_subcie10+" "+ret.descripcion+"");   
                                    document.getElementById(""+caja1_nutri+"").value=""+ret.id_subcie10;
                                    document.getElementById(""+caja2_nutri+"").value=""+ret.descripcion;
                                    $("#dilog_cie10_nutri").dialog( "close" );
                                  }	
});

  <% /*   int valida=Integer.parseInt((String)session.getAttribute("valida_nutri"));
        if(valida==1){
         */   %> 
          jQuery("#listcie10_nutri").jqGrid('navGrid','#pagercie10_nutri',{add:false,edit:false,del:false,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);
               <%
        out.print("jQuery('#listcie10_nutri').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});");
        session.setAttribute("valida_nutri","2");
     /*   } */
  %>                           

    $("#imggraficas").on("click",function(event){
           $("#dialog_grafic" ).dialog("open");
        
        /*
            var tipo = $('input:radio[name=radiograf]:checked').val();
            var formato="puntuacionz";
            if(tipo==0){formato="percentiles";}
         // var ruta="../../graficas/nutricion/talla_edad_0_5_a.jsp?genero=<%= genero %>&tipo="+formato+"";
         // var ruta="../../graficas/nutricion/peso_edad_0_5_a.jsp?genero=<%= genero %>&tipo="+formato+"";
            var ruta="../../graficas/nutricion/peso_talla_0_5_a.jsp?genero=<%= genero %>&tipo="+formato+"";
            window.open(ruta); 
                 */
            
            
    });
    
   
 });
  function grafic(dato){
          var tipo = $('input:radio[name=radiograf]:checked').val();
          var formato="puntuacionz";
          if(tipo==0){formato="percentiles";}
          window.open("../../graficas/nutricion/"+dato+"_0_5_a.jsp?genero=<%= genero %>&tipo="+formato+""); 
    }
 function recagatsubs(){
     jQuery("#list4").jqGrid('setCaption',"").trigger('reloadGrid'); 
     
     var cambiarsigno=document.getElementById("cambis");
     var cambiarsigno2=cambiarsigno.options[cambiarsigno.selectedIndex].value
     $("#cambiasigno").load("cambia_signo_desnu.jsp?dato="+cambiarsigno2+"");
 }
 
</script> 
<style type="text/css">
/*    
#diagnosticop{
width:250px;
border:solid 1px #000;
padding:3px;

}*/
#display_consu_nutri,#display_consu_nutri_r1,#display_consu_nutri_r2,#display_consu_nutri_r3
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
</head>
<body>
    
    
     <div id="dialog_grafic" >
         <center>
             <br>    
             <label>Percentil</label>
             <input type="radio" id="radiograf" name="radiograf" value="0" checked="checked">
             &nbsp;
             <label>Puntuacion z</label>
             <input type="radio" id="radiograf" name="radiograf" value="1" >
             <br>
             <button id="peso_edad" onclick="grafic('peso_edad')" >Peso Edad</button>
             <br> <br>
             <button id="peso_talla" onclick="grafic('peso_talla')" >Peso Talla</button>
             <br> <br>
             <button id="talla_edad" onclick="grafic('talla_edad')">Talla Edad</button>
             <br>
         </center>
     </div>

    
    <div id="resu_b"></div>
<fieldset>
<legend>Signos Fisicos de Desnutricion</legend>
<form id="fsignos" action="crear_signo_fisico_temporal.jsp"  method="post" name="fsignos">
<table style="width:99%" border="0">
<tr>
    <td style="width:40px"><label>Parte: </label></td>
    <td style="width:300px">
    <select onchange="cambia_signo_desnu()" id="cambis" name="cambis"  style="width: 90%">
        <option value="-1">Seleccione...</option>
    <% 
    String sql="select * from signos_desnu;";    
                        ResultSet resu1=ba.consultas(sql);
                        try{
                            while (resu1.next()&&resu1!=null) {   
                                       out.print("<option value='"+resu1.getString(1)+"'>"+resu1.getString(2)+"</option>");
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                        
    %>    
                </select></td>
                <td style="width:90px"><label>Signo Fisico:</label> 
                </td>
                <td  style="width:400px">
                       <div id="carga_signos_desnu" style="float:right;text-align: left;width: 100%">
                        <select id="cambiasigno" name="cambiasigno" style="width: 100%">
                            <option value="-1">Seleccione...</option>
                        </select>
                       </div>
                </td>
                <td rowspan="2" style="width:7%">
                    <div id="figu" name="figu" style="padding-left:30px">
        <center><input type="image" src="../../imagenes/fotos/agregar.png" style="width:25px;height:25px" ></center>
        </div>
</td>
</tr>
<tr>
    <td colspan="4" >
        <table style="width:100%">
         <td VALIGN=TOP style="width: 100px"><label>Observaciones: </label></td>
         <td style="padding-left: 30px">
        <textarea  name="obs" id="obs" maxlength="100" rows="3" style="width:99%"></textarea>
        </td>
        </table>
        
    </td>
</tr>
</table>
                
</form>
<table id="list4" ></table>
<div id="pager4"></div>
</fieldset><br>

 <iframe name="el-iframe1n" id="el-iframe1n" style="display:none"></iframe>
<form id="consu_nutri_1" name="consu_nutri_1" method="post" target="el-iframe1n" accept-charset="UTF-8" action="guarda_consu_nutri_1.jsp">
    
     <input type="hidden" id="estado_civilo_nutri" name="estado_civilo_nutri">   
     <input type="hidden" id="orientacion_nutri" name="orientacion_nutri">

     <input type="hidden" id="comentario_menu2" name="comentario_menu2">   
     <input type="hidden" id="dieta_menu2" name="dieta_menu2">
 <fieldset>        
<table width="100%"> 
<tr>
<td  style="text-align:right;width:15%">
<label>Atrofia Muscular</label>
</td>
<td style="width:15%">
<input type="radio" name="atrofia" id="atrofia1" value="1">Si
<input type="radio" name="atrofia" id="atrofia2" value="2">No
</td>
<td  style="text-align:right;width:15%">
<label for="rosario">Rosario Costal</label>
</td>
<td style="width:55%">
<input type="radio" name="rosario" id="rosario1" value="1">Si
<input type="radio" name="rosario" id="rosario2" value="2">No
</td>
</tr>
<tr>
<td colspan="4" style="width:100%">
<label for="">Caracteristicas Generales:(signos de maltrato,descuido etc)</label><br>
<textarea rows="3" style="width:100%" name="caracgenerales" id="caracgenerales"></textarea>
</td>
</tr>
</table>
</fieldset>

<br>

<fieldset>
<legend>Recordatorio de 24 Horas</legend>
<table width="100%">
<tr>
<td style="width:17%">
<label for="desayuno">Desayuno:</label>
</td>
<td style="width:83%">
<input type="text" name="desayuno" id="desayuno" style="width:100%">
</td>
</tr>

<tr>
<td style="width:17%">
<label for="refrigerio1">Refrigerio1:</label>
</td>
<td style="width:83%">
<input type="text" name="refrigerio1" id="refrigerio1" style="width:100%">
</td>
</tr>

<tr>
<td style="width:17%">
<label for="almuerzo">Almuerzo:</label>
</td>
<td style="width:83%">
<input type="text" name="almuerzo" id="almuerzo" style="width:100%">
</td>
</tr>

<tr>
<td style="width:17%">
<label for="refrigerio2">Refrigerio2:</label>
</td>
<td style="width:83%">
<input type="text" name="refrigerio2" id="refrigerio2" style="width:100%">
</td>
</tr>

<tr>
<td style="width:17%">
<label for="comida">Comida:</label>
</td>
<td style="width:83%">
<input type="text" name="comida" id="comida" style="width:100%">
</td>
</tr>

<tr>
<td style="width:17%">
<label for="complemento">Complemento:</label>
</td>
<td style="width:83%">
<input type="text" name="complemento" id="complemento" style="width:100%">
</td>
</tr>

<tr>
<td style="width:17%">
<label for="alimnetosfav">Alimentos Favoritos:</label>
</td>
<td style="width:83%">
<input type="text" name="alimnetosfav" id="alimnetosfav" style="width:100%">
</td>
</tr>

<tr>
<td style="width:17%">
<label for="alimentosrech">Alimentos Rechazados:</label>
</td>
<td style="width:83%">
<input type="text" name="alimentosrech" id="alimentosrech" style="width:100%">
</td>
</tr>
</table>

<label for="programacomple">Participa en programa de complementacion alimentaria?</label>
<input type="radio" name="programacomple" id="programacomple1" value="1">Si
<input type="radio" name="programacomple" id="programacomple2" value="2">No
<label for="programasnutri"> Cual? </label>
<select name="programasnutri" id="programasnutri">
<option value="-1">Seleccione...</option>    
<option value="1">Donacion barrio</option>
<option value="2">Donacion iglesia</option>
<option value="3">Otro</option>
</select>
</fieldset>

<br>

<fieldset>
<legend>Componente Antropometrico</legend>
<table style="width:100%">
<tr>
<td style="width:13.28%;text-align:right"> 
<label for="pesonutri">Peso Actual(kg):</label>
</td>
<td style="width:13.28%;text-align:left">
<input type="text" name="pesonutri" id="pesonutri" style="width:50%">
</td>
<td style="width:13.28%;text-align:right"> 
<label for="tallanutri">Longitud Actual(cm):</label>
</td>
<td style="width:13.28%;text-align:left">
<input type="text" name="tallanutri" id="tallanutri" style="width:50%">
</td>
<td style="width:13.28%;text-align:right"> 
<label for="pcefalico">P. Cefalico(cm):</label>
</td>
<td style="width:13.28%;text-align:left">
<input type="text" name="pcefalico" id="pcefalico" style="width:50%">
</td>
<td style="width:20.28%;text-align:left">     
    &nbsp;&nbsp;&nbsp;  <img id="imggraficas" src="/ISALUD/imagenes/fotos/grag.png" style="cursor:pointer" alt="grafica" width="28px" height="28px" > 
</td>
</tr>
</table>


<table style="width:100%;" >
<tr style="text-align:center">
<td width="16%">
<label>Indicador: Ref.NCHS</label>
</td>
<td width="10%">
<label>D.E.</label>
</td>
<td width="10%">
<label>Valor p 50</label>
</td>
<td width="10%">
<label>Percentil</label>
</td>
<td colspan="2" width="50%">
<label>Interpretacion Indicador:</label>
</td>
</tr>
<!----------Segunda Fila-------------->
<tr style="text-align:center">
<td>
<label>Peso/Edad</label>
</td>
<td>
<input type="text" name="depesoedad" id="depesoedad" style="width:60%" disabled="disabled">
</td>
<td>
<input type="text" name="valorppesoedad" id="valorppesoedad" style="width:60%" disabled="disabled">
</td>
<td>
<input type="text" name="percentilpesoedad" id="percentilpesoedad" style="width:60%" disabled="disabled">
</td>
<td  style="width:40px;"> 
            <input type="text" id="diagnosticoconsu_nutri" name="diagnosticoconsu_nutri" class="diagnosticoconsu_nutri"  autocomplete="off"  style="width:100%">
            <div id="display_consu_nutri"></div> 
</td>
<td width="40%">
   <img src="../../imagenes/fotos/buscar.png" id="busca" name="busca" class="mas" alt="falla al cargar imagen" width="18px" height="18px" onclick="abreDialogConsu_Nutri('diagnosticoconsu_nutri','diagnosticoconsu2_nutri');" > 
    <input type="text" id="diagnosticoconsu2_nutri" name="diagnosticoconsu2_nutri" class="diagnosticoconsu2_nutri" disabled="true"  style="width:90%"> 
        
</td>
</tr>
<!----------Tercera Fila-------------->
<tr style="text-align:center">
<td>
<label>Talla/Edad</label>
</td>
<td>
<input type="text" name="detallaedad" id="detallaedad" style="width:60%" disabled="disabled">
</td>
<td>
<input type="text" name="valortallaedad" id="valortallaedad" style="width:60%" disabled="disabled">
</td>
<td>
<input type="text" name="percentiltallaedad" id="percentiltallaedad" style="width:60%" disabled="disabled">
</td>
<td  style="width:40px"> 
            <input type="text" id="diagnosticoconsu_nutri_r1" name="diagnosticoconsu_nutri_r1" autocomplete="off"  class="diagnosticoconsu_nutri_r1" style="width:100%">
             <div id="display_consu_nutri_r1"></div> 
</td>
<td width="40%">
   <img src="../../imagenes/fotos/buscar.png" id="busca" name="busca" class="mas" alt="falla al cargar imagen" width="18px" height="18px" onclick="abreDialogConsu_Nutri('diagnosticoconsu_nutri_r1','diagnosticoconsu2_nutri_r1');" > 
    <input type="text" id="diagnosticoconsu2_nutri_r1" name="diagnosticoconsu2_nutri_r1" class="diagnosticoconsu2_nutri_r1" disabled="true"  style="width:90%"> 
        
</td>
</tr>
<!----------Cuarta Fila-------------->
<tr style="text-align:center">
<td>
<label>Peso/Talla</label>
</td>
<td>
<input type="text" name="depesotalla" id="depesotalla" style="width:60%" disabled="disabled">
</td>
<td>
<input type="text" name="valorpesotalla" id="valorpesotalla" style="width:60%" disabled="disabled">
</td>
<td>
<input type="text" name="percentilpesotalla" id="percentilpesotalla" style="width:60%" disabled="disabled">
</td>

<td  style="width:40px"> 
            <input type="text" id="diagnosticoconsu_nutri_r2" name="diagnosticoconsu_nutri_r2" autocomplete="off"  class="diagnosticoconsu_nutri_r2" style="width:100%">
             <div id="display_consu_nutri_r2"></div> 
</td>
<td width="40%">
   <img src="../../imagenes/fotos/buscar.png" id="busca" name="busca" class="mas" alt="falla al cargar imagen" width="18px" height="18px" onclick="abreDialogConsu_Nutri('diagnosticoconsu_nutri_r2','diagnosticoconsu2_nutri_r2');" > 
    <input type="text" id="diagnosticoconsu2_nutri_r2" name="diagnosticoconsu2_nutri_r2" class="diagnosticoconsu2_nutri_r2" disabled="true"  style="width:90%"> 
        
</td>
</tr>
<!----------Quinta Fila-------------->
<tr style="text-align:center">
<td>
<label>ICM para &lt; &gt; 9años</label>
</td>
<td>
<input type="text" name="deimc" id="deimc" style="width:60%" disabled="disabled">
</td>
<td>
<input type="text" name="valorimc" id="valorimc" style="width:60%" disabled="disabled">
</td>
<td>
<input type="text" name="percentilimc" id="percentilimc" style="width:60%" disabled="disabled">
</td>
<td  style="width:40px"> 
            <input type="text" id="diagnosticoconsu_nutri_r3" name="diagnosticoconsu_nutri_r3" autocomplete="off"  class="diagnosticoconsu_nutri_r3" style="width:100%">
             <div id="display_consu_nutri_r3"></div> 
</td>
<td width="40%">
   <img src="../../imagenes/fotos/buscar.png" id="busca" name="busca" class="mas" alt="falla al cargar imagen" width="18px" height="18px" onclick="abreDialogConsu_Nutri('diagnosticoconsu_nutri_r3','diagnosticoconsu2_nutri_r3');" > 
    <input type="text" id="diagnosticoconsu2_nutri_r3" name="diagnosticoconsu2_nutri_r3" class="diagnosticoconsu2_nutri_r3" disabled="true"  style="width:90%"> 
        
</td>
</tr>
</table>

<label>RECOMENDACIONES</label><br>
<textarea rows="3" style="width:100%" name="recomendacionesnutri" id="recomendacionesnutri"></textarea>
<label>OBSERVACIONES</label><br>
<textarea rows="3" style="width:100%" name="observacionesnutri" id="observacionesnutri"></textarea>
</fieldset>
</form>
<br>

<%
        ba.cierraResultado(resu1);  
        ba.cerrar();
%>
<div id="divsignos" name="divsignos">
        
 <div name="dilog_cie10_nutri" id="dilog_cie10_nutri" >  
                                 <table id="listcie10_nutri" ></table>
                                 <div id="pagercie10_nutri"></div> 
</div> 
             
    
</div>
</body>

</html>




