<%-- 
    Document   : edita_eps
    Created on : 28-ago-2013, 12:20:02
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
                  jQuery("#listEPSED").jqGrid({
                            url:'eps/carga_eps.jsp?q=2',
                            datatype: "json",
                            colNames:['id','Codigo','Nombre','Dirección','Telefono','Nit','Ciudad','Tipo'],
                            colModel:[
                                    {name:'indice',index:'indice',hidden:true,width:120,editable: false,required : true,editoptions:{maxlength: 63}},
                                    {name:'ideps',index:'ideps',width:80,editable:true,required : true,editoptions:{maxlength: 99, dataInit: function(element) { $(element).prop("readonly",true) }}},   		
                                    {name:'nombre',index:'nombre', width:285,search:true, editable: true,required : true,editoptions: {maxlength:399},editrules: { required:true},searchoptions:{sopt:['cn','eq']}},
                                    {name:'direccion',index:'direccion', width:315,search:true, editable: true,required :false,editoptions: {maxlength:399},editrules: { required: false},searchoptions:{sopt:['cn','eq']}},
                                    {name:'telefono',index:'telefono', width:85,search:true, editable: true,required :false,editoptions: {maxlength:399},editrules: { required:false },searchoptions:{sopt:['cn','eq']}},
                                    {name:'nit',index:'nit', width:70,search:true, editable: true,required :false,editoptions: {maxlength:99},editrules: { required:false},searchoptions:{sopt:['cn','eq']}},
                                    {name:'ciudad',index:'ciudad', width:85,search:true, editable: true,required : false,editoptions: {maxlength:199},editrules: { required:false},searchoptions:{sopt:['cn','eq']}},
                                    {name:'tipo',index:'tipo', width:60,search:true, editable: true,required : false,editoptions: {maxlength:44},editrules: { required:false },searchoptions:{sopt:['cn','eq']}},
                           ],
                            rowNum:14,
                            rowList:[3,5,14,20,40],
                            pager: '#pagerEPSED',
                            sortname: 'nombre',
                            viewrecords: true,
                            sortorder: "asc",
                            height:"auto",
                            width:1025,
                            shrinkToFit: false,//columnas tamaÃ±o dato
                            rownumbers: false,
                            editurl: 'eps/edita_datos_eps.jsp',
                            caption: "EPS",
                         // hiddengrid: true,
                            onSelectRow: function(id){
                                  //  if(id && id!==lastsel){
                                            jQuery('#listEPSED').jqGrid('restoreRow',lastsel);
                                            jQuery('#listEPSED').jqGrid('editRow',id,true);
                                            lastsel=id;
                                  // } 
                            }	
                    });


                    jQuery("#listEPSED").jqGrid('navGrid','#pagerEPSED',{add:false,edit:false,del:true,search:false,view:false},
                                                {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
                                                                            {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
                                                                            {}, //opciones del
                                                                            {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                                                                            {width:420} //para el view
                                            );

                    jQuery('#listEPSED').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
          
                
        </script>
    </head>
    <body>
     <center>
       <table id="listEPSED" ></table>
        <div id="pagerEPSED"></div>   
     </center>
    </body>
</html>
