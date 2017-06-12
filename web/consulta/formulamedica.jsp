<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8" >

<script type="text/javascript" language="javascript">
    
var caja1_f="";
var caja2_f="";
         $(document).ready(function(){
             jQuery("#list100").jqGrid({
   	url:'carga_formula_medica.jsp?q=2',
	datatype: "json",
   	colNames:['serial','Descripción','Via Administración','Forma Farmacéutica','Concentración','Cantidad','Tiempo','Posologia','CIE 10'],
   	colModel:[
                {name:'id',index:'id',hidden:true,width:0,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'producto',index:'producto', width:285,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcion',index:'d0', width:115,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'f',index:'d1', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'d2',index:'d2', width:115,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	        {name:'d3',index:'d3', width:57,search:true,align: 'center', editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	        {name:'ttra',index:'ttra', width:79,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'poso',index:'poso', width:170,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'cie',index:'cie',width:55, align: 'left', editable: true, sortable: true, edittype:'password', editrules: { edithidden: true }, hidden: true,editoptions: {maxlength: 10},searchoptions:{sopt:['cn','eq']}}
   	 ],
   	rowNum:15,
   	rowList:[15,30,45],
   	pager: '#pager100',
   	sortname: 'fo.serial',
    viewrecords: true,
    sortorder: "asc",
    shrinkToFit: false,//columnas tamaño dato
    rownumbers: false,    
   // height: 239,
    height: 'auto',
    width:995,
    editurl: 'borra_med_fromu.jsp',
	caption: "FORMULA",
	ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
	                                     NuevoCaso2(""+cedula_nit+"");  }
	
});
jQuery("#list100").jqGrid('navGrid','#pager100',{add:false,edit:false,del:true,search:false,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
							{width:370,top:150,left:550}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420,top:150,left:450} //para el view
 								);

 });
 
 
 function abreDialog_for(dato1,dato2){
                               var bb=document.getElementById("display_consu_for");
                               bb.style.display="none";
                                     
                               caja1_f=dato1;
                               caja2_f=dato2;
                             //  jQuery("#list_form").jqGrid('setCaption',"CIE 10").trigger('reloadGrid');
                               $("#form_10").dialog("open");
                                 }
 $(function() {
     $( "#form_10" ).dialog({
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
      width:'1100px'
    });});  

