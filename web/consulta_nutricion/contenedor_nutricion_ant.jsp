<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

         

  $(document).ready(function(){
             jQuery("#list3").jqGrid({
   	url:'server.php?q=3',
	datatype: "json",
   	colNames:['Tipo','Descripcion'],
   	colModel:[
   		{name:'cedula_nit',index:'cedula_nit', width:30,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'primer_nombre',index:'primer_nombre', width:150,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}}
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
   

                               
function cambiaPestanaNutri(pstana){

                           if(pstana==1){$("#tabs-1").load("../consulta/datospersonales.jsp");}
                           else if(pstana==3){$("#tabs-1").load("menu.jsp");}
                           else if(pstana==2){$("#tabs-1").load("consulta_nutricion.jsp");}
                           else{$("#tabs-1").load("menu.jsp");}
                             
                         }  
</script>        
 	<style type="text/css">
	body{
		font: 62.5% "Trebuchet MS", sans-serif;
		margin: 5px;
	}
	#figu:hover{
	       background-color:#3baae3;                                
	       cursor:pointer;                                
	       border-radius: 10px;                           
	       }
	#dsa{padding: 5px 5px 0px 5px;}
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
	label,option,select{font-family:"Eras Medium ITC";
	      color:#2779aa;
          font-size:11pt;}
	legend{font-family:"Eras Bold ITC";
	       font-size:11pt;
    	   color:#2779aa;}
    fieldset{border:1px #2779aa solid;
             -webkit-border-radius: 10px;
             -moz-border-radius: 10px;
             border-radius: 10px;} 
             
    .boton{font-family:"Eras Medium ITC";
	      color:#2779aa;
          font-size:11pt;
          background:#e4f1fb;
          -webkit-border-radius: 10px;
          -moz-border-radius: 10px;
           border-radius: 10px;
         }
    .boton:hover {
     	 background:#3baae3;
 	     /*border-top-color: #3baae3;*/ 
         color: #ffffff;
         cursor: pointer;
		}
	
	</style>
</head>
<body> 
<%
             
if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || request.getParameter( "s_agenda" )==null || request.getParameter("s_paciente")==null){
                    %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
    
    
            String agenda=request.getParameter( "s_agenda" ); 
            String ced_pacinet=request.getParameter("s_paciente");
               session.setAttribute("serial_agenda",agenda); 
               session.setAttribute("serial_pacinete",ced_pacinet);
               session.setAttribute("valida_nutri","1");
      conecta_bd ba = new conecta_bd();
         ba.ConectaDb();
      
         String genero="";
                        String sql="select genero from personas where serial='"+ced_pacinet+"'";    
                        ResultSet resu2=ba.consultas(sql);
                        try{
                            while (resu2.next()&&resu2!=null) {   
                               genero=resu2.getString(1);                           
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cierraResultado(resu2);
                        ba.cerrar();        
    //    System.out.println("nombre "+(String)session.getAttribute("nombre")+" clave "+(String)session.getAttribute("clave")+" id "+session.getAttribute("id")+" permiso "+(String)session.getAttribute("permiso")+" agenda"+(String)session.getAttribute("serial_agenda")+" serial pacinete "+(String)session.getAttribute("serial_pacinete"));
                session.setAttribute("generop",genero);          
    %>
<table style="height:100%;width:100%">
<tr style="height:100px"><td colspan="2">
<center><img src="../imagenes/fotos/baner.png" alt="imagen no encontrada" height="100px" width="100%"></center>

</td></tr>

<tr >
<td style="width:250px" >
<div id="alertas" style="width:250px; height:100%; overflow:auto;">
<table border="0" style="height:100%;width:100%">
<!-- consultas anteriores -->
<tr><td>
<div id="dsa">
<center>
<table id="list3" ></table>
</center>
</div>
</td></tr>
</table>
</div>
</td>


<td>

<div id="tabs" style="height:100%;width:99%;">
    
    <ul>    
        <li><a href="#tabs-1" onclick="cambiaPestanaNutri(1)">Datos Personales</a></li>
        <li><a href="#tabs-1" onclick="cambiaPestanaNutri(2)">Consulta</a></li>
        <li><a href="#tabs-1" onclick="cambiaPestanaNutri(3)">Menu</a></li>
                
    </ul>
    <div id="tabs-1" style="height:400px;width:1012px;overflow:auto;">
    </div>
    <!--
     <ul>
        <li><a href="#tabs-1">Nunc tincidunt</a></li>
        <li><a href="#tabs-2">Proin dolor</a></li>
        <li><a href="#tabs-3">Aenean lacinia</a></li>
    </ul>
    <div id="tabs-1" style="height:400px;width:1012px;overflow:auto;">
    </div>
    <div id="tabs-2" style="height:400px;width:1012px;overflow:auto;">
    </div>
    <div id="tabs-3" style="height:400px;width:1012px;overflow:auto;">
    </div>
-->
</div>



</td>



</tr>

</table>
<script type="text/javascript" language="javascript">
//document.writeln("<b>Tú resolución es de:</b> " + screen.width + " x " + screen.height +"");
var hoja = document.createElement('style')
  var element = document.getElementById("tabs-1");
  element.style.width= ""+(screen.width-320)+"px";
  element.style.height= ""+(screen.height-320)+"px";
  cambiaPestanaNutri(1);
</script>

</body>
</html>

