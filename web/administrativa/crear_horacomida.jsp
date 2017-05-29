
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" language="javascript">
            
            $('#form_hcomida').submit(function() {
                var vhcomida=document.getElementById("hcomida").value;
                if(vhcomida == null ||vhcomida.length == 0 || /^\s+$/.test(vhcomida)){
                    alert('Escribe la hora de comida');
                    return false; 
                }
                var vhcomida1=document.getElementById("hcomida1").value;
                if(vhcomida1 == null ||vhcomida1.length == 0 ||vhcomida1=='existe' || /^\s+$/.test(vhcomida1)){
                    alert('Hora comida repetida');
                    return false; 
                }
                pos=vhcomida.indexOf("*");
                if(pos>=0){
                    alert('No puedes utilizar el *');
                    return false;
                }
                           
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                    success: function(data) {;
                        $('#resu_hcomida').html(data);
                        $("#div_hcomida").load("<label>Exito</label>"); 
                    }
                })
                return false;
            }); 
                     
            function comprueba_hcomida(){
                var comp_hcomida=document.getElementById("hcomida").value;
                comp_hcomida=comp_hcomida.replace(/ /gi,'*');
                $("#divcomp_hcomida").load("comprob_hcomida.jsp?dato="+comp_hcomida+"");
            }
            
            jQuery("#hora_comida").jqGrid({
                url:'load_hora_comida.jsp',
                datatype: "json",
                colNames:['Id','Hora de comida'],
                colModel:[
                    {name:'id',index:'id', width:120,editable:true,hidden:true,editoptions:{readonly:'readonly'}},
                    {name:'desc',index:'desc', width: 350,editable:true,sorttype:'int'},
                ],
                rowNum:20,
                rowList:[10,20,30],
                pager: '#p_hora_comida',
                sortname: 'id',
                viewrecords: true,
                shrinkToFit: false,
                sortorder: "desc",
                width: 370,
                rownumbers: true,
                height: "auto",
                editurl: "insert_horacomida.jsp",
                caption: "Horas de Comida"
            });
            jQuery("#hora_comida").jqGrid('navGrid',"#p_hora_comida",{add:true,edit:true,del:true,search:true,view: true},
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
           // jQuery("#hora_comida").jqGrid('inlineNav',"#p_hora_comida");  
             
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        
         <table id="hora_comida"></table>
        <div id="p_hora_comida"></div>
        
        <div id="div_hcomida" name="div_hcomida"></div>
        
        <div id="resu_hcomida" name="resu_hcomida"></div>
    </body>
</html>