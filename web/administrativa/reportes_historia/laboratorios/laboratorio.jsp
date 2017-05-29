<%-- 
    Document   : laboratorio
    Created on : 18/11/2013, 06:05:50 PM
    Author     : servidor
--%>


<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" >
           var  anchoPantallaslab=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
                                            
jQuery("#listLabor").jqGrid({
   	url:'reportes_historia/laboratorios/carga_labor.jsp?hist=0',
	datatype: "json",
   	colNames:['id','Paciente','Identificación','Laboratorio','Ordenado por','Fecha'],
        colModel:[
                  {name:'id',index:'id', hidden:true,width:0,search:false,editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false }},
                  {name:'pac',index:'pac',width:((anchoPantallaslab*27)/100),search:true,editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                  {name:'ced',index:'ced', width:((anchoPantallaslab*9)/100),search:true,align: "center",editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                  {name:'descri',index:'descri', width:((anchoPantallaslab*27)/100),search:true,editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                  {name:'prof',index:'prof', width:((anchoPantallaslab*26)/100),search:true,editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                  {name:'fecha',index:'fecha', width:((anchoPantallaslab*9)/100),search:true,align: "center", editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                 ], 
   	rowNum:5,
   	rowList:[5,10,20,40,400],
   	pager: '#pagerLabor',
   	sortname: 'c.fecha',
        viewrecords: true,
        sortorder: "asc",
        width:anchoPantallaslab+27,
        height: 'auto',
        shrinkToFit: false,//columnas tamaÃ±o dato
        rownumbers: false,                           
	caption: "Solicitudes de Laboratorios",
	//onSelectRow: function(ids){},
        ondblClickRow: function(ids){ 
                                  window.open("reportes_historia/laboratorios/muestra_reportes_lab.jsp?dato2="+ids+"");
                        //          $("#resu_labor").load("reportes_historia/laboratorios/muestra_reportes_lab.jsp?dato2="+ids+"");
                                    }	
});
jQuery("#listLabor").jqGrid('navGrid','#pagerLabor',{add:false,edit:false,del:false,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
			     {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
	 		     {}, //opciones del
 		             {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 			     {width:420} //para el view
 			);
            
jQuery('#listLabor').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});

        </script>
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
        } %>
        <center>
           <table id="listLabor" ></table>
           <div id="pagerLabor"></div>  
        <br>
        <div id="resu_labor"></div>
        </center>
    </body>
</html>

