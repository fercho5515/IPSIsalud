

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8"/>
<title>Sin título 1</title>
<script type="text/javascript" language="javascript">
   var anchoPantallaaaa=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
                
  $(document).ready(function(){
             jQuery("#list5").jqGrid({
   	url:'carga_menu.jsp?q=2',
	datatype: "json",
   	colNames:['id','Hora del Dia','Comida','Cantidad',],
   	colModel:[
   		{name:'id',index:'id', width:0,hidden:true,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},  
   		{name:'hora',index:'d1', width:((anchoPantallaaaa*11)/100),search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'comida',index:'d2', width:((anchoPantallaaaa*41)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'cant',index:'cant', width:((anchoPantallaaaa*41)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		],
   	rowNum:15,
   	rowList:[5,10,15,30,45],
   	pager: '#pager5',
   	sortname: 'h.id_hora_comida',
    viewrecords: true,
    sortorder: "asc",
	//multiselect: false,
	////loadonce: true,
	//height: 'auto',
	//height: 190,
    
      width:anchoPantallaaaa-20,
	//height: 190,
   // autowidth: true, 
    shrinkToFit: false,
	height: 'auto',
       /* 
           grouping:true,         
           groupingView : {
   		groupField : ['hora'],
            groupColumnShow: [false],
            groupDataSorted: false,
            groupOrder : 'asc'
   	},   */
   // autowidth: true, 
    rownumbers: false,
    editurl: 'editaCli.php',
	caption: "MENU",
	ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
	                                     NuevoCaso2(""+cedula_nit+"");  }
	
});
jQuery("#list5").jqGrid('navGrid','#pager5',{add:false,edit:false,del:false,search:true,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:60} //para el view
 								);
/* 								
$("#pager10").click(function(){
	var gr = jQuery("#list10").getGridParam('selrow');
	if( gr != null ) jQuery("#list10").editGridRow(gr,{height:280,reloadAfterSubmit:false});
	else alert("Por Favor Seleccione Un Usuario");
});
*/

 });
 function cambiaComida(){
     var dato=document.getElementById("hora_d").value;
     $("#div_comita").load("cambiaComida.jsp?dato="+dato+"");
 }
 function form_comi(){
                            var hora = document.getElementById("hora_d").value; 
                            var idco  = document.getElementById("id_comida").value;   
                            var cant = document.getElementById("cantidadc").value;             

                           
                          if(hora == -1){
                                               alert('Seleccione Hora del Día');
                                               return false;  
                                            }          
                           else if(idco == -1){
                                               alert('Seleccione Comida');
                                               return false;  
                                            } 
                           else if( cant == null || cant.length == 0 || /^\s+$/.test(cant) ) {
                                                     alert('Ingrese Cantidad');
                                                       return false;  
                                                                      } 
                           else if(cant.length >= 300 ){alert('La Cantidad tiene como máximo 299 caracteres');
                                                       return false;  
                                                                     }                   
                            cant=cant.replace(/\r\n|\n|\r/g, " ");
                            cant=cant.replace("'", " ");  
                            document.getElementById("cantidadc").value=cant;                                        
                            //setTimeout(recarg(), 1000);
                      } 
function recarg(){
     jQuery("#list5").jqGrid('setCaption',"MENU").trigger('reloadGrid');                                  
     document.getElementById("cantidadc").value=""; 
     document.getElementById("hora_d").value=-1;   
     document.getElementById("id_comida").value=-1;  
                 }   

</script>
</head>
<body>
<center>
<table style="width:60%">
<tr><td>
<table id="list5"></table>
<div id="pager5"></div> 
</td></tr>
</table>

<div id="menu" name="menu">
    <iframe name="iframe_com" id="iframe_com" style="display:none" onload="recarg()"></iframe>        
    <form id="form_menu" name="form_menu" accept-charset="UTF-8" action="nueva_comida_menu.jsp" onsubmit="return form_comi()" target="iframe_com"> 
            <table>
            <tr>
            <td><label>Hora del Día:</label></td>
            <td>
                <select id="hora_d" name="hora_d" style="min-width:120px" onchange="cambiaComida()">
                    <option value="-1">Seleccione...</option>
                      <%     request.setCharacterEncoding("UTF-8");
                             conecta_bd ba = new conecta_bd();
                             ba.ConectaDb();

                        String cons_a="select id_hora_comida,descripcion from hora_comida order by id_hora_comida;";

                        ResultSet resu2a=ba.consultas(cons_a);
                                    try{
                                        while (resu2a.next()&&resu2a!=null) { 
                                            out.print("<option value='"+resu2a.getString(1)+"'>"+resu2a.getString(2)+"</option>");                                 
                                        }}
                                    catch(SQLException e){}
                                    catch(Exception ex){}
                                    ba.cierraResultado(resu2a); 
                                    ba.cerrar();
                        %>
                </select>
            </td>
            </tr>
            <tr>
            <td><label>Comida:</label></td>
            <td>
                <div id="div_comita">
                        <select id="id_comida" name="id_comida" style="min-width:120px">
                            <option value="-1">Seleccione...</option>
                        </select>
                </div>    
            </td>
            </tr>
            <tr>
                <td><label>Cantidad:</label></td><td><input type="text" id="cantidadc" name="cantidadc" maxlength="299" style="min-width:120px"></td>
            </tr>
            <tr><td colspan="2">
            <center><input type="submit" value="Agregar" name="aceptar" id="aceptar" ></center>
            </td></tr>
            </table>
    </form>
</div>        
                <table style="width:85%">
                    <tr><td><label style="width:100%">Comentario:</label></td></tr>
                    <tr><td><textarea id="comentario_menu" name="comentario_menu" style="width:85%" rows="4"></textarea></td></tr>
                    <tr><td><label style="width:100%">Dieta:</label></td></tr>
                    <tr><td><textarea id="dieta_menu" name="dieta_menu" style="width:85%" rows="4"></textarea></td></tr>
                </table>

</center>
</body>
</html>
