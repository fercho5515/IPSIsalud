<%-- 
    Document   : soli_no_pos
    Created on : 18/11/2013, 05:19:38 PM
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
           var  anchoPantallasnp=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
                                            
jQuery("#listSoliNP").jqGrid({
   	url:'reportes_historia/soli_no_pos/carga_soli_np.jsp?hist=0',
	datatype: "json",
   	colNames:['id','Fecha solicitud','Paciente','Identificación','Profesional','Identificación'],
        colModel:[
                 {name:'id',index:'id', hidden:true,width:0,search:false,editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false }},
                 {name:'fecha',index:'fecha',width:((anchoPantallasnp*10)/100),search:true,align: "center",editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                 {name:'pac',index:'pac', width:((anchoPantallasnp*34)/100),search:true,editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                 {name:'ced',index:'ced', width:((anchoPantallasnp*10)/100),search:true,align: "center",editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                 {name:'prof',index:'prof', width:((anchoPantallasnp*34)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                 {name:'ced2',index:'ced2', width:((anchoPantallasnp*10)/100),search:true,align: "center",editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                 ], 
   	rowNum:5,
   	rowList:[5,10,20,40,400],
   	pager: '#pagerSoliNP',
   	sortname: 'c.fecha',
        viewrecords: true,
        sortorder: "desc",
        width:anchoPantallasnp+27,
        height: 'auto',
        shrinkToFit: false,//columnas tamaÃ±o dato
        rownumbers: false,                           
	caption: "Solicitudes de Medicamentos no POS",
	// onSelectRow: function(ids){},
        ondblClickRow: function(ids){ // window.open("datos_soli_no_pos.jsp?id_soli_no_pos="+ids+"");}
                                         var num= prompt("Introdusca numero para el reporte");
                                         window.open("../reportes/no_pos/soli_no_pos.jsp?cod_sol="+ids+"&numero="+num+"");
                                      }	
});
jQuery("#listSoliNP").jqGrid('navGrid','#pagerSoliNP',{add:false,edit:false,del:false,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
			     {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
	 		     {}, //opciones del
 		             {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 			     {width:420} //para el view
 			);
            
jQuery('#listSoliNP').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});

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
           <table id="listSoliNP" ></table>
           <div id="pagerSoliNP"></div>  
        <br>
        <div id="resu_snp"></div>
        </center>
    </body>
</html>
