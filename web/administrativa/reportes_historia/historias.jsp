<%-- 
    Document   : editarpaciente
    Created on : 29/04/2013, 10:29:31 AM
    Author     : EMMANUEL
--%>
<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>
      
<script type="text/javascript" language="javascript">
              function muestra_formu(ids){
                document.getElementById("from_med_con2").value=ids;
                $("#resu_Hitro_rep" ).dialog( "open" );
            }
              function imprime_from_imag(iidd){
                  var id=document.getElementById("from_med_con2").value;
                   $("#resu_Hitro_rep" ).dialog( "close" );
                  if(iidd==1){  window.open("../reportes/reporte_formula_med/formulas.jsp?cod_con="+id+""); }
                         else{  window.open("../reportes/reporte_formula_med/formula.jsp?cod_con="+id+""); }
                                         }
  
jQuery("#listaHistoImp").jqGrid({
   	url:'reportes_historia/carga_historias.jsp?hist=0',
	datatype: "json",
   	colNames:['id','Cedula','P nombre','S nombre','P apellido','S apellido'],
   	colModel:[
                {name:'id',index:'id',hidden:true,width:120,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'id_person',index:'id_person',width:120,editable: false,required : true,editoptions:{maxlength: 63}},   		
                {name:'p_nom',index:'p_nom', width:215,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'s_nom',index:'s_nom', width:215,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	        {name:'p_ape',index:'p_ape', width:215,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'s_ape',index:'s_ape', width:215,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	    ],
   	rowNum:5,
   	rowList:[3,5,10,20,40,400],
   	pager: '#pagerHistoImp',
   	sortname: 'p_nom,s_nom,p_ape,s_ape',
        viewrecords: true,
        sortorder: "asc",
        height:"auto",
        width:1025,
        shrinkToFit: false,//columnas tamaño dato
        rownumbers: false,
	caption: "Historia Clinica",
	onSelectRow: function(ids){
                                    if(ids == null) {
                                            ids=0;
                                            if(jQuery("#listaConsulta").jqGrid('getGridParam','records') >0 )
                                            {
                                               jQuery("#listaConsulta").jqGrid('setGridParam',{url:"reportes_historia/carga_consultas.jsp?hist=0&idtipo=0",page:1});
                                               jQuery("#listaConsulta").jqGrid('setCaption',"Consultas ").trigger('reloadGrid');
                                            }
                                    } else {
                                               var comboe = document.getElementById("especialidad"); 
                                               var idse = comboe.options[comboe.selectedIndex].value; 
                                               var idste = comboe.options[comboe.selectedIndex].text;                                                
                                               var ret = jQuery("#listaHistoImp").jqGrid('getRowData',ids);
                                               var per = ret.p_nom+" "+ret.s_nom+" "+ret.p_ape+" "+ret.s_ape;
                                               jQuery("#listaConsulta").jqGrid('setGridParam',{url:"reportes_historia/carga_consultas.jsp?hist="+ids+"&idtipo="+idse+"",page:1});
                                               jQuery("#listaConsulta").jqGrid('setCaption',"Consultas "+idste+" de "+per).trigger('reloadGrid');
                                            }
                                    }	
});


jQuery("#listaHistoImp").jqGrid('navGrid','#pagerHistoImp',{add:false,edit:false,del:false,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);
            
jQuery('#listaHistoImp').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
jQuery("#listaHistoImp").jqGrid('navButtonAdd','#pagerHistoImp',
                 {
                  caption:"",
               // buttonicon:"ui-icon-circle-plus",     
                  buttonicon:"ui-icon-print",
                  onClickButton:function(){      
                               var id = jQuery("#listaHistoImp").jqGrid('getGridParam','selrow');
                                if (id)	{
                                          var comboe = document.getElementById("especialidad"); 
                                          var idse = comboe.options[comboe.selectedIndex].value; 
                                          if(idse==1){ window.open("../reportes/reporte_historia_med_ant/historia_medica_ant.jsp?id_paci="+id+"&permi=1"); }   
                                          if(idse==2){ window.open("../reportes/reporte_historia_med_ant/historia_medica_ant.jsp?id_paci="+id+"&permi=2"); }   
                                          if(idse==3){ window.open("../reportes/reporte_historia_med_ant/historia_medica_ant.jsp?id_paci="+id+"&permi=3"); }   
                                          if(idse==4){ window.open("../reportes/reporte_historia_nutri_ant/historia_nutri_ant.jsp?id_paci="+id+""); }   
                                          if(idse==5){ window.open("../reportes/reporte_historia_psico_ant/historia_psico_ant.jsp?id_paci="+id+""); }   
                                          if(idse==6){ window.open("../reportes/reporte_historia_trabs_ant/historia_trabs_ant.jsp?id_paci="+id+""); }  
                                        }
                                else { alert("Selecciona historia a imprimir");}
                             
                  },
                  position:"last",
                  title:"Imprimir Historia ",
                  cursor: "pointer"});
 ///////////////////////////////
 ///////////////////////////////
 
jQuery("#listaConsulta").jqGrid({
   	url:'reportes_historia/carga_consultas.jsp?hist=0&idtipo=0',
	datatype: "json",
   	colNames:['id','permi','Tipo','Atendida por','Fecha','Formula'],
   	colModel:[
                {name:'id',index:'id',hidden:true,width:120,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'permi',index:'permi',hidden:true,width:120,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'tipo',index:'tipo', width:415,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'prof',index:'prof', width:395,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	        {name:'fecha',index:'fecha', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'Formula',index:'Formula', width:60,search:false, editable:false,required : false,editoptions: {maxlength: 43},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
             ],
   	rowNum:5,
   	rowList:[3,5,10,20,40,400],
        gridComplete: function ()
                    {
                      var ids = jQuery("#listaConsulta").jqGrid('getDataIDs');
                        for (var i = 0; i < ids.length; i++)
                        {
                            var cl = ids[i];
                            var ret = jQuery("#listaConsulta").jqGrid('getRowData',ids[i]);
                            
                            if(ret.Formula=="0"){ be = ""; }
                            else {  be = "<center><input type='image' src='../imagenes/fotos/formula.png' style='height:22px;width:22px' onclick=\"muestra_formu('"+ids[i]+"')\"></center>";  }
                            jQuery("#listaConsulta").jqGrid('setRowData', ids[i], { Formula: be });
                        }
                    },
   	pager: '#pagerConsulta',
   	sortname: 'p_nom,s_nom,p_ape,s_ape',
        viewrecords: true,
        sortorder: "desc",
        height:"auto",
        width:1025,
        shrinkToFit: false,//columnas tamaño dato
        rownumbers: false,
	caption: "Consultas",
	onSelectRow: function(id){   }	
});


jQuery("#listaConsulta").jqGrid('navGrid','#pagerConsulta',{add:false,edit:false,del:false,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);
            
jQuery('#listaConsulta').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
jQuery("#listaConsulta").jqGrid('navButtonAdd','#pagerConsulta',
                 {
                  caption:"",    
                  buttonicon:"ui-icon-print",                          
                 onClickButton:function(){ 
                                var id = jQuery("#listaConsulta").jqGrid('getGridParam','selrow');
                                if (id)	{
                                         var ret = jQuery("#listaConsulta").jqGrid('getRowData',id);
                                         var per =ret.permi;
                                              if(per==1){ window.open("../reportes/reporte_consulta_med_ant/consulta_medica_ant.jsp?cod_con="+id+""); }
                                         else if(per==2){ window.open("../reportes/reporte_consulta_med_ant/consulta_medica_ant.jsp?cod_con="+id+""); }
                                         else if(per==3){ window.open("../reportes/reporte_consulta_med_ant/consulta_medica_ant.jsp?cod_con="+id+""); }
                                         else if(per==4){ window.open("../reportes/reporte_consulta_nutri_ant/consulta_nutri_ant.jsp?cod_con="+id+""); }
                                         else if(per==5){ window.open("../reportes/reporte_consulta_psico_ant/consulta_psico_ant.jsp?cod_con="+id+""); }
                                         else if(per==6){ window.open("../reportes/reporte_consulta_trabs_ant/consulta_trabs_ant_imp.jsp?cod_con="+id+""); }
                                        }
                                else { alert("Selecciona consulta a imprimir");}
                                
                              },
                  position:"last",
                  title:"Imprimir Consulta",
                  cursor: "pointer"});
   //////////////////////////////////////////////
   //////////////////////////////////////////////
   //////////////////////////////////////////////
function cambia_especialidad(){
    var combo = document.getElementById("especialidad"); 
    var ids = combo.options[combo.selectedIndex].value; 
    var idst = combo.options[combo.selectedIndex].text; 
    
    jQuery("#listaHistoImp").jqGrid('setGridParam',{url:"reportes_historia/carga_historias.jsp?hist="+ids,page:1});
    jQuery("#listaHistoImp").jqGrid('setCaption',"Historia Clinica: "+idst).trigger('reloadGrid');
    
    jQuery("#listaConsulta").jqGrid('setGridParam',{url:"reportes_historia/carga_consultas.jsp?hist=0&idtipo=0",page:1});
    jQuery("#listaConsulta").jqGrid('setCaption',"Consultas ").trigger('reloadGrid');
}

  $(function() { 
     $( "#resu_Hitro_rep" ).dialog({
      autoOpen: false,
      modal: true,
      height:100,
      width: 200,
      dialogClass: 'no-close',
      /*open: function(event, ui) {
            $(this).closest('.ui-dialog').find('.ui-dialog-titlebar-close').hide();
          },*/
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1200
      }
    });}); 
</script>
<style type="text/css">
    .error{
	background-color: #BC1010;
	padding: 6px 12px;
	border-radius: 4px;
	color: white;
	font-weight: bold;
	margin-left: 16px;
	margin-top: -200px;
	position: absolute;
}
.error:before{
	content: '';
    border-top: 8px solid transparent;
    border-bottom: 8px solid transparent;
    border-right: 8px solid #BC1010;
    border-left: 8px solid transparent;
    left: -16px;
    position: absolute;
    top: 4px;
}
</style>
<title>Sin título 1</title>

</head>

<body>
    
      <% request.setCharacterEncoding("UTF-8");
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     <% 
        out.println("</body></html>");
        return;
        }
          conecta_bd ba = new conecta_bd();
          ba.ConectaDb(); 
          
          String sql="select id_permi,descripcion from permisos where id_permi<=6 order by id_permi ";
          out.print("<center><label>Especialidad: &nbsp;</label>");
          out.print("<select onchange='cambia_especialidad()' id='especialidad' name='especialidad'> <option value='0'>Seleccione...</option>");
          ResultSet resu2=null;
          try{  resu2=ba.consultas(sql);
               while (resu2.next()&&resu2!=null) {  
                                  out.print("<option value='"+resu2.getString(1)+"'>"+resu2.getString(2).replace("Consulta ","") +"</option>");
                                                  }
             }                       
          catch(SQLException ex){}
          catch(Exception exe){}
          ba.cierraResultado(resu2);
                             
     %>      
         </select><br>
         
         
       <table id="listaHistoImp" ></table>
        <div id="pagerHistoImp"></div>   <br>
        
       <table id="listaConsulta" ></table>
        <div id="pagerConsulta"></div>   
     
      <div id="resu_Hitro_rep"><center><br>
                <input type="button" value="Sencilla" id="aceptar" onclick="imprime_from_imag(1)">    &nbsp;  &nbsp;           
                <input type="button" value="Doble" id="aceptar"  onclick="imprime_from_imag(2)">
                <input type="hidden" id="from_med_con2" name="from_med_con2">
            </center>
        </div>
     
     </center>
     
<% ba.cerrar(); %>  

</body>

</html>
