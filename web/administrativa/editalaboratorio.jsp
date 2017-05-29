<%-- 
    Document   : crearlaboratorio
    Created on : 13/03/2013, 03:05:08 PM
    Author     : EMMANUEL
--%>
<%@page import="java.util.*" session="true" %>

<!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>
<script type="text/javascript" language="javascript">
$(document).ready(function(){
    var grid = $("#listlabf"),prmEdit = {
                    errorTextFormat: function(data) {
                        var myInfo = '<div class="ui-state-highlight ui-corner-all">'+
                                     '<span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>' +
                                     '<strong>Texto de Informacion:</strong><br/>' +
                                     '' + data.responseText
                                     '</div>';
                            infoTR = $("table#TblGrid_"+grid[0].id+">tbody>tr.tinfo");
                            infoTD = infoTR.children("td.topinfo");
                            infoTD.html(myInfo);
                            infoTR.show();
                            jQuery("#listlabf").jqGrid('setCaption',"Laboratorios Farmaceuticos").trigger('reloadGrid');
                            return '';
                    },beforeInitData : function(fod) {  
                            infoTR = $("table#TblGrid_"+grid[0].id+">tbody>tr.tinfo");
                            infoTD = infoTR.children("td.topinfo");
                            infoTD.html("");
                            infoTR.hide();
                    }
                },prmEdit2 = {
                    errorTextFormat: function(data) {
                        var myInfo = '<div class="ui-state-highlight ui-corner-all">'+
                                     '<span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>' +
                                     '<strong>Texto de Informacion:</strong><br/>' +
                                     '' + data.responseText
                                     '</div>';
                             $("table.DelTable>tbody>tr#DelError>td").removeClass("ui-state-error");
                             $("table.DelTable>tbody>tr#DelError>td").html(myInfo);
                            jQuery("#listlabf").jqGrid('setCaption',"Laboratorios Farmaceuticos").trigger('reloadGrid');
                           // //infoTD = infoTR.children("td");
                           // infoTR.html(myInfo);
                           // infoTR.show();
                           // return '';
                    },beforeInitData : function(fod) {  
                             $("table.DelTable>tbody>tr#DelError>td").html("");
                            //infoTD = infoTR.children("td");
                          //  infoTR.html("");
                          //  infoTR.hide();
                    }
                };

   var anchoPantalla2=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
    jQuery("#listlabf").jqGrid({
   	url:'carga_laboratorio_farmaceutico.jsp?q=2',
	datatype: "json",
   	colNames:['id','Nombre','Direccion','Telefono','Nit'],
   	colModel:[
                {name:'id',index:'idlab_farmaceutico',hidden:true,width:0,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'nombre',index:'nombre', width:((anchoPantalla2*25)/100),search:true,editable: true,required : true,editoptions:{maxlength:199}},
   		{name:'direccion',index:'direccion', width:((anchoPantalla2*43)/100),search:true,editable: true,required : true,editoptions:{maxlength:199}},
   		{name:'telefono',index:'telefono', width:((anchoPantalla2*15)/100),search:true,editable: true,required : true,editoptions:{maxlength:199}},
   		{name:'nit',index:'nit',width:((anchoPantalla2*15)/100),search:true,editable: true,required : true,editoptions:{maxlength:199}},
   	       ],
   	rowNum:11,
   	rowList:[10,20,30,40,400],
   	pager: '#pagerlabf',
   	sortname: 'nombre',
        viewrecords: true,
        sortorder: "asc",
      //height: 100,
        height: 'auto',
        width:anchoPantalla2,
        shrinkToFit: false,//columnas tamaño dato
        rownumbers: false,
        editurl: 'editalabfarmaceutico.jsp',
	caption: "Laboratorios Farmaceuticos",
	ondblClickRow: function(id){}	
});

  /*
          jQuery("#listlabf").jqGrid('navGrid','#pagerlabf',{add:false,edit:true,del:true,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{width:300}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);*/
            jQuery("#listlabf").jqGrid('navGrid','#pagerlabf', {add:false,edit:true,del:true,search:false,view:false},
                                                        prmEdit,
                           				{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){  alert("1"); } }, //opciones add
							prmEdit2, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420});

        jQuery('#listlabf').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
                     


 });


$('#flabo').submit(function() {
                                                       
                               if($("#nombrelabo").val().length < 1) { 
                                                        document.getElementById('validacionelab').innerHTML = "<h2 style='color:red'>El nombre es obligatorio</h2><br>  ";
                                                       return false;  
                                                                      } 
                          else if($("#nombrelabo").val().length > 100) { 
                                                        document.getElementById('validacionelab').innerHTML = "<h2 style='color:red'>El nombre tiene como maximo 199 caracteres</h2><br>  ";
                                                       return false;  
                                                                      } 
                     /*   else if($("#direccionlabo").val().length < 1) { 
                                                        document.getElementById('validacionelab').innerHTML = "<h2 style='color:red'>La direccion es obligatoria</h2><br>  ";
                                                       return false;  
                                                                      } */
                          else if($("#direccionlabo").val().length > 100) { 
                                                        document.getElementById('validacionelab').innerHTML = "<h2 style='color:red'>La direccion tiene como maximo 199 caracteres</h2><br>  ";
                                                       return false;  
                                                                      } 
                    /*    else if($("#telefonolabo").val().length < 1) { 
                                                        document.getElementById('validacionelab').innerHTML = "<h2 style='color:red'>el telefono es obligatorio</h2><br>  ";
                                                       return false;  
                                                                      } */
                          else if($("#telefonolabo").val().length > 100) { 
                                                        document.getElementById('validacionelab').innerHTML = "<h2 style='color:red'>el telefono tiene como maximo 199 caracteres</h2><br>  ";
                                                       return false;  
                                                                      } 
                     /*   else if($("#nitlabo").val().length < 1) { 
                                                        document.getElementById('validacionelab').innerHTML = "<h2 style='color:red'>El nit es obligatoria</h2><br>  ";
                                                       return false;  
                                                                      } */
                          else if($("#nitlabo").val().length > 100) { 
                                                        document.getElementById('validacionelab').innerHTML = "<h2 style='color:red'>El nit tiene como maximo 199 caracteres</h2><br>  ";
                                                       return false;  
                                                                      }                                                 
       
                    // Enviamos el formulario usando AJAX
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#validacionelab').html(data);
                                  document.getElementById("nombrelabo").value="";
                                  document.getElementById("direccionlabo").value="";
                                  document.getElementById("telefonolabo").value="";
                                  document.getElementById("nitlabo").value="";
                                  //borrar los campos cuando crre
                                }                             
                          })
                     
                          return false;
                      });      
</script>
<title></title>
</head>

<body>
      <% 
      
           request.setCharacterEncoding("UTF-8");
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }%>
    <br><br><br>
<center>
<center>
    <table id="listlabf" ></table>
    <div id="pagerlabf"></div> 
    <br>
</center>
</body>
</html>