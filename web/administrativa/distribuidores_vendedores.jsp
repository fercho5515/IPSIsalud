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
    jQuery("#listdit").jqGrid({
   	url:'carga_distribuidor.jsp?q=2',
	datatype: "json",
   	colNames:['id','Nombre','Direccion','Telefono','Celular','Nit','Camara de Comercio'],
   	colModel:[
                {name:'id',index:'id_distri',hidden:true,width:0,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'nombre',index:'nombre', width:((anchoPantallaa2*24)/100),search:true,editable: true,required : true,editoptions:{maxlength:399}},
   		{name:'direc',index:'direccion',width:((anchoPantallaa2*42)/100),search:true,editable: true,required : true,editoptions:{maxlength:399}},
   	        {name:'telefono',index:'telefono',width:((anchoPantallaa2*15)/100),search:true,editable: true,required : true,editoptions:{maxlength:199}},
   		{name:'celular',index:'celular',hidden:true,align: 'left', editable: true, editrules: { edithidden: true },editoptions:{maxlength:199}},
   	        {name:'nit',index:'nit',width:((anchoPantallaa2*15)/100),search:true,editable: true,required : true,editoptions:{maxlength:399}},
   		{name:'camco',index:'camara_comercio',hidden:true,align: 'left', editable: true, editrules: { edithidden: true },editoptions:{maxlength:199}},
   	        ],
   	rowNum:6,
   	rowList:[6,10,20,30,400],
   	pager: '#pagerdit',
   	sortname: 'nombre',
        viewrecords: true,
        sortorder: "asc",
        height: 150,
        width:anchoPantallaa2,
        shrinkToFit: false,//columnas tamaño dato
        rownumbers: false,
        editurl: 'edita_distribuidor.jsp',
	caption: "Listado de distribuidores",
	onSelectRow: function(ids) {//alert(ids);
		if(ids == null) {
		       ids=0;
			if(jQuery("#listdit2").jqGrid('getGridParam','records') >0 )
			{      
                               var ret = jQuery("#listdit").jqGrid('getRowData',ids);
				jQuery("#listdit2").jqGrid('setGridParam',{url:"carga_vendedores.jsp?q=1&id="+ids,page:1});
				jQuery("#listdit2").jqGrid('setCaption',"LISTADO DE VENDEDORES "+ret.nombre).trigger('reloadGrid');
			}
		} else {
                        var ret = jQuery("#listdit").jqGrid('getRowData',ids);
                        jQuery("#listdit2").jqGrid('setGridParam',{url:"carga_vendedores.jsp?q=1&id="+ids,page:1});
                        jQuery("#listdit2").jqGrid('setCaption',"LISTADO DE VENDEDORES PARA: "+ret.nombre).trigger('reloadGrid');			
		}
	}	
            
       });
        jQuery("#listdit").jqGrid('navGrid','#pagerdit',{add:false,edit:false,del:false,search:false,view:true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{width:420}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);
             
        jQuery('#listdit').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
                     
     ////////////
     ////////////
     ////////////
     ////////////
   jQuery("#listdit2").jqGrid({
	height: 100,
   	url:'carga_vendedores.jsp?q=1&id=0',
	datatype: "json",
   	colNames:['id','Cedula','Nombres', 'Apellidos', 'Telefono','Celular','Direccion'],
   	colModel:[
   		{name:'id',index:'id_vendedor',hidden:true,width:0,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'cedula',index:'cedula',hidden:true,align: 'left', editable: true, editrules: { edithidden: true },editoptions:{maxlength:44}},
   		{name:'nombres',index:'nombres',width:((anchoPantallaa2*18)/100),search:true,editable: true,required : true,editoptions:{maxlength:399}},
   		{name:'apellidos',index:'apellidos',width:((anchoPantallaa2*18)/100),search:true,editable: true,required : true,editoptions:{maxlength:399}},
   		{name:'telefono',index:'telefono',width:((anchoPantallaa2*14)/100),search:true,editable: true,required : true,editoptions:{maxlength:199}},		
   		{name:'celular',index:'celular',width:((anchoPantallaa2*15)/100),search:true,editable: true,required : true,editoptions:{maxlength:199}},
   		{name:'direccion',index:'direccion',width:((anchoPantallaa2*30)/100),search:true,editable: true,required : true,editoptions:{maxlength:299}},
   	],
   	rowNum:20,
   	rowList:[20,30,40],
   	pager: '#pagerdit2',
   	sortname: 'nombres',
        viewrecords: true,
        sortorder: "asc",
	multiselect: false,
        editurl: 'edita_vendedor.jsp',
	//loadonce: true,
	rownumbers: false,
	height: 150,
        width:anchoPantallaa2,
        shrinkToFit: false,
	caption:"LISTADO DE VENDEDORES",
	ondblClickRow: function(id){  }
	
});

jQuery("#listdit2").jqGrid('navGrid','#pagerdit2',{add:false,edit:true,del:true,search:true,view: true},
                                                        {width:355,closeAfterEdit: true},//opciones edit
							{width:355,closeAfterAdd: true}, //opciones add
							{width:355}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:355} //para el view
 								);

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
    <br>
<center>
<center>
    <table id="listdit" ></table>
    <div id="pagerdit"></div> 
    <br>
    <table id="listdit2"></table>
    <div id="pagerdit2"></div>
    <br>               
</center>
</body>
</html>