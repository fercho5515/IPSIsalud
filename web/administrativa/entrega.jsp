
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" language="javascript">
       
            var anchoPantalla=document.body.offsetWidth -((document.body.offsetWidth*24)/100);  
            var id_consulta=0;
            var id_formula=0;
            var id_person=0;
            var contra=0;
            var paque=0;
            
            //----------------------------------
            
            $('#form_insert_entrega').submit(function() {
                           var vcantidad=document.getElementById("cantidad").value;
                           if(vcantidad == null ||vcantidad.length == 0 || /^\s+$/.test(vcantidad)){
                                                      alert('Digitala cantidad de este medicamento');
                                                      return false; 
                           }
                           var vexis=document.getElementById("existencias").value;
                           if( parseInt(vcantidad) >  parseInt(vexis)){
                                                      alert('No hay suficientes ');
                                                      return false; 
                           }
                           
                           /*
                           var vc10=document.getElementById("c10").value;
                           if(vc10 == null ||vc10.length == 0 ||vc10=='Cie10 no Valido' || /^\s+$/.test(vsubcie10)){
                                                      alert('Codigo Cie10 no valido ');
                                                      return false; 
                           }
                           */
                         
                          
                           $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              datatype:"json",
                              success: function(data) {
                                  if(data.res==1){
                                      $("#dialog_medicamentos").dialog("close");
                                      $("#dialog_insert_medic").dialog("close");
                                      alert("Entrega realizada satisfactoriamente ");
                                      jQuery("#listmedicformula_"+data.res3+"").trigger('reloadGrid');                                       
                                  }else if(data.res==5){
                                      alert("Sobrepasa la cantidad a entregar");
                                  }
                                  else{
                                  alert("Falla al realizar entrega ");
                                  }
                              }
                           })
                           return false;
                      });
            
            //----------------------------------
           
            jQuery("#list_formulas").jqGrid({
                url:'search_formulas.jsp?q=2',
                datatype: "json",
                colNames:['Formula','P Nombre', 'S Nombre', 'P Apellido','S Apellido ','Identificacion','','cont','paq','Fecha'],
                colModel:[
                    {name:'idformula',index:'idformula', width:((anchoPantalla - 400)*20)/100,align:"center"},
                    {name:'p_nom',index:'p_nom', width:((anchoPantalla - 400)*17)/100},
                    {name:'s_nom',index:'s_nom', width:((anchoPantalla - 400)*20)/100},
                    {name:'p_ape',index:'p_ape', width:((anchoPantalla - 400)*20)/100, align:"lefth"},
                    {name:'s_ape',index:'s_ape', width:((anchoPantalla - 400)*20)/100, align:"lefth"},		
                    {name:'id',index:'id', width:((anchoPantalla - 400)*20)/100,align:"center"},		
                    {name:'serial',index:'serial', width:85,align:"right",hidden:true},
                    {name:'cont',index:'cont', width:85,align:"right",hidden:true},		
                    {name:'paq',index:'paq', width:85,align:"right",hidden:true},		
                    {name:'fecha',index:'fecha', width:((anchoPantalla - 400)*23)/100,align:"center"}	
                ],
                rowNum:10,
                rowList:[10,20,30],
                pager: '#pager_formulas',
                sortname: 'fm.id_consulta',
        
                viewrecords: true,
                sortorder: "desc",
                multiselect: false,
                caption: "Formulas Medicas",
                width:anchoPantalla - 100,
                height:100,
                shrinkToFit: false,
                
                onSelectRow: function(ids) {
	
                    var lineap=jQuery("#list_formulas").jqGrid('getRowData',ids);
                    id_person=""+lineap.serial;
                    contra=""+lineap.cont;
                
                    if(ids == null) {
                        ids=0;
                        if(jQuery("#list_formulas").jqGrid('getGridParam','records') >0 )
                        {
                            jQuery("#listmedicformula").jqGrid('setGridParam',{url:"cargar_med_farma.jsp?q=1&id="+ids,page:1});
                            jQuery("#listmedicformula").jqGrid('setCaption',"Formula Medica: "+ids).trigger('reloadGrid');
                        }
                    } else {
                        jQuery("#listmedicformula").jqGrid('setGridParam',{url:"cargar_med_farma.jsp?q=1&id="+ids,page:1});
                        jQuery("#listmedicformula").jqGrid('setCaption',"Formula Medica: "+ids).trigger('reloadGrid');			
                    }
                }
            });jQuery("#list_formulas").jqGrid('navGrid','#pager_formulas',{add:false,edit:false,del:false,search:false});

            jQuery('#list_formulas').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
    
            //-------------------------------------------------------------------------------------------------------------

            jQuery("#listmedicformula").jqGrid({
                url:'cargar_med_farma.jsp?q=2',
                datatype: "json",
                colNames:['id_formula','id_consulta','cod_medicamento','ATC','CUM','Medicamento','F. Farmaceutica','Via Admin','Cantidad','Concentracion','Unidad','Presentacion'],
                colModel:[
                    {name:'id_formula',index:'id_formula',hidden:true,width:80,editable: false,required : true,editoptions:{maxlength: 63}},
                    {name:'id_consulta',index:'id_consulta',hidden:true,width:60,editable: false,required : true,editoptions:{maxlength: 63}},
                    {name:'cod_medicamento',index:'cod_medicamento',hidden:true,width:60,editable: false,required : true,editoptions:{maxlength: 63}},
                    {name:'atc',index:'atc', width:((anchoPantalla-100)*5)/100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'cum',index:'m_cum', width:((anchoPantalla-100)*5)/100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'m1',index:'m1', width:((anchoPantalla-100)*25)/100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'f1',index:'f1', width:((anchoPantalla-100)*11)/100,align:"right",search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'v1',index:'v1', width:((anchoPantalla-100)*11)/100,align:"right",search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'cantidad',index:'cantidad', width:((anchoPantalla-100)*9)/100,align:"right",search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'concentracion',index:'concentracion', width:((anchoPantalla-100)*9)/100,align:"right",search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'unidad',index:'u1', width:((anchoPantalla-100)*6)/100,align:"right",search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'presentacion',index:'presentacion', width:((anchoPantalla-100)*10)/100,align:"right",search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                ],
                rowNum:5,
                rowList:[5,10],
                pager: '#pagermedicformula',
                sortname: 'm.serial',
                viewrecords: true,
                sortorder: "asc",
                height: 200,
                width:anchoPantalla - 100,
                shrinkToFit: false,
                rownumbers: false,
                editurl: 'editaCli.php',
                caption: "Formula Medica",
                subGrid: true,
                onSelectRow: function (id){       
                    var lineap=jQuery("#listmedicformula").jqGrid('getRowData',id);
                    
                    $("#fid_consulta").val(lineap.id_consulta);
                    $("#fid_formula").val(lineap.id_formula);
                    $("#can_formula").val(lineap.cantidad);
                    jQuery("#list_farmacia").jqGrid('setGridParam',{url:"farmacia/cargainventariofarmacia.jsp?q=1&id="+lineap.id_consulta,page:1});
                    jQuery("#list_farmacia").jqGrid('setCaption',"Medicamentos ").trigger('reloadGrid');
                    $("#dialog_medicamentos").dialog("open");
                    
                },
                subGridOptions: {
                    "plusicon"  : "ui-icon-triangle-1-e",
                    "minusicon" : "ui-icon-triangle-1-s",
                    "openicon"  : "ui-icon-arrowreturn-1-e"
                },
                
                subGridRowExpanded: function(subgrid_id,id,id_consulta) {
                   
                    var subgrid_table_id, pager_id;
                    subgrid_table_id = subgrid_id+"_t";
                    pager_id = "p_"+subgrid_table_id;
                    $("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'\n\></table><div id='"+pager_id+"' class='scroll'></div>");
                    jQuery("#"+subgrid_table_id).jqGrid({
                        url:"search_subgrid_medic.jsp?q=2&id="+id+"&id2="+id_consulta,
                        datatype: "json",
                        colNames:['','','Producto','Laboratorio','Fecha','Cantidad',''],
                        colModel: [
                            {name:"id_salida",index:"id_salida",width:1,key:true,hidden:true},
                            {name:"id_inven",index:"id_inven",width:1,align:"right",hidden:true},
                            {name:"m1",index:"m1",width:((anchoPantalla-300)*57)/100,align:"lefth"},
                            {name:"lab",index:"lab",width:((anchoPantalla-300)*24)/100,align:"right"},
                            {name:"fecha",index:"fecha",width:((anchoPantalla-300)*19)/100,align:"center"},
                            {name:"canti",index:"canti",width:((anchoPantalla-300)*13)/100,align:"right"},
                            {name:'am_pm',index:'am_pm', hidden:false, width:((anchoPantalla-300)*4)/100,search:false,editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false }},
   		        ],
                        shrinkToFit: false,
                        rowNum:200,		   	
                        sortname: 'id_salida',
                        width:anchoPantalla-150,gridComplete: function ()
                    {
                        var ids = jQuery("#"+subgrid_table_id).jqGrid('getDataIDs');
                        
                        
                        for (var i = 0; i < ids.length; i++)
                        {
                            var cl = ids[i];
                           // var ret = jQuery("#"+subgrid_table_id).jqGrid('getRowData',ids[i]);
                            
                              be = "<span class='ui-icon ui-icon-trash' onclick=\"borrameden('" + cl +"','#"+subgrid_table_id+"');\"></span>";
                           
                        //  disabled='true'   be = "<input style='height:22px;width:68px;'  id='aceptar' type='button' value='Atender' onclick=\"atiende('" + cl + "','"+ret.descripcion+"','"+ret.serial+"');\"  />";
                           
                          jQuery("#"+subgrid_table_id).jqGrid('setRowData', ids[i], { am_pm: be });
                        }
                    },  
                        sortorder: "asc",
                        height: '100%',
                        footerrow : true,
                        //jsonReader: { repeatitems : false },
                        userDataOnFooter : true,
                        altRows : true
                    });
		
                }
            });


            jQuery("#listmedicformula").jqGrid('navGrid','#pagermedicformula',{add:false,edit:false,del:false,search:true,view:true},
            {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
            {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
            {}, //opciones del
            {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
            {width:420} //para el view
        );
            //---------------------------------------------------------------------------------------------------------
        var anchoPan=document.body.offsetWidth-100;

            jQuery("#list_farmacia").jqGrid({
                url:'farmacia/cargainventariofarmacia.jsp?q=2&id=0',
                datatype: "json",
                colNames:['inven','cod_medicamento','CUM','ATC','Producto','Concentracion','UM','FF','Presentacion','Existencias','Fecha Fab','Fecha Ven','Cod Barras','Ubicacion','Invima','Nombre'],
                colModel:[
                    {name:'serial_inven',index:'serial_inven',hidden:false,width:80,search:true,searchoptions:{sopt:['cn','eq']}},
                    {name:'serial',index:'serial',hidden:false,width:160,search:true,searchoptions:{sopt:['cn','eq']}},
                    {name:'cum',index:'cum', width:((anchoPan-30)*6)/100,search:true,searchoptions:{sopt:['cn','eq']},align:"right"},
                    {name:'cod_atc',index:'cod_atc', width:((anchoPan-30)*5)/100,search:true, searchoptions:{sopt:['cn','eq']},align:"center"},
                    {name:'producto',index:'producto', width:((anchoPan-30)*5)/100,search:true, searchoptions:{sopt:['cn','eq']},align:"center"},
                    {name:'concentracion',index:'concentracion',width:((anchoPan-30)*2)/100,search:true, searchoptions:{sopt:['cn','eq']}},
                    {name:'d1',index:'d1', width:((anchoPan-30)*8)/100,search:true, searchoptions:{sopt:['cn','eq']},align:"lefth"},
                    {name:'d2',index:'d2', width:((anchoPan-30)*6)/100,search:true, searchoptions:{sopt:['cn','eq']},align:"right"},
                    {name:'presentacion',index:'presentacion', width:((anchoPan-30)*6)/100,search:true, searchoptions:{sopt:['cn','eq']},align:"lefth"},
                    {name:'existencias',index:'existencias', width:((anchoPan-30)*6)/100,search:true, searchoptions:{sopt:['cn','eq']}},
                    {name:'fecha_fab',index:'fecha_fab', width:((anchoPan-30)*8)/100,search:true, searchoptions:{sopt:['cn','eq']}},
                    {name:'fecha_ven',index:'fecha_ven',hidden:false, width:((anchoPan-30)*7)/100,search:true, searchoptions:{sopt:['cn','eq']}},
                    {name:'cod_barras',index:'cod_barras', width:((anchoPan-30)*5)/100,search:true, searchoptions:{sopt:['cn','eq']},align:"center"},
                    {name:'ubicacion',index:'ubicacion', width:((anchoPan-30)*7)/100,search:true, searchoptions:{sopt:['cn','eq']}},
                    {name:'invima',index:'invima',hidden:false, width:((anchoPan-30)*6)/100,search:true, searchoptions:{sopt:['cn','eq']}},
                    {name:'nombre',index:'nombre', width:((anchoPan-30)*6)/100,search:true, searchoptions:{sopt:['cn','eq']}},
//                    {name:'ubicacion',index:'ubicacion',hidden:false, width:((anchoPan-30)*4)/100,search:true, searchoptions:{sopt:['cn','eq']}},
//                    {name:'lote',index:'lote',hidden:false, width:((anchoPan-30)*4)/100,search:true, searchoptions:{sopt:['cn','eq']}}
                ],
                rowNum:5,
                rowList:[5,10,20,30,100],
                pager: '#pager_farmacia',
                sortname: 'm.producto,ifa.fecha_ven',
                viewrecords: true,
                sortorder: "asc",
                height: 200,
                shrinkToFit: false,
                width:anchoPan-30,
                rownumbers: false,
                editurl: 'editaCli.php',
                caption: "Medicamentos de Contrato",
                onSelectRow: function (id){	
                    var med=jQuery("#list_farmacia").jqGrid('getRowData',id); 
                    var med2=""+med.serial_inven;
                    
                    $("#dialog_insert_medic").dialog("open");
                    
                    $("#producto").val(med.producto);
                    $("#serial_inven").val(med.serial_inven);
                    $("#atc").val(med.cod_atc);
                    $("#cum").val(med.cum);
                    $("#f1").val(med.d2);
                    $("#v1").val(med.d1);
                    $("#presentacion").val(med.presentacion);
                    $("#existencias").val(med.existencias);
                    $("#lab").val(med.nombre);
                    $("#fecha_fab").val(med.fecha_fab);
                    $("#fecha_ven").val(med.fecha_ven);
                    $("#ubicacion").val(med.ubicacion);
                    $("#lote").val(med.lote);
                    $("#concentracion").val(med.concentracion+" "+med.d1);
                }
                
            });
            
            jQuery("#list_farmacia").jqGrid('navGrid','#pager_farmacia',{add:false,edit:false,del:false,search:false,view:true},
            {},//opciones edit
            { }, //opciones add
            {}, //opciones del
            {/* multipleSearch:true,closeAfterSearch: true, closeOnEscape: true */},
            {width:920} //para el view
        );
            jQuery('#list_farmacia').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
           /*
            //---------------------------------------------------
            jQuery("#list_farmacia_paq").jqGrid({
                url:'search_inventario_p.jsp?q=2',
                datatype: "json",
                colNames:['inven','cod_medicamento','Producto','ATC','CUM','Forma Farmaceutica','Via de Administacion','Concentracion','Presentacion','Valor','Existencias','Laboratorios','Fabricacion','Vencimiento','Ubicacion','Lote',''],
                colModel:[
                    {name:'serial_inven',index:'serial_inven',hidden:true,width:80,editable: false,required : true,editoptions:{maxlength: 63}},
                    {name:'serial',index:'serial',hidden:true,width:160,editable: false,required : true,editoptions:{maxlength: 63}},
                    {name:'producto',index:'producto',width:((anchoPantalla)*12)/100,editable: false,required : true,editoptions:{maxlength: 63}},
                    {name:'atc',index:'atc', width:((anchoPantalla)*4)/100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'cum',index:'m_cum', width:((anchoPantalla)*4)/100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'f1',index:'f1', width:((anchoPantalla)*7)/100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'v1',index:'v1', width:((anchoPantalla)*7)/100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'concentracion',index:'concentracion', width:((anchoPantalla)*7)/100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'presentacion',index:'presentacion', width:((anchoPantalla)*8)/100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'valor_compra',index:'valor_compra', width:((anchoPantalla)*7)/100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'existencias',index:'existencias', width:((anchoPantalla)*6)/100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'lab',index:'lab', width:((anchoPantalla)*7)/100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'fecha_fab',index:'fecha_fab', width:((anchoPantalla)*7)/100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'fecha_ven',index:'fecha_ven', width:((anchoPantalla)*7)/100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'ubicacion',index:'ubicacion', width:((anchoPantalla)*4)/100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'lote',index:'lote', width:((anchoPantalla)*4)/100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'paq',index:'paq', width:((anchoPantalla)*4)/100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    
                ],
                rowNum:5,
                rowList:[5,10],
                pager: '#pager_farmacia_paq',
                sortname: 'i.serial_inven',
                viewrecords: true,
                sortorder: "asc",
                height: 200,
                width:anchoPantalla,
                shrinkToFit: false,
                // shrinkToFit: false,//columnas tamaÃ±o dato
           
                rownumbers: false,
                editurl: 'edit_entregas_paq.jsp',
                caption: "Medicamentos Del Paquete",
                onSelectRow: function (serial_inven){
                    var med=jQuery("#list_farmacia_paq").jqGrid('getRowData',serial_inven); 
                    var med2=""+med.serial_inven;
                    var r=confirm('Desea agregar este medicamentos de inventario a la formula');
                    if(!r){
                        return false;
                    }
                    //alert(id_formula);
                    $("#div_insert_entregas").load("insert_entregas.jsp?dato="+med2+"&&dato2="+id_formula+"&&dato3="+id_person+"");
                    $("#dialog_medicamentos").dialog("close");
                }
                
            });
            
            jQuery("#list_farmacia_paq").jqGrid('navGrid','#pager_farmacia_paq',{add:true,edit:true,del:true,search:true,view:true},
            {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
            {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
            {}, //opciones del
            {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
            {width:920} //para el view
        );
            jQuery('#list_farmacia_paq').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
*/
            //---------------------------------------------------
            $(function(){
                
                $('#dialog_medicamentos').dialog({
                    autoOpen: false,
                    modal:true,
                    /*buttons: {
                        Ok: function() {
                            // $("#div_sesiones").load("cerrar_sesiones.jsp");
                            $( this ).dialog( "close" );
                        }
                    },*/
                    show:{
                        effect: "blind",
                        duration: 550
                    },
                    hide:{
                        effect: "explode",
                        duration: 550
                    },
                    width:anchoPan
                }); 
            });  
            
            //---------------------------------------------------
            $(function(){
                $('#dialog_insert_medic').dialog({
                    autoOpen: false,
                    modal:true,
                   
                    show:{
                        effect: "blind",
                        duration: 500
                    },
                    hide:{
                        effect: "explode",
                        duration: 500
                    },
                    width:500
                }); 
            });
      function borrameden(id,idtabla){
          var r=confirm('Está seguro de borrar este registro?');
                    if(!r){
                        return false;
                    }
           $.ajax({
                   type: 'POST',
                   url: "entregamedicamentos/borramedentregados.jsp", 
                   data:{ids:id},
                   dataType: 'json',
                   success: function(data) {
                                    if(data.res==1){
                                        jQuery(idtabla).trigger('reloadGrid');	
                                        alert("Operación realizada satisfactoriamente. "); 
                                    }
                                    else{alert("Falla al realizar esta operación.");}
                                            },
                   error: function (xhr, ajaxOptions, thrownError) { alert("Falla al realizar esta operación."); }  
                   });
      }      
            
        </script>
    </head>
    <body >
        <%
            request.setCharacterEncoding("UTF-8");
            HttpSession sesion = request.getSession();
            sesion.setAttribute("id_formula", 0);
            //out.print(sesion.getAttribute("id_formula"));
        %>
        <br>
    <center >
        <div id="div_insert_entregas"></div>       
        <table id="list_formulas" ></table>
        <div id="pager_formulas"></div>   
        <div id="div_med_formu" name="div_med_formu"></div> 
        <br>

        <table id="listmedicformula" ></table>
        <div id="pagermedicformula"></div>  

        <div id="dialog_medicamentos" name="dialog_medicamentos" title="Inventario de Farmacia">
            <div>
                <table id="list_farmacia" ></table>
                <div id="pager_farmacia"></div>
              <!--  <table id="list_farmacia_paq" ></table>
                <div id="pager_farmacia_paq"></div> -->
            </div>
        </div>

        <div id="dialog_insert_medic" name="dialog_insert_medic" title="Agregar Medicamento">
            <div>
                <form id="form_insert_entrega" name="form_insert_entrega" action="insert_entregas.jsp" method="post">
                    <table style="width: 100%">
                        <tr>
                            <td style="width:30%"><label>Producto:</label></td>
                            <td style="width:70%">
                                <input style="width:100%" type="text" id="producto" name="producto" readonly>
                                <input type="hidden" id="serial_inven" name="serial_inven" readonly>
                                <input type="hidden" id="fid_formula" name="fid_formula" readonly>
                                <input type="hidden" id="fid_consulta" name="fid_consulta" readonly>
                                <input type="hidden" id="can_formula" name="can_formula" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td><label>ATC:</label></td>
                            <td><input style="width:100%" type="text" id="atc" name="atc" readonly></td>
                        </tr>
                        <tr>
                            <td><label>CUM:</label></td>
                            <td><input style="width:100%" type="text" id="cum" name="cum" readonly></td>
                        </tr>
                        <tr>
                            <td><label>Forma Farmaceutica:</label></td>
                            <td><input style="width:100%" type="text" id="f1" name="f1" readonly></td>
                        </tr>
                        <tr>
                            <td><label>Via de Administracion:</label></td>
                            <td><input style="width:100%" type="text" id="v1" name="v1" readonly></td>
                        </tr>
                        <tr>
                            <td><label>Concentracion:</label></td>
                            <td><input style="width:100%" type="text" id="concentracion" name="concentracion" readonly></td>
                        </tr>
                        <tr>
                            <td><label>Presentacion:</label></td>
                            <td><input style="width:100%" type="text" id="presentacion" name="presentacion" readonly></td>
                        </tr>
                        <tr>
                            <td><label>Existencias</label></td>
                            <td><input style="width:100%" type="text" id="existencias" name="existencias" readonly></td>
                        </tr>
                        <tr>
                            <td><label>Labotorio:</label></td>
                            <td><input style="width:100%" type="text" id="lab" name="lab" readonly></td>
                        </tr>
                        <tr>
                            <td><label>Fecha Fabricacion:</label></td>
                            <td><input style="width:100%" type="text" id="fecha_fab" name="fecha_fab" readonly></td>
                        </tr>
                        <tr>
                            <td><label>Fecha Vencimiento</label></td>
                            <td><input style="width:100%" type="text" id="fecha_ven" name="fecha_ven" readonly></td>
                        </tr>
                        <tr>
                            <td><label>Ubicacion:</label></td>
                            <td><input style="width:100%" type="text" id="ubicacion" name="ubicacion" readonly></td>
                        </tr>
                        <tr>
                            <td><label>Lote:</label></td>
                            <td><input style="width:100%" type="text" id="lote" name="lote" readonly></td>
                        </tr>
                        <tr>
                            <td><label>Cantidad:</label></td>
                            <td><input style="width:100%" type="text" id="cantidad" name="cantidad">
                                <div id="div_paquete"></div>
                                <div id="div_consu_formula"></div>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" id="aceptar" name="aceptar" value="Guardar"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <div id="div_resuentrega_"></div>  

      </center> 
    </body>
</html>
