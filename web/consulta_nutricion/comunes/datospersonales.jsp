
<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" >
<style type="text/css">
body
{
font-family:"Lucida Sans";

}

#display,#display2
{
width:250px;
display:none;
/*float:right; margin-right:30px;*/
border-left:solid 1px #dedede;
border-right:solid 1px #dedede;
border-bottom:solid 1px #dedede;
overflow:hidden;
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


</style>        
<script type="text/javascript" language="javascript">
  function cambiaAnt(){
                     var sela =document.getElementById("tipo_antecedente");
                     var valsela=sela.options[sela.selectedIndex].value;
                     $("#divanecedente").load("../comunes/cambia_antecedente.jsp?dato="+valsela+"");                           
                      }
  function cambiaAnt2(){
                      var sela =document.getElementById("tipo_antecedente2");
                      var valsela=sela.options[sela.selectedIndex].value;
                      var sela2 =document.getElementById("id_perentesco");
                      var valsela2=sela2.options[sela2.selectedIndex].value;
                      $("#divanecedente2").load("../comunes/cambia_antecedente2.jsp?dato="+valsela+"&dato2="+valsela2+"");                           
                       }
                      
  function emmanuel(nom){
                       // alert("entro "+nom);
                       document.getElementById("descripcion_ant").value=nom;
                       var bb=document.getElementById("display");
                       bb.style.display="none";
                      } 
  function emmanuel2(nom){
                       // alert("entro "+nom);
                       document.getElementById("descripcion_ant_f").value=nom;
                       var bb= document.getElementById("display2");
                       bb.style.display="none";
                      }                     
                      
  //dialog  
  $(function() {
     $( "#dialog1" ).dialog({
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

  $(function() {
     $( "#dialog2" ).dialog({
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
             
             
             
   $('#f1').submit(function() {
                            var nom = document.getElementById("descripcion_ant").value;               
                           if( nom == null || nom.length == 0 || /^\s+$/.test(nom) ) {
                                                      document.getElementById('validacione1').innerHTML = 'La descripcion es obligatoria';
                                                       return false;  
                                                                      }                                            
                           else if($("#edad_ant").val().length < 1) { 
                                                        document.getElementById('validacione1').innerHTML = 'La edad es obligatoria';
                                                       return false;  
                                                                      } 
                           if( nom.length >= 400 ) {
                                                      document.getElementById('validacione1').innerHTML = 'La descripcion tiene como maximo 390 caracteres';
                                                       return false;  
                                                                      }
                           else if($("#edad_ant").val().length > 100) { 
                                                        document.getElementById('validacione1').innerHTML = 'La edad tiene como maximo 100 caracteres';
                                                       return false;  
                                                                      } 
                           var sela =document.getElementById("antecedentee");
                           var valsela=sela.options[sela.selectedIndex].value;                                         
                           if(valsela=="2212aei"){
                                                  document.getElementById('validacione1').innerHTML = 'Favor seleccione antecedente';
                                                       return false;      
                                                  }  
                              document.getElementById("descripcion_ant").value=nom.replace(/\r\n|\n|\r/g, " ");
                                           
                            //document.forms.f1.submit();                                                
                         $("#dialog1").dialog( "close" );
            
            
                    // Enviamos el formulario usando AJAX
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#resu').html(data);
                                  jQuery("#list24").jqGrid('setCaption',"Antecedentes Personales ").trigger('reloadGrid');
                                  $("#tipo_antecedente option[value='2212aei']").attr("selected",true);
                                  $("#divanecedente").load("../comunes/cambia_antecedente.jsp?dato=2212aei"); 
                              }                             
                          })
                     
                          return false;
                      });      
                      
          $('#f2').submit(function() {
                            var nom = document.getElementById("descripcion_ant_f").value;               
                           if( nom == null || nom.length == 0 || /^\s+$/.test(nom) ) {
                                                      document.getElementById('validacione2').innerHTML = 'La descripcion es obligatoria';
                                                       return false;  
                                                                      } 
                           if( nom.length >= 400 ) {
                                                      document.getElementById('validacione2').innerHTML = 'La descripcion tiene como maximo 390 caracteres';
                                                       return false;  
                                                                      }  
                           var sela =document.getElementById("antecedentee2");
                           var valsela=sela.options[sela.selectedIndex].value;                                         
                           if(valsela=="2212aei"){
                                                  document.getElementById('validacione2').innerHTML = 'Favor seleccione antecedente';
                                                       return false;      
                                                  }     
                       document.getElementById("descripcion_ant_f").value=nom.replace(/\r\n|\n|\r/g, " ");
                                             
                            //document.forms.f1.submit();                                                
                         $("#dialog2").dialog( "close" );
            
            
                    // Enviamos el formulario usando AJAX
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#resu').html(data);
                                  jQuery("#list25").jqGrid('setCaption',"Antecedentes Familiares").trigger('reloadGrid');
                                  $("#tipo_antecedente2 option[value='2212aei']").attr("selected",true);
                                  $("#divanecedente2").load("../comunes/cambia_antecedente2.jsp?dato=2212aei"); 
                              }                             
                          })
                     
                          return false;
                      });          
             
             
  $(function(){
		     $("#fecha_t_ante").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#fecha_t_ante').datepicker($.datepicker.regional['es']);
		     $('#fecha_t_ante').datepicker("option","showAnim","slideDown");
		     $('#fecha_t_ante').datepicker("option","dateFormat","yy-mm-dd");
		     		
	});
$(function(){
		     $("#calendario").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#calendario').datepicker($.datepicker.regional['es']);
		     $('#calendario').datepicker("option","showAnim","slideDown");
		     $('#calendario').datepicker("option","dateFormat","yy-mm-dd");
		     		
	});
		
$(function(){
		     $("#calendariofum").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#calendariofum').datepicker($.datepicker.regional['es']);
		     $('#calendariofum').datepicker("option","showAnim","slideDown");
		     $('#calendariofum').datepicker("option","dateFormat","yy-mm-dd");
	});
		
$(function(){
		     $("#calendariofup").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });
			 $('#calendariofup').datepicker($.datepicker.regional['es']);
		     $('#calendariofup').datepicker("option","showAnim","slideDown");
		     $('#calendariofup').datepicker("option","dateFormat","yy-mm-dd");		     
	
		});

$(function(){
		     $("#calendarioultimacitologia").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#calendarioultimacitologia').datepicker($.datepicker.regional['es']);
		     $('#calendarioultimacitologia').datepicker("option","showAnim","slideDown");
		     $('#calendarioultimacitologia').datepicker("option","dateFormat","yy-mm-dd");
		});


  $(document).ready(function(){
             
 <%
         request.setCharacterEncoding("UTF-8");
         String d="";
         if(session.getAttribute("serial_pacinete")!=null){d=""+session.getAttribute("serial_pacinete");}
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb(); 
         
     String sql="select p_nom,s_nom,p_ape,s_ape,id_person,fecha_naci,pa.cod_estado_civil,nivel_sisben,"
              + "pe.genero,pe.id_rh,mu.descripcion, de.descripcion,barrio,pe.direccion,pe.email,pe.telefono,"
              + "'','',nu_carnet,pa.cod_zona,pe.foto,pa.id_orientacion,pa.vih,'',tid.descripcion,pa.embarazo_activo"
              + " from personas pe, pacientes pa,departamento de, municipio mu,tipo_id tid where"
              + " pa.serial_persona=pe.serial and   pe.serial='"+d+"' and tid.idtipo_id=pe.tipo_id and "
              + "mu.id_muni=pe.id_muni and de.id_departo=pe.id_depto and mu.id_depto=de.id_departo ;";
            ResultSet resu=null;
            
          
          try{  resu=ba.consultas(sql);}
          catch(Exception e){}
           
          
            String datos[]=new String[26];
            
            for(int i=0;i<26;i++){
                datos[i]="";
            }
            int band_co=0;
         
	try{
	    while (resu.next()&&resu!=null) { band_co=1;  
                         if(resu.getString(1)!=null){datos[0]=resu.getString(1);}//primer nonbre
                         if(resu.getString(2)!=null){datos[1]=resu.getString(2);}//segundo nombre
                         if(resu.getString(3)!=null){datos[2]=resu.getString(3);}//primer apellido
                         if(resu.getString(4)!=null){datos[3]=resu.getString(4);}//segundo apellido
                         if(resu.getString(5)!=null){datos[4]=resu.getString(5);}//cedula
                         if(resu.getString(6)!=null){datos[5]=resu.getString(6);}//fecha nacimiento
                         if(resu.getString(7)!=null){datos[6]=resu.getString(7);}//estado civil
                         if(resu.getString(8)!=null){datos[7]=resu.getString(8);}//nivel sisven
                         if(resu.getString(9)!=null){datos[8]=resu.getString(9);}//genero
                         if(resu.getString(10)!=null){datos[9]=resu.getString(10);}//rh
                         if(resu.getString(11)!=null){datos[10]=resu.getString(11);}//municipio
                         if(resu.getString(12)!=null){datos[11]=resu.getString(12);}//departamento
                         if(resu.getString(13)!=null){datos[12]=resu.getString(13);}//barrio
                         if(resu.getString(14)!=null){datos[13]=resu.getString(14);}//direccion
                         if(resu.getString(15)!=null){datos[14]=resu.getString(15);}//email
                         if(resu.getString(16)!=null){datos[15]=resu.getString(16);}//telefono
                         if(resu.getString(17)!=null){datos[16]=resu.getString(17);}//nivel educativo
                         if(resu.getString(18)!=null){datos[17]=resu.getString(18);}//eps
                         if(resu.getString(19)!=null){datos[18]=resu.getString(19);}//numero carnet
                         if(resu.getString(20)!=null){datos[19]=resu.getString(20);}//zona
                         if(resu.getString(21)!=null){datos[20]=resu.getString(21);}//foto
                         if(resu.getString(22)!=null){datos[21]=resu.getString(22);}//orientacion sexual
                         if(resu.getString(23)!=null){datos[22]=resu.getString(23);}//vih
                         if(resu.getString(24)!=null){datos[23]=resu.getString(24);}//tipo usuario
                         if(resu.getString(25)!=null){datos[24]=resu.getString(25);}//tipo identificacion
                         if(resu.getString(26)!=null){datos[25]=resu.getString(26);}//embarazo activo
                     }
        }
        catch(SQLException ex){band_co=0; }
	catch(Exception exe){band_co=0; }
         
       
            
        ba.cierraResultado(resu); 
        
               
        
        
        
       %>                                                       
   
 var anchoPantalla=document.body.offsetWidth -((document.body.offsetWidth*24)/100)-70;
 var anchoPantalla2=(anchoPantalla/2);


             jQuery("#list24").jqGrid({
   	url:'../comunes/carga_antecedentes_personales.jsp?q=2',
	datatype: "json",
   	colNames:['ID','Tipo','Antecedente','Comentario','Edad','Fecha','id_empleado','id_consulta','id_permiso'],
   	colModel:[
                {name:'id',index:'id', width:0,hidden:true,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'tipo_a',index:'t.descripcion', width:((anchoPantalla2*19)/100),search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'antecedente1',index:'d.descripcion', width:((anchoPantalla2*25)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'antecedente2',index:'a.descripcion', width:((anchoPantalla2*25)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'edad',index:'a.edad', width:((anchoPantalla2*10)/100),search:true, editable: true,required : true,editoptions: {maxlength: 200},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'fecha',index:'a.fecha', width:((anchoPantalla2*14)/100),search:true, editable: true,required : true,editoptions: {maxlength: 200},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'id_empleado',index:'id_empleado', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'id_consulta',index:'id_consulta', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'id_permiso',index:'id_permiso', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		],
   	rowNum:6,
   	rowList:[15,30,45],
   	pager: '#pager24',
   	sortname: 't.descripcion',
    viewrecords: true,
    sortorder: "desc",
     width:anchoPantalla/2,
    shrinkToFit: false,
    rownumbers: false,
	caption: "Antecedentes Personales"
	
});
jQuery("#list24").jqGrid('navGrid','#pager24',{add:false,edit:false,del:false,search:true,view: true},
                            {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:360} //para el view
 								);
 jQuery("#list24").jqGrid('navButtonAdd','#pager24',
     {
      caption:"",
      buttonicon:"ui-icon-circle-plus",
      onClickButton:function(){ 
                                        var bb=document.getElementById("display");
                                            bb.style.display="none";
                                        document.getElementById("descripcion_ant").value="";
                                        document.getElementById("edad_ant").value="";
                                        document.getElementById('validacione1').innerHTML ='';
                                       $( "#dialog1" ).dialog( "open" );
      },
      position:"last",
      title:"Agregar Antecedente Personal",
      cursor: "pointer"});
  
  
    jQuery("#list24").jqGrid('navButtonAdd','#pager24',
     {
      caption:"",
      buttonicon:"ui-icon-trash",
      onClickButton:function(){ 
                                var id = jQuery("#list24").jqGrid('getGridParam','selrow');
                                if (id)	{
                                        var ret = jQuery("#list24").jqGrid('getRowData',id);
                                        var consu="<% out.print(""+session.getAttribute("serial_consulta")+""); %>";
                                        var permi="<% out.print(""+session.getAttribute("permiso")+""); %>";
                                        var idprof="<% out.print(""+session.getAttribute("id")+""); %>";
                                        var consu2=""+ret.id_consulta+"";
                                        var permi2=""+ret.id_permiso+"";
                                        var idprof2=""+ret.id_empleado+"";
                                        if(consu==consu2 && permi==permi2 && idprof==idprof2 ){
                                                          apprise("¿Esta seguro de eliminar el antecedente personal seleccionado: "+ret.antecedente1+" ?", {'verify':true}, function(opcion) {
                                                            if(opcion) {                                                                         
                                                                          $("#id_ant_p").val(""+id+"");
                                                                          document.form_borra_ant_per.submit();  
                                                                          setTimeout ('recagatdtp(1)', 500); 
                                                                       }
                                                           });       
                                                        }
                                       else{alert("Solo se permiten eliminar antecedentes personales ingresados en esta consulta");}
                                }else { alert("Selecciona el antecedentes personales a eliminar");}
                                
                              },
      position:"last",
      title:"Borrar Antecedente Personal",
      cursor: "pointer"}); 
  
  
  
  
  
  
 
 jQuery("#list25").jqGrid({
   	url:"../comunes/carga_antecedentes_familiares.jsp?q=2",
	datatype: "json",
        colNames:['ID','Parentesco','Tipo','Antecedente','Descripcion','Vivo','id_empleado','id_consulta','id_permiso'],
   	colModel:[
   		{name:'id',index:'id', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'p_descripcion',index:'p.descripcion', width:((anchoPantalla2*16)/100),search:true,editable: true,required : true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'t_descripcion',index:'t.descripcion', width:((anchoPantalla2*19)/100),search:true, editable: true,required : true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'d_descripcion',index:'d.descripcion', width:((anchoPantalla2*22)/100),search:true, editable: true,required : true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'a_descripcion',index:'a.descripcion', width:((anchoPantalla2*27)/100),search:true, editable: true,required : true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'vivo',index:'a.vivo', width:((anchoPantalla2*9)/100),search:true, editable: true,required : true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'id_empleado',index:'id_empleado', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'id_consulta',index:'id_consulta', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'id_permiso',index:'id_permiso', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		],
   	rowNum:15,
   	rowList:[15,30,45],
   	pager: '#pager25',
   	sortname: 'p.descripcion',
    viewrecords: true,    
    sortorder: "desc",
     width:anchoPantalla/2,
    shrinkToFit: false,
    rownumbers: false,
    editurl: 'editaCli.php',
	caption: "Antecedentes Familiares"
	
});
jQuery("#list25").jqGrid('navGrid','#pager25',{add:false,edit:false,del:false,search:true,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:160} //para el view
 								);
 jQuery("#list25").jqGrid('navButtonAdd','#pager25',
     {
      caption:"",
      buttonicon:"ui-icon-circle-plus",
      onClickButton:function(){ 
                                       var bb=document.getElementById("display2");
                                           bb.style.display="none";
                                       document.getElementById("descripcion_ant_f").value="";
                                       document.getElementById('validacione2').innerHTML ='';
                                       $( "#dialog2" ).dialog( "open" );
      },
      position:"last",
      title:"Agregar Antecedente",
      cursor: "pointer"});


    jQuery("#list25").jqGrid('navButtonAdd','#pager25',
     {
      caption:"",
      buttonicon:"ui-icon-trash",
      onClickButton:function(){ 
                                var id = jQuery("#list25").jqGrid('getGridParam','selrow');
                                if (id)	{
                                        var ret = jQuery("#list25").jqGrid('getRowData',id);
                                        var consu="<% out.print(""+session.getAttribute("serial_consulta")+""); %>";
                                        var permi="<% out.print(""+session.getAttribute("permiso")+""); %>";
                                        var idprof="<% out.print(""+session.getAttribute("id")+""); %>";
                                        var consu2=""+ret.id_consulta+"";
                                        var permi2=""+ret.id_permiso+"";
                                        var idprof2=""+ret.id_empleado+"";
                                        if(consu==consu2 && permi==permi2 && idprof==idprof2 ){
                                                          apprise("¿Esta seguro de eliminar el antecedente familiar seleccionado: "+ret.antecedente1+" ?", {'verify':true}, function(opcion) {
                                                            if(opcion) {                                                                         
                                                                          $("#id_ant_f").val(""+id+"");
                                                                          document.form_borra_ant_fam.submit();  
                                                                          setTimeout ('recagatdtp(2)', 500); 
                                                                       }
                                                           });       
                                                        }
                                       else{alert("Solo se permiten eliminar antecedentes familiares en esta consulta");}
                                }else { alert("Selecciona el antecedente familiar eliminar");}
                                
                              },
      position:"last",
      title:"Borrar Antecedente Personal",
      cursor: "pointer"}); 

 

//---------------------------------------------
});
 
 //------------------------------------------------

 //-----------------------------------------------


function recagatdtp(dat){
         if(dat==1){jQuery("#list24").jqGrid('setCaption',"Antecedentes Personales ").trigger('reloadGrid'); }
    else if(dat==2){jQuery("#list25").jqGrid('setCaption',"Antecedentes Familiares ").trigger('reloadGrid'); }    
}


</script> 
<title></title>

</head>

<body>
      <% request.setCharacterEncoding("UTF-8");
        //  out.print("nom "+session.getAttribute("nombre")+" clave "+session.getAttribute("clave")+" id "+session.getAttribute("id")+" permiso "+session.getAttribute("permiso")+" s agenda "+session.getAttribute("serial_agenda" )+" s paciente"+session.getAttribute("serial_pacinete"));
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){
          
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
    
    
        
           
           String histoc=""+session.getAttribute("histocreada_psico");   
           if(histoc.compareTo("1")==0){
           out.print("<h3 style='color:red'>Historia clínica nutricional abierta por primera vez</h3><br>");           
           }  
             
    %>
    
<form id="modifdatosp" name="modifdatosp" method="post" target="daotp-ifr1" accept-charset="UTF-8" action="modifdatosp.jsp">      
<table  style="width:100%" border="0">
<tr>
<td style="width:20%">
<label for="nombre1">Primer Nombre </label>
</td>

<td style="width:20%">
<label for="nombre2">Segundo Nombre </label>
</td>

<td style="width:20%">
<label for="apellido1">Primer Apellido </label>
</td>

<td style="width:20%">
<label for="apellido2">Segundo Apellido </label>
</td>

<td style="width:20%" rowspan="8">
    <input type="image" name="fo" size="25" id="fo" src="../../imagenes/fotos/<% out.print(datos[20]); %>" alt="Pintura geométrica"  onerror="this.src='../../imagenes/fotos/paciente.png'" style="width:auto;height:180px">
</td>
</tr>

<!--Segunda Fila-->

<tr>
<td style="width:20%">
    <input type="text" name="nombre1" size="25" id="nombre1" maxlength="30" disabled="disabled" value="<% out.print(datos[0]); %>" style="width:95%">
</td>

<td style="width:20%">
<input type="text" name="nombre2" size="25" id="nombre2" maxlength="30" disabled="disabled"  value="<% out.print(datos[1]); %>" style="width:95%">
</td>

<td style="width:20%">
<input type="text" name="apellido1" size="25" id="apellido1" maxlength="30" disabled="disabled"  value="<% out.print(datos[2]); %>" style="width:95%">
</td>

<td style="width:20%">
<input type="text" name="apellido2" size="25" id="apellido2" maxlength="30" disabled="disabled"  value="<% out.print(datos[3]); %>" style="width:95%">
</td>

</tr>

<!--Tercera Fila-->

<tr>

<td style="width:20%">
<label for="numidentificacion"><% out.print(datos[24]); %></label>
</td>

<td style="width:20%">
<label for="fechanacimiento">Fecha de Nacimiento </label>
</td>

<td style="width:20%">
<label for="edad">Edad </label>
</td>

<td style="width:20%">
<label for="estadocivil">Estado Civil </label>
</td>
</tr>

<!--Cuarta Fila-->

<tr>
<td style="width:20%">
<input type="text" name="numidentificacion" size="25" id="numidentificacion" maxlength="30" disabled="disabled" value="<% out.print(datos[4]); %>" style="width:95%">
</td>

<td style="width:20%">
<input type="text" name="fechanacimiento" size="25" id="fechanacimiento" maxlength="30" disabled="disabled" value="<% out.print(datos[5]); %>" style="width:95%">
</td>

<td style="width:20%">
    <%  String fechanaci =datos[5]; 
    edad s = new edad();
    String adadcita=s.edad(fechanaci);

%>
<input type="text" name="edad" size="25" id="edad" maxlength="30" disabled="disabled" value="<% out.print(adadcita); %>" style="width:95%">
</td>

<td style="width:20%">
      <select id="estado_civil" name="estado_civil" style="width:95%" >
          <% 
            String sql55="select idestado_civil,descripcion from estado_civil;";
               String estadociv="";
            ResultSet resu55=null;
            try{  resu55=ba.consultas(sql55);
                  while (resu55.next()&&resu55!=null) {  
                      if(datos[6].compareTo(resu55.getString(1))==0){ out.print("<option value='"+resu55.getString(1)+"' SELECTED>"+resu55.getString(2)+"</option>");estadociv=resu55.getString(2);}
                                                                else{ out.print("<option value='"+resu55.getString(1)+"'>"+resu55.getString(2)+"</option>");}
                                                       }
               }                       
            catch(SQLException ex){}
            catch(Exception exe){}
            ba.cierraResultado(resu55);  
         %>
         </select> 
         <input type="hidden" name="estado_civilant" id="estado_civilant" value="<% out.print(estadociv); %>">         
</td>
</tr>

<!--Quinta Fila-->

<tr>

<td style="width:20%">
<label for="nivelsisben">Nivel Sisben </label>
</td>

<td style="width:20%">
<label for="sexo">Sexo </label>
</td>

<td style="width:20%">
<label for="rh">RH </label>
</td>

<td style="width:20%">
<label for="orientacionsexual">Orientacion Sexual </label>
</td>

</tr>

<!--Sexta Fila-->

<tr>
<td style="width:20%">
<input type="text" name="nivelsisben" size="25" id="nivelsisben" maxlength="30" disabled="disabled" value="<% out.print(datos[7]); %>">
</td>

<td style="width:20%">
<input type="text" name="sexo" size="25" id="sexo" maxlength="30" disabled="disabled"  value="<% out.print(datos[8]); %>" style="width:95%">
</td>

<td style="width:20%">
<!-- <input type="text" name="rh" size="25" id="rh" maxlength="30" disabled="disabled"  value="<% //out.print(datos[9]); %>" style="width:95%"> -->
  <%    
                             String sql2="select descripcion from rh where id_rh='"+datos[9]+"';";
                             String rhanter="";
                             ResultSet resurh=null;
                             try{  resurh=ba.consultas(sql2);
                                   while (resurh.next()&&resurh!=null) { 
                                                   out.print("<input type='text' disabled='disabled' value='"+resurh.getString(1)+"' style='width:95%' >");
                                                                                  
                                                                    }
                                 }                       
                             catch(SQLException ex){}
                             catch(Exception exe){}
                             ba.cierraResultado(resurh);  
                        %>                          

</td>

<td style="width:20%">
 <select id="orientacion_sex" name="orientacion_sex" style="width:95%" >
          <% 
            String sql7="select id_sex,descripcion from oreintacion_sex;";
            String sex="";
            ResultSet resuoris=null;
            try{  resuoris=ba.consultas(sql7);
                  while (resuoris.next() && resuoris!=null) {  
                      if(datos[21].compareTo(resuoris.getString(1))==0){out.print("<option value='"+resuoris.getString(1)+"' SELECTED>"+resuoris.getString(2)+"</option>");sex=""+resuoris.getString(2);}
                      else{ out.print("<option value='"+resuoris.getString(1)+"'>"+resuoris.getString(2)+"</option>");}
                                                    }
               }                       
            catch(SQLException ex){}
            catch(Exception exe){}
            ba.cierraResultado(resuoris);  
         %>
         </select> 
           <input type="hidden" name="orientacion_sexant" id="orientacion_sexant" value="<% out.print(sex); %>"> 
       </td>
</tr>

<!--Septima Fila-->

<tr>

<td style="width:20%">
<label for="departamento">Departamento </label>
</td>

<td style="width:20%">
<label for="ciudad">Ciudad </label>
</td>

<td style="width:40%" colspan="2">
<label for="direccion">Direccion</label>
</td>

</tr>

<!--Octava Fila-->

<tr>
<td style="width:20%">
<input type="text" name="departamento" size="25" id="departamento" maxlength="30" disabled="disabled"  value="<% out.print(datos[11]); %>" style="width:95%">
</td>

<td style="width:20%">
<input type="text" name="ciudad" size="25" id="ciudad" maxlength="30" disabled="disabled" value="<% out.print(datos[10]); %>" style="width:95%">
</td>

<td style="width:40%" colspan="2">
    <input type="text" name="direccion" size="25" id="direccion" maxlength="30" disabled="disabled" value="<% out.print(datos[13]); %>" style="width:98%">
</td>
</tr>

<!--Novena Fila-->

<tr>
<td>
<label for="barrio">Barrio </label>
</td>
<td>
<label for="vih"></label>
</td>
<td>
</td>
<td>

</td>
<td>

</td>
</tr>

<!--Decima Fila-->

<tr>
<td>
 <input type="text" name="barrio" size="25" id="barrio" maxlength="30" disabled="disabled" value="<% out.print(datos[12]); %>" style="width:95%">
</td>
<td></td>
<td></td>
<td>

</td>
<td>

</td>
</tr>
</table>
</form>
<!--tabla de antecedentes y retrovirales-->
<table width="100%">
<tr>
<td width="50%">
<fieldset>
<legend>Antecedentes Personales</legend>
<center>
<table id="list24" ></table>
<div id="pager24"></div> 
</center>
</fieldset>
</td>
<td>
<fieldset>
<legend>Antecedentes Familiares</legend>
<center>
<table id="list25" ></table>
<div id="pager25"></div> 
</center>
</fieldset>
</td>
</tr>

<tr>

     
<td>

</td>

</tr>



</table>

 

<div id="dialog1" title="Nuevo Antecedente Personal">
    <div>
        <p id="validacione1" name="validacione1" style="color: red"></p>
        <form id="f1" name="f1" action="../comunes/crea_antecedente_personal.jsp" method='post'  >
          <label for="tipo_antecedente">Tipo Antecedente</label><br>
                  <select name="tipo_antecedente" id="tipo_antecedente" onchange="cambiaAnt()">
                        <option value='2212aei'>Seleccione tipo de antecedente</option>   
                        <%
                       sql="select * from tipo_antecedente;";    
                        ResultSet resu2=ba.consultas(sql);
                        try{
                            while (resu2.next()&&resu2!=null) {   
                                       out.print("<option value='"+resu2.getString(1)+"'>"+resu2.getString(2)+"</option>");
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cierraResultado(resu2);
                      
                         %>
                    </select>  <br> 
             <label for="antecedentee">Antecedente</label><br>
             <div id="divanecedente" name="divanecedente">
             <select name="antecedentee" id="antecedentee">
                        <option value='2212aei'>Seleccione tipo de antecedente</option> 
             </select>
             </div>  <br>  <br>        
       
             <label for="descripcion_ant">Descripcion</label><br>
             <textarea  name="descripcion_ant" id="descripcion_ant" rows="3"  maxlength="398" style="width: 100%" class="text ui-widget-content ui-corner-all"> </textarea>
             <div id="display"></div><br><br> 
             
             <label for="edad">Edad</label><br>
             <input type="text" name="edad_ant" id="edad_ant" value=""    maxlength="100"  class="text ui-widget-content ui-corner-all" />
             <br><br>
             <center><input type="submit" id="aceptar" name="aceptar"   value="Agregar"></center>
        </form>    
  </div>
</div>
<div id="dialog2" title="Nuevo Antecedente Familiar">
    <div>
        <p id="validacione2" name="validacione1" style="color: red"></p>
        <form id="f2" name="f2" action="../comunes/crea_antecedente_familiar.jsp" method='post'  >
               <label for="tipo_antecedente">Tipo Antecedente</label><br>
                  <select name="tipo_antecedente2" id="tipo_antecedente2" onchange="cambiaAnt2()">
                        <option value='2212aei'>Seleccione tipo de antecedente</option>   
                        <%
                       sql="select * from tipo_antecedente;";    
                        ResultSet resUu2=ba.consultas(sql);
                        try{
                            while (resUu2.next()&&resUu2!=null) {   
                                       out.print("<option value='"+resUu2.getString(1)+"'>"+resUu2.getString(2)+"</option>");
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cierraResultado(resUu2);
                      
                         %>
                    </select>  <br> 
             <label for="antecedentee">Antecedente</label><br>
             <div id="divanecedente2" name="divanecedente2">
             <select name="antecedentee2" id="antecedentee2">
                        <option value='2212aei'>Seleccione tipo de antecedente</option> 
             </select>
             </div>  <br> 
            
            <label for="id_perentesco">Parentesco</label><br>
                   <select name="id_perentesco" id="id_perentesco" onchange="cambiaAnt2()">
                            
                        <%
                       sql="select * from parentesco;";    
                        ResultSet resu3=ba.consultas(sql);
                        try{
                            while (resu3.next()&&resu3!=null) {   
                                       out.print("<option value='"+resu3.getString(1)+"'>"+resu3.getString(2)+"</option>");
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cierraResultado(resu2);
                      
                         %>
                    </select>  <br>  <br>               
       
             <label for="descripcion_ant_f">Descripcion</label><br>
             <textarea  name="descripcion_ant_f" id="descripcion_ant_f" rows="3"  maxlength="398" style="width: 100%" class="text ui-widget-content ui-corner-all"> </textarea>
             <div id="display2"></div><br>
             
             <label for="pari_vive">Edad</label><br>
             <select id="pari_vive" name="pari_vive">
                 <option value="viv@">viv@</option>
                 <option value="muert@">muert@</option>
             </select>
             
             <br><br>
             <center><input type="submit" id="aceptar" name="aceptar"   value="Agregar"></center>
        </form>    
  </div>
</div>
<div id="resu" name="resu"></div>
<br> 
                     
<iframe name="daotp-ifr1" id="daotp-ifr1" style="display:none"></iframe>
<iframe name="daotp-ifr2" id="daotp-ifr2" style="display:none"></iframe>

<iframe name="iframe_b_a_f" id="iframe_b_a_f" style="display: none" > </iframe> 
<form id="form_borra_ant_fam" name="form_borra_ant_fam" action="../comunes/borra_ant_fam.jsp" target="iframe_b_a_f" method="post">
    <input type="hidden" name="id_ant_f" id="id_ant_f">
</form>   

<iframe name="iframe_b_a_p" id="iframe_b_a_p" style="display: none" > </iframe> 
<form id="form_borra_ant_per" name="form_borra_ant_per" action="../comunes/borra_ant_per.jsp" target="iframe_b_a_p" method="post">
    <input type="hidden" name="id_ant_p" id="id_ant_p">
</form>  
<div id="nada" name="nada"></div>
<% ba.cerrar(); %>
</body>

</html>