$(document).ready(function(){
      
    jQuery("#list_form").jqGrid({
   	url:'carga_medicamentos.jsp?q=2',
	datatype: "json",
    // select DISTINCT m.serial,m.producto,,m.cod_tres,v.descripcion,f.descripcion,m.concentracion,u.descripcion from medicamentos m,forma_farmaceutica f,via_admin v,unidad_medida u where m.forma_farmaceutica=f.id_forma_farmaceutica and m.via_administracion=v.id_via_admin and m.unidad_medida=u.id_unidad_medida
        colNames:['serial','CUM','Nombre Generico','Descripción comecial','Via Administración','Forma Farmacéutica','Concentración','Producto'],
   	colModel:[
                {name:'id',index:'id',hidden:true,width:0,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'cum',index:'cum', width:60,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcion_atc',index:'descripcion_atc', width:340,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcion_comercial',index:'descripcion_comercial', width:340,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcion',index:'d0', width:130,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'f',index:'d1', width:130,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'d2',index:'d2', width:130,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	        {name:'producto',index:'producto', width:340,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	],
   	rowNum:11,
   	rowList:[10,20,30,40,400],
   	pager: '#pager_form',
   	sortname: 'm.producto',
        viewrecords: true,
        sortorder: "asc",
        height: 339,
        width:1075,
        shrinkToFit: false,//columnas tamaño dato
        rownumbers: false,
        editurl: 'editaCli.php',
	caption: "Medicamentos",
	ondblClickRow: function(id){
                                    var ret = jQuery("#list_form").jqGrid('getRowData',id);
                                    //alert(""+ret.id_subcie10+" "+ret.descripcion+"");   
                                    document.getElementById(""+caja1_f+"").value=""+ret.cod_atc;
                                    document.getElementById(""+caja2_f+"").value=""+ret.producto;
                                    document.getElementById("seria_medic").value=""+ret.id;
                                    document.getElementById("concentra_for").value=""+ret.d2;
                                    document.getElementById("foma_far").value=""+ret.f;
                                    document.getElementById("viaadmin_med").value=""+ret.descripcion;
                                    $("#form_10").dialog( "close" );
                                  }	
});

  <%    int validaf=Integer.parseInt((String)session.getAttribute("validafor"));
        if(validaf==1){
            %>
          jQuery("#list_form").jqGrid('navGrid','#pager_form',{add:false,edit:false,del:false,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);
               <%
        out.print("jQuery('#list_form').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});");
        session.setAttribute("validafor","2");
        }
  %>                           


 });
 
   $(document).ready(
 function(){
	  $("#diagnosticoconsu_fod").keyup(
			      function(){
					var searchbox = $(this).val();
					var dataString = 'searchword='+ searchbox;
					
                                        if(searchbox==''){
					             var bb=document.getElementById("display_consu_for");
                       			             bb.style.display="none";
                                                     document.getElementById("diagnosticoconsu_fod2").value='';
							  }
					else{
					    $.ajax({
					    type: "POST",
					    url: "autocompleta_med.jsp?dato=p",
					    data: dataString,
					    cache: false,
					    success: function(html){ $("#display_consu_for").html(html).show();
                                                                      var canti=document.getElementById("cantidaddffp").value;
                                                                    //  alert("we "+canti);
                                                                       if(canti==1){document.getElementById("diagnosticoconsu_fod2").value=""+document.getElementById("nommedp").value;
                                                                                    document.getElementById("diagnosticoconsu_fod").value=""+document.getElementById("codatcp").value;
                                                                                    var bb=document.getElementById("display_consu_for");
                                                                                    bb.style.display="none";
                                                                                   }
                                                                        else{document.getElementById("diagnosticoconsu_fod2").value='';}
                                                                    }
			                     });
                                            
			                  }
			                return false;    
			                    }
                                         
	 	             );
 } );
     function pasadatoForm(nom,nom2,dato){
                      
                                     document.getElementById("diagnosticoconsu_fod").value=nom;
                                     document.getElementById("diagnosticoconsu_fod2").value=nom2;
                                     var bb=document.getElementById("display_consu_for");
                                     bb.style.display="none";
                                    
                              }
 jQuery('#cantidad_med').keyup(function () {
  this.value = this.value.replace(/[^0-9]/g,''); 
});

jQuery('#cantidad_med').blur(function () {
  this.value = this.value.replace(/[^0-9]/g,''); 
});   

 $('#form_formula').submit(function() {
                            var cod_f = document.getElementById("diagnosticoconsu_fod").value; 
                            cod_f=cod_f.toString().trim();
                            var cant = document.getElementById("cantidad_med").value; 
                            cant=cant.toString().trim();
                            var tiem = document.getElementById("tiempo_trat").value; 
                            tiem=tiem.toString().trim();
                            var diag = document.getElementById("select_diag_form").value; 
                            var poso = document.getElementById("formu_posologia").value; 
                            poso=poso.toString().trim();
                            var viaa = document.getElementById("viaadmin_med").value; 
                            viaa=viaa.toString().trim();
                            
                           if( cod_f == null || cod_f.length == 0 || /^\s+$/.test(cod_f) ) { 
                                                      alert('Seleccione medicamento');
                                                      return false;  
                                                                      } 
                           if( cant == null || cant.length == 0 || /^\s+$/.test(cant) ) { 
                                                      alert('Ingrese cantidad de medicamentos');
                                                      return false;  
                                                                      }
                           else if( cant.length >= 10 ) {
                                                      alert('La cantidad de medicamentos tiene como maximo 9 caracteres');
                                                      return false;  
                                                                      }    
                           else if( tiem == null || tiem.length == 0 || /^\s+$/.test(tiem) ) { 
                                                      alert('Ingrese el tiempo de tratamiento');
                                                      return false;  
                                                                      }
                           else if( tiem.length >= 100 ) {
                                                      alert('El tiempo de tratamiento tiene como maximo 99 caracteres');
                                                      return false;  
                                                                      } 
                           else if( diag == "npa" ) {
                                                      alert('El diagnostico relacionado es obligatorio');
                                                      return false;  
                                                                      } 
                           else if( poso == null || poso.length == 0 || /^\s+$/.test(poso) ) { 
                                                      alert('Ingrese la posologia');
                                                      return false;  
                                                                      }
                           else if( poso.length >= 500 ) {
                                                      alert('La posologia tiene como maximo 499 caracteres');
                                                      return false;  
                                                                      }  
                           else if( viaa == null || viaa.length == 0 || /^\s+$/.test(viaa) ) { 
                                                      alert('Ingrese la vía de administración');
                                                      return false;  
                                                                      }
                           else if( viaa.length >= 298 ) {
                                                      alert('La vía de administración tiene como maximo 298 caracteres');
                                                      return false;  
                                                                      }                                       

                                                                    
                               poso=poso.replace(/\r\n|\n|\r/g, " ");
                               document.getElementById("formu_posologia").value=poso;
                    // Enviamos el formulario usando AJAX
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#resu_form').html(data);
                                  //actualiza la tabla
                                  jQuery("#list100").jqGrid('setCaption',"FORMULA ").trigger('reloadGrid');	
                                  //BORRA CAJAS
                                 document.getElementById("diagnosticoconsu_fod").value="";
                                 document.getElementById("seria_medic").value="";
                                 document.getElementById("diagnosticoconsu_fod2").value="";
                                 document.getElementById("concentra_for").value="";
                                 document.getElementById("foma_far").value="";
                                 document.getElementById("cantidad_med").value="";
                                 document.getElementById("tiempo_trat").value="";
                                 document.getElementById("formu_posologia").value="";
                                 document.getElementById("viaadmin_med").value="";
                                 $("#select_diag_form").val("npa");
                                                                        
                              }                             
                          })
                     
                          return false;
                      });  
