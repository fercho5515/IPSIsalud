<%@page import="java.util.*" session="true" %>
<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8">
<title>Ips Isalud Total S.A.S</title>
	        <link rel="stylesheet" type="text/css" media="screen" href="../jquery/css/flick/jquery-ui-1.9.2.custom.css" >
                <link rel="stylesheet" type="text/css" media="screen" href="../jquery/jqgrid/css/ui.jqgrid.css" >
                <link rel="stylesheet" type="text/css" media="screen" href="../jquery/bajados/ui.multiselect.css" >
                <script src="../jquery/bajados/jquery.min.js" type="text/javascript"></script> 
                <script src="../jquery/bajados/jquery-ui.min.js" type="text/javascript"></script> 
		<script type="text/javascript" language="javascript" src="../jquery/js/jquery-ui.js"></script>
		<script type="text/javascript" src="../jquery/bajados/jquery.ui.widget.js"></script>
		<script type="text/javascript" src="../jquery/bajados/jquery.ui.datepicker-es.js"></script>
		<script type="text/javascript" src="../jquery/bajados/jquery.ui.core.js"></script>
		<script src="../jquery/jqgrid/js/i18n/grid.locale-es.js" type="text/javascript"></script>
                <script src="../jquery/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
                <link type='text/css' href='../jquery/bajados/modal/osx.css' rel='stylesheet' media='screen'>
                <script type='text/javascript' src='../jquery/bajados/modal/jquery.simplemodal.js'></script>

<script type="text/javascript" language="javascript">

    function inicio(){
                               location.href="../ingreso.jsp";    
                            }                           
    function cierra(){
                               location.href="../cierra_sesion.jsp";    
                     }


         $(document).ready(function(){
             jQuery("#list10").jqGrid({
   	url:'server.php?q=2',
	datatype: "json",
   	colNames:['Tipo','Descripcion',],
   	colModel:[
   		{name:'cedula_nit',index:'cedula_nit', width:30,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'primer_nombre',index:'primer_nombre', width:150,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		],
   	rowNum:15,
   	rowList:[15,30,45],
   	pager: '#pager10',
   	sortname: 'cedula_nit',
    viewrecords: true,
    sortorder: "desc",
	//multiselect: false,
	////loadonce: true,
	height: 'auto',
	//height: 190,
//	height: 'auto',
   // autowidth: true, 
   width:200,
    rownumbers: false,
    editurl: 'editaCli.php',
	caption: "ALERTAS",
	ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
	                                     NuevoCaso2(""+cedula_nit+"");  }
	
});
 });

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

         $(document).ready(function(){
             jQuery("#list11").jqGrid({
   	url:'server.php?q=2',
	datatype: "json",
   	colNames:['Tipo','Descripcion',],
   	colModel:[
   		{name:'cedula_nit',index:'cedula_nit', width:30,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'primer_nombre',index:'primer_nombre', width:150,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		],
   	rowNum:15,
   	rowList:[15,30,45],
  // 	pager: '#pager10',
   	sortname: 'cedula_nit',
    viewrecords: true,
    sortorder: "desc",
	//multiselect: false,
	////loadonce: true,
	height: 'auto',
	//height: 190,
	//height: 'auto',
	width:200,
    //autowidth: true, 
    rownumbers: false,
    editurl: 'editaCli.php',
	caption: "RECOMENDACIONES",
	ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
	                                     NuevoCaso2(""+cedula_nit+"");  }
	
});
 });

  $(document).ready(function(){
             jQuery("#list12").jqGrid({
   	url:'server.php?q=2',
	datatype: "json",
   	colNames:['Tipo','Descripcion',],
   	colModel:[
   		{name:'cedula_nit',index:'cedula_nit', width:30,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'primer_nombre',index:'primer_nombre', width:150,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		],
   	rowNum:15,
   	rowList:[15,30,45],
   //	pager: '#pager10',
   	sortname: 'cedula_nit',
    viewrecords: true,
    sortorder: "desc",
	//multiselect: false,
	////loadonce: true,
	height: 'auto',
	//height: 190,
    width:200,
    //autowidth: true, 
    rownumbers: false,
    editurl: 'editaCli.php',
	caption: "CONSULTAS ANT",
	ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
	                                     NuevoCaso2(""+cedula_nit+"");  }
	
});
 });
