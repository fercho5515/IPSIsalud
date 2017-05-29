
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" language="javascript">
   
            $(function() {
                $( "#accordiontari" ).accordion({
                    heightStyle: "content",
                    collapsible: true,
                    active: false
                });
            });    
           var list_tarproc= jQuery("#list_tarproc").jqGrid({
                url:'busca_tariproced.jsp?q=2',
                datatype: "json",
                colNames:['id','Cup','Mapipo','Nombre','Precio','idt'],
                colModel:[
                    {name:'id',index:'id',key:true, width:30,hidden:true,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'cup',index:'cup_verdadero', width:60,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'mapipo',index:'codigo_maipos', width:60,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'nombre',index:'d1', width:450,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'precio',index:'precio', width:80,search:true, editable: true,required : true,editoptions: {maxlength: 200},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'idt',index:'idt',key:true, width:80,search:true, editable: true,required : true,editoptions: {maxlength: 200},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                ],
                rowNum:10,
                rowList:[15,30,45],
                pager: '#pager_tarproc',
                sortname: 'cup_verdadero',
                viewrecords: true,
                sortorder: "asc",
                autowidth: true, 
                rownumbers: false,
                editurl: 'edit_tari_proced.jsp',
                caption: "Procedimientos",
                ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
                    NuevoCaso2(""+cedula_nit+"");  }
	
            });
            jQuery("#list_tarproc").jqGrid('navGrid','#pager_tarproc',{add:false,edit:true,del:true,search:true,view: true},
                {closeAfterEdit: true,width:300,reloadAfterSubmit:true,reloadAfterEdit:true, 
                    afterSubmit: function (response,postdata) {
                        var result = jQuery.parseJSON(response.responseText); 
                        alert(result.msj);return [true,""];
                    },
                    errorTextFormat: function (response,postdata) {
                        var result = jQuery.parseJSON(response.responseText); 
                        alert(result.msj);return [true,""];
                    }
                },//opciones edit
                {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
                {delData: {
                             idt: function() {
                                        var sel_id = list_tarproc.jqGrid('getGridParam', 'selrow');
                                        var value = list_tarproc.jqGrid('getCell', sel_id, 'idt');
                                        return value;
                                   }
                            },closeAfterDel:false,width:300 
                    , afterSubmit: function (response,postdata) {
                        var result = jQuery.parseJSON(response.responseText); 
                        alert(result.msj);return [true,""];
                    },
                    errorTextFormat: function (response,postdata) {
                        var result = jQuery.parseJSON(response.responseText); 
                        alert(result.msj);return [true,""];
                    }
                },//opciones del 
                {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                {width:600} //para el view//para el view
            );

                                                                    
            jQuery("#list_proced").jqGrid({
                url:'busca_proced.jsp?q=2',
                datatype: "json",
                colNames:['id','Cup','Mapipo','Nombre'],
                colModel:[
                    {name:'id',index:'id', width:10,hidden:true,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'cup',index:'cup_verdadero', width:20,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'mapipo',index:'codigo_maipos', width:20,search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    {name:'nombre',index:'d1', width:100,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                ],
                rowNum:10,
                rowList:[15,30,45],
                pager: '#pager_proced',
                sortname: 'cup_verdadero',
                viewrecords: true,
                sortorder: "asc",
                width: 700, 
                rownumbers: false,
                editurl: 'editaCli.php',
                caption: "Procedimientos",
                onSelectRow: function (id){       
                    var lineap=jQuery("#list_proced").jqGrid('getRowData',id);
                    var lineap2=""+lineap.id;
                    lineap2=lineap2.replace(/ /gi,'*');
                    //alert(lineap2);
                    $("#div_datos_tariproced").load("mostrar_proced.jsp?dato="+lineap2+"");
                    $( "#dialog_tariproced" ).dialog( "close" );
                }

            });
            jQuery("#list_proced").jqGrid('navGrid','#pager_proced',{add:false,edit:false,del:false,search:true,view: true},
            {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
            {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
            {}, //opciones del
            {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
            {width:60} //para el view
        );
            jQuery('#list_proced').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});

    
    
    jQuery("#list_tarmed").jqGrid({
                url:'busca_tarimedic.jsp?q=2',
                datatype: "json",
                colNames:['ID','Cum','Atc','Nombre','Concentacion','Unidad de Medida','Forma Farmaceutica','Presentacion','Precio','Laboratorio'],
                colModel:[
                {name:'id',index:'id', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'cum',index:'m_cum',width:50,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'atc',index:'atc', width:50,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'nombre',index:'m_producto', width:200,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	        {name:'concentracion',index:'m_concentracion', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'unidad',index:'um_descripcion', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'forma',index:'ff_descripcion', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'presentacion',index:'presentacion', width:150,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'precio',index:'precio', width:90,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'laboratorio',index:'laboratorio', width:90,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                ],
                rowNum:10,
                rowList:[15,30,45],
                pager: '#pager_tarmed',
                sortname: 'm.cum',
                viewrecords: true,
                sortorder: "asc",
                autowidth: true, 
                rownumbers: false,
                editurl: 'editaCli.php',
                caption: "Medicamentos",
                ondblClickRow: function(cedula_nit){cedula_nit=cedula_nit.replace(" ","_");
                    NuevoCaso2(""+cedula_nit+"");  }
	
            });
            jQuery("#list_tarmed").jqGrid('navGrid','#pager_tarmed',{add:false,edit:false,del:false,search:true,view: true},
            {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
            {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
            {}, //opciones del
            {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
            {width:60} //para el view
        );
    
    
    jQuery("#list_medic").jqGrid({
                url:'busca_medic.jsp?q=2',
                datatype: "json",
                colNames:['ID','Cum','Atc','Nombre','Concentacion','Unidad de Medida','Forma Farmaceutica','Presentacion'],
                colModel:[
                {name:'id',index:'id', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'cum',index:'m_cum',width:80,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'atc',index:'atc', width:80,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'nombre',index:'m_producto', width:300,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	        {name:'concentracion',index:'m_concentracion', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'unidad',index:'um_descripcion', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'forma',index:'ff_descripcion', width:120,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'presentacion',index:'presentacion', width:150,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                 ],
                rowNum:10,
                rowList:[15,30,45],
                pager: '#pager_medic',
                sortname: 'm.producto',
                viewrecords: true,
                sortorder: "asc",
                width: 700, 
                rownumbers: false,
                editurl: 'editaCli.php',
                caption: "Medicamentos",
                onSelectRow: function (id){       
                    var lineap=jQuery("#list_medic").jqGrid('getRowData',id);
                    var lineap2=""+lineap.id;
                    lineap2=lineap2.replace(/ /gi,'*');
                    //alert(lineap2);
                    $("#div_datos_tarimedic").load("mostrar_medic.jsp?dato="+lineap2+"");
                    $( "#dialog_tarimedic" ).dialog( "close" );
                }

            });
            jQuery("#list_medic").jqGrid('navGrid','#pager_medic',{add:false,edit:false,del:false,search:true,view: true},
            {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
            {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
            {}, //opciones del
            {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
            {width:60} //para el view
        );
            jQuery('#list_medic').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});

                                                                    
            function carga_tariproc(){
                var vtari=$("#tarifario").val(); 
                $("#div_sesiontari").load("sesion_tarifario.jsp?dato="+vtari+"");
                setTimeout ('recarga2()',500);
           
            };
            
            function carga_tarimedic(){
                var vtarim=$("#tarifariomed").val(); 
                $("#div_sesiontarimed").load("sesion_tarifariomed.jsp?dato="+vtarim+"");
                setTimeout ('recarga3()',500);
           
            };
            
            function recarga2(){
                jQuery("#list_tarproc").jqGrid('setCaption',"Procedimientos").trigger('reloadGrid');
            };
            
            function recarga3(){
                jQuery("#list_tarmed").jqGrid('setCaption',"Medicamentos").trigger('reloadGrid');
            };
            
            $(function(){
                $('#dialog_tariproced').dialog({
                    autoOpen: false,
                    modal:true,
                    buttons: {
                        Ok: function() {
                            // $("#div_sesiones").load("cerrar_sesiones.jsp");
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
                    width:'720px'
                }); 
            });
       
            
            $(function(){
                $('#dialog_tarimedic').dialog({
                    autoOpen: false,
                    modal:true,
                    buttons: {
                        Ok: function() {
                            // $("#div_sesiones").load("cerrar_sesiones.jsp");
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
                    width:'720px'
                }); 
            });
            
            function agregar_tariproced(){
                $( "#dialog_tariproced" ).dialog( "open" );
            };
            
             function agregar_tarimed(){
                $( "#dialog_tarimedic" ).dialog( "open" );
            };
                        
                        
            $('#form_tariproced').submit(function() {
                var nom = document.getElementById("precio").value;               
                if( nom == null || nom.length == 0 || /^\s+$/.test(nom) ) {
                    alert('Digite el precio es obligatorio');
                    return false;  
                }                                            
                         
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                    dataType: "json",          
                    success: function(data) {                        
                                       if(data.res==1){
                                            alert("Proceso finalizado satisfactoriamente  ");                                            
                                             jQuery("#list_tarproc").jqGrid('setCaption',"Procedimientos ").trigger('reloadGrid');
                                        }                    
                                 else if(data.res==0){
                                            alert("No se pudo insertar, revisa si el procedimiento ya esta en el tarifario");
                                        }
                                 else{alert("Falla");}  
                    }                             
                })
                return false;
            });
            $('#form_tarimedic').submit(function() {
                var nom = document.getElementById("precio").value;               
                if( nom == null || nom.length == 0 || /^\s+$/.test(nom) ) {
                    alert('Digite el precio es obligatorio');
                    return false;  
                }                                            
                var vlab = document.getElementById("laboratorio").value;               
                if( vlab == null || vlab.length == 0|| vlab == 0 || /^\s+$/.test(vlab) ) {
                    alert('Escoja un Laboratorio Farmaceutico');
                    return false;  
                }         
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),      
                    dataType: "json",          
                    success: function(data) {                        
                                       if(data.res==1){
                                            alert("Proceso finalizado satisfactoriamente  ");                                            
                                             jQuery("#list_tarmed").jqGrid('setCaption',"Medicamentos ").trigger('reloadGrid');
                                        }                    
                                 else if(data.res==0){
                                            alert(">No se pudo insertar, revisa si el medicamento ya está en el tarifario, o si escogiste un tarifario.");
                                        }
                                 else{alert("Falla");}  
                    }                 
                });
                return false;
            });
        </script>
    </head>
    <body>
        <%
        request.setCharacterEncoding("UTF-8");
        HttpSession sesion=request.getSession();
        sesion.setAttribute("tarifario",0);
        sesion.setAttribute("tarifariomed",0);
        %>
        <div id="accordiontari" >
            <h3>Procedimientos</h3>
            <div>
                <form id="form_tariproced" name="form_tariproced" action="insert_tariproced.jsp" method='post'  >

                    <table style="width: 80%">
                        <tr><td><h2>Agregar Procedimientos</h2></td></tr>
                        <tr><td>
                                <select name="tarifario" id="tarifario" onchange="carga_tariproc();">
                                    <option value="escojer">--Escoja un tarifario--</option>
                                    <%
                                        request.setCharacterEncoding("UTF-8");
                                        conecta_bd ba = new conecta_bd();
                                        ba.ConectaDb();
                                        String sqlfina = "select fn.id_tarifarios, fn.nombre from tarifarios fn;";
                                        //out.print(sqlfina);
                                        ResultSet resufina = ba.consultas(sqlfina);
                                        try {
                                            while (resufina.next() && resufina != null) {
                                                out.print("<option value='" + resufina.getString(1) + "'>" + resufina.getString(2) + "</option>");
                                            }
                                        } catch (SQLException e) {
                                        } catch (Exception ex) {
                                        }
                                    %>
                                </select>
                            </td></tr>
                        <tr><td>
                                <table id="list_tarproc" ></table>
                                <div id="pager_tarproc"></div> 
                            </td></tr>
                        <tr><td>
                                <input type="button" id="aceptar" value="Buscar Procedimiento" onclick="agregar_tariproced();">       
                            </td></tr>
                        <div id="div_sesiontari" name="div_sesiontari"></div>

                    </table> 
                                
                                
                    <div id="div_instariproced" name="div_instariproced"></div>
                    <div id="resu_instariproced" name="resu_instariproced"></div>
                    <div id="div_datos_tariproced" name="div_datos_tariproced"></div>                    

                               

                    
                    <div id="dialog_tariproced" name="dialog_tariproced" title="Nuevo Procedimiento">
                        <div>
                            <table id="list_proced" ></table>
                            <div id="pager_proced"></div>
                        </div>
                    </div>
                    
                               </form>
            </div>


            <h3>Medicamentos</h3>
            <div>
                  <form id="form_tarimedic" name="form_tarimedic" action="insert_tarmedic.jsp" method='post'  >

                    <table style="width: 80%">
                        <tr><td><h2>Agregar Medicamentos</h2></td></tr>
                        <tr><td>
                                <select name="tarifariomed" id="tarifariomed" onchange="carga_tarimedic();">
                                    <option value="escojer">--Escoja un tarifario--</option>
                                    <%
                                        request.setCharacterEncoding("UTF-8");
                                        ba.ConectaDb();
                                        sqlfina = "select fn.id_tarifarios, fn.nombre from tarifarios fn;";
                                        //out.print(sqlfina);
                                        ResultSet resu = ba.consultas(sqlfina);
                                        try {
                                            while (resu.next() && resu != null) {
                                                out.print("<option value='" + resu.getString(1) + "'>" + resu.getString(2) + "</option>");
                                            }
                                        } catch (SQLException e) {
                                        } catch (Exception ex) {
                                        }
                                        ba.cerrar();
                                    %>
                                </select>
                            </td></tr>
                        <tr><td>
                                <table id="list_tarmed" ></table>
                                <div id="pager_tarmed"></div> 
                            </td></tr>
                        <tr><td>
                                <input type="button" id="aceptar" value="Buscar Medicamento" onclick="agregar_tarimed();">       
                            </td></tr>
                        <div id="div_sesiontarimed" name="div_sesiontarimed"></div>

                    </table> 
                    <div id="div_instarimedic" name="div_instarimedic"></div>
                    <div id="resu_instarimedic" name="resu_instarimedic"></div>
                    <div id="div_datos_tarimedic" name="div_datos_tarimedic"></div>        
                    
                   
                    <div id="dialog_tarimedic" name="dialog_tarimed" title="Nuevo Medicamentos">
                        <div>
                            <table id="list_medic" ></table>
                            <div id="pager_medic"></div>
                        </div>
                    </div>
            </form>  

            </div>
        </div>
                        
</body>
</html>
