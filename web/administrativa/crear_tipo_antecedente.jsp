<%-- 
    Document   : crear_tipo_antecedente
    Created on : 13-abr-2013, 17:53:01
    Author     : Fercho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" language="javascript">
            $(function(){        
                $('#formtipo_antecedente').submit(function() {
                    var veps=document.getElementById("tipo_antecedente").value;
                    if(veps == null ||veps.length == 0 || /^\s+$/.test(veps)){
                        alert('Escribe el Tipo de Antecedente');
                        return false; 
                    }
                    var veps1=document.getElementById("tipo_antecedente1").value;
                    if(veps1 == null ||veps1.length == 0 ||veps1=='existe' || /^\s+$/.test(veps1)){
                        alert('Tipo de antecedente repetido');
                        return false; 
                    }
                         
                           
                    $.ajax({
                        type: 'POST',
                        url: $(this).attr('action'),
                        data: $(this).serialize(),
                        success: function(data) {;
                            $('#resutipo_antecedente').html(data);
                            $("#divtipo_antecedente").load("<label>Exito</label>"); 
                        }
                    })
                    return false;
                }); 
            });     
            function comprueba_tipo_ant(){
                var comp_tipo_ant=document.getElementById("tipo_antecedente").value;
                $("#divcomp_antecedente").load("comprob_tipo_antecedente.jsp?dato="+comp_tipo_ant+"");
            }
            jQuery("#tipo_antecedente").jqGrid({
                url:'load_tantecedentes.jsp',
                datatype: "json",
                colNames:['Id','Tipo de antecedente'],
                colModel:[
                    {name:'id',index:'id', width:75,editable:true,hidden:true,editoptions: { readonly: 'readonly' }},
                    {name:'descr',index:'descr', width:200, editable:true},
                ],
                rowNum:20,
                rowList:[10,20,30],
                pager: '#ptipo_antecedente',
                sortname: 'id',
                viewrecords: true,
                sortorder: "desc",
                rownumbers: true,
                width: 300,
                shrinkToFit: false,
                height: "auto",
                editurl: "insert_tipo_antecedente.jsp",
                caption: "Tipos de antecedentes"
            });
            jQuery("#tipo_antecedente").jqGrid('navGrid',"#ptipo_antecedente",{add:true,edit:true,del:true,search:true,view: true},
                {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true
                    , afterSubmit: function (response,postdata) {
                        var result = jQuery.parseJSON(response.responseText); 
                        alert(result.msj);return [true,""];
                    },
                    errorTextFormat: function (response,postdata) {
                        var result = jQuery.parseJSON(response.responseText); 
                        alert(result.msj);return [true,""];
                    }
                },//opciones edit
                {closeAfterAdd: true, closeOnEscape: true 
                    , afterSubmit: function (response,postdata) {
                        var result = jQuery.parseJSON(response.responseText); 
                        alert(result.msj);return [true,""];
                    },
                    errorTextFormat: function (response,postdata) {
                        var result = jQuery.parseJSON(response.responseText); 
                        alert(result.msj);return [true,""];
                    }
                }, //opciones add
                {width:300 
                    , afterSubmit: function (response,postdata) {
                        var result = jQuery.parseJSON(response.responseText); 
                        alert(result.msj);return [true,""];
                    },
                    errorTextFormat: function (response,postdata) {
                        var result = jQuery.parseJSON(response.responseText); 
                        alert(result.msj);return [true,""];
                    }
                }, //opciones del
                {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                {width:400}
                );
            jQuery("#tipo_antecedente").jqGrid('inlineNav',"#ptipo_antecedente");               
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        
        <table id="tipo_antecedente"></table>
        <div id="ptipo_antecedente"></div>
        
        
    </body>
</html>

