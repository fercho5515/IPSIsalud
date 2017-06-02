<!--hola mundo citas1-->

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            .letra {
                font-family: Arial;
                font-size: 10px;
            }
        </style>
    </head>
    <script type="text/javascript" language="javascript">
        
        /*-------------------------------*/
        $("#proced").val("");
        $("#id_pac").val("");
        
        var id_paciente="";
        var id_tarifario="";
        var proced="";
        var cupv="";
        var cont="";
        var paque="";
        var anchoPantalla = $("#gridcitas").width();
//        anchoPantalla=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
        
        jQuery("#listcitaspaciente").jqGrid({
            url:'cargar_citaspaciente.jsp?cod=0',
            datatype: "json",
            colNames:['ID','1','Especialidad','Hora','Fecha','Serial'],
            colModel:[
                {name:'ida',index:'ida', width:(anchoPantalla*0.30*0.1),hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'proc',index:'proc',width:180,hidden:true,editable: false,required : true,editoptions:{maxlength: 63}},
                {name:'descr',index:'descr',width:(anchoPantalla*0.30*0.67),editable: false,required : true,editoptions:{maxlength: 63}},
                {name:'hora',index:'hora', width:(anchoPantalla*0.30*0.13),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'fecha',index:'fecha', width:(anchoPantalla*0.30*0.17),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'serial',index:'serial', width:(anchoPantalla*0.30*0.1),hidden:true,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
            ],
            rowNum:3,
            rowList:[3,5],
            pager: '#pagercitaspaciente',
            sortname: 'proc',//OJO AQUI
            viewrecords: true,
            sortorder: "desc",
            height: 300,
//            autowidth: true,
            width:anchoPantalla*0.30,
            shrinkToFit: false,//columnas tamaÃ±o dato
        
            rownumbers: false,
            editurl: 'editaCli.php',
            caption: "Citas del Paciente",
            onSelectRow: function (id){       
                var lineap=jQuery("#listcitaspaciente").jqGrid('getRowData',id);
                var lineap2=""+lineap.id;
                lineap2=lineap2.replace(/ /gi,'*');
                id_paciente=""+lineap.serial;  
                //$("#id_pac").val(id_paciente);
                $("#div_datos_medic").load("cargar_medic_farma.jsp?dato="+lineap2+"");
            }	
        });
        jQuery("#listcitaspaciente").jqGrid('navGrid','#pagercitaspaciente',{add:true,edit:false,del:false,search:true,view: true},
        {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
        {closeAfterAdd: true, closeOnEscape: true,top:10,left:10},
        //opciones add
        {}, //opciones del
        {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true}
//        {width:400} //para el view
    );
        /**--------------------------------*/
        /*-------------------------------*/
        jQuery("#listseviciospaciente22").jqGrid({
            url:'cargar_serviciospaciente.jsp',
            datatype: "json",
            colNames:['ID','Especialidad','0','1','Hora','2','CUP','4'],
            colModel:[
                {name:'conta',index:'conta', width:(anchoPantalla*0.30*0.1),hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'descr',index:'descr',width:(anchoPantalla*0.30*0.8),editable: false,required : true,editoptions:{maxlength: 63}},
                {name:'proce',index:'proce',width:180,hidden:true,editable: false,required : true,editoptions:{maxlength: 63}},
                {name:'tari',index:'tari',width:180,hidden:true,editable: false,required : true,editoptions:{maxlength: 63}},
                {name:'cont',index:'cont', width:(anchoPantalla*0.30*0.1),hidden:true,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'paq',index:'paq', width:(anchoPantalla*0.30*0.1),hidden:true,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'cup',index:'cup', width:(anchoPantalla*0.30*0.2),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'bande',index:'bande', width:40,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
            ],
            rowNum:10,
            rowList:[15,5],
            pager: '#pagerseviciospaciente22',
            sortname: 'proce',//OJO AQUI
            viewrecords: true,
            sortorder: "desc",
            height:300,
//            autowidth:true,
            width:anchoPantalla*0.30,
            shrinkToFit: false,//columnas tamaÃ±o dato
            rownumbers: false,
            editurl: 'editaCli.php',
            caption: "Servicios",
            grouping:true,
            groupingView : {
                groupField : ['bande'],
                groupColumnShow : [false]
            },
            onSelectRow: function (conta){ 
                var lineap=jQuery("#listseviciospaciente22").jqGrid('getRowData',conta);
                var lineap2=""+lineap.conta;
                var cup=""+lineap.cup;
                var idpac=jQuery("#id_pac").val();
                //alert(idpac);
                var fecha=jQuery("#2cambia_dia").val();
                //var fecha = jQuery("#2cambia_dia").val();
                id_tarifario=""+lineap.tari;
                proced=""+lineap.proce;
                cupv=""+lineap.cup;
                cont=""+lineap.cont;
                paque=""+lineap.paq;
                
                $.ajax({ 
                    type: "POST",
                    url: "validar_paquete_contrato.jsp",
                    dataType: 'json',
                    data: "id_paciente="+idpac+"&id_contrato="+cont+"&id_paquete="+paque+"&id_procedimiento="+proced+"&fecha_cita="+fecha+"&cupv="+cupv,
                    success: function(data){
                        //alert(data.res);
                        if(data.id_serial==null || data.id_serial==0){
                            alert("Datos Incorrectos");
                        }else if(data.res==1){
                            $("#valida").val("1");   
                            alert(data.msj);
                        }else if(data.res==2){
                            $("#valida").val("2"); 
                            alert(data.msj);
                        }else if(data.res==3){
                            alert(data.msj);
                        }else if(data.res==4){
                            alert(data.msj);
                        }else if(data.res==5){
                            alert(data.paq);
                        }else if(data.res==6){
                            alert(data.msj);
                        }else if(data.res==7){
                            alert(data.msj);
                        }
                        else{
                            //$( "#dialog_horario" ).dialog( "open" );
                        }
                    },
                    error: function(data){
                        //alert("---"+data.msg)
                    }
                });
                $("#id_tarifario").val(id_tarifario);
                $("#proced").val(proced);
                $("#cupv").val(cupv);
                $("#cont").val(cont);
                $("#paque").val(paque);

                lineap2=lineap2.replace(/ /gi,'*');
                $("#div_profesionales").load("cargar_prof.jsp?dato="+cup+"&datot="+id_tarifario+"&datop="+proced+"");   
                jQuery("#list_citas_medico").jqGrid('setCaption',"AGENDA DEL DIA ").trigger('reloadGrid');
            }	
        });
        jQuery("#listseviciospaciente22").jqGrid('navGrid','#pagerseviciospaciente22',{add:true,edit:false,del:false,search:true,view: true},
        {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
        {closeAfterAdd: true, closeOnEscape: true,top:10,left:10},
        //opciones add
        {}, //opciones del
        {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
        {width:(anchoPantalla*0.30)} //para el view
    );
        /**--------------------------------*/

        /*   $(function(){
           $('#dialog_cita').dialog({
               autoOpen: false,
               modal:false,
               show:{
                 effect: "blind",
                 duration: 500
               },
               hide:{
                 effect: "explode",
                 duration: 500
               },
               width:'700px'
           }); 
        });*/

        jQuery("#list_citas_medico").jqGrid({
            url:'busca_citas.jsp?q=2',
            datatype: "json",
            colNames:['Identificacion','Nombre','Hora','Minuto','AM/PM'],
            colModel:[
                {name:'id',index:'id', width:(anchoPantalla*0.30*0.1),hidden:true,search:true,editable: false,required : false,editoptions:{maxlength: 50},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                {name:'nombre',index:'nombre', width:(anchoPantalla*0.30*0.6),search:true, editable: false,required : false,editoptions: {maxlength: 200},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                {name:'hora',index:'hora', width:(anchoPantalla*0.30*0.1),search:true,edittype:"select" , editable: true,required : true,editoptions: {value:"1:1;2:2;3:3;4:4;5:5;6:6;7:7;8:8;9:9;10:10;11:11;12:12"},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'minuto',index:'minuto', width:(anchoPantalla*0.30*0.1),search:true, editable: true,required : true,editoptions: {maxlength: 50},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                {name:'am_pm',index:'am_pm', width:(anchoPantalla*0.30*0.1),search:true, editable: true,required : true,editoptions: {maxlength: 50},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
            ],
            rowNum:10,
            rowList:[15,30,45],
            pager: '#pager_citas_medico',
            sortname: 'am_pm',
            viewrecords: true,
            sortorder: "asc",
            height: 300,
            width:anchoPantalla*0.30,
            shrinkToFit: false,
//            autowidth: true, 
            rownumbers: false,
            editurl: "insert_cita.jsp?cod=3",
            caption: "AGENDA DEL DIA ",
            ondblClickRow: function(cedula_nit){
                cedula_nit=cedula_nit.replace(" ","_");
                NuevoCaso2(""+cedula_nit+"");  
            }
        });
        jQuery("#list_citas_medico").jqGrid('navGrid','#pager_citas_medico',{add:false,edit:false,del:false,search:true,view: true},
        {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true,urledit:"insert_cita.jsp?as="+id_paciente},//opciones edit
        {closeAfterAdd: true, closeOnEscape: true,top:10,left:10},        //opciones add
        {}, //opciones del
        {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
        {width:anchoPantalla*0.30} //para el view
    );
        /*$("#addcita").click(function(){
        var id_prof = jQuery("#profesionales").val();
        var fecha = jQuery("#2cambia_dia").val();
        //$("#rowed3").jqGrid('setGridParam', {editurl:'whatever/url/you/need/with/the/id'});
        jQuery("#list_citas_medico").jqGrid('setGridParam',{editurl:"insert_cita.jsp?id_pac="+id_paciente+"&id_prof="+id_prof+"&id_tari="+id_tarifario+"&id_proce="+proced+"&cup="+cupv+"&paque="+paque+"&cont="+cont+"&fecha="+fecha+""});
        jQuery("#list_citas_medico").jqGrid('editGridRow',"new",{height:280,reloadAfterSubmit:false});
    });*/
    
    
        jQuery("#list_citas_medico").jqGrid('navButtonAdd','#pager_citas_medico',
        {
            caption:"",
            buttonicon:"ui-icon-circle-plus",
            onClickButton:function(){ 
                var valida=jQuery("#valida").val();
//                if(valida==1){
//                    confirm("Cita ya programada en este mes, deseas continuar?");
//                }else
//               
//                if (confirm('Some message')) {
//                    alert('Thanks for confirming');
//                } else {
//                    alert('Why did you press cancel? You should have confirmed');
//                }
                if(valida==1){
                var r = confirm("Cita ya programada en este mes, deseas continuar?");
                    if (r == true) {
                    } else {
                    return false;
                }}
                var fecha=jQuery("#2cambia_dia").val();
                $("#fecha").val(fecha);
                var idpac=jQuery("#id_pac").val();
                var proc=jQuery("#proced").val();
                var contrato=jQuery("#contra").val();
                var prof=jQuery("#profesionales").val();
                var paque=jQuery("#paque").val();
                var cupv=jQuery("#cupv").val();
                var mostrar="";
                var bandera="0";
                
                alert("paquete="+idpac+"Procedimiento="+proc+"idcontrato="+contrato+"prof="+prof+"paque="+paque+"cupv="+cupv);
                if( idpac == null || idpac.length == 0 || /^\s+$/.test(idpac) ) {
                    mostrar=mostrar+"Cedula del Paciente ";
                    bandera="1";
                }
                if( contrato == null || contrato.length == 0 ||contrato=="escoger" || /^\s+$/.test(contrato) ) {
                    mostrar=mostrar+"Contrato ";
                    bandera="1";  
                }
                if( fecha == null || fecha.length == 0 || /^\s+$/.test(fecha) ) {
                    mostrar=mostrar+"Fecha ";
                    bandera="1";  
                }
                if( proc == null || proc.length == 0 || /^\s+$/.test(proc) ) {
                    mostrar=mostrar+"Servicio ";
                    bandera="1";  
                }
          
                if( prof == null || prof.length == 0 ||prof=="escoger"|| /^\s+$/.test(prof) ) {
                    mostrar=mostrar+"Profesional ";
                    bandera="1";  
                }
                if(bandera==1){
                    alert("Escoja: "+mostrar);
                    return false;
                }
                $.ajax({ 
                    type: "POST",
                    url: "validar_cita.jsp",
                    dataType: 'json',
                    data: "id_paciente="+idpac+"&id_contrato="+contrato+"&id_paquete="+paque+"&id_procedimiento="+proc+"&fecha_cita="+fecha+"&cupv="+cupv,
                    success: function(){
                        //alert(data.id_serial+"--"+data.num );
                        /* if(data.id_serial==null || data.id_serial==0){
                            alert("Datos Incorrectos");
                        }else if(data.num>0){
                            alert("Esta cita ya fue asignada");
                        }
                        else{
                            $( "#dialog_horario" ).dialog( "open" );
                        }*/
                        $( "#dialog_horario" ).dialog( "open" );
                    },
                    error: function(){
                        alert("---");
                    }
                });
                //$( "#dialog_horario" ).dialog( "open" );
            },
          
            position:"last",
            title:"Agregar citas medica",
            cursor: "pointer"});
  
        
        $('#buscapaciente').submit(function() {
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
                //dataType: "json",
                              
                success: function(data) {
                    //alert(data.resp);
                    $('#divdatoscitas').html(data);
                    jQuery("#list4").jqGrid('setCaption',"").trigger('reloadGrid');
                }                             
            })
            return false;
        }); 
        function cambia_dias(){
            
        
            var vcontra=document.getElementById("contra").value;
            //cambiar_dia=cambiar_dia.replace(/ /gi,'*');  
//            $("#cambia_dia").load("cambia_dia.jsp?dato="+vcontra+"")
            var ide = jQuery("#id_citas").val();
            var contra = jQuery("#contra").val();
            jQuery("#listseviciospaciente22").jqGrid('setGridParam',{url:"cargar_serviciospaciente.jsp?contra="+contra+"&ide="+ide}).trigger("reloadGrid");
       }
        function cambia_contratos(){
            var id_persona=document.getElementById("id_citas").value;
            $("#id_pac").val(id_persona)
            $("#div_contra").load("carga_contrato.jsp?dato="+id_persona+"")
            
        }
                      
        function cargar_servicios(){
            
            
            var cd_mask = jQuery("#id_citas").val();
            var dia = jQuery("#2cambia_dia").val();
            alert(dia);
            jQuery("#listcitaspaciente").jqGrid('setGridParam',{url:"cargar_citaspaciente.jsp?cod="+cd_mask+"&dia="+dia}).trigger("reloadGrid");
            
            
//            var varcambia_dia=document.getElementById("2cambia_dia").value;
//            var varid_perso=document.getElementById("id_citas").value;
//            var contra=document.getElementById("contra").value;
//            $("#carga_servicios").load("carga_servicios2.jsp?dato="+varcambia_dia+"&dato2="+varid_perso+"&dato3="+contra+"")
        }
        function busca_profesional(i){
            /*var id_proced="text2_"+i;
            var id_proced2=document.getElementById(id_proced).value;
            var id_tarifario="text3_"+i;
            var id_tarifario2=document.getElementById(id_tarifario).value;
            var id_proce="text_"+i;
            var id_proce2=document.getElementById(id_proce).value;
            document.getElementById('div_insert_cita').innerHTML = "";*/
            //$("#div_profesionales").load("cargar_prof.jsp?dato="+id_proced2+"&datot="+id_tarifario2+"&datop="+id_proce2+"");   
            //jQuery("#list_citas_medico").jqGrid('setCaption',"AGENDA DEL DIA ").trigger('reloadGrid');
            //$( "#dialog_medicos" ).dialog( "open" );
        };
        function cambia_agenda(){
            /*var id_med=$("#profesionales").val();
            var fecha_cita=$("#2cambia_dia").val();
            var contr="contra";
            var contratin=document.getElementById(contr).value;
            var id_pac="id_citas";
            var id_paci=document.getElementById(id_pac).value;
            $("#div_sesiones").load("cargar_sesion_prof.jsp?dato="+id_med+"&dato2="+fecha_cita+"&dato3="+contratin+"&dato4="+id_paci+"");
            setTimeout ('recarga()',500);*/
            var dia = jQuery("#2cambia_dia").val();
            var profe = jQuery("#profesionales").val();
            jQuery("#list_citas_medico").jqGrid('setGridParam',{url:"busca_citas.jsp?dia="+dia+"&prof="+profe}).trigger("reloadGrid");
            
        };
        function recarga(){
            jQuery("#list_citas_medico").jqGrid('setCaption',"AGENDA DEL DIA ").trigger('reloadGrid');
        };
        /*function agenda_citas(){
                           var vcontrato=document.getElementById("contra").value;
                           var vpaciente=document.getElementById("id_citas").value;
                          
                           $("#div_insert_cita").load("insert_cita.jsp?dato="+vcontrato+"&dato2="+vpaciente+"");
                          
                       };*/
        $('#form_citas').submit(function() {
            var vhora = document.getElementById("hora").value;               
            if( vhora == null || vhora.length == 0 ||vhora=='escoger' || /^\s+$/.test(vhora) ) {
                alert('No ha escogido la hora de la cita');
                return false;  
            }
            var vminu = document.getElementById("minu").value;               
            if( vminu == null || vminu.length == 0 ||vminu=='escoger' || /^\s+$/.test(vminu) ) {
                alert('No ha escogido la hora de la cita');
                return false;  
            }
            var vampm = document.getElementById("ampm").value;               
            if( vampm == null || vampm.length == 0 ||vampm=='escoger' || /^\s+$/.test(vampm) ) {
                alert('Seleccione si es mañana o tarde');
                return false;  
            }
            //document.getElementById("id_paciente").value=document.getElementById("id_cita").value;
            //document.getElementById("id_contrato").value=document.getElementById("contra").value;
            //alert(id_paciente);
            //document.forms.f1.submit();                                                
            //Enviamos el formulario usando AJAX
            $.ajax({
                type: 'POST',
                url: $(this).attr('action'),
                data: $(this).serialize(),
                              
                success: function(data) {
                    $('#div_insert_cita').html(data);
                    jQuery("#list4").jqGrid('setCaption',"").trigger('reloadGrid');
                }                             
            })
            return false;
        }); 
        
        
        $(function(){
            $("#2cambia_dia").datepicker({
                //inline:true
                showOn:'both',
                buttonImageOnly:true,
                buttonImage:'../imagenes/fotos/calendar.gif',
                firstDay:1,
                changeMonth:true,
                changeYear:true
            });	
            $('#2cambia_dia').datepicker($.datepicker.regional['es']);
            $('#2cambia_dia').datepicker("option","showAnim","slideDown");
            $('#2cambia_dia').datepicker("option","dateFormat","yy-mm-dd");
        });
        
        
    </script>
    <body>
        <% request.setCharacterEncoding("UTF-8");%>
        <div style="display:inline-flex">
            <div style="width: 30%">
                <form id="buscapaciente" action="buscapaciente2.jsp" method="post" name="buscapaciente">
                    <fieldset style="width: 95%">
                        <legend>Buscar Paciente</legend>
                        <table border="0" >
                            <tr>
                                <td colspan="2"><label>1088798141</label></td>
                                <td colspan="2"><input type="text" name="id_citas" id="id_citas" onchange="cambia_contratos();"></td>
                                <input type="hidden" name="valida" id="valida" class="valida" value="0">
                                <td>
                                    <div id="figu" name="figu">
                                        <center><input type="image" src="../imagenes/fotos/buscar.png" style="width:25px;height:25px" ></center>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><label>Contrato:</label></td>
                                <td colspan="2">
                                    <div id="div_contra" name="div_contra">
                                        <select name="contra" id="contra"> 
                                       
                                            <option value="escoger">--Escoja un Contrato--</option>
                                        </select>
                                    </div></td>
                                <td> </td>
                            </tr>
                            <tr>
                                <td colspan="2"><label>Dia:</label></td>
                                <td colspan="2"><div id="cambia_dia" name="cambia_dia">
                                        <input type="text" name="2cambia_dia" id="2cambia_dia" readonly onchange="cargar_servicios()">&nbsp;
                                        <!--<select name="2cambia_dia"  id="2cambia_dia" style="width: 150px" ></select>-->
                                    </div></td>
                                <!--<td><input type="button" value="Cargar Servicios" onclick="cargar_servicios();"></td>-->
                                <td></td>
                            </tr>
                        </table>
                    </fieldset>
                </form>
            </div>
            <!--DATOS PERSONALES-->
            <div id="divdatoscitas" name="divdatoscitas" style="width: 70%; overflow-x: visible;margin-left: 2%">
                <table  border="0">
                    <tr>
                        <td><label class="letra">Primer Nombre </label></td>
                        <td><label class="letra">Segundo Nombre </label></td>
                        <td><label class="letra">Primer Apellido </label></td>
                        <td><label class="letra">Segundo Apellido </label></td>
                        <td><label class="letra">Cedula </label></td>
                        <td><label class="letra" >RH </label></td>
                        <td style="width:10%" rowspan="8"><input type="image" name="fo" size="15" id="fo" src="../imagenes/fotos/silueta.png" alt="Pintura geometrica" style="height:120px"></td>
                    </tr>
                    <!--Segunda Fila-->
                    <tr>
                        <td><input type="text" name="nombre1" size="15" id="nombre1" maxlength="30" disabled="disabled" ></td>
                        <td><input type="text" name="nombre2" size="15" id="nombre2" maxlength="30" disabled="disabled"  ></td>
                        <td><input type="text" name="apellido1" size="15" id="apellido1" maxlength="30" disabled="disabled"  ></td>
                        <td><input type="text" name="apellido2" size="15" id="apellido2" maxlength="30" disabled="disabled"  ></td>
                        <td><input type="text" name="numidentificacion" size="15" id="numidentificacion" maxlength="30" disabled="disabled"></td>
                        <td><input type="text" name="rh" size="15" id="rh" maxlength="30" disabled="disabled"  ></td>
                    </tr>
                    <!--Tercera Fila-->
                    <tr>
                        <td><label class="letra">Fecha de Nacimiento </label></td>
                        <td><label class="letra">Edad </label></td>
                        <td><label class="letra">Estado Civil </label></td>
                        <td><label class="letra">Nivel Sisben </label></td>
                        <td><label class="letra">Sexo </label></td>
                        <td><label class="letra">Orientacion Sexual </label></td>
                    </tr>
                    <!--Cuarta Fila-->
                    <tr>
                        <td>
                            <input type="text" name="fechanacimiento" size="15" id="fechanacimiento" maxlength="30" disabled="disabled">
                        </td>
                        <td>
                            <input type="text" name="edad" size="15" id="edad" maxlength="30" disabled="disabled" >
                        </td>
                        <td>
                            <input type="text" name="estadocivil" size="15" id="estadocivil" maxlength="30" disabled="disabled" >
                        </td>
                        <td>
                            <input type="text" name="nivelsisben" size="15" id="nivelsisben" maxlength="30" disabled="disabled" >
                        </td>
                        <td>
                            <input type="text" name="sexo" size="15" id="sexo" maxlength="30" disabled="disabled"  >
                        </td>
                        <td>
                            <input type="text" name="orientacionsexual" size="15" id="orientacionsexual" maxlength="30" disabled="disabled" >
                        </td>
                    </tr>
                    <!--Quinta Fila-->
                    <!--Sexta Fila-->
                    <!--Septima Fila-->
                    <tr>
                        <td><label class="letra">Departamento </label></td>
                        <td><label class="letra">Ciudad </label></td>
                        <td><label class="letra">Barrio </label></td>
                        <td><label class="letra">Direccion </label></td>
                        <td><label class="letra">VIH </label></td>
                        <td></td>
                    </tr>
                    <!--Octava Fila-->
                    <tr>
                        <td>
                            <input type="text" name="departamento" size="15" id="departamento" maxlength="30" disabled="disabled"  >
                        </td>
                        <td>
                            <input type="text" name="ciudad" size="15" id="ciudad" maxlength="30" disabled="disabled">
                        </td>
                        <td>
                            <input type="text" name="barrio" size="15" id="barrio" maxlength="30" disabled="disabled" >
                        </td>   
                        <td>
                            <input type="text" name="direccion" size="15" id="direccion" maxlength="30" disabled="disabled" >
                        </td>
                        <td>
                            <input type="text" name="vih" size="15" id="vih" maxlength="30" disabled="disabled" >
                        </td>
                        <td></td>
                    </tr>
                    <!--Novena Fila-->
                    <!--Decima Fila-->

                </table>
            </div> 

        </div>
        <div id="carga_servicios" name="carga_servicios"></div>
        <div id="div_sesiones" name="div_sesiones"></div>
        <div style="display: inline-flex;width: 100%;" id="gridcitas" class="gridcitas">
        <div style="margin-top:2%;display: inline-flex">
            <table id="listcitaspaciente"></table>
            <div id="pagercitaspaciente"></div>
        </div>

<!--        <div style="margin-top:2%;display: inline-flex; margin-left: 1%">-->
        <div style="margin-top:2%;margin-left: 1%">
            
            <table id="listseviciospaciente22" ></table>
            <div id="pagerseviciospaciente22"></div>
        </div>
        <div style="margin-top:2%; margin-left: 1%">    
            <label>Profesionales</label><br>
            <!-- <input type="hidden" id="asas" name="asas"> -->
            <div id="div_profesionales" name="div_profesionales">       
                <select name="profesionales" id="profesionales" onchange="cambia_agenda();">
                    <option value='escoger'>- Seleccione Profesional -</option>  
                </select>
            </div>

            <table id="list_citas_medico" ></table>
            <div id="pager_citas_medico"></div>
            <!--<input type="button" id="addcita" value="Add Cita">-->
        </div>
        </div>
        <!--   
           <div id="dialog_medicos" name="dialog_medicos" title="Cita Medica">
               <form id="form_citas" name="form_citas" action="insert_cita.jsp" method='post'>
                   <input type="hidden" name="id_paciente" id="id_paciente">
                   <input type="hidden" name="id_contrato" id="id_contrato">
                   <div>
                       <label>Profesionales2</label><br>
                       <div id="div_profesionales" name="div_profesionales">       
                           <select name="profesionales" id="profesionales" onchange="cambia_agenda();">
                               <option value='escoger'>- Seleccione Profesional -</option>  
                           </select>
                       </div>
                       <br> 
                       
                       <label>CITA</label><br>-->
        <!-- <input type="hidden" id="asas" name="asas"> ->
        <select name="hora" id="hora">
            <option value='escoger'>- Seleccione Hora -</option>  
            <option value='1'> 1 </option>  
            <option value='2'> 2 </option>  
            <option value='3'> 3 </option>  
            <option value='4'> 4 </option>  
            <option value='5'> 5 </option>  
            <option value='6'> 6 </option>  
            <option value='7'> 7 </option>  
            <option value='8'> 8 </option>  
            <option value='9'> 9 </option>  
            <option value='10'> 10 </option>  
            <option value='11'> 11 </option>  
            <option value='12'> 12 </option>  
        </select>
        <br>
        <select name="minu" id="minu">
            <option value='escoger'>- Seleccione Hora -</option>
            <option value='0'> 00 </option>
            <option value='20'> 20 </option>
            <option value='40'> 40 </option>
        </select>
        <br>
        <select name="ampm" id="ampm">
            <option value='escoger'>- Am/Pm -</option>
            <option value='am'> am </option>
            <option value='pm'> pm </option>
        </select>
        <br> 
        <select>
            <option value="1">Mallamas</option>
        </select>
        <!---
        </div>
        <center><input type="submit" id="aceptar" name="aceptar"   value="Agregar com Form"></center>
    </form>
    <div id="div_insert_cita" name="div_insert_cita"></div>
</div>--> 

    </div>
</body>
</html>
