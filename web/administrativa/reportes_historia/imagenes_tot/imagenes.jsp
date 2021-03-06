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
              function abreDiagImg(id){
                document.getElementById("cod_con_con2").value=id;
                $("#resu_Imagent" ).dialog( "open" );
            }
              function imprime_imag(iidd){
                  var id=document.getElementById("cod_con_con2").value;
                   $("#resu_Imagent" ).dialog( "close" );
                  if(iidd==1){ window.open("../reportes/imagenes/imagen.jsp?cod_con="+id+"");}
                         else{ window.open("../reportes/imagenes/imagenes.jsp?cod_con="+id+"");}
                                         }
            
           var  anchoPantallaslabtt22=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
  jQuery("#listImagent").jqGrid({
   	url:'reportes_historia/imagenes_tot/carga_imag.jsp?hist=0',
	datatype: "json",
   	colNames:['id','codigo','Fecha','Paciente','Tipo Consulta','Imprimir'],
        colModel:[
                  {name:'id',index:'id', hidden:true,width:0,search:false,editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false }},
                  {name:'codigo',index:'codigo', width:((anchoPantallaslabtt22*9)/100),search:true,align: "center", editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                  {name:'fecha',index:'fecha', width:((anchoPantallaslabtt22*7)/100),search:true,align: "center", editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                  {name:'pac',index:'pac',width:((anchoPantallaslabtt22*35)/100),search:true,editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                  {name:'consu',index:'consu',width:((anchoPantallaslabtt22*41)/100),search:true,editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                  {name:'impri',index:'impri',width:((anchoPantallaslabtt22*5)/100),search:true,editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                ], 
   	rowNum:5,
   	rowList:[5,10,20,40,400],
   	pager: '#pagerImagent',
   	sortname: 'co.fecha',
        viewrecords: true,
        sortorder: "desc",
        gridComplete: function ()
                    {
                      var ids = jQuery("#listImagent").jqGrid('getDataIDs');
                      for (var i = 0; i < ids.length; i++)
                        {
                            var cl = ids[i];
                            be = "<center><input type='image' src='../imagenes/fotos/formula.png' style='height:22px;width:22px' onclick=\"abreDiagImg('"+ids[i]+"')\"></center>";  
                            jQuery("#listImagent").jqGrid('setRowData', ids[i], { impri: be });
                        }
                    },
        width:anchoPantallaslabtt22+27,
        height: 'auto',
        shrinkToFit: false,//columnas tamaÃ±o dato
        rownumbers: false, 
	multiselect: false,
	subGrid : true,
    	subGrid: true,
	caption: "Consultas en las que se ordeno laboratorios",
	subGridRowExpanded: function(subgrid_id, row_id) {
		var subgrid_table_id, pager_id;
		subgrid_table_id = subgrid_id+"_t";
		pager_id = "p_"+subgrid_table_id;
		$("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>");
		jQuery("#"+subgrid_table_id).jqGrid({
			url:"reportes_historia/imagenes_tot/carga_imag_det.jsp?cons="+row_id,
			datatype: "json",
			colNames:['id','Paciente','Identificación','Laboratorio','Ordenado por','Fecha'],
                        colModel:[
                                {name:'id',index:'id', hidden:true,width:0,search:false,editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false }},
                                {name:'pac',index:'pac',width:((anchoPantallaslabtt22*26)/100),search:true,editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                                {name:'ced',index:'ced', width:((anchoPantallaslabtt22*8)/100),search:true,align: "center",editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                                {name:'descri',index:'descri', width:((anchoPantallaslabtt22*30)/100),search:true,editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                                {name:'prof',index:'prof', width:((anchoPantallaslabtt22*25)/100),search:true,editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                                {name:'fecha',index:'fecha', width:((anchoPantallaslabtt22*7)/100),search:true,align: "center", editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                                ], 
		   	rowNum:400,
   	             // rowList:[20,40,400],
		     //	pager: pager_id,                        
                        width:anchoPantallaslabtt22-15,
                        height: 'auto',
                        shrinkToFit: false,
		   	sortname: 'l.serial',
		        sortorder: "asc",
		        height: '100%',
                        ondblClickRow: function(ids){ 
                                  window.open("reportes_historia/imagenes/muestra_reportes_img.jsp?dato2="+ids+"");
                        //          $("#resu_labor").load("reportes_historia/laboratorios/muestra_reportes_lab.jsp?dato2="+ids+"");
                                    }
		});
	     // jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id,{edit:false,add:false,del:false});
             // jQuery("#"+subgrid_table_id).jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
	},
	subGridRowColapsed: function(subgrid_id, row_id) {
		// this function is called before removing the data
		//var subgrid_table_id;
		//subgrid_table_id = subgrid_id+"_t";
		//jQuery("#"+subgrid_table_id).remove();
	}
	
});
jQuery("#listImagent").jqGrid('navGrid','#pagerImagent',{add:false,edit:false,del:false});

jQuery('#listImagent').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
   $(function() { 
     $( "#resu_Imagent" ).dialog({
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
           <table id="listImagent" ></table>            
           <div id="pagerImagent"></div>  
        <br>
        <div id="resu_Imagent"
             ><center><br>
                <input type="button" value="Sencillo" id="aceptar" onclick="imprime_imag(1)">    &nbsp;  &nbsp;           
                <input type="button" value="Doble" id="aceptar"  onclick="imprime_imag(2)">
                <input type="hidden" id="cod_con_con2" name="cod_con_con">
            </center>
        </div>
        </center>
    </body>
</html>

