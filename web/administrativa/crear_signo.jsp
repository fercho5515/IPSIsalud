<%-- 
    Document   : crear_signo
    Created on : 20-abr-2013, 18:22:57
    Author     : Fercho
--%>

<% response.setCharacterEncoding("UTF-8"); %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" language="javascript">
            
        $(document).ready(function(){
                         
                            var   anchoPantalla=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
                                        //alert(document.body.offsetWidth+" t "+anchoPantalla+" p "+((document.body.offsetWidth*24)/100));
                           jQuery("#listSignoD").jqGrid({
                           url:'signos_desnutricion/carga_signos_desnu.jsp',
                           datatype: "json",
                           colNames:['id','Descripcion'],
                           colModel:[
                                   {name:'id_signos',index:'id_signos', hidden:true,width:0,search:false,editable:false,required :false,editoptions:{readonly:'readonly'},editrules: { required: false }},
                                   {name:'descripcion',index:'descripcion', width:((anchoPantalla*95)/100),search:true, editable:true,required : false,editoptions: {maxlength: 140},editrules: { required: true },searchoptions:{sopt:['cn','eq']}}
                                    ],
                           gridComplete: function (){},       
                           rowNum:10,
                           rowList:[10,15,30,45,500],
                           pager: '#pagerSignoD',
                           sortname: 'descripcion',
                           viewrecords: true,
                           sortorder: "asc",
                           width:anchoPantalla,
                           height: 230,
                           shrinkToFit: false,//columanas fijas aunque tenga autowith
                           rownumbers: true,
                           editurl: 'insert_signo.jsp',
                           caption: "Signos de Desnutrición"
                   });
                   jQuery("#listSignoD").jqGrid('navGrid','#pagerSignoD',{add:true,edit:true,del:true,search:true,view: true},
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
                                                                           {width:400} //para el view
                                               );
            });
            
            
            
            $('#form_signo').submit(function() {
                           var vsigno=document.getElementById("signo").value;
                           if(vsigno == null ||vsigno.length == 0 || /^\s+$/.test(vsigno)){
                                                      alert('Escribe el signo');
                                                       return false; 
                           }
                           var vsigno1=document.getElementById("signo1").value;
                           if(vsigno1 == null ||vsigno1.length == 0 ||vsigno1=='existe' || /^\s+$/.test(vsigno1)){
                                                      alert('Signo repetido');
                                                       return false; 
                           }
                           pos=vsigno.indexOf("*");
                           if(pos>=0){
                               alert('No puedes utilizar el *');
                               return false;
                           }
                           
                           $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              success: function(data) {;
                                  $('#resu_signo').html(data);
                                  $("#div_signo").load("<label>Exito</label>"); 
                              }
                           })
                          return false;
                      }); 
                     
            function comprueba_signo(){
                        //comp_signo=comp_signo.replace(/ /gi,'*');
                        var comp_signo=document.getElementById("signo").value;
                        comp_signo=comp_signo.replace(/ /gi,'*');
                        $("#divcomp_signo").load("comprob_signo.jsp?dato="+comp_signo+"");
                        }
         </script>
        <title>JSP Page</title>
    </head>
    <body>
        <br>

        <center>
        <table id="listSignoD" ></table>
        <div id="pagerSignoD"></div> 
        </center>
<%
 /*
        <div id="div_signo" name="div_signo"></div>
        <form id="form_signo" name="form_signo" method="post" action="insert_signo.jsp">
        <table>
            <tr>
                <td>
                    <h2>Signos Fisicos de Desnutricion</h2>
                </td>
                <td></td>
            </tr>
            <tr>
                <td style="text-align: right"><label>Digite Signo de Desnutricion</td>
                <td></label><input type="text" id="signo" name="signo" maxlength="98" size="20" onkeyup="comprueba_signo();">
                <div id="divcomp_signo" name="divcomp_signo">
                    <input type="text" name="signo1" id="signo1" style="display: none" readonly>
                </div>
                </td>
            </tr>
                   
            <tr>
                <td style="text-align: center"><input type="submit" id="aceptar" name="aceptar" value="Guardar"></td>
                <td></td>
            </tr>
        </table>
        </form>
        <div id="resu_signo" name="resu_signo"></div>
        */ %>
    </body>
</html>

