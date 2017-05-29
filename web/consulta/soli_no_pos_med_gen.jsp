<%-- 
    Document   : soli_no_pos_med_gen
    Created on : 12/11/2013, 10:18:34 AM
    Author     : servidor
--%>
<%@page import="java.util.Calendar" session="true" %>
<%@page import="java.util.GregorianCalendar" session="true" %>
<%@page import="java.util.Date" session="true" %>
<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
                   
        var anchoPantalla3=990;

 $(document).ready(function(){
        jQuery("#listSolinoP").jqGrid({
   	url:'carga_muestra_soli_no_post_med.jsp',
	datatype: "json",
   	colNames:['id_soli','Medicamento uno','Medicamento dos','Medicamento tres','Fecha'],
   	colModel:[
   		{name:'id_ima',index:'id_ima',hidden:true,width:0,search:false,editable: false,required : false},
              {name:'cup_verdadero',index:'cup_verdadero', width:((anchoPantalla3*28)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcion',index:'descripcion', width:((anchoPantalla3*28)/100),search:true, editable: true,required : true,editoptions: {maxlength: 400},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'reporte',index:'reporte', width:((anchoPantalla3*28)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'fecha',index:'fecha', width:((anchoPantalla3*10)/100),search:true, editable: true,required : true,editoptions: {maxlength: 400},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	    ],
   	rowNum:2,
   	rowList:[2,15,30,45],
   	pager: '#pagerSolinoP',
   	sortname:'s.id_soli_no_post',
        viewrecords: true,
        sortorder: "desc",    
        shrinkToFit: false,
     ///multiselect: false,
     ///loadonce: true,
     ///height:50,
        height:'auto',   
        width:anchoPantalla3-13,
        rownumbers: false,
	caption: "Solicitudes de Medicamentos no pos disponibles para reactivar",
	ondblClickRow: function(id){ $("#carga_soli_no_pos_med_gen").load("sub_soli_no_post_tres.jsp?id_soli_n_p="+id+"");  }	
    });
    jQuery("#listSolinoP").jqGrid('navGrid','#pagerSolinoP',{add:false,edit:false,del:false,search:false,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:60} //para el view
 								);
   /* jQuery("#listSolinoP").jqGrid('navButtonAdd','#pagerSolinoP',
        {
      caption:"",
      buttonicon:"ui-icon-trash",
      onClickButton:function(){ 
                                var id = jQuery("#listSolinoP").jqGrid('getGridParam','selrow');
                                if (id)	{
                                         var ret = jQuery("#listSolinoP").jqGrid('getRowData',id);
                                         apprise("¿Esta seguro de eliminar el resulatado de la imagen seleccionada: "+ret.cup_verdadero+" ?", {'verify':true}, function(opcion) {
                                                            if(opcion) {                                                                         
                                                                     //     setTimeout ('recaga_tablas()', 500); 
                                                                       }
                                                           });       
                                        }
                                else { alert("Selecciona el resultado de imagen a eliminar");}                                
                              },
      position:"last",
      title:"Borrar resultado de imagen",
      cursor: "pointer"}); */
      
      //////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////      
      
        jQuery("#listSolinoP2").jqGrid({
   	url:'carga_soli_no_pos_med_gen.jsp',
	datatype: "json",
   	colNames:['id_soli','Medicamento uno','Medicamento dos','Medicamento tres'],
   	colModel:[
   		{name:'id',index:'id',hidden:true,width:0,search:false,editable: false,required : false},
              {name:'cup_verdadero',index:'cup_verdadero', width:((anchoPantalla3*32)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcion',index:'descripcion', width:((anchoPantalla3*31)/100),search:true, editable: true,required : true,editoptions: {maxlength: 400},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'reporte',index:'reporte', width:((anchoPantalla3*31)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	 ],
   	rowNum:2,
   	rowList:[2,15,30,45],
   	pager: '#pagerSolinoP2',
   	sortname:'s.id_soli_no_post',
        viewrecords: true,
        sortorder: "desc",    
        shrinkToFit: false,
     ///multiselect: false,
     ///loadonce: true,
     ///height:50,
        height:'auto',   
        width:anchoPantalla3-13,
        rownumbers: false,
	caption: "Solicitudes de medicamentos no pos realizadas",
	ondblClickRow: function(id){ $("#carga_soli_no_pos_med_gen").load("../administrativa/datos_soli_no_pos.jsp?id_soli_no_pos="+id+"");  }	
    });
    jQuery("#listSolinoP2").jqGrid('navGrid','#pagerSolinoP2',{add:false,edit:false,del:false,search:false,view: true},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:60} //para el view
 								);
     jQuery("#listSolinoP2").jqGrid('navButtonAdd','#pagerSolinoP2',
        {
      caption:"",
      buttonicon:"ui-icon-trash",
      onClickButton:function(){ 
                                var id = jQuery("#listSolinoP2").jqGrid('getGridParam','selrow');
                                if (id)	{
                                       //  var ret = jQuery("#listSolinoP2").jqGrid('getRowData',id);
                                         apprise("¿Esta seguro de eliminar la solicitud seleccionada?", {'verify':true}, function(opcion) {
                                                            if(opcion) { 
                                                                $("#carga_soli_no_pos_med_gen").load("borra_soli_no_pos_med_gen.jsp?cod_borra="+id+"");
                                                                setTimeout ('recar_snp()', 800); 
                                                                       }
                                                           });       
                                        }
                                else { alert("Selecciona la solicitud a eliminar");}                                
                              },
      position:"last",
      title:"Borrar solicitud",
      cursor: "pointer"});   
      
      
      
      
      });
     function recar_snp(){
                        jQuery("#listSolinoP").jqGrid('setCaption',"Solicitudes de Medicamentos no pos disponibles para reactivar").trigger('reloadGrid');
                        jQuery("#listSolinoP2").jqGrid('setCaption',"Solicitudes de medicamentos no pos realizadas").trigger('reloadGrid');
                      //  document.getElementById("carga_soli_no_pos_med_gen").innerHTML="";  
                      }         

        </script>
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
     %>
     <center>
            <table id="listSolinoP" ></table>
            <div id="pagerSolinoP"></div> 
            <br>
            <table id="listSolinoP2" ></table>
            <div id="pagerSolinoP2"></div> 
    </center>
 <br>
 <div id="carga_soli_no_pos_med_gen">
     
 </div>
    </body>
</html>
