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
    //***********************************************
    
          
        //-----------------Form Add Cita-----------------
      $(function(){  
        $('#form_dialog_horario').submit(function(event) {
            //var hor = document.getElementById("horacita").value;
            /*var minuto=document.getElementById("minuto").value;
            var ampm =document.getElementById("ampm").value;
            var proced =document.getElementById("proced").value;
            alert(hora+"-"+minuto+"-"+ampm+"-"+proced)
            */
           
           alert("asf");
            $.ajax({
                type: 'POST',
                url: $(this).attr('action'),
                data: $(this).serialize(),                
                //dataType: "json",
                              
                success: function(data) {
                    alert(data.resp);
                }                             
            });
            
            return false;
        });
      });
      //-----------------------------------------------
               $(function(){
            $('#dialog_medicos').dialog({
                autoOpen: false,
                modal:true,
                buttons: {
                    Ok: function() {
                        $("#div_sesiones").load("cerrar_sesiones.jsp");
                        $( this ).dialog( "close" );
                    }
                },
                show:{
                    effect: "blind",
                    duration: 500
                },
                hide:{
                    effect: "explode",
                    duration: 500
                },
                width:'700px'
            }); 
        });
        
        $(function(){
            $('#dialog_horario').dialog({
                autoOpen: false,
                modal:true,
                buttons: {
                    Ok: function() {
                        alert("a");
                        //$("#div_sesiones").load("cerrar_sesiones.jsp");
                        $( this ).dialog( "close" );
                    }
                },
                show:{
                    effect: "blind",
                    duration: 500
                },
                hide:{
                    effect: "explode",
                    duration: 500
                },
                width:'300px'
            }); 
        });
//***********************************************
    
    

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
   

                               
function cambiaPestana(pstana){

                           if(pstana==1){$("#tabs-citas").load("citas.jsp");}
//                           if(pstana==1){$("#tabs-citas").load("programacion_dia.jsp");}
                           else if(pstana==2){$("#tabs-citas").load("citaspaquete.jsp");}
                           else{$("#tabs-citas").load("reportes_imagenes.jsp");}
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
        <li><a href="#tabs-citas" onclick="cambiaPestana(1)">Evento</a></li>
        <li><a href="#tabs-citas" onclick="cambiaPestana(2)">Paquete</a></li>
        
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
  element.style.width= ""+(screen.width-50)+"px";
  element.style.height= ""+(screen.height-320)+"px";
</script>

<div id="caja2" style="position:absolute;visibility:visible;position:absolute;right:20px;top: 3px;text-align: right;width:615px" >
 <h2><% out.print(""+(String)session.getAttribute("nombre")+""); %></h2>     
<input type="button" value="Inicio" name="aceptar" size="25" id="aceptar" onclick="inicio();" ><br>
<input type="button" value="Cerrar Sesion" name="aceptar" size="25" id="aceptar" onclick="cierra();" >
</div>

<div id="dialog_horario">        
            <form id="form_dialog_horario" name="form_dialog_horario" action="insert_cita.jsp">
                <label>Hora: </label>
                <select id="horacita" name="horacita" >
                    <option value='escoger'>- Seleccione Hora -</option>  
                    <option value='1'> 1 </option>  
                    <option value='2'> 2 </option>  
                    <option value='3'> 3 </option>  
                    <option value='4'> 4 </option>  
                    <option value='5'> 5 </option>  
                    <option value='6'> 6 </option>  
                    <option value='7'> 7 </option>  
                    <option value='8'> 8 </option>  
                    <option value='9'> 9 </option>  
                    <option value='10'> 10 </option>  
                    <option value='11'> 11 </option>  
                    <option value='12'> 12 </option>  
                </select></br>
                <label>Minuto: </label>
                <select id="minutocita" name="minutocita">
                    <option value='escoger'>- Seleccione Hora -</option>
                    <option value='0'> 00 </option>
                    <option value='20'> 20 </option>
                    <option value='40'> 40 </option>
                </select></br>
                <label>Am-Pm: </label>
                <select name="ampmcitas" id="ampmcitas">
                    <option value='escoger'>- Am/Pm -</option>
                    <option value='am'> am </option>
                    <option value='pm'> pm </option>
                </select></br>
                
                <input type="hidden" id="id_tarifario" name="id_tarifario">
                <input type="hidden" id="proced" name="proced">
                <input type="hidden" id="cupv" name="cupv">
                <input type="hidden" id="cont" name="cont">
                <input type="hidden" id="paque" name="paque">
                <input type="hidden" id="id_pac" name="id_pac">
                <input type="hidden" id="fecha" name="fecha">
                <input type="submit" value="Guardar">
                
                
                
            </form>

 
</body>
</html>