
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
            
            $('#form_antecedente').submit(function() {
                var veps=document.getElementById("tipo_ant").value;
                if(veps == null ||veps.length == 0 || /^\s+$/.test(veps)){
                    alert('Selecciona el Tipo de Antecedente');
                    return false; 
                }
                var vant=document.getElementById("antecedente").value;
                if(vant == null ||vant.length == 0 || /^\s+$/.test(vant)){
                    alert('Escribe Antecedente');
                    return false; 
                }
                var vant1=document.getElementById("antecedente1").value;
                if(vant1 == null ||vant1.length == 0 ||vant1 =='existe'|| /^\s+$/.test(vant)){
                    alert('Este Antecedente ya Existe');
                    return false; 
                }
                           
                pos=vant.indexOf("*");
                           
                if(pos>=0){
                    alert('No puedes utiliar * en el codigo cie10');
                    return false;
                }
                           
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                    success: function(data) {;
                        $('#resu_antecedente').html(data);
                        $("#div_antecedente").load("<label>Exito</label>"); 
                    }
                })
                return false;
            }); 
                     
            function comprueba_ant(){
                //var comat=document.getElementById("antecedente2").value;
                //comat=comat.replace(/ /gi,'*');
                //var comp_ant=document.getElementById("antecedente").value;
                //var comp_t_ant=document.getElementById("tipo_ant").value;
                //$("#divcomp_antecedente").load("comprob_antecedente.jsp?dato="+comat+"&dato2="+comp_t_ant+"");
                var id = jQuery("#tipo_ant").val();
                jQuery("#antecedente").jqGrid('setGridParam',{url:"load_antecedentes.jsp?id="+id}).trigger("reloadGrid");
            }
            <%
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb();
                String sql = "select serial,descripcion from tipo_antecedente;";
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
                        
                jQuery("#antecedente").jqGrid({
                    url:'load_antecedentes.jsp?id=0',
                    datatype: "json",
                    colNames:['Id','Tipo de antecedente','Antecedente','Sexo'],
                    colModel:[
                        {name:'id',index:'id', width:55,editable:true,hidden:true,editoptions:{readonly:'readonly'}},
                        {name:'ta',index:'ta', width: 200,editable:true,sorttype:'int',edittype:'select',editoptions: {value: <%= json%> },formatter:'select'},
                        //   ,formatter:'select',align: 'left',required:true,editrules:{required:true}},
                        {name:'des',index:'des', width:100, editable:true},
                        {name:'sx',index:'sx', width:70, editable:true,edittype:'select',editoptions:{value:{3:'ambos',1:'masculino',2:'femenino'}},formatter:'select'},
                    ],
                    rowNum:20,
                    rowList:[10,20,30],
                    pager: '#p_antecedente',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    width: 390,
                    shrinkToFit: false,
                    height: "auto",
                    editurl: "insert_antecedente.jsp",
                    caption: "Tipos de antecedentes"
                });
                jQuery("#antecedente").jqGrid('navGrid',"#p_antecedente",{add:true,edit:true,del:true,search:true,view: true},
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
                jQuery("#antecedente").jqGrid('inlineNav',"#p_antecedente");            
                        
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="div_antecedente" name="div_antecedente"></div>
        <form id="form_antecedente" name="form_antecedente" method="post" action="insert_antecedente.jsp">
            <table style="width: 400px">
                
                <tr>
                    <td><label>Seleccione tipo de antecedente:</label>
                        <select name="tipo_ant" id="tipo_ant" style="width:90%" onchange="comprueba_ant();"> 
                            <option value="0">--Seleccione tipo de antecedente--</option>
                            <%
                                String sqlant = "select serial,descripcion from tipo_antecedente;";
                                out.print(sqlant);
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
                    <td><table id="antecedente"></table>
                        <div id="p_antecedente"></div></td>
                </tr>

            </table>
        </form>
        <div id="resu_antecedente" name="resutipo_antecedente"></div>
    </body>
</html>


