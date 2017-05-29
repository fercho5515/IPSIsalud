<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE
    <!doctype html>
    <html lang="es">

        <head>
            <meta charset="utf-8"/>
            <%
                request.setCharacterEncoding("UTF-8");

                conecta_bd ba = new conecta_bd();
                ba.ConectaDb();
            %>
            <script type="text/javascript" language="javascript">
                
                jQuery("#listbuscamed").jqGrid({
                    url:'busca_medicamento.jsp?q=2',
                    datatype: "json",
                    colNames:['ID','Cum','Atc','Nombre','Concentracion','Unidad de Medida','Forma Farmaceutica','Presentacion'],
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
                    rowNum:3,
                    rowList:[3,5],
                    pager: '#pagerbuscamed',
                    sortname: 'm.serial',//OJO AQUI
                    viewrecords: true,
                    sortorder: "desc",
                    height: 70,
                    width:1025,
                    shrinkToFit: false,//columnas tamaÃ±o dato
        
                    rownumbers: false,
                    editurl: 'editaCli.php',
                    caption: "Medicamentos",
                    onSelectRow: function (id){       
                        var lineap=jQuery("#listbuscamed").jqGrid('getRowData',id);
                        var lineap2=""+lineap.id;
                        lineap2=lineap2.replace(/ /gi,'*');
                        //alert(lineap2);
                        $("#div_datos_medic").load("cargar_medic_farma.jsp?dato="+lineap2+"");
                    }	
                });


                jQuery("#listbuscamed").jqGrid('navGrid','#pagerbuscamed',{add:false,edit:false,del:false,search:false,view:false},
                {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
                {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
                {}, //opciones del
                {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                {width:420} //para el view
            );
            
                jQuery('#listbuscamed').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
                 
                      
                      
                $('#formedicamento').submit(function() {
                    
                    
//                    if (!/^([0-9])*[.]?[0-9]*$/.test(vconcentracion)){
//                        alert("El valor " + vconcentracion + " no es un número");
//                        return false;
//                    }
                    //CUM          
                var vcum=document.getElementById("cum").value;
                if(vcum == null ||vcum.length == 0 || /^\s+$/.test(vcum)){
                    alert('Codigo CUM es obligatorio ');
                    return false; 
                }
                //R-Sanitario
                var vrs=document.getElementById("registrosanitario").value;
                if(vrs == null ||vrs.length == 0 || /^\s+$/.test(vrs)){
                    alert('Registró sanitario es obligatorio ');
                    return false; 
                }
                //Producto
                var vp=document.getElementById("producto").value;
                if(vp == null ||vp.length == 0 || /^\s+$/.test(vp)){
                    alert('Casilla Producto es obligatoria');
                    return false; 
                }
                //Laboratorio
                var vlab=document.getElementById("laboratorio").value;
                if(vlab == null ||vlab.length == 0 || /^\s+$/.test(vlab)){
                    alert('Casilla Laboratorio es obligatoria ');
                    return false; 
                }                
                //consecutivo
               
                var vcons=document.getElementById("consecutivo").value;
                if(vcons == null ||vcons.length == 0 || /^\s+$/.test(vcons)){
                    alert('Casilla Consecutivo es obligatoria ');
                    return false; 
                }
                if (!/^([0-9])*[.]?[0-9]*$/.test(vcons)){
                    alert("El valor '" + vcons + "' en la casilla Consecutivo no es un número");
                    return false;
                }
                //Cantidad Cum
                var vccum=document.getElementById("cantidadcum").value;
                if(vccum == null ||vccum.length == 0 || /^\s+$/.test(vccum)){
                    alert('Casilla Cantidad CUM es obligatoria ');
                    return false; 
                }
                if (!/^([0-9])*[.]?[0-9]*$/.test(vccum)){
                    alert("El valor '" + vccum + "' en la casilla Cantidad CUM no es un número");
                    return false;
                }
                //Descripcion Comercial
                var vdcom=document.getElementById("descripcionc").value;
                if(vdcom == null ||vdcom.length == 0 || /^\s+$/.test(vdcom)){
                    alert('Casilla Descripcion Comercial es obligatoria ');
                    return false; 
                }
                //Estado Cum
                var vecum=document.getElementById("estadocum").value;
                if(vecum == null ||vecum.length == 0 || /^\s+$/.test(vecum)){
                    alert('Casilla Estado CUM es obligatoria ');
                    return false; 
                }
                //Unidad 
                var vunidad=document.getElementById("unidad").value;
                if(vunidad == null ||vunidad.length == 0 || /^\s+$/.test(vunidad)){
                    alert('Casilla Unidad es obligatoria ');
                    return false; 
                }
                //Via Admin 
                var vviaadmin=document.getElementById("viaadmin").value;
                if(vviaadmin == null ||vviaadmin.length == 0 || /^\s+$/.test(vviaadmin)){
                    alert('Casilla Vía Administración es obligatoria ');
                    return false; 
                }
                //Principio Activo  
                var vpactivo=document.getElementById("viaadmin").value;
                if(vpactivo == null ||vpactivo.length == 0 || /^\s+$/.test(vpactivo)){
                    alert('Casilla Principio Activo es obligatoria ');
                    return false; 
                }
                 //Unidad Medida  
                var vumedida=document.getElementById("unidadmedida").value;
                if(vumedida == null ||vumedida.length == 0 || /^\s+$/.test(vumedida)){
                    alert('Casilla Unidad Medida es obligatoria ');
                    return false; 
                }
                 //Cantidad  
                var vcantidad=document.getElementById("cantidad").value;
                if(vcantidad == null ||vcantidad.length == 0 || /^\s+$/.test(vcantidad)){
                    alert('Casilla Cantidad es obligatoria ');
                    return false; 
                }
                if (!/^([0-9])*[.]?[0-9]*$/.test(vcantidad)){
                    alert("El valor '" + vcantidad + "' en la casilla Cantidad no es un número");
                    return false;
                }
                 //Unidad Referencia  
                var vureferencia=document.getElementById("unidadreferencia").value;
                if(vureferencia == null ||vureferencia.length == 0 || /^\s+$/.test(vureferencia)){
                    alert('Casilla Unidad Referencia es obligatoria ');
                    return false; 
                }
                 //Forma Farmacéutica
                var vformafarma=document.getElementById("formafarma").value;
                if(vformafarma == null ||vformafarma.length == 0 || /^\s+$/.test(vformafarma)){
                    alert('Casilla Forma Farmacéutica es obligatoria ');
                    return false; 
                }
                   
                    
                  
                  
                    
                    
                    
                          
                    $.ajax({
                        type: 'POST',
                        url: $(this).attr('action'),
                        data: $(this).serialize(),
                        success: function(data) {;
                            $('#resumed').html(data);
//                            $("#div_medic_load").load("crearmedicamento.jsp");
                        }                         
                    })
                     
                    return false;
                }); 

            </script>
            <title>Crear Medicamento</title>
        </head>

        <body>
            <div id="resumed" name="resumed"></div>
            <div id="div_medic_load">
                <table id="listbuscamed" ></table>
                <div id="pagerbuscamed"></div> 

                <div id="divconfmed" name="divconfmed"></div>
                <form id="formedicamento" name="formedicamento" method="post" action="insertmedicamento.jsp">
                    <table style="height:100%;width:90%;padding-top:5px" align="center" border="0">
                        <tbody valign="top">

                            <tr>
                                <td>

                                  <fieldset><legend>Medicamentos CUMS</legend>
                            
                            <table style="width:100%">
                                <tr>
                                    <td class="cuatro">
                                        <label for="codigo">CUM: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="producto">Registró Sanitario: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Fecha Expedición: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Fecha Vencimiento </label>
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="cum" id="cum" maxlength="30" value="" size="24%">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="registrosanitario" id="registrosanitario" maxlength="400" value="">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="fechae" id="fechae" maxlength="30" value="">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="fechav" id="fechav" maxlength="30" value="">
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <label for="codigo">Producto: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="producto">Laboratorio : </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Estado Registro: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Consecutivo: </label>
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="producto" id="producto" maxlength="30" value="" size="24%">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="laboratorio" id="laboratorio" maxlength="400" value="">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="estador" id="estador" maxlength="30" value="">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="consecutivo" id="consecutivo" maxlength="30" value="">
                                    </td>
                                </tr>
                              
                              <!-----fila---->
                                <tr>
                                    <td class="cuatro" name="cuatro">
                                        <label for="codigo">Cantidad CUM: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="producto">Descripción Comercial: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Estado CUM: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Fecha Activo </label>
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="cantidadcum" id="cantidadcum" maxlength="30" value="" size="24%">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="descripcionc" id="descripcionc" maxlength="400" value="">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="estadocum" id="estadocum" maxlength="30" value="">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="fechaac" id="fechaac" maxlength="30" value="">
                                    </td>
                                </tr>
                                
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro" name="cuatro">
                                        <label for="codigo">Fecha Inactivo: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="producto">Muestra Médica: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Unidad: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">ATC:</label>
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="fechain" id="fechain" maxlength="30" value="" size="24%">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="muestra" id="muestra" maxlength="400" value="">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="unidad" id="unidad" maxlength="30" value="">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="atc" id="atc" maxlength="30" value="">
                                    </td>
                                </tr>
                              <!-----fila---->
                                <tr>
                                    <td class="cuatro" name="cuatro">
                                        <label for="codigo">Descripción ATC: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="producto">Vía Administración: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Concentración: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Principio Activo: </label>
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="descripcionatc" id="descripcionatc" maxlength="30" value="" size="24%">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="viaadmin" id="viaadmin" maxlength="400" value="">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="concentracion" id="concentracion" maxlength="30" value="">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="principioa" id="principioa" maxlength="30" value="">
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro" name="cuatro">
                                        <label for="codigo">Unidad Medida: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="producto">Cantidad: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Unidad Referencia: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Forma Farmacéutica: </label>
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="unidadmedida" id="unidadmedida" maxlength="30" value="" size="24%">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="cantidad" id="cantidad" maxlength="400" value="">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="unidadreferencia" id="unidadreferencia" maxlength="30" value="">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="formafarma" id="formafarma" maxlength="30" value="">
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro" name="cuatro">
                                        <label for="codigo">Nombre Rol: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="producto">Tipo Rol: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Modalidad: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Activo: </label>
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="nombrerol" id="nombrerol" maxlength="30" value="" size="24%">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="tiporol" id="tiporol" maxlength="400" value="">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="modalidad" id="modalidad" maxlength="30" value="">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="activo" id="activo" maxlength="30" value="">
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro" name="cuatro">
                                        <label for="codigo">Retroviral: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="producto">Plan Beneficios: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc"> </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc"> </label>
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="retroviral" id="retroviral" maxlength="30" value="" size="24%">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="plan" id="plan" maxlength="400" value="">
                                    </td>
                                    <td class="cuatro">
                                        <!--<input type="text" class="cuatro" name="atc" id="atc" maxlength="30" value="">-->
                                    </td>
                                    <td class="cuatro">
                                        <!--<input type="text" class="cuatro" name="atc" id="atc" maxlength="30" value="">-->
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                                </td><td>
                                </td>
                            </tr>

                            <tr>
                                <td  colspan="2" style="text-align:right;width:80%">
                        <center>  <input type="Submit" value="Guardar" name="aceptar" size="25" id="aceptar" maxlength="30">
                            <input type="Reset" value="Borrar Todo" id="aceptar"> </center>
                        </td>
                        </tr>


                    </table>
                </form>

                <div id="resuforma" name="resuforma"></div>
                <div id="resuvia" name="resuvia"></div>
                <div id="resunidad" name="resunidad"></div>


            </div>
        </body>
    </html>
    <% ba.cerrar();%>