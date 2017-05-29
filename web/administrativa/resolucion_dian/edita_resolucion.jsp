<%-- 
    Document   : edita_resolucion
    Created on : 27/11/2013, 06:26:20 PM
    Author     : servidor
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
                  var lastsel;
                  jQuery("#listRESU").jqGrid({
                            url:'resolucion_dian/carga_rsp.jsp?q=2',
                            datatype: "json",
                            colNames:['id','Numero Resolución','Fecha','Numero Inicia','Numero Fin','Tipo Factura','Estado'],
                            colModel:[
                                    {name:'id',index:'id',hidden:true,width:120,editable: false,required : true,editoptions:{maxlength: 63}},
                                    {name:'numero_resolucion',index:'numero_resolucion',width:110,align: "center",editable:true,required : true,editoptions:{maxlength: 99, dataInit: function(element) { $(element).prop("readonly",true) }}},   		
                                    {name:'fecha_resolucion',index:'fecha_resolucion', width:70,align: "center",search:true, editable: true,required : true,editoptions: {maxlength:399},editrules: { required:true},searchoptions:{sopt:['cn','eq']}},
                                    {name:'num_inicial',index:'num_inicial', width:100,search:true,align: "center", editable: true,required :false,editoptions: {maxlength:399},editrules: { required: false},searchoptions:{sopt:['cn','eq']}},
                                    {name:'num_final',index:'num_final', width:100,search:true, align: "center",editable: true,required :false,editoptions: {maxlength:399},editrules: { required:false },searchoptions:{sopt:['cn','eq']}},
                                    {name:'tipo_factura',index:'tipo_factura', width:515,search:true, editable: true,required :false,editoptions: {maxlength:99},editrules: { required:false},searchoptions:{sopt:['cn','eq']}},
                                    {name:'estado',index:'estado', width:85,search:false, align: "center",editable: true,required : false,edittype:"select",editoptions:{value:"0:Inactivo;1:Activo"},editrules: { required:false},searchoptions:{sopt:['cn','eq']}},
                         //	    {name:'estado',index:'estado', width:80,align:"right",search:false, sortable: true,editable:true,edittype:"select",editoptions:{value:"1:Activo;0:Inactivo"},searchoptions:{sopt:['cn','eq']}},    
                                       ],
                            rowNum:5,
                            rowList:[3,5,14,20,40],
                            pager: '#pagerRESU',
                            sortname: 'id_resolucion_dian',
                            viewrecords: true,
                            sortorder: "desc",
                         // height:"auto",
                            height:115,
                            width:1025,
                            ondblClickRow: function(id){
                               $("#resu_resol_edi").load("resolucion_dian/form_edita_resolucion.jsp?id_par="+id+"");
                            },
                            shrinkToFit: false,//columnas tamaÃ±o dato
                            rownumbers: false,
                            editurl: 'resolucion_dian/borra.jsp',
                            caption: "RESOLUCIÓN DIAN"	
                    });


                    jQuery("#listRESU").jqGrid('navGrid','#pagerRESU',{add:false,edit:false,del:false,search:false,view:false},
                                                {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
                                                                            {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
                                                                            {}, //opciones del
                                                                            {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                                                                            {width:420} //para el view
                                            );

                    jQuery('#listRESU').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
                    jQuery("#listRESU").jqGrid('navButtonAdd','#pagerRESU',
                                            {
                                            caption:"",
                                            buttonicon:"ui-icon-trash",
                                            onClickButton:function(){ 
                                                        var id = jQuery("#listRESU").jqGrid('getGridParam','selrow');
                                                        if (id)	{
                                                                var ret = jQuery("#listRESU").jqGrid('getRowData',id);
                                                                if(ret.estado==1){alert("No se puede eliminar una resolución activa, se debe activar otra primero");}
                                                                else{
                                                                      apprise("¿Esta seguro de eliminar la resolución seleccionada: "+ret.numero_resolucion+" ?", {'verify':true}, function(opcion) {
                                                                                    if(opcion) {  

                                                                                                $("#resu_resol").load("resolucion_dian/borra.jsp?id="+id+"");
                                                                                                setTimeout ('recagaresolu()',700); 
                                                                                            }
                                                                                });      
                                                                     }           
                                                                }
                                                        else { alert("Selecciona la fila a eliminar");}
                                                               },
                                            position:"last",
                                            title:"Borra Resolución",
                                            cursor: "pointer"});
function recagaresolu(){ jQuery("#listRESU").jqGrid('setCaption',"RESOLUCIÓN DIAN").trigger('reloadGrid');}
        </script>
    </head>
    <body>
     <center>
       <table id="listRESU" ></table>
        <div id="pagerRESU"></div>   
     </center>
    <div id="resu_resol_edi"></div>
    </body>
</html>
