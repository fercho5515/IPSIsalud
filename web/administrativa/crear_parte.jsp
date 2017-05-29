
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" language="javascript">
            
            $('#form_parte').submit(function() {
                var vparte=document.getElementById("parte").value;
                if(vparte == null ||vparte.length == 0 || /^\s+$/.test(vparte)){
                    alert('Escribe la parte');
                    return false; 
                }
                var vparte1=document.getElementById("parte1").value;
                if(vparte1 == null ||vparte1.length == 0 ||vparte1=='existe' || /^\s+$/.test(vparte1)){
                    alert('Parte repetida');
                    return false; 
                }
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                    success: function(data) {;
                        $('#resu_parte').html(data);
                        $("#div_parte").load("<label>Exito</label>"); 
                    }
                })
                return false;
            }); 
                     
            function comprueba_parte(){
                var comp_parte=document.getElementById("parte").value;
                $("#divcomp_parte").load("comprob_parte.jsp?dato="+comp_parte+"");
            }

            jQuery("#cefalocaudal").jqGrid({
                url:'load_cefalocaudal.jsp',
                datatype: "json",
                colNames:['Id','Parte del cuerpo'],
                colModel:[
                    {name:'id',index:'id', width:120,hidden:true,editable:true,editoptions:{readonly:'readonly'}},
                    {name:'desc',index:'desc', width: 350,editable:true,sorttype:'int'},
                ],
                rowNum:20,
                rowList:[10,20,30],
                pager: '#p_cefalocaudal',
                sortname: 'id',
                viewrecords: true,
                shrinkToFit: false,
                sortorder: "desc",
                width: 400,
                rownumbers:true,
                height: "auto",
                editurl: "insert_parte.jsp",
                caption: "Cefalocaudal"
            });
            jQuery("#cefalocaudal").jqGrid('navGrid',"#p_cefalocaudal",{add:true,edit:true,del:true,search:true,view: true},
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
            //jQuery("#cefalocaudal").jqGrid('inlineNav',"#p_cefalocaudal");  

        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="div_parte" name="div_parte"></div>
        
        <table id="cefalocaudal"></table>
        <div id="p_cefalocaudal"></div>
        
    </body>
</html>