/////////////////////////////
//////////tabs///////////////
/////////////////////////////
 $(function() {
        $( "#tabs" ).tabs();
    });
 $(function() {
        $( "#alertas" ).tabs();
    });
   

                               
function cambiaPestanaMed(pstana){

                           if(pstana==1){$("#tabs-citas").load("formulas.jsp");}
                           else{$("#tabs-citas").load("formulas_anteriores.jsp");}
                          }    

                          
    
</script>        
        

	<style type="text/css">
	body{
		font: 62.5% "Trebuchet MS", sans-serif;
		margin: 5px;
	}
	#dsa{padding: 5px 5px 0px 5px;}
	label,option,select{font-family:"Eras Medium ITC";
	      color:#2779aa;
          font-size:11pt;}
	
	
	#figu:hover{
	       background-color:#3baae3;                                
	       cursor:pointer;                                
	       border-radius: 10px;                           
	       }
    legend{font-family:"Eras Bold ITC";
	       font-size:11pt;
    	   color:#2779aa;}
    fieldset{border:1px #2779aa solid;
             -webkit-border-radius: 10px;
             -moz-border-radius: 10px;
             border-radius: 10px;} 
             
    #aceptar{font-family:"Eras Medium ITC";
   			color:#2779aa;
          font-size:11pt; background:white;
         
          -webkit-border-radius: 10px;
          -moz-border-radius: 10px;
           border-radius: 10px;
         }
    #aceptar:hover {
     	 background: #3baae3;
 	     border-top-color: #3baae3;
         color: #ffffff;
         cursor: pointer;
		}
	h2{
		color:#2779aa;
	}
	
	
	</style>
</head>
<body>
    
    <% 
      
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || (request.getParameter( "permiso" )==null&&session.getAttribute("permiso")==null)){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="index.jsp">volver</a></center>
     
  
            <% 
              out.println("</body></html>");
              return;
            }  
              String permisos="";
                          
              if(request.getParameter( "permiso" )==null){
                 permisos=(String)session.getAttribute("permiso");
               }
              else{permisos=request.getParameter( "permiso" );
                  session.setAttribute("permiso",permisos);
                  }                          
                         
               String nombre=(String)session.getAttribute("nombre");
               String clave=(String)session.getAttribute("clave");
               String id=(String)session.getAttribute("id");
               String cedula=(String)session.getAttribute("cedula");
               String imagen=(String)session.getAttribute("imagen");
            
    
    
            
               
    //    System.out.println("nombre "+(String)session.getAttribute("nombre")+" clave "+(String)session.getAttribute("clave")+" id "+session.getAttribute("id")+" permiso "+(String)session.getAttribute("permiso")+" agenda"+(String)session.getAttribute("serial_agenda")+" serial pacinete "+(String)session.getAttribute("serial_pacinete"));
                
    %>
    
    
<table border="0" style="height:100%;width:100%">
<tr style="height:100px">
<td colspan="2">
<center><img src="../imagenes/fotos/baner.png" alt="imagen no encontrada" height="100px" width="100%"></center>
</td>
</tr>

<tr >
<td>
<div id="tabs" style="height:100%;width:99%;">
    <ul>    
        <li><a href="#tabs-citas" onclick="cambiaPestanaMed(1)">Formulas</a></li>
        <li><a href="#tabs-citas" onclick="cambiaPestanaMed(2)">Formulas Anteriores</a></li>
        
    </ul>
    <div id="tabs-citas" style="height:400px;width:1012%;overflow:auto;">
    </div>
</div>

</td>
</tr>

</table>
<script type="text/javascript" language="javascript">
//document.writeln("<b>Tú resolución es de:</b> " + screen.width + " x " + screen.height +"");
var hoja = document.createElement('style');
  var element = document.getElementById("tabs-citas");
  element.style.width= ""+(screen.width-200)+"px";
  element.style.height= ""+(screen.height-320)+"px";
</script>

<div id="caja2" style="position:absolute;visibility:visible;position:absolute;right:20px;top: 3px;text-align: right;width:615px" >
 <h2><% out.print(""+(String)session.getAttribute("nombre")+""); %></h2>     
<input type="button" value="Inicio" name="aceptar" size="25" id="aceptar" onclick="inicio();" ><br>
<input type="button" value="Cerrar Sesion" name="aceptar" size="25" id="aceptar" onclick="cierra();" >
</div>
