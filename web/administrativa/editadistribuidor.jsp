<%-- 
    Document   : editalabfarmaceutico
    Created on : 14/03/2013, 06:13:02 PM
    Author     : EMMANUEL
--%>
<%@page import="java.util.*" session="true" %>

<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>
<script type="text/javascript" language="javascript">
$(document).ready(function(){
   var anchoPantallaa2=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
    jQuery("#listdist").jqGrid({
   	url:'carga_distribuidor.jsp?q=2',
	datatype: "json",
   	colNames:['id','Nombre','Direccion','Telefono','Celular','Nit','Camara de Comercio'],
   	colModel:[
                {name:'id',index:'id_distri',hidden:true,width:0,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'nombre',index:'nombre', width:((anchoPantallaa2*25)/100),search:true,editable: true,required : true,editoptions:{maxlength:399}},
   		{name:'direc',index:'direccion',width:((anchoPantallaa2*42)/100),search:true,editable: true,required : true,editoptions:{maxlength:399}},
   	        {name:'telefono',index:'telefono',width:((anchoPantallaa2*15)/100),search:true,editable: true,required : true,editoptions:{maxlength:199}},
   		{name:'celular',index:'celular',hidden:true,align: 'left', editable: true, editrules: { edithidden: true },editoptions:{maxlength:199}},
   	        {name:'nit',index:'nit',width:((anchoPantallaa2*15)/100),search:true,editable: true,required : true,editoptions:{maxlength:199}},
   		{name:'camco',index:'camara_comercio',hidden:true,align: 'left', editable: true, editrules: { edithidden: true },editoptions:{maxlength:199}},
   	        ],
   	rowNum:11,
   	rowList:[10,20,30,40,400],
   	pager: '#pagerdist',
   	sortname: 'nombre',
        viewrecords: true,
        sortorder: "asc",
        height: 'auto',
        width:anchoPantallaa2,
        shrinkToFit: false,//columnas tamaño dato
        rownumbers: false,
        editurl: 'edita_distribuidor.jsp',
	caption: "Distribuidores",
	ondblClickRow: function(id){}	
             });
        jQuery("#listdist").jqGrid('navGrid','#pagerdist',{add:false,edit:true,del:true,search:false,view:true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{width:420}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);
             
        jQuery('#listdist').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
                     


 });
   
</script>
<title>Crear Medicamento</title>
</head>

<body>
      <% 
      
           request.setCharacterEncoding("UTF-8");
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
      
     
  
            <% 
              out.println("</body></html>");
              return;
            }%>
    <br><br><br>
<center>
<center>
    <table id="listdist" ></table>
    <div id="pagerdist"></div> 
    <br>
</center>
</body>
</html>