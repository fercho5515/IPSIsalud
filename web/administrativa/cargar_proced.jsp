
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" language="javascript">
function cambia_cup_up(){
  var cambiarcup=document.getElementById("cod_cup").value;
  cambiarcup=cambiarcup.replace(/ /gi,'*');
  //alert(cambiarcup);
  $("#divcup").load("cambia_cup_up.jsp?dato="+cambiarcup+"");
}
$('#form_edita_proced').submit(function() {
                           var vdes=document.getElementById("producto").value;
                           if(vdes == null || vdes =='CUP No Valido' ||/^\s+$/.test(vdes)){
                                                      alert('Codigo CUP no valido');
                                                       return false; 
                           }
                           var vcomprob_cup=document.getElementById("comprob_cup").value;
                           if(vcomprob_cup =='existe' ||/^\s+$/.test(vcomprob_cup)){
                                                      alert('El codigo CUP ya ha sido utilizado en otro procedimiento');
                                                       return false; 
                           }
                           var vcup = document.getElementById("cod_cup").value;  
                           if( vcup == null || vcup.length == 0 || /^\s+$/.test(vcup) ) {
                                                      alert('Codigo CUP es obligatorio');
                                                       return false;  
                                                                      } 
                           var vmap = document.getElementById("cod_mapipo").value;  
                           if( vmap == null || vmap.length == 0 || /^\s+$/.test(vmap) ) {
                                                      alert('Codigo Mapipo es obligatorio');
                                                       return false;  
                                                                      }
                           var vmapipo = document.getElementById("mapipo").value;               
                           if( vmapipo == null || vmapipo.length == 0 ||vmapipo.length > 198|| /^\s+$/.test(vmapipo) ) {
                                                      alert('No has descrito el procedimiento, o has sobrepasado el límite de caracteres (199)');
                                                       return false;  
                                                                      }  
                             
                           var vedadmin=document.getElementById("edadmin").value;
                           var vedadmin2=$("input[name='edadmin2']:checked").val();
                           //alert(vedadmin2);
                           if(vedadmin.length != 0 || /^\s+$/.test(vedadmin)){
                                    var comp = parseInt(vedadmin);
                                    if (isNaN(comp)) {
                                    alert('Edad minima no valida');
                                    return false;
                                    }
                                    else if(comp!=vedadmin || comp.toString()!=vedadmin.toString()){
                                    alert('Edad minima no valida');
                                    return false;
                                    }
                                    if(vedadmin2==0){
                                    alert('Debes escoger una unidad para Edad Minima');
                                    return false;
                                    }
                           }
                            else if(vedadmin.length == 0){
                               if(vedadmin2==1||vedadmin2==2||vedadmin2==3){
                                   alert('Debes escribir una Edad Minima');
                                   return false;
                               }
                           } 
                           
                           var vedadmax=document.getElementById("edadmax").value;
                           var vedadmax2=$("input[name='edadmax2']:checked").val();
                           if(vedadmax.length != 0 || /^\s+$/.test(vedadmax)){
                                    var comp2 = parseInt(vedadmax);
                                    if (isNaN(comp2)) {
                                    alert('Edad maxima no valida');
                                    return false;
                                    }
                                    else if(comp2!=vedadmax || comp2.toString()!=vedadmax.toString()){
                                    alert('Edad maxima no valida');
                                    return false;
                                    }
                                    if(vedadmax2==0){
                                    alert('Debes escoger una unidad para Edad Maxima');
                                    return false;
                                    }
                           }
                           else if(vedadmax.length == 0){
                               if(vedadmax2==1||vedadmax2==2||vedadmax2==3){
                                   alert('Debes escribir una Edad Maxima');
                                   return false;
                               }
                           }
                           $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              dataType: "json",
                              success: function(data) {
                                 if(data.res==1){
                                            alert("Procedimiento actualizado con exito");
                                        }
                                 else{alert("Falla al actualizar procedimiento");}       
                              }
                          })
                          return false;
                      }); 
                      
       ///////////
       
       
      
    var  anchoPantalla=document.body.offsetWidth -200; 
  $(function(){             
                  
    jQuery("#listcreacups_ed").jqGrid({
   	url:'cups/cargacups.jsp?q=2',
	datatype: "json",
   	colNames:['Id','Cod Cups','Descripción','Cod aux1','Cod aux2','Tipo','Sexo','Quirurgico'],
   	colModel:[
                {name:'id',index:'id',hidden:true,width:60,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'cup_verdadero',index:'cup_verdadero', width:((anchoPantalla*8)/100),search:true, editable: true,required : true,editoptions: {maxlength: 10},editrules: { required: true },searchoptions:{sopt:['cn','eq']},align:"center"},
   		{name:'nom',index:'nom',  width:((anchoPantalla*61)/100),search:true, editable: true,required : true,editoptions: {maxlength: 300},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'cod_aux1',index:'cod_aux1', width:((anchoPantalla*7)/5),hidden:true,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'cod_aux2',index:'cod_aux2', width:((anchoPantalla*7)/5),hidden:true,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'tipo',index:'tipo', width:((anchoPantalla*9)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'sexo',index:'sexo', width:((anchoPantalla*9)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'quirur',index:'quirur', width:((anchoPantalla*9)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}}
   		],
   	rowNum:10,
   	rowList:[10,20,30,40,400],
   	pager: '#pagercreacups_ed',
   	sortname: 'c.descripcion',
        viewrecords: true,
        sortorder: "asc",
        height: "auto",
        width:anchoPantalla,
        shrinkToFit: false,//columnas tamaÃ±o dato
           
        rownumbers: false,
        editurl: 'editaCli.php',
	caption: "CUPS",
	onSelectRow: function (id){       
                                   var lineap=jQuery("#listcreacups_ed").jqGrid('getRowData',id);
                                   $("#cod_cup").val(""+lineap.cup_verdadero+"");
                                   $("#producto").val(""+lineap.nom+"");
                                   $( "#dialog_cups_ed" ).dialog("close");
                                  }
});


jQuery("#listcreacups_ed").jqGrid('navGrid','#pagercreacups_ed',{add:false,edit:false,del:false,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);
            
jQuery('#listcreacups_ed').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
    
$( "#dialog_cups_ed" ).dialog({
      autoOpen: false,
      modal: true,
      dialogClass: 'no-close',
      width:""+(anchoPantalla+100)+"px",
      open: function(event, ui) {},
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1200
      }
    });    
 });
       
 function vercups_ed(){
    $( "#dialog_cups_ed" ).dialog("open");
}                     
</script>
    </head>
    <body>
<%
        //  out.print("nom "+session.getAttribute("nombre")+" clave "+session.getAttribute("clave")+" id "+session.getAttribute("id")+" permiso "+session.getAttribute("permiso")+" s agenda "+session.getAttribute("serial_agenda" )+" s paciente"+session.getAttribute("serial_pacinete"));
if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null ){
%>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
            <% 
              out.println("</body></html>");
              return;
            }
         request.setCharacterEncoding("UTF-8");         
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb(); 
         
         String datop=request.getParameter("dato");
         datop=datop.replace('*',' ');
         //out.print(datop);
         
         HttpSession sesion=request.getSession();
         sesion.setAttribute("cup_update",datop);
         //out.println("Sesion==>"+sesion.getAttribute("cup_update"));
         
         String sql="select p.codigo_maipos,c.cup_verdadero,p.descripcion as dp,c.descripcion as dc,p.sexo,p.edad_min,p.unidad_edad_min,p.edad_max,p.unidad_edad_max,p.plan_beneficios,p.obstetrico,p.pyp,p.quirurgico,p.consulta_primeraves,p.consulta,p.servicio,p.cod_finalidad,p.cod_rip_adicional,p.cod_forma_realiza,p.cod_tipo_serv,p.cod_concepto_facturacion,p.idprocedimientos_tari from procedimientos_tari p, cups c where p.cod_cups = c.id_cups and idprocedimientos_tari='"+datop+"';";
       //  out.print(sql); 
         ResultSet resu=null;
         try{  resu=ba.consultas(sql);}
         catch(Exception e){}
            String datos[]=new String[22];
            
            for(int i=0;i<22;i++){
                datos[i]="";
            }
         try{
	    while (resu.next()&&resu!=null) {   
                         if(resu.getString(1)!=null){datos[0]=resu.getString(1);}//id_subcie10
                         if(resu.getString(2)!=null){datos[1]=resu.getString(2);}//cie10
                         if(resu.getString(3)!=null){datos[2]=resu.getString(3);}//descripcion
                         if(resu.getString(4)!=null){datos[3]=resu.getString(4);}//masc fem                        if(resu.getString(5)!=null){datos[4]=resu.getString(5);}//cedula
                         if(resu.getString(5)!=null){datos[4]=resu.getString(5);}//edad min
                         if(resu.getString(6)!=null){datos[5]=resu.getString(6);}//uni edad min
                         if(resu.getString(7)!=null){datos[6]=resu.getString(7);}//edad max
                         if(resu.getString(8)!=null){datos[7]=resu.getString(8);}
                         if(resu.getString(9)!=null){datos[8]=resu.getString(9);}
                         if(resu.getString(10)!=null){datos[9]=resu.getString(10);}
                         if(resu.getString(11)!=null){datos[10]=resu.getString(11);}
                         if(resu.getString(12)!=null){datos[11]=resu.getString(12);}
                         if(resu.getString(13)!=null){datos[12]=resu.getString(13);}
                         if(resu.getString(14)!=null){datos[13]=resu.getString(14);}
                         if(resu.getString(15)!=null){datos[14]=resu.getString(15);}
                         if(resu.getString(16)!=null){datos[15]=resu.getString(16);}
                         if(resu.getString(17)!=null){datos[16]=resu.getString(17);}
                         if(resu.getString(18)!=null){datos[17]=resu.getString(18);}
                         if(resu.getString(19)!=null){datos[18]=resu.getString(19);}
                         if(resu.getString(20)!=null){datos[19]=resu.getString(20);}
                         if(resu.getString(21)!=null){datos[20]=resu.getString(21);}
                         if(resu.getString(22)!=null){datos[21]=resu.getString(22);}
                     }
        }
        catch(SQLException ex){}
	catch(Exception exe){}
        ba.cierraResultado(resu);
        %>
<form id="form_edita_proced" name="form_edita_proced" method="post" action="update_proced.jsp">      
<table style="height:100%;width:80%;padding-top:5px" align="center">
<tbody valign="top">
<tr>
<td>
    <input type="hidden" id="idproced" name="idproced" value="<%out.print(datos[21]);%>">
<fieldset><legend>Procedimiento</legend>
<table style="width:100%"  border="0">
<tr>
<td style="width:33%"  colspan="2">
<label for="codigo">Codigo CUP:</label>
</td>
<td style="width:66%" colspan="4">
<label>Nombre:</label>
</td>
</tr>
<!-----2da fila---->

<tr>
<td  colspan="2">
<input type="text" name="cod_cup" size="15" id="cod_cup" maxlength="30" onkeyup="cambia_cup_up();" value="<%out.print(datos[1]);%>">
<input type="button" value="ver" onclick="vercups_ed()">
</td>

<td colspan="4">
    <div id="divcup" name="divcup">
        <input type="text" name="producto" size="85%" id="producto" maxlength="400" readonly value="<%out.print(datos[3]);%>">
        <input type="text" name="comprob_cup" style="display: none" size="85%" id="comprob_cup" maxlength="400" readonly>
    </div>
</td>
</tr>
<!----------------------->
<tr>
<td style="width:33%"  colspan="2">
<label for="codigo">Codigo Mapipo:</label>
</td>
<td style="width:66%" colspan="4">
<label>Procedimiento</label>
</td>
</tr>
<!----------------------->
<tr>
<td  colspan="2">
<input type="text" name="cod_mapipo" size="15" id="cod_mapipo" maxlength="30" value="<%out.print(datos[0]);%>">
</td>
<td colpasn="4">
    <input type="text" id="mapipo" name="mapipo" size="85%" maxlength="199" value="<%out.print(datos[2]);%>">
</td>
</tr>
<!-----3ra fila---->
</table>

    <table style="height:100%;width:80%;padding-top:5px" align="center">
<tr>
<td style="width:16%">
<%
 int dato5;
 try{dato5=Integer.parseInt(datos[10]);}
 catch(Exception exe){dato5=-9;}
 if(dato5==1){
%>
<input type="checkbox" name="obstetrico" id="obstetrico" checked>
<%}
 else if(dato5==0){
 %>
 <input type="checkbox" name="obstetrico" id="obstetrico">
<%}%>

<label for="obstetrico">Obstetrico</label>
</td>
<td style="width:14%">
<%
 int dato6;
 try{dato6=Integer.parseInt(datos[11]);}
 catch(Exception exe){dato6=-9;}
 if(dato6==1){
%>
<input type="checkbox" name="pyp" id="pyp" checked>
<%}
 else if(dato6==0){
 %>
<input type="checkbox" name="pyp" id="pyp">
<%}%>
<label for="PyP">PyP</label>
</td>
<td style="width:16%">
<%
 int dato7;
 try{dato7=Integer.parseInt(datos[12]);}
 catch(Exception exe){dato7=-9;}
 if(dato7==1){
%>    
<input type="checkbox" name="quirurjico" id="quirurjico" checked>
<%}
 else if(dato7==0){
%>
<input type="checkbox" name="quirurjico" id="quirurjico">
<%}%>
<label for="quirurjico">Quirurjico</label>
</td>
<td style="width:22%">
<%
 int dato8;
 try{dato8=Integer.parseInt(datos[13]);}
 catch(Exception exe){dato8=-9;}
 if(dato8==1){
%>    
<input type="checkbox" name="consulta1" id="consulta1" checked>
<%}
 else if(dato8==0){
%>
<input type="checkbox" name="consulta1" id="consulta1">
<%}%>
<label for="consulta1">Consulta 1ra vez</label>
</td>
<td style="width:15%">
<%
 int dato9;
 try{dato9=Integer.parseInt(datos[14]);}
 catch(Exception exe){dato9=-9;}
 if(dato9==1){
%>        
<input type="checkbox" name="consulta" id="consulta" checked>
<%}
 else if(dato9==0){
%>
<input type="checkbox" name="consulta" id="consulta">
<%}%>
<label for="consulta">Consulta</label>
</td>
<td style="width:16%">
<%
 int dato10;
 try{dato10=Integer.parseInt(datos[15]);}
 catch(Exception exe){dato10=-9;}
 if(dato10==1){
%>   
<input type="checkbox" name="servicio" id="servicio" checked>
<%}
 else if(dato10==0){
%>
<input type="checkbox" name="servicio" id="servicio">
<%}%>
<label for="servicio">Servicio</label>
</td>
</tr>
</table>
</fieldset>
<fieldset><legend>Edad y Sexo</legend>
<table style="width:100%">
<tr>
<td style="width:16%">
<label>Sexo:</label>
</td>
<td>

<%
 int dato;
 try{dato=Integer.parseInt(datos[4]);}
 catch(Exception exe){dato=-9;}
//out.print(dato);
if( dato==(-9)){
%>
<label>Masculino</label><input type="radio" id="sexo" name="sexo" value="1">
<label>Femenino</label><input type="radio" id="sexo" name="sexo" value="2">
<label>Ambos</label><input type="radio" name="sexo" id="sexo" value="3">
<%}
if(dato==3||dato==0){
%>
<label>Masculino</label><input type="radio" id="sexo" name="sexo" value="1">
<label>Femenino</label><input type="radio" id="sexo" name="sexo" value="2">
<label>Ambos</label><input type="radio" name="sexo" id="sexo" value="3" checked>
<%}
if(dato==2){
%>
<label>Masculino</label><input type="radio" id="sexo" name="sexo" value="1">
<label>Femenino</label><input type="radio" id="sexo" name="sexo" value="2" checked>
<label>Ambos</label><input type="radio" name="sexo" id="sexo" value="3">
<%}
if(dato==1){
%>
<label>Masculino</label><input type="radio" id="sexo" name="sexo" value="1" checked>
<label>Femenino</label><input type="radio" id="sexo" name="sexo" value="2">
<label>Ambos</label><input type="radio" name="sexo" id="sexo" value="3">
<%}
%>
</td>
<td rowspan="3">
<fieldset  style="width:70%">
<legend>Plan de Beneficios</legend>
<%
 int dato4;
 try{dato4=Integer.parseInt(datos[9]);}
 catch(Exception exe){dato4=-9;}
//out.print("==>"+dato4);
if( dato4==(-9)){
%>
<input type="radio" name="plan" id="plan" value="1"><label>   POS</label><br>
<input type="radio" name="plan" id="plan" value="2"><label>   POS_S</label><br>
<input type="radio" name="plan" id="plan" value="3"><label>   PAB</label><br>
<input type="radio" name="plan" id="plan" value="4"><label>   No Aplica</label>
<%}
else if(dato4==3){
%>
<input type="radio" name="plan" id="plan" value="1"><label>   POS</label><br>
<input type="radio" name="plan" id="plan" value="2"><label>   POS_S</label><br>
<input type="radio" name="plan" id="plan" value="3" checked><label>   PAB</label><br>
<input type="radio" name="plan" id="plan" value="4"><label>   No Aplica</label>
<%}
else if(dato4==2){
%>
<input type="radio" name="plan" id="plan" value="1"><label>   POS</label><br>
<input type="radio" name="plan" id="plan" value="2" checked><label>   POS_S</label><br>
<input type="radio" name="plan" id="plan" value="3"><label>   PAB</label><br>
<input type="radio" name="plan" id="plan" value="4"><label>   No Aplica</label>
<%}
else if(dato4==1 || dato4==0){
%>
<input type="radio" name="plan" id="plan" value="1" checked><label>   POS</label><br>
<input type="radio" name="plan" id="plan" value="2"><label>   POS_S</label><br>
<input type="radio" name="plan" id="plan" value="3"><label>   PAB</label><br>
<input type="radio" name="plan" id="plan" value="4"><label>   No Aplica</label>
<%}
else if(dato4==4){
%>
<input type="radio" name="plan" id="plan" value="1"><label>   POS</label><br>
<input type="radio" name="plan" id="plan" value="2"><label>   POS_S</label><br>
<input type="radio" name="plan" id="plan" value="3"><label>   PAB</label><br>
<input type="radio" name="plan" id="plan" value="4" checked><label>   No Aplica</label>
<%}
%>

</fieldset>
</td>
</tr>

<!---2da fila---->

<tr>
<td>
<label>Edad minima:</label>
</td>
<td>
<input type="text" name="edadmin" size="2" id="edadmin" maxlength="2" value="<%out.print(datos[5]);%>">
<label>en: </label>
<% 
 int dato2;
  try{dato2=Integer.parseInt(datos[6]);}
  catch(Exception exe){dato2=-9;}
//out.print(datos[5]);
if( dato2==(-9) || dato2==0) {%>
<input type="radio" id="edadmin2" name="edadmin2" value="0" style="display: none" checked>
<input type="radio" id="edadmin2" name="edadmin2" value="1"><label>semanas</label>
<input type="radio" id="edadmin2" name="edadmin2" value="2"><label>meses</label>
<input type="radio" id="edadmin2" name="edadmin2" value="3"><label>años</label>
<%}
else if(dato2==3) {%>
<input type="radio" id="edadmin2" name="edadmin2" value="0" style="display: none">
<input type="radio" id="edadmin2" name="edadmin2" value="1"><label>semanas</label>
<input type="radio" id="edadmin2" name="edadmin2" value="2"><label>meses</label>
<input type="radio" id="edadmin2" name="edadmin2" value="3" checked><label>años</label>
<%}
else if(dato2==2) {%>
<input type="radio" id="edadmin2" name="edadmin2" value="0" style="display: none">
<input type="radio" id="edadmin2" name="edadmin2" value="1"><label>semanas</label>
<input type="radio" id="edadmin2" name="edadmin2" value="2" checked><label>meses</label>
<input type="radio" id="edadmin2" name="edadmin2" value="3"><label>años</label>
<%}
else if(dato2==1) {%>
<input type="radio" id="edadmin2" name="edadmin2" value="0" style="display: none">
<input type="radio" id="edadmin2" name="edadmin2" value="1" checked><label>semanas</label>
<input type="radio" id="edadmin2" name="edadmin2" value="2"><label>meses</label>
<input type="radio" id="edadmin2" name="edadmin2" value="3"><label>años</label>
<%}
%>
</td>
</tr>

<!---3ra fila----->

<tr>
<td>
<label>Edad maxima:</label>
</td>
<td>
<input type="text" name="edadmax" size="2" id="edadmax" maxlength="3" value="<%out.print(datos[7]);%>">
<label>en: </label>
<%
int dato3;
try{dato3=Integer.parseInt(datos[8]);}
catch(Exception exe){dato3=-9;}

if( dato3==(-9) ||dato3==0){
%>
<input type="radio" id="edadmax2" name="edadmax2" value="0" style="display: none" checked>
<input type="radio" id="edadmax2" name="edadmax2" value="1"><label>semanas</label>
<input type="radio" id="edadmax2" name="edadmax2" value="2"><label>meses</label>
<input type="radio" id="edadmax2" name="edadmax2" value="3"><label>años</label>
<%}
else if (dato3==3){
%>
<input type="radio" id="edadmax2" name="edadmax2" value="0" style="display: none">
<input type="radio" id="edadmax2" name="edadmax2" value="1"><label>semanas</label>
<input type="radio" id="edadmax2" name="edadmax2" value="2"><label>meses</label>
<input type="radio" id="edadmax2" name="edadmax2" value="3" checked><label>años</label>
<%
}
else if (dato3==2){
%>
<input type="radio" id="edadmax2" name="edadmax2" value="0" style="display: none">
<input type="radio" id="edadmax2" name="edadmax2" value="1"><label>semanas</label>
<input type="radio" id="edadmax2" name="edadmax2" value="2" checked><label>meses</label>
<input type="radio" id="edadmax2" name="edadmax2" value="3"><label>años</label>
<%}
else if (dato3==1){
%>
<input type="radio" id="edadmax2" name="edadmax2" value="0" style="display: none">
<input type="radio" id="edadmax2" name="edadmax2" value="1" checked><label>semanas</label>
<input type="radio" id="edadmax2" name="edadmax2" value="2"><label>meses</label>
<input type="radio" id="edadmax2" name="edadmax2" value="3"><label>años</label>
<%}%>
</td>
</tr>
</table>
</fieldset>

<br>

<fieldset>
<table style="width:100%">
<tr>
<td style="width:65%">
<label>Finalidad:</label> 
</td>
<td style="width:35%">
<label>RIP adicional:</label>
</td>
</tr>

<tr>
<td>
<select name="finalidad" id="finalidad" style="width:85%">
          <%          
                       String sqlfina="select fn.idfinalidad, fn.descripcion from finalidad fn;";    
                       //out.print(sqlfina);
                        ResultSet resufina=ba.consultas(sqlfina);
                        try{
                            while (resufina.next()&&resufina!=null) {  
                                       if(datos[16].compareTo(""+resufina.getString(1)+"")==0){
                                       out.print("<option value='"+resufina.getString(1)+"' SELECTED>"+resufina.getString(2)+"</option>");
                                       }
                                       else{
                                       out.print("<option value='"+resufina.getString(1)+"'>"+resufina.getString(2)+"</option>");
                                       }
                                       }}
                        catch(SQLException e){}
                        catch(Exception ex){}
         %>
</select>
</td>
<td>
<select name="rip_adicional" id="rip_adicional" style="width:85%">
         <%
                        String sqlrip="select ra.id_rip_adicional, ra.descripcion from rip_adicional ra;";    
                        out.print(sqlrip);
                        ResultSet resurip=ba.consultas(sqlrip);
                        try{
                            while (resurip.next()&&resurip!=null) { 
                                       if(datos[17].compareTo(""+resurip.getString(1)+"")==0){
                                       out.print("<option value='"+resurip.getString(1)+"' SELECTED>"+resurip.getString(2)+"</option>");
                                          }
                                       else{
                                       out.print("<option value='"+resurip.getString(1)+"'>"+resurip.getString(2)+"</option>");
                                          }                                  
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
         %>
</select>
</td>
</tr>
<tr>
<td style="width:65%">
<label>Forma de Realizacion:</label>
</td>
<td style="width:35%">
<label>Tipo de Servicio:</label>
</td>
</tr>

<tr>
<td>
<select name="formarealizacion" id="formarealizacion" style="width:85%"> 
<%
                        String sqlforma="select id_forma_realizacion, descripcion from forma_realizacion;";    
                        out.print(sqlforma);
                        ResultSet resuforma=ba.consultas(sqlforma);
                        try{
                            while (resuforma.next()&&resuforma!=null) { 
                            if(datos[18].compareTo(""+resuforma.getString(1)+"")==0){    
                                       out.print("<option value='"+resuforma.getString(1)+"' SELECTED>"+resuforma.getString(2)+"</option>");
                                       }
                            else{
                            out.print("<option value='"+resuforma.getString(1)+"'>"+resuforma.getString(2)+"</option>");
                                }
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
         %>
</select>
</td>
<td>
<select name="tiposervicio" id="tiposervicio" style="width:85%">
    <%
                        String sqltipo="select id_tipo_servicio, descripcion from tipo_servicio;";    
                        ResultSet resutipo=ba.consultas(sqltipo);
                        try{
                            while (resutipo.next()&&resutipo!=null) {
                            if(datos[19].compareTo(""+resutipo.getString(1)+"")==0){
                                       out.print("<option value='"+resutipo.getString(1)+"' SELECTED>"+resutipo.getString(2)+"</option>");
                                                                  }
                            else {
                                       out.print("<option value='"+resutipo.getString(1)+"'>"+resutipo.getString(2)+"</option>");
                                       }
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
         %>
</select>
</td>
</tr>

<tr>
<td style="width:65%">
<label>Concepto de Facturacion</label>
</td>
<td style="width:35%">
</td>
</tr>

<tr>
<td>
<select name="conceptofactu" id="conceptofactu" style="width:85%"> 
<%
                        String sqlfactu="select id_concepto_facturacion, descripcion from concepto_facturacion;";    
                        out.print(sqlfactu);
                        ResultSet resufactu=ba.consultas(sqlfactu);
                        try{
                            while (resufactu.next()&&resuforma!=null) {
                             if(datos[20].compareTo(""+resufactu.getString(1)+"")==0){
                                       out.print("<option value='"+resufactu.getString(1)+"' SELECTED>"+resufactu.getString(2)+"</option>");
                                                                   }
                             else{
                             out.print("<option value='"+resufactu.getString(1)+"'>"+resufactu.getString(2)+"</option>");
                                       }
                             }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cerrar();
         %>
</select>
</td>
<td>

</td>
</tr>

</table>
</fieldset>

</td>
</tr>

<tr>
<td style="text-align:right;width:70%">
<input type="submit" value="Guardar" name="aceptar" size="25" id="aceptar" maxlength="30"><br>
</td>
</tr>

</table>
</form>
<div id="divconf" name="divconf"></div>
<div id="resuproced" name="resuproced"></div>

<div id="dialog_cups_ed">    
    <center> 
      <table id="listcreacups_ed" ></table>
      <div id="pagercreacups_ed"></div>
    </center>  
</div>
</body>
</html>

