
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" language="javascript">
            
            $('#form_comida').submit(function() {
                var vcomida=document.getElementById("comida").value;
                if(vcomida == null ||vcomida.length == 0 || /^\s+$/.test(vcomida)){
                    alert('Escribe Comida');
                    return false; 
                }
                var vcomida1=document.getElementById("comida1").value;
                if(vcomida1 == null ||vcomida1.length == 0 ||vcomida1=='existe' || /^\s+$/.test(vcomida1)){
                    alert('Comida Repetida');
                    return false; 
                }
                           
                pos=vcomida.indexOf("*");
                           
                if(pos>=0){
                    alert('* no');
                    return false;
                }
                           
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                    success: function(data) {;
                        $('#resu_comida').html(data);
                        $("#div_comida").load("<label>Exito</label>"); 
                    }
                })
                return false;
            }); 
                     
            function comprueba_comida(){
                /*var comp_hcomida=document.getElementById("hcomida").value;
                var comp_comida=document.getElementById("comida").value;
                comp_comida=comp_comida.replace(/ /gi,'*');
                $("#divcomp_comida").load("comprob_comida.jsp?dato="+comp_hcomida+"&dato2="+comp_comida+"");*/
                var id = jQuery("#hcomida").val();
                jQuery("#comida").jqGrid('setGridParam',{url:"load_comidas.jsp?id="+id}).trigger("reloadGrid");
            }
            <%
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb();
                String sql = "select id_hora_comida,descripcion from hora_comida;";
                //out.print(sql);
                //String json ="value:{";
                String json = "{";
                String bandera = "0";
                ResultSet resu = ba.consultas(sql);
                //  out.print("<select>");
                try {
                    while (resu.next() && resu != null) {
                        if (bandera == "1") {
                            json = json + ",";
                        }
                        json = json + "\"" + resu.getString(1) + "\":\"" + resu.getString(2) + "\"";
                        bandera = "1";
                        // out.print("<option value='"+ resu.getString(1) +"' >" + resu.getString(2) + "</option>");
                    }
                } catch (SQLException e) {
                } catch (Exception ex) {
                }
                json = json + "}";
            %>               
                jQuery("#comida").jqGrid({
                    url:'load_comidas.jsp?id=0',
                    datatype: "json",
                    colNames:['Id','Hora de Comida','Comida'],
                    colModel:[
                        {name:'id',index:'id', width:55,editable:true,hidden:true,editoptions:{readonly:'readonly'}},
                        {name:'id_hc',index:'id_hc', width: 200,editable:true,sorttype:'int',edittype:'select',editoptions: {value: <%= json%> },formatter:'select'},
                        //   ,formatter:'select',align: 'left',required:true,editrules:{required:true}},
                        {name:'descr',index:'descr', width:100, editable:true}
                    ],
                    gridComplete: function (){},       
                    rowNum:20,
                    rowList:[10,20,30],
                    pager: '#p_comida',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    width: 390,
                    rownumbers: true,
                    shrinkToFit: false,
                    height: "auto",
                    editurl: "insert_comida.jsp",
                    caption: "Comida"
                });
                
                jQuery("#comida").jqGrid('navGrid',"#p_comida",{add:true,edit:true,del:true,search:true,view: true},
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
             //   jQuery("#comida").jqGrid('inlineNav',"#p_comida");            
              
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="div_comida" name="div_comida"></div>
        <form id="form_comida" name="form_comida" method="post" action="insert_comida.jsp">
            <table style="width: 400px">
                <tr>
                    <td>
                        <h2>Comida</h2>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td style="text-align: right;width: 60%"><label>Seleccione Hora de Comida:</label></td>
                    <td style="width: 40%"><select name="hcomida" id="hcomida" style="width:90%" onchange="comprueba_comida();"> 

                            <%
                                ba.ConectaDb();
                                String sqlant = "select id_hora_comida,descripcion from hora_comida;";
                                //out.print(sqlant);
                                ResultSet resuant = ba.consultas(sqlant);
                                try {
                                    while (resuant.next() && resuant != null) {
                                        out.print("<option value='" + resuant.getString(1) + "'>" + resuant.getString(2) + "</option>");
                                    }
                                } catch (SQLException e) {
                                } catch (Exception ex) {
                                }
                                ba.cerrar();
                            %>

                        </select>
                    </td>
                </tr>
            </table>
        </form>


        <table id="comida"></table>
        <div id="p_comida"></div>


        <div id="resu_comida" name="resu_comida"></div>
    </body>
</html>
