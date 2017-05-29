
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
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
                           jQuery("#listSubSignoD").jqGrid({
                           url:'signos_desnutricion/carga_subsignos_desnu.jsp',
                           datatype: "json",
                           colNames:['id','Signo Desnutrición Detalle','id','Signo Desnutrición'],
                           colModel:[
                                   {name:'id_sub_signos',index:'id_sub_signos', hidden:true,width:0,search:false,editable:false,required :false,editoptions:{readonly:'readonly'},editrules: { required: false }},
                                   {name:'decripcion',index:'decripcion', width:((anchoPantalla*95)/100),search:true, editable:true,required : false,editoptions: {maxlength: 140},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                                   {name:'id_signos',index:'id_signos', hidden:true,width:0,search:false,editable:false,required :false,editoptions:{readonly:'readonly'},editrules: { required: false }},
                                   {name:'descripcion',index:'descripcion', hidden:true, width:((anchoPantalla*0.1)/100),search:true, editable:true,required : false,editoptions: {maxlength: 140},editrules: { required: true },searchoptions:{sopt:['cn','eq']}}
                                    ],
                           gridComplete: function (){},
                           grouping:true,         
                           groupingView : {groupField : ['descripcion']  },         
                           rowNum:10,
                           rowList:[10,15,30,45,500],
                           pager: '#pagerSubSignoD',
                           sortname: 'descripcion,decripcion',
                           viewrecords: true,
                           sortorder: "asc",
                           //multiselect: false,
                           ////loadonce: true,
                           //height: 'auto',
                           width:anchoPantalla,
                           height: 230,
                           //height: 'auto',
                           // autowidth: true, 
                           shrinkToFit: false,//columanas fijas aunque tenga autowith
                           rownumbers: true,
                           editurl: 'insert_signo.jsp',
                           caption: "Signos de Desnutrición Detalle"
                   });
                   jQuery("#listSubSignoD").jqGrid('navGrid','#pagerSubSignoD',{add:false,edit:false,del:false,search:true,view: true},
                                                                           {closeAfterEdit: false,reloadAfterSubmit:true,reloadAfterEdit:true,
                                                                                            afterSubmit: function (response) {
                                                                                                                alert(response.status+" -- "+response.statusText);
                                                                                            },
                                                                                            errorTextFormat: function (response) {
                                                                                                                alert(response.status+" -2- "+response.statusText);
                                                                                                                                }
                                                                           },//opciones edit
                                                                           {closeAfterAdd: false, closeOnEscape: true }, //opciones add
                                                                           {width:300}, //opciones del
                                                                           {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                                                                           {width:400} //para el view
                                               );
                     // boton de agregar                  
                    jQuery("#listSubSignoD").jqGrid('navButtonAdd','#pagerSubSignoD',
                                                            {
                                                             caption:"",
                                                             buttonicon:"ui-icon-circle-plus",
                                                             onClickButton:function(){ 
                                                                                             $( "#div-crea-sub" ).dialog( "open" );
                                                             },
                                                             position:"last",
                                                             title:"Agregar",
                                                             cursor: "pointer"});  
                     // editar                  
                    jQuery("#listSubSignoD").jqGrid('navButtonAdd','#pagerSubSignoD',
                                                            {
                                                             caption:"",
                                                             buttonicon:"ui-icon-pencil",
                                                             onClickButton:function(){ 
                                                                 var id = jQuery("#listSubSignoD").jqGrid('getGridParam','selrow');
                                                                 if (id){
                                                                       var ret = jQuery("#listSubSignoD").jqGrid('getRowData',id);
                                                                       $("#idssuf").val(ret.id_signos);
                                                                       $("#subsiged").val(id);
                                                                       $("#id_detalle").val(ret.decripcion);                                                                       
                                                                      $("#dialog_edit").dialog("open");
                                                                 }
                                                                 else{alert("Seleccione Fila");}
                                                             },
                                                             position:"last",
                                                             title:"Agregar",
                                                             cursor: "pointer"}); 
                     // boton de borrar                                    
                    jQuery("#listSubSignoD").jqGrid('navButtonAdd','#pagerSubSignoD',
                                                            {
                                                             caption:"",
                                                             buttonicon:"ui-icon-trash",
                                                             onClickButton:function(){ 
                                                                 var id = jQuery("#listSubSignoD").jqGrid('getGridParam','selrow');
                                                                 if (id){
                                                                     var r = confirm("Esta seguro de Borrar el dato seleccionado");
                                                                    if (r == true) {
                                                                         $.ajax({
                                                                                    type: 'POST',
                                                                                    url: "signos_desnutricion/borra_subsigno.jsp",
                                                                                    data: {ids:id},
                                                                                    datatype:'json',
                                                                                    success: function(data) {
                                                                                        if(data.res==1){
                                                                                                       alert("Proceso finalizado satisfactoriamente");  
                                                                                                       jQuery("#listSubSignoD").jqGrid('setCaption',"Signos de Desnutrición Detalle").trigger('reloadGrid');
                                                                                                   }                    
                                                                                             else if(data.res==2){
                                                                                                        alert("No se pudo borrar, dato relacionado");
                                                                                                    }
                                                                                             else{alert("No se pudo borrar");}  
                                                                                     }                         
                                                                                });
                                                                    } else {}
                                                                 }
                                                                 else{alert("Seleccione Fila");}
                                                             },
                                                             position:"last",
                                                             title:"Agregar",
                                                             cursor: "pointer"});  
                  ///////////
                            $( "#div-crea-sub" ).dialog({
                                              autoOpen: false,
                                              modal: false,
                                              width:450,
                                              show: {
                                                effect: "blind",
                                                duration: 1000
                                              },
                                              hide: {
                                                effect: "explode",
                                                duration: 1200
                                              }
                                            });
                   ////////
                        $( "#dialog_edit" ).dialog({
                                              autoOpen: false,
                                              modal: false,
                                              width:400,
                                              show: {
                                                effect: "blind",
                                                duration: 1000
                                              },
                                              hide: {
                                                effect: "explode",
                                                duration: 1200
                                              }
                                            });
            });
            
            $("#editar_subsigno").submit(function(){
                
                var deta=document.getElementById("id_detalle").value;
                if(deta == null ||deta.length == 0 || /^\s+$/.test(deta)){
                    alert('Escribe Signo Fisico de Desnutricion Detalle');
                    return false; 
                }
                
                        
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                    datatype: "json",
                    success: function(data) {                        
                                       if(data.res==1){
                                            alert("Proceso finalizado satisfactoriamente");                                            
                                            $( "#dialog_edit" ).dialog( "close" );
                                             jQuery("#listSubSignoD").jqGrid('setCaption',"Signos de Desnutrición Detalle").trigger('reloadGrid');
                                        }                    
                                 else if(data.res==2){
                                            alert("No se pudo editar");
                                        }
                                 else{alert("Falla");}  
                    }  
                });
                return false;
            });
            
            
            $('#form_subsigno').submit(function() {
                var vsubsigno=document.getElementById("subsigno").value;
                if(vsubsigno == null ||vsubsigno.length == 0 || /^\s+$/.test(vsubsigno)){
                    alert('Escribe Signo Fisico de Desnutricion');
                    return false; 
                }
                           
               var pos=vsubsigno.indexOf("*");
               var pos2=vsubsigno.indexOf('"');
               var pos3=vsubsigno.indexOf("'");
                           
                if(pos>=0){ alert('* caracter invalido');   return false;  }
                else if(pos2>=0){ alert('" caracter invalido');   return false;  }
                else if(pos3>=0){ alert("' caracter invalido");   return false;  }
                           
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                    dataType: "json",
                    success: function(data) {                        
                                       if(data.res==1){
                                            alert("Proceso finalizado satisfactoriamente");                                            
                                            $( "#div-crea-sub" ).dialog( "close" );
                                            $("#subsigno").val("");
                                             jQuery("#listSubSignoD").jqGrid('setCaption',"Signos de Desnutrición Detalle").trigger('reloadGrid');
                                        }                    
                                 else if(data.res==2){
                                            alert("No se pudo insertar, dato duplicado");
                                        }
                                 else{alert("Falla");}  
                    }  
                });
                return false;
            }); 
                     
            function comprueba_subsigno(){
                var comp_signo=document.getElementById("signo").value;
                var comp_s_signo=document.getElementById("subsigno").value;
                //comp_signo=comp_signo.replace(/ /gi,'*');
                comp_s_signo=comp_s_signo.replace(/ /gi,'*');
                //alert(comp_signo);
                $("#divcomp_subsigno").load("comprob_subsigno.jsp?dato="+comp_signo+"&dato2="+comp_s_signo+"");
            }
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        
        <center>
        <table id="listSubSignoD" ></table>
        <div id="pagerSubSignoD"></div> 
        </center>
        
        
        <div id="div_subsigno" name="div_subsigno"></div>
        <div id="div-crea-sub" name="div-crea-sub">
        <form id="form_subsigno" name="form_subsigno" method="post" action="insert_subsigno.jsp">
            <table style="width: 400px">
                <tr>
                    <td>
                        <h2>Signo Fisico de Desnutricion</h2>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td style="text-align: right;width: 60%"><label>Seleccione parte:</label></td>
                    <td style="width: 40%"><select name="signo" id="signo" style="width:90%" onchange="comprueba_subsigno();"> 

                            <%
                                conecta_bd ba = new conecta_bd();
                                ba.ConectaDb();

                                String sqlant = "select id_signos,descripcion from signos_desnu;";
                                //out.print(sqlant);
                                ResultSet resuant = ba.consultas(sqlant);
                                try {
                                    while (resuant.next() && resuant != null) {
                                        out.print("<option value='" + resuant.getString(1) + "'>" + resuant.getString(2) + "</option>");
                                    }
                                } catch (SQLException e) {
                                } catch (Exception ex) {
                                }
                            %>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right"><label>Digite signo fisico de desnutricion:</label></td>
                    <td></label><input type="text" id="subsigno" name="subsigno" maxlength="98" size="30" onkeyup="comprueba_subsigno();">
                        <div id="divcomp_subsigno" name="divcomp_subsigno">
                            <input type="text" name="subsigno1" id="subsigno1" style="display: none" readonly>
                        </div></td>
                </tr>

                <tr>
                    <td style="text-align: center" colspan="2"><input type="submit" id="aceptar" name="aceptar" value="Guardar"></td>
                </tr>
            </table>
        </form>
        </div>                    
        <div id="resu_subsigno" name="resu_subsigno"></div>
        
        
        <div id="dialog_edit">
            <form id="editar_subsigno" name="form_edit_subsig" action="signos_desnutricion/editar_subsigno.jsp" method="post">
                <input type="hidden" id="subsiged" name="subsiged">
            <table>
                <tr>
                    <td colspan="2"><center><h2>Editar Signo de Desnutrición Detalle</h2></center></td>
                </tr>
                <tr>
                    <td>Signo de Desnutricion</td>
                    <td>
                        <select id="idssuf" name="idssuf">
                          <%
                                String sqlan = "select id_signos,descripcion from signos_desnu order by descripcion;";
                                ResultSet resuan = ba.consultas(sqlan);
                                try {
                                    while (resuan.next() && resuan != null) {
                                        out.print("<option value='" + resuan.getString(1) + "'>" + resuan.getString(2) + "</option>");
                                    }
                                } catch (SQLException e) {
                                } catch (Exception ex) {
                                }
                                ba.cerrar();
                          %>  
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Detalle:</td>
                    <td><input type="text" id="id_detalle" name="id_detalle" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <center>
                            <input type="submit" id="aceptar" value="Aceptar">
                        </center>
                    </td>
                </tr>
            </table> 
          </form>    
        </div>
        
    </body>
</html>