</script>
<style type="text/css">

#display_consu_for
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
.display_box_for
{
padding:4px; border-top:solid 1px #dedede; font-size:12px; height:10px;
}

.display_box_for:hover
{
background:#3b5998;
color:#FFFFFF;
}       
#busca_for:hover{
            background-color:#3baae3;
            cursor:pointer;
            border-radius: 5px;
}
#masmas:hover{
            background-color:#3baae3;
            cursor:pointer;
            border-radius: 5px;
            }
</style>

<title>formula medica</title>
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
          
          String datosf[][]= new String[4][3];
          for(int i=0;i<4;i++){
             for(int j=0;j<3;j++){
                                 datosf[i][j]=""; 
                                 }
                              }
          try {Thread.sleep(200);} catch (InterruptedException ex) {}
          
          String  sqlcf="select imp.id_subcie,sub.descripcion,imp.descrip from sub_cie10 sub,impre_diagno imp where imp.id_subcie=sub.id_subcie10 and id_consulta='"+session.getAttribute("serial_consulta")+"' order by control;";
          
           ResultSet resultf=null;
           int i=0;
          try{  
           resultf=ba.consultas(sqlcf);            
           while (resultf.next()&&resultf!=null) { 
                         datosf[i][0]=""+resultf.getString(1);
                         datosf[i][1]=""+resultf.getString(2);
                         datosf[i][2]=""+resultf.getString(3);
                         i++;
                                               }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        ba.cierraResultado(resultf); 
        ba.cerrar();
     %>
<fieldset>
<legend>Formula Medica</legend>

<form name="form_formula" id="form_formula" action="agrega_medicamento.jsp">
<table style="width:97%" border="0">
    <tr>
        <td colspan="3"><label>Medicamento</label><br></td>
    </tr>
     <tr>
        <td  style="width:75px">           
            <label>Codigo ATC</label>
        </td>
        <td  style="width:30px"></td>
        <td  style="width:87%">
            <label>Descripción</label>
        </td>
        </tr>
    <tr>
        <td  style="width:75px"> 
            <input type="text" id="diagnosticoconsu_fod" name="diagnosticoconsu_fod" class="diagnosticoconsu_fod" disabled="true" style="width:100%">
            <input type="hidden" id="seria_medic" name="seria_medic">
            <div id="display_consu_for"></div> 
        </td>
        <td  style="width:30px">
    <center>  <img src="../imagenes/fotos/buscar.png" id="busca_for" name="busca_for" alt="falla al cargar imagen" width="18px" height="18px" onclick="abreDialog_for('diagnosticoconsu_fod','diagnosticoconsu_fod2');" > </center>
        </td>
        <td  style="width:87%">
           <input type="text" id="diagnosticoconsu_fod2" name="diagnosticoconsu_fod2" class="diagnosticoconsu_fod2" disabled="true"  style="width:100%"> 
        </td>
        </tr>
</table>   

<br>
<table border="0" style="width:98%;padding-left:3px">
    <tr><td style="width:20%"><label>Concentración</label></td><td style="width:20%"><label>Forma farmaceutica</label></td><td style="width:20%"><label>Via Administración</label></td><td style="width:20%"><label>Cantidad</label></td><td style="width:45%"><label>Tiempo tratamiento</label></td></td>
    <tr><td style="width:20%"><input type="text" value="" style="width:98%" id="concentra_for" name="concentra_for" readonly></td><td style="width:20%"><input type="text" value="" style="width:98%" id="foma_far" name="foma_far" readonly></td><td style="width:20%"><input type="text" value="" id="viaadmin_med" name="viaadmin_med" style="width:97%" ></td><td style="width:20%"><input type="text" value="" id="cantidad_med" name="cantidad_med" style="width:97%;text-align:center"></td><td style="width:45%"><input type="text" value="" id="tiempo_trat" name="tiempo_trat" style="width:98%"></td></td>
    <tr><td style="width:100%" colspan="5"><br><label>Diagnostico</label>  
        <select style="width:91%;height:22px" id="select_diag_form" name="select_diag_form" onchange="cambiadiag()">
                              <option value="npa">Seleccione diaggnostico</option>
              <%   
                   for(int j=0;j<i;j++){ out.println("<option value='"+datosf[j][0]+"'>"+datosf[j][0]+" - "+datosf[j][1]+"</option>"); }
              %>                              
           </select><br>
    </td></tr>
</table> 
<table border="0" style="width:98%;padding-left:3px">
    <tr><td  style="width:98%" colspan="2"><label>Posología</label></td>  </tr>
    <tr>
        <td ><textarea rows="4" style="width:100%" name="formu_posologia" id="formu_posologia" ></textarea></td>
         <td rowspan="2" style="width:45px">
                 <center>
                     <input type="image" id="masmas" src="../imagenes/fotos/agregar.png" style="width:35px;height:35px" alt="fallo">
                 </center>
        </td>
    </tr>
</table> 
</form>
           <center>
<table id="list100" ></table>
 <div id="pager100"></div>
         </center>
<br>
<!-- <center><input type="button" value="Solicitar" name="aceptar" size="25" id="aceptar" maxlength="30"></center> -->
</fieldset>



<div name="form_10" id="form_10" >  
                <table id="list_form" ></table>
                <div id="pager_form"></div> 
</div> 

 <div name="resu_form" id="resu_form" style="display:none"></div>          
           
</body>

</html>
