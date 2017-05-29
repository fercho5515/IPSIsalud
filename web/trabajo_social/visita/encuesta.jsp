<%-- 
    Document   : encuesta
    Created on : 10-mar-2013, 21:38:41
    Author     : Fercho
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script type="text/javascript" language="javascript">
            $('#buscapacientetrabajo').submit(function() {
                var nom = document.getElementById("id_citas").value;               
                if( nom == null || nom.length == 0 || /^\s+$/.test(nom) ) {
                    alert('La identificacion es obligatoria');
                    return false;  
                }                                            
                            
                if( nom.length >= 64 ) {
                    alert('La id tiene como maximo 64 caracteres');
                    return false;  
                }
                                                                  
                //document.forms.f1.submit();                                                
                        
            
                // Enviamos el formulario usando AJAX
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                              
                    success: function(data) {
                        $('#divdatostrabajo').html(data);
                        jQuery("#list4").jqGrid('setCaption',"").trigger('reloadGrid');
                    }                             
                })
                     
                return false;
            }); 
    
            var anchoPantalla=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
            $(document).ready(function(){
            
                jQuery("#listfamiliar").jqGrid({
                    url:'../comunes/carga_comp_fami.jsp?q=2',
                    datatype: "json",
                    colNames:['id','Nombre Completo','Parenteso','Edad','Escolaridad','Ocupacion','Observaciones',],
                    colModel:[
                        {name:'id',index:'id', hidden:true,width:0,search:false,editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false }},
                        {name:'nombre_apellidos',index:'nombre_apellidos',width:((anchoPantalla*30)/100),search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'d1',index:'d1',width:((anchoPantalla*10)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'edad',index:'edad',width:((anchoPantalla*5)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'d2',index:'d2',width:((anchoPantalla*10)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'d3',index:'d3',width:((anchoPantalla*10)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'observaciones',index:'observaciones',width:((anchoPantalla*30)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                    ],
                    rowNum:15,
                    rowList:[15,30,45,500],
                    pager: '#pagerfamiliar',
                    sortname: 'nombre_apellidos',        
                    sortorder: "asc",
                    viewrecords: true,
                    width:anchoPantalla,
                    //height: 190,
                    height: 'auto',        
                    editurl: '../comunes/quita_fam.jsp',
                    // autowidth: true, 
                    shrinkToFit: false,
                    caption: ""
	
                });
                jQuery("#listfamiliar").jqGrid('navGrid','#pagerfamiliar',{add:false,edit:false,del:true,search:true,view: true},
                {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
                {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
                {width:320}, //opciones del
                {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                {width:420} //para el view
            );
                jQuery("#listfamiliar").jqGrid('navButtonAdd','#pagerfamiliar',
                {
                    caption:"",
                    // buttonicon:"ui-icon-circle-plus",     
                    buttonicon:"ui-icon-person",
                    onClickButton:function(){ 
                        $( "#dilog_agrega_fami" ).dialog( "open" );
                    },
                    position:"last",
                    title:"Agregar Familiar",
                    cursor: "pointer"});

            });
            ////////////////////
            $(document).ready(function(){      
                var anchoPantallaaconsu=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
                jQuery("#listdiag_consu_evol").jqGrid({
                    url:'../comunes/carga_diagcie10.jsp?q=2',
                    datatype: "json",
                    colNames:['id','Tipo','Cod','Diagnostico','Tipo Diagnostico','Causa Externa','Observaciones'],
                    colModel:[
                        {name:'id',index:'id',hidden:true,width:0,editable: false,required : true,editoptions:{maxlength: 63}},
                        {name:'id_subcie10',index:'id_subcie10', width:((anchoPantallaaconsu*6)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'id_subcie10',index:'id_subcie10', width:((anchoPantallaaconsu*4)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'descripcion',index:'d2', width:((anchoPantallaaconsu*34)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'descripcitong',index:'drr1',width:((anchoPantallaaconsu*12)/100),editable: false,required : true,editoptions:{maxlength: 63}},
                        {name:'descripcditong',index:'ddrr1',width:((anchoPantallaaconsu*15)/100),editable: false,required : true,editoptions:{maxlength: 63}},
                        {name:'descriptciong',index:'dr1',width:((anchoPantallaaconsu*22)/100),editable: false,required : true,editoptions:{maxlength: 63}},
                    ],
                    rowNum:11,
                    rowList:[10,20,30,40,400],
                    pager: '#pagerdiag_consu_evol',
                    sortname: 'imp.control',
                    viewrecords: true,
                    sortorder: "asc",
                    height: 92,
                    width:(anchoPantallaaconsu-40),
                    shrinkToFit: false,//columnas tamaño dato
                    rownumbers: false,
                    /*  grouping:true,         
                groupingView : {
                        groupField : ['descripciong']
                }, */  
                    rownumbers: false,
                    editurl: 'quitadiag.jsp',
                    caption: "Diagnosticos",
                    ondblClickRow: function(id){   }	
                });

                jQuery("#listdiag_consu_evol").jqGrid('navGrid','#pagerdiag_consu_evol',{add:false,edit:false,del:false,search:false,view: true},
                {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
                {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() { } }, //opciones add
                {top:250,left:anchoPantalla,width:420}, //opciones del
                {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                {top:250,left:anchoPantalla,width:420} //para el view
            );                    

                jQuery("#listdiag_consu_evol").jqGrid('navButtonAdd','#pagerdiag_consu_evol',
                {
                    caption:"",
                    buttonicon:"ui-icon-trash",
                    onClickButton:function(){ 
                        var id = jQuery("#listdiag_consu_evol").jqGrid('getGridParam','selrow');
                        if (id)	{
                            var ret = jQuery("#listdiag_consu_evol").jqGrid('getRowData',id);
                                        
                            apprise("¿Esta seguro de eliminar el diagnostico seleccionado: "+ret.id_subcie10+" ?", {'verify':true}, function(opcion) {
                                if(opcion) {  $("#qcie_10").val(""+ret.id_subcie10+"");
                                    document.quitadiag.submit();  
                                    setTimeout ('recar_diag_t_soci()', 500);                                                          
                                }
                            });
                        }else { alert("Selecciona la fila a eliminar");}
                                
                    },
                    position:"last",
                    title:"Quitar diagnostico",
                    cursor: "pointer"});
            });
            $(function() {
                $( "#dilog_cie10" ).dialog({
                    autoOpen: false,
                    modal: true,
                    show: {
                        effect: "blind",
                        duration: 500
                    },
                    hide: {
                        // effect: "explode",
                        effect: "drop", 
                        duration: 1000
                    },
                    width:'800px'
                });}); 


            $(function() {
                $( "#dilog_agrega_fami" ).dialog({
                    autoOpen: false,
                    modal: true,
                    show: {
                        effect: "blind",
                        duration: 500
                    },
                    hide: {
                        // effect: "explode",
                        effect: "drop", 
                        duration: 1000
                    },
                    width:'700px'
                });}); 


            function recar_diag_t_soci(){
                jQuery("#listdiag_consu_evol").jqGrid('setCaption',"Diagnosticos ").trigger('reloadGrid'); 
            }
            function abreDialogConsu_evol(dato1,dato2){
                var bb=document.getElementById("display_consu_evol");
                bb.style.display="none";
                                     
                caja1=dato1;
                caja2=dato2;
                jQuery("#listcie10").jqGrid('setCaption',"CIE 10").trigger('reloadGrid');
                $("#dilog_cie10").dialog("open");
            }
            ////////////////////////////
            ////////////////////////////
  
            $(document).ready(function(){
                                                   
                ///////////////////////////////////////////7
                //////////////////////////////////////////////////7
                ////////////////////////////////////////////////7
      
                jQuery("#listcie10").jqGrid({
                    url:'../comunes/carga_cie10.jsp?q=2',
                    datatype: "json",
                    colNames:['id','Codigo','Descripción','grupo'],
                    colModel:[
                        {name:'id',index:'id',hidden:true,width:0,editable: false,required : true,editoptions:{maxlength: 63}},
                        {name:'id_subcie10',index:'id_subcie10', width:60,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'descripcion',index:'d2', width:700,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'descripciong',index:'d1',hidden:true,width:1,editable: false,required : true,editoptions:{maxlength: 63}},
                    ],
                    rowNum:11,
                    rowList:[10,20,30,40,400],
                    pager: '#pagercie10',
                    sortname: 's.id_subcie10',
                    viewrecords: true,
                    sortorder: "asc",
                    height: 339,
                    width:775,
                    shrinkToFit: false,//columnas tamaño dato
                    grouping:true,         
                    groupingView : {
                        groupField : ['descripciong']
                    },   
                    rownumbers: false,
                    editurl: 'editaCli.php',
                    caption: "CIE 10",
                    ondblClickRow: function(id){
                        var ret = jQuery("#listcie10").jqGrid('getRowData',id);
                        //alert(""+ret.id_subcie10+" "+ret.descripcion+"");   
                        document.getElementById(""+caja1+"").value=""+ret.id_subcie10;
                        document.getElementById(""+caja2+"").value=""+ret.descripcion;
                        $("#dilog_cie10").dialog( "close" );
                    }	
                });

 
                jQuery("#listcie10").jqGrid('navGrid','#pagercie10',{add:false,edit:false,del:false,search:false,view:false},
                {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
                {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
                {}, //opciones del
                {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                {width:420} //para el view
            );
                jQuery('#listcie10').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
                             


            }); 
 
            $(document).ready(
            function(){
                $("#diagnosticoconsu_evol").keyup(
                function(){
                    var searchbox = $(this).val();
                    var dataString = 'searchword='+ searchbox;
					
                    if(searchbox==''){
                        var bb=document.getElementById("display_consu_evol");
                        bb.style.display="none";
                        document.getElementById("diagnosticoconsu2_evol").value='';
                    }
                    else{
                        $.ajax({
                            type: "POST",
                            url: "../comunes/auto_completa_cie10.jsp?dato=p",
                            data: dataString,
                            cache: false,
                            success: function(html){ $("#display_consu_evol").html(html).show();
                                var canti=document.getElementById("cantidaddp").value;
                                if(canti==1){document.getElementById("diagnosticoconsu2_evol").value=""+document.getElementById("nomcie10p").value;
                                    document.getElementById("diagnosticoconsu_evol").value=""+document.getElementById("codicie10p").value;
                                    var bb=document.getElementById("display_consu_evol");
                                    bb.style.display="none";
                                }
                                else{document.getElementById("diagnosticoconsu2_evol").value='';}
                            }
                        });
                                            
                    }
                    return false;    
                }
                                         
            );
            } );
 
            $(document).ready(function(){   
                $('#form_diag').submit(function() {
                    var nom = document.getElementById("diagnosticoconsu2_evol").value; 
                    if( nom == null || nom.length == 0 || /^\s+$/.test(nom) ) {
                        alert('El diagnostico es obligatorio');
                        return false;  
                    }   
                    var nom2 = document.getElementById("observaciones_evol_consu").value; 
                    /*     if( nom2 == null || nom2.length == 0 || /^\s+$/.test(nom2) ) {
                                                              alert('La observación es obligatorioa');
                                                              return false;  
                                                                              } */
                    if( nom2.length >= 399 ) {
                        alert('La observación tiene como maximo 390 caracteres');
                        return false;  
                    }                                        
                    var ids = jQuery("#listdiag_consu_evol").jqGrid('getDataIDs');
                        
                    if(ids.length==4){alert('Solo se permite un diagnostico principal y tres relacionados');
                        return false; }
                    document.getElementById("observaciones_evol_consu").value=nom2.replace("\"", "'").replace(/\r\n|\n|\r/g, " ");                         
               
                    // Enviamos el formulario usando AJAX
                    $.ajax({
                        type: 'POST',
                        url: $(this).attr('action'),
                        data: $(this).serialize(),
                              
                        success: function(data) {
                            $('#resu').html(data);
                            //actualiza la tabla
                            jQuery("#listdiag_consu_evol").jqGrid('setCaption',"Diagnosticos ").trigger('reloadGrid');	
                            document.getElementById("observaciones_evol_consu").value="";
                            document.getElementById("diagnosticoconsu2_evol").value="";
                            document.getElementById("diagnosticoconsu_evol").value="";
                            $("#tipodiagnostico_consu_evol").val("");
                            $("#causaexterna_consu_evol").val("");
                        }                             
                    })
                     
                    return false;
                }); 
            });       
            function pasadatoConsu(nom,nom2,dato){
                      
                document.getElementById("diagnosticoconsu_evol").value=nom;
                document.getElementById("diagnosticoconsu2_evol").value=nom2;
                var bb=document.getElementById("display_consu_evol");
                bb.style.display="none";
                                    
            }
                              
            $(function(){
                $("#fecha_real").datepicker({
                    //inline:true
                    showOn:'both',
                    buttonImageOnly:true,
                    buttonImage:'../../imagenes/fotos/calendar.gif',
                    firstDay:1,
                    changeMonth:true,
                    changeYear:true
                });	
                $('#fecha_real').datepicker($.datepicker.regional['es']);
                $('#fecha_real').datepicker("option","showAnim","slideDown");
                $('#fecha_real').datepicker("option","dateFormat","yy-mm-dd");		     		
            });                        
            function valida_nuevo_failiar(){
         
                var nom = document.getElementById("nombre_fam").value; 
                if( nom == null || nom.length == 0 || /^\s+$/.test(nom) ) {
                    alert('El nombre es obligatorio');
                    return false;  
                }   
                if( nom.length >= 299 ) {
                    alert('El nombre tiene como maximo 298 caracteres');
                    return false;  
                }  
                nom=nom.replace(/\r\n|\n|\r/g, " ");            
                nom=nom.replace("'", " ");            
                document.getElementById("nombre_fam").value=nom;                                                                      
                                                                      
                                                                      
                var par = document.getElementById("perentesco_fam").value;
                if(par=='-1'){
                    alert('El parentesco es obligatorio');
                    return false;  
                }
                var esc = document.getElementById("escolaridad_fam").value;
                if(esc=='-1'){
                    alert('La escolaridad es obligatoria');
                    return false;  
                }   
                var ocf = document.getElementById("ocupacion_fam").value;
                if(ocf=='-1'){
                    alert('La ocupación es obligatoria');
                    return false;  
                }     
                                       
            
                var eda = document.getElementById("edad_fam").value; 
                if( eda == null || eda.length == 0 || /^\s+$/.test(eda) ) {
                    alert('La edad es obligatoria');
                    return false;  
                }   
                if( eda.length >= 99 ) {
                    alert('El nombre tiene como maximo 98 caracteres');
                    return false;  
                }             
                eda=eda.replace(/\r\n|\n|\r/g, " ");            
                eda=eda.replace("'", " ");            
                document.getElementById("edad_fam").value=eda;                                                            
                                                                      
                                                                      
                var obs = document.getElementById("observaciones_fam").value; 
                if( obs == null || obs.length == 0 || /^\s+$/.test(obs) ) {
                    alert('Las observaciones son obligatorias');
                    return false;  
                }   
                if( obs.length >= 499 ) {
                    alert('Las observaciones tienen como maximo 498 caracteres');
                    return false;  
                }                                             
                obs=obs.replace(/\r\n|\n|\r/g, " ");            
                obs=obs.replace("'", " ");            
                document.getElementById("observaciones_fam").value=obs;     
            }  
            function carga_perso(){
                jQuery("#listfamiliar").jqGrid('setCaption',"").trigger('reloadGrid'); 
                document.getElementById("nombre_fam").value=""; 
                document.getElementById("observaciones_fam").value=""; 
                document.getElementById("edad_fam").value="";  
                document.getElementById("perentesco_fam").value="-1";
                document.getElementById("escolaridad_fam").value="-1";
                document.getElementById("ocupacion_fam").value="-1"; 
                $( "#dilog_agrega_fami" ).dialog( "close" );
            }   
        </script>
    </head>
    <body>
        <%       request.setCharacterEncoding("UTF-8");
            //  out.print("nom "+session.getAttribute("nombre")+" clave "+session.getAttribute("clave")+" id "+session.getAttribute("id")+" permiso "+session.getAttribute("permiso")+" s agenda "+session.getAttribute("serial_agenda" )+" s paciente"+session.getAttribute("serial_pacinete"));
            if (session.getAttribute("nombre") == null || session.getAttribute("clave") == null || session.getAttribute("id") == null || session.getAttribute("permiso") == null || session.getAttribute("serial_agenda") == null || session.getAttribute("serial_pacinete") == null) {

        %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>  
    <%
            out.println("</body></html>");
            return;
        }

        conecta_bd ba = new conecta_bd();
        ba.ConectaDb();
    %>



    <iframe name="el-iframe1n" id="el-iframe1n" style="display:none"></iframe>             

    <!--DATOS PERSONALES-->
    <div id="divdatostrabajo" name="divdatoscitas" style="width: 100%; overflow-x: visible">


        <center>
            <form id="consu_trabs_1" name="consu_trabs_1" target="el-iframe1n" action="guarda_consu_trabs_1.jsp" >
                <h2>Composicion Familiar</h2>         
                <fieldset>
                <table id="listfamiliar" ></table>
                <div id="pagerfamiliar"></div> 
                <br>  
                <table style="width: 100%" border="0">
                    <tr>
                        <td style="width:25%"><label>Factores de Riesgo</label></td>
                        <td style="width:75%"><textarea name="facriesgo" id="facriesgo" rows="2" style="width:100%">factores</textarea></td>
                    </tr>
                    <tr>
                        <td style="width:25%"> <label>Tipología Familiar</label></td>
                        <td style="width:75%"> <textarea name="tipfami" id="tipfami" rows="2" style="width:100%">tipologia</textarea></td>
                    </tr>
                </table>
                </fieldset>
                <br>              

                <!--<form id="consu_trabs_1" name="consu_trabs_1" target="el-iframe1n" action="guarda_consu_trabs_1.jsp" >-->

                <input type="hidden" id="estado_civilo_trabs" name="estado_civilo_trabs">
                <input type="hidden" id="orientacion_trabs" name="orientacion_trabs">

                <h2>Fecha Real</h2>
                <input type="text" id="fecha_real" name="fecha_real" style="width:80px;text-align: center" readonly>
                <br> 
                <h2>Situación Socioeconómica</h2>
                <fieldset>
                    <table style="width: 100%" border="0">

                        <tr>
                            <td style="width: 20%" colspan="6">  </td>
                        </tr>
                        <tr>
                            <td><h3 style="color:#2779aa ">Ingresos Mensuales:</h3></td>
                            <td><label>Salario</label> <input type="checkbox" id="salarioingreso" name="salarioingreso" value="1" ></td>
                            <td><label>Pensión</label> <input type="checkbox" id="pensioningreso" name="pensioningreso" value="1" ></td>
                            <td><label>Arrendamiento</label> <input type="checkbox" id="arrendamientoingreso" name="arrendamientoingreso" value="1" ></td>
                            <td><label>Otro?</label> <input type="checkbox" id="otroingreso" name="otroingreso" value="1" ><label>Cual?</label><input type="text" id="cualotroingreso" name="cualotroingreso"></td>
                            <td><label>Monto Mes</label> <input type="text" id="ingresos_eco" name="ingresos_eco" style="width:98%"></td>
                        </tr>

                        <tr>
                            <td><h3 style="color:#2779aa ">Egresos Economicos</h3></td>
                            <td><center><input type="checkbox" id="chec_vivi" name="chec_vivi" value="1"><label>Vivienda</label></center></td>
                            <td><center><input type="checkbox" id="chec_educ" name="chec_educ" value="1" ><label>Educacion</label></center></td>
                            <td><center><input type="checkbox" id="chec_tran" name="chec_tran" value="1" ><label>Transporte</label></center></td>
                            <td><center><input type="checkbox" id="chec_salu" name="chec_salu" value="1" ><label>Salud</label></center></td>
                            <td></td>
                        </tr>  
                         <tr>
                            <td></td>
                            <td><center><input type="checkbox" id="chec_servivios" name="chec_servivios" value="1"><label>Servicios</label></center></td>
                            <td><center><input type="checkbox" id="chec_recreacion" name="chec_recreacion" value="1" ><label>Recreación</label></center></td>
                            <td><center><input type="checkbox" id="chec_alimentacion" name="chec_alimentacion" value="1" ><label>Alimentación</label></center></td>
                            <td><center><input type="checkbox" id="chec_otro" name="chec_otro" value="1" ><label>Otro</label></center></td>
                            <td><label>Egreso Mes</label> <input type="text" id="egresos_eco" name="egresos_eco" style="width:98%"></td>                    
                        </tr>      

                    </table>
                </fieldset>
                <br>
                 <h2>Vivienda</h2>
                <fieldset>
               
                <table style="width:70%"  border="0">
                    <tr><td colspan="5"><center><h2>Tipo de Vivienda</h2></center></td></tr>
                    <tr>
                        <td style="width: 20%"><label></label></td>
                        <td style="width: 20%"><center><label>Propia</label></center></td>
                        <td style="width: 20%"><center><label>Arrendada</label></center></td>
                        <td style="width: 20%"><center><label>Casa familiar</label></center></td>
                        <td style="width: 20%"><center><label>La esta pagando</label></center></td>
                    </tr>
                    <tr>
                        <td><label style="padding-left:5px">Pieza</label></td>
                        <td><center><input type="radio" name="casa" id="casa1" value="1"></center></td>
                        <td><center><input type="radio" name="casa" id="casa2" value="2"></center></td>
                        <td><center><input type="radio" name="casa" id="casa3" value="3"></center></td>
                        <td><center><input type="radio" name="casa" id="casa4" value="4"></center></td>
                    </tr>
                    <tr>
                        <td><label style="padding-left:5px">Casa</label></td>
                        <td><center><input type="radio" name="casa" id="casa5" value="5"></center></td>
                        <td><center><input type="radio" name="casa" id="casa6" value="6"></center></td>
                        <td><center><input type="radio" name="casa" id="casa7" value="7"></center></td>
                        <td><center><input type="radio" name="casa" id="casa8" value="8"></center></td>

                    </tr>
                    <tr>
                        <td><label style="padding-left:5px">Inquilinato</label></td>
                        <td><center><input type="radio" name="casa" id="casa9" value="9"></center></td>
                        <td><center><input type="radio" name="casa" id="casa10" value="10"></center></td>
                        <td><center><input type="radio" name="casa" id="casa11" value="11"></center></td>
                        <td><center><input type="radio" name="casa" id="casa12" value="12"></center></td>

                    </tr>
                    <tr>
                        <td><label style="padding-left:5px">Apartameto </label></td>
                        <td><center><input type="radio" name="casa" id="casa13" value="13"></center></td>
                        <td><center><input type="radio" name="casa" id="casa14" value="14"></center></td>
                        <td><center><input type="radio" name="casa" id="casa15" value="15"></center></td>
                        <td><center><input type="radio" name="casa" id="casa16" value="16"></center></td>

                    </tr>
                    <tr>
                        <td><label style="padding-left:5px">Cambuche </label></td>
                        <td><center><input type="radio" name="casa" id="casa17" value="17"></center></td>
                    <td><center><input type="radio" name="casa" id="casa18" value="18"></center></td>
                    <td><center><input type="radio" name="casa" id="casa19" value="19"></center></td>
                    <td><center><input type="radio" name="casa" id="casa20" value="20"></center></td>
                    </tr>

                </table>
                 <table style="width: 100%" border="0">
                     <tr><td colspan="3"><center><h2>Distribucion de la Vivienda</h2></center></td></tr>
                    <tr>
                        <td><label style="padding-right: 5px">Numero de Habitaciones:</label><input type="number" id="num_habit" name="num_habit" size="4" ></td>
                        <td><label style="padding-right: 5px;padding-left:20px">Personas por Habitacion</label><input type="number" id="perso_x_habi" name="perso_x_habi" size="4"></td>
                        <td></td>
                    </tr><tr>
                        <td><label  style="padding-right: 5px;padding-left:20px">Comedor</label><input type="checkbox" id="comedor" name="comedor" value="1" ></td>
                        <td><label  style="padding-right: 5px;padding-left:20px">Parqueadero</label><input type="checkbox" id="parqueadero" name="parqueadero" value="1" ></td>
                        <td><label  style="padding-right: 5px;padding-left:20px">Patio de Ropas</label><input type="checkbox" id="patior" name="patior" value="1" ></td>
                    </tr><tr>
                        <td><label  style="padding-right: 5px;padding-left:20px">Sala</label><input type="checkbox" id="sala" name="sala" value="1" ></td>
                        <td><label  style="padding-left:20px">Cocina</label><input type="checkbox" id="cocina" name="cocina" value="1" ></td>
                        <td></td>
                    </tr>

                </table>
                <br>
                 <table style="width: 100%" border="0">
                    <tr><td ><h2>Servicio sanitario</h2></td></tr>
                    <tr>
                        <td>
                            <label style="padding-right: 5px">Letrina:</label><input type="radio" name="sanitario" id="sanitario1" value="1">
                            <label style="padding-right: 5px;padding-left:20px">Inodoro:</label><input type="radio" id="sanitario2" name="sanitario" value="2">
                            <label  style="padding-left:20px">No tiene:</label><input type="radio" name="sanitario" id="sanitario3" value="3">
                        </td>
                    </tr>

                </table>
                <br>
                <table style="width: 100%" border="0">
                    <tr><td><h2>Servicios publicos</h2></td></tr>
                    <tr>
                        <td>
                            <label style="padding-right: 5px">Agua</label><input type="checkbox" id="servi_agua" name="servi_agua" value="1">
                            <label style="padding-right: 5px;padding-left:20px">Luz</label><input type="checkbox" id="servi_luz" name="servi_luz" value="1" >
                            <label style="padding-right: 5px;padding-left:20px">Alcantarillado</label><input type="checkbox"  id="servi_alcan" name="servi_alcan" value="1">
                            <label style="padding-right: 5px;padding-left:20px">Telefono</label><input type="checkbox"  id="servi_tele" name="servi_tele" value="1" >
                            <label style="padding-right: 5px;padding-left:20px">Aseo</label><input type="checkbox"  id="servi_aseo" name="servi_aseo" value="1" >
                            <label style="padding-right: 5px;padding-left:20px">Internet</label><input type="checkbox"  id="servi_internet" name="servi_internet" value="1" >
                            <label style="padding-right: 5px;padding-left:20px">Tv por Cable</label><input type="checkbox"  id="servi_cable" name="servi_cable" value="1" >
                            <label  style="padding-left:20px">Gas</label><input type="checkbox"  id="servi_gas" name="servi_gas" value="1" >
                        </td>
                    </tr>
                </table><br>

                <table style="width: 100%" border="0">
                    <tr><td><h2>Materiales de construccion</h2></td></tr>
                    <tr>
                        <td>
                            <label style="padding-right: 5px">Ladrillo</label><input type="checkbox" name="material1" id="material1" value="1">
                            <label style="padding-right: 5px;padding-left:20px">Bareque</label><input type="checkbox" name="material2" id="material2" value="1">
                            <label style="padding-right: 5px;padding-left:20px">Guadua</label><input type="checkbox" name="material3" id="material3" value="1">
                            <label style="padding-right: 5px;padding-left:20px">Madera</label><input type="checkbox" name="material4" id="material4" value="1">
                            <label style="padding-right: 5px;padding-left:20px">Otro</label><input type="checkbox" name="material5" id="material5" value="1">
                            <label  style="padding-right: 5px;padding-left:20px">Cual?  </label><input type="text" name="material_cual" id="material_cual" style="width:150px" >
                        </td>
                    </tr>
                </table><br>

                <table style="width: 100%" border="0">
                    <tr><td><h2>Piso</h2></td></tr>
                    <tr>
                        <td>
                            <label style="padding-right: 5px">Tierra</label><input type="checkbox" name="piso1" id="piso1" value="1">
                            <label style="padding-right: 5px;padding-left:20px">Balsoda</label><input type="checkbox" name="piso2" id="piso2" value="1">
                            <label style="padding-right: 5px;padding-left:20px">Mineral</label><input type="checkbox" name="piso3" id="piso3" value="1">
                            <label style="padding-right: 5px;padding-left:20px">Otro</label><input type="checkbox" name="piso4" id="piso4" value="1">
                            <label style="padding-right: 5px;padding-left:20px">Cual?  </label><input type="text" name="piso_cual" id="piso_cual" style="width:150px" >
                        </td>
                    </tr>
                </table><br>

                <table style="width: 100%" border="0">
                    <tr><td><h2>Animales Dentro de la Casa</h2></td></tr>
                    <tr>
                        <td>
                            <label style="padding-right: 5px">Si</label><input type="radio" name="animal" id="animal1" value="1" >
                            <label  style="padding-left:20px">No</label><input type="radio" name="animal" id="animal2" value="2">
                        </td>
                    </tr>
                </table><br>

                <table style="width: 100%" border="0">
                    <tr><td><h2>Manejo de Basura</h2></td></tr>
                    <tr>
                        <td>
                            <label style="padding-right: 5px">Quemada</label><input type="radio" name="basura" id="basura1" value="1">
                            <label style="padding-right: 5px;padding-left:20px">Enterrada</label><input type="radio" name="basura" id="basura2" value="2">
                            <label style="padding-right: 5px;padding-left:20px">Recogida</label><input type="radio" name="basura" id="basura3" value="3">
                            <label style="padding-left:20px">Tirada</label><input type="radio" name="basura" id="basura4" value="4">
                            <label style="padding-right: 5px;padding-left:20px">Otro</label><input type="radio" name="basura" id="basura5" value="5">
                            <label style="padding-right: 5px;padding-left:20px">Cual?  </label><input type="text" name="basura_cual" id="basura_cual" style="width:150px" >
                        </td>
                    </tr>
                </table><br>
                <table style="width: 100%" border="0">
                    <tr>
                        <td style="width:25%"><label>Factores de Riesgo</label></td>
                        <td style="width:75%"><textarea name="factor_vivienda" id="factor_vivienda" rows="2" style="width:100%"></textarea></td>
                    </tr>
                    
                </table>
                </fieldset>

                <br>
                <h2>Dinamica Familiar</h2>
                <fieldset>
                    <table style="width: 100%" border="0">
                        <br>
                        <tr>
                            <td colspan="5"><br><label>1.) La comunicación dentro de su hogar es:</label></td>
                        </tr>
                        <tr>
                            <td><label style="padding-right: 5px">Adecuada</label><input type="radio" name="comunicacion" id="comunicacion1" value="1"></td>
                            <td><label style="padding-right: 5px">Inadecuada</label><input type="radio" name="comunicacion" id="comunicacion2" value="2"></td>
                            <td><label style="padding-right: 5px">Regular</label><input type="radio" name="comunicacion" id="comunicacion3" value="3"></td>
                            <td colspan="2"><label style="padding-left:20px">Mala</label><input type="radio" name="comunicacion" id="comunicacion4" value="4"></td>
                        </tr>
                        <tr>
                            <td><label>Porque?</label></td>
                            <td colspan="4"><textarea name="comunicacionp" id="comunicacionp" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>2.) Como expresa el afecto a su espos@ y/o hijos</label></td>
                        </tr>
                        <tr>
                            <td colspan="5"><textarea name="expresa" id="expresa" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>3.) Alguna vez se ha presentado algún tipo de violencia dentro de su núcleo familiar?</label></td>
                        </tr>
                        <tr>
                            <td colspan="5"><textarea name="violencia" id="violencia" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>4.) Cuando se ha presentado algún tipo de conflicto usted(es) como lo han solucionan:</label></td>
                        </tr>
                        <tr>
                            <td><label style="padding-right: 5px">Dialogando</label><input type="radio" name="solucionan" id="solucionan1" value="1"></td>
                            <td><label style="padding-right: 5px">Evitando el problema</label><input type="radio" name="solucionan" id="solucionan2" value="2"></td>
                            <td><label style="padding-right: 5px">A golpes</label><input type="radio" name="solucionan" id="solucionan3" value="3"></td>
                            <td><label style="padding-right: 5px">A gritos</label><input type="radio" name="solucionan" id="solucionan4" value="4"></td>
                            <td><label style="padding-left:20px">Insultando</label><input type="radio" name="solucionan" id="solucionan5" value="5"></td>
                            
                        </tr>
                        
                        <br>
                        <tr>
                            <td colspan="5"><br><label>5.) Cuáles son sus metas a:</label></td>
                        </tr>
                        <tr>
                            <td><label>Corto plazo</label></td>
                            <td colspan="4"><textarea name="cortoplazo" id="cortoplazo" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        <tr>
                            <td><label>Mediano plazo</label></td>
                            <td colspan="4"><textarea name="medianoplazo" id="medianoplazo" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        <tr>
                            <td><label>Largo plazo</label></td>
                            <td colspan="4"><textarea name="largoplazo" id="largoplazo" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>6.) Que ha hecho usted(es) para lograr sus metas?</label></td>
                        </tr>
                        <tr>
                            <td colspan="5"><textarea name="metas" id="metas" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>7.) Que lo limita para seguir adelante?</label></td>
                        </tr>
                        <tr>
                            <td colspan="5"><textarea name="limita" id="limita" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>8.) Que actividades practica en su tiempo libre y cuales comparte con su familia?</label></td>
                        </tr>
                        <tr>
                            <td colspan="5"><textarea name="actividades" id="actividades" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>9.) Dinamica familiar</label></td>
                        </tr>
                        <tr>
                            <td><input type="text" id="dinamica"></td>
                            <td><label style="padding-right: 5px">Funcional</label><input type="radio" name="dinamicafamiliar" id="dinamicafamiliar1" value="1"></td>
                            <td colspan="3"><label style="padding-left:20px">Disfuncional</label><input type="radio" name="dinamicafamiliar" id="dinamicafamiliar2" value="2"></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>10.) Alguna vez a solicitado ayuda a algún profesional?</label></td>
                        </tr>
                        <tr>
                            <td><label style="padding-right: 5px">Si</label><input type="radio" name="profesionalayuda" id="profesional1" value="1"></td>
                            <td colspan="4"><label style="padding-left:20px">No</label><input type="radio" name="profesionalayuda" id="profesional2" value="2"></td>
                        </tr>
                        
                        <tr>
                            <td><label>Porque?</label></td>
                            <td colspan="4"><textarea name="porqueprofesional" id="porqueprofesional" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>11.) A que profesional(es) ha solicitado ayuda?</label></td>
                        </tr>
                        <tr>
                            <td colspan="5"><textarea name="queprofesional" id="queprofesional" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        
                    </table>
                </fieldset>
<!--                <table style="width: 100%" border="0">
                    
                    <tr>
                        <td>
                            <select name="salud_eps" id="salud_eps" style="width:90%">
                                <option value="-1">Seleccione ...</option>
                                <%
//                                    String sqll0 = "select ideps,nombre from eps order by nombre ";
//
//                                    ResultSet resuu20 = null;
//                                    try {
//                                        resuu20 = ba.consultas(sqll0);
//                                        while (resuu20.next() && resuu20 != null) {
//                                            out.println("<option value='" + resuu20.getString(1) + "'>" + resuu20.getString(2) + "</option>");
//                                        }
//                                    } catch (SQLException ex) {
//                                    } catch (Exception exe) {
//                                    }
//
//                                    ba.cierraResultado(resuu20);
                                %>
                            </select> 
                        </td>
                    </tr>
                </table><br>-->


                <table style="width: 100%" border="0">
                    
                </table><br>


                <table style="width: 100%" border="0">
                    <tr><td><h2>Observaciones y/o Recomendaciones del funcionario quien realizó la visita domiciliaria:</h2></td></tr>
                    <tr>
                        <td>
                            <textarea name="observa_y_reco" id="observa_y_reco" rows="4" style="width:100%"></textarea>
                        </td>
                    </tr>
                </table><br>


            </form>
            <!--Diagnosticos-->

            <table style="width: 100%" border="0"><tr><td>

                        <fieldset>
                            <legend>Diagonostico:</legend>
                            <form  id="form_diag" name="form_diag" accept-charset="UTF-8" action="../comunes/agrega_diag_trabs.jsp">
                                <table style="width:100%" border="0">
                                    <tr>
                                        <td colspan="3"><label>Diagnostico principal</label></td>
                                        <td><label style="padding-left:10px">Tipo Diagnostico</label></td>
                                        <td><label style="padding-left:10px">Causa Externa</label></td>
                                    </tr>
                                    <tr>
                                        <td  style="width:40px"> 
                                            <input type="text" id="diagnosticoconsu_evol" name="diagnosticoconsu_evol" class="diagnosticoconsu_evol" autocomplete="off"  style="width:100%">
                                            <div id="display_consu_evol"></div> 
                                        </td>
                                        <td  style="width:40px">
                                    <center>  <img src="../../imagenes/fotos/buscar.png" id="busca" name="busca" class="mas" alt="falla al cargar imagen" width="18px" height="18px" onclick="abreDialogConsu_evol('diagnosticoconsu_evol','diagnosticoconsu2_evol');" > </center>
                                    </td>
                                    <td  style="width:50%">
                                        <input type="text" id="diagnosticoconsu2_evol" name="diagnosticoconsu2_evol" class="diagnosticoconsu2_evol" disabled="true"  style="width:100%"> 
                                    </td>
                                    <td><center>
                                        <select name="tipodiagnostico_consu_evol" id="tipodiagnostico_consu_evol" style="width:90%">

                                            <%
                                                String sqll = "select idtipodiag,descripcion from tipo__diagnostico order by idtipodiag";

                                                ResultSet resuu2 = null;
                                                try {
                                                    resuu2 = ba.consultas(sqll);
                                                    while (resuu2.next() && resuu2 != null) {
                                                        out.println("<option value='" + resuu2.getString(1) + "'>" + resuu2.getString(2) + "</option>");
                                                    }
                                                } catch (SQLException ex) {
                                                } catch (Exception exe) {
                                                }

                                                ba.cierraResultado(resuu2);
                                            %>
                                        </select>
                                    </center>
                                    </td>
                                    <td>
                                    <center> 
                                        <select name="causaexterna_consu_evol" id="causaexterna_consu_evol" style="width:90%">
                                            <%
                                                String sqqll = "select idcausa,descripcion from causa_externa order by idcausa";

                                                ResultSet ressuu2 = null;
                                                try {
                                                    ressuu2 = ba.consultas(sqqll);

                                                    while (ressuu2.next() && ressuu2 != null) {
                                                        out.println("<option value='" + ressuu2.getString(1) + "'>" + ressuu2.getString(2) + "</option>");
                                                    }
                                                } catch (SQLException ex) {
                                                } catch (Exception exe) {
                                                }

                                                ba.cierraResultado(ressuu2);

                                            %>
                                        </select> 
                                    </center>
                                    </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" >
                                            <label>Observaciones:</label><br>
                                            <textarea name="observaciones_evol_consu" id="observaciones_evol_consu" rows="2" style="width:95%"></textarea>
                                            &nbsp;&nbsp;<input type="image" src="../../imagenes/fotos/agregar.png" style="width:25px;height:25px" alt="fallo">
                                            <br>
                                        </td>
                                    </tr>
                                </table> 
                            </form>

                            <table> 
                                <tr>
                                    <td colspan="5"><br>
                                        <table id="listdiag_consu_evol" ></table>
                                        <div id="pagerdiag_consu_evol"></div>              
                                    </td>
                                </tr>
                            </table>
                        </fieldset>

                    </td></tr></table>



        </center>
    </div> 

    <div name="dilog_cie10" id="dilog_cie10" >  
        <table id="listcie10" ></table>
        <div id="pagercie10"></div> 
    </div>   
    <iframe name="ifr_agregafami" id="ifr_agregafami" style="display:none" onload="carga_perso()"></iframe>             
    <div name="dilog_agrega_fami" id="dilog_agrega_fami" > 
        <form id="form_agregafami" name="form_agregafami" action="../comunes/agraga_comp_fami.jsp" target="ifr_agregafami" onsubmit="return valida_nuevo_failiar()" method="post">
            <center>
                <table>
                    <tr>
                        <td style="width:150px"><label><b>Nombre completo:</b></label></td>
                        <td style="width:450px"><input type="text" id="nombre_fam" name="nombre_fam" style="width:100%" maxlength="299" required></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                    <center>
                        <table>
                            <tr>
                                <td style="width:150px"><label><b>Parentesco:</b></label></td>
                                <td style="width:150px"><label><b>Escolaridad:</b></label></td>
                                <td style="width:150px"><label><b>Ocupación:</b></label></td>
                                <td style="width:150px"><label><b>Edad:</b></label></td>
                            </tr>
                            <tr>
                                <td>
                                    <select id="perentesco_fam" name="perentesco_fam"  style="width:100%">
                                        <option value="-1">Seleccione ...</option>
                                        <%
                                            String sqlf1 = "select idparentesco,descripcion from parentesco_trab_soci";
                                            ResultSet rs = null;

                                            try {
                                                rs = ba.consultas(sqlf1);
                                                while (rs.next() && rs != null) {
                                                    out.println("<option value='" + rs.getString(1) + "'>" + rs.getString(2) + "</option>");
                                                }
                                            } catch (SQLException ex) {
                                            } catch (Exception exe) {
                                            }

                                            ba.cierraResultado(rs);
                                        %>
                                    </select>
                                </td>
                                <td>
                                    <select id="escolaridad_fam" name="escolaridad_fam" style="width:100%">
                                        <option value="-1">Seleccione ...</option>
                                        <%
                                            String sqlf2 = "select idescolaridad_trab_soci,descripcion from escolaridad_trab_soci";
                                            ResultSet rs2 = null;

                                            try {
                                                rs2 = ba.consultas(sqlf2);
                                                while (rs2.next() && rs2 != null) {
                                                    out.println("<option value='" + rs2.getString(1) + "'>" + rs2.getString(2) + "</option>");
                                                }
                                            } catch (SQLException ex) {
                                            } catch (Exception exe) {
                                            }

                                            ba.cierraResultado(rs2);
                                        %>
                                    </select>   
                                </td>
                                <td>       
                                    <select id="ocupacion_fam" name="ocupacion_fam" style="width:100%">
                                        <option value="-1">Seleccione ...</option>
                                        <%
                                            String sqlf3 = "select idocupacion_trabajo_soci,descripcion from ocupacion_trabajo_soci";
                                            ResultSet rs3 = null;

                                            try {
                                                rs3 = ba.consultas(sqlf3);
                                                while (rs3.next() && rs3 != null) {
                                                    out.println("<option value='" + rs3.getString(1) + "'>" + rs3.getString(2) + "</option>");
                                                }
                                            } catch (SQLException ex) {
                                            } catch (Exception exe) {
                                            }

                                            ba.cierraResultado(rs3);
                                        %>
                                    </select> 
                                </td>
                                <td>                                          
                                    <input type="text" id="edad_fam" name="edad_fam" style="width:100%" maxlength="99" required>
                                </td>
                            </tr>
                        </table>
                    </center>
                    </td>
                    </tr>
                    <tr>
                        <td><label><b>Observaciones:</b></label></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <textarea name="observaciones_fam" id="observaciones_fam" rows="2" style="width:95%"></textarea>
                        </td>
                    </tr>
                </table>
                <input type="submit" value="Agregar" id="aceptar">                             
            </center>  
        </form>                                          
    </div>               




    <% ba.cerrar();%>
</body>
</html>
