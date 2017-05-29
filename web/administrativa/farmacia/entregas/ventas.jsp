<%-- 
    Document   : ventas
    Created on : 9/03/2015, 01:54:29 PM
    Author     : VAIO
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" language="javascript">
            var  anchoPantallaef=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
                     
            
        jQuery("#listventasfarma").jqGrid({
                url:'farmacia/entregas/cargarventasfarmacia.jsp?cedulan=0&tipoc=CC',
                datatype: "json",
                colNames:['ID','serialmed','seriallab','ATC','Nombre','Forma','Unidad de Medida','Via Admin','Laboratorio','Codigo Barras','lote','num factura'],
                colModel:[
                        {name:'id',index:'id', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'m_serial',index:'m_serial',width:80,hidden:true,editable: false},
                        {name:'l_serial',index:'l_serial',width:80,hidden:true,editable: false},
                        {name:'cod_atc',index:'cod_atc', width:((anchoPantallaef*7)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'m_producto',index:'m_producto', width:((anchoPantallaef*22)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'forma_f',index:'forma_f',width:((anchoPantallaef*14)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'unioon',index:'unioon', width:((anchoPantallaef*12)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'via_ad',index:'via_ad', width:((anchoPantallaef*12)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'laboratorio',index:'laboratorio',width:((anchoPantallaef*9)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'cod_barras',index:'cod_barras', width:((anchoPantallaef*7)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'lote',index:'lote', width:((anchoPantallaef*7)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'num_factura',index:'num_factura',width:((anchoPantallaef*7)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                         ],       
                rowNum:11,
                rowList:[10,20,30,40,400],
                pager: '#pagerventasfarma',
                sortname: 'm.producto',//OJO AQUI
                viewrecords: true,
                sortorder: "asc",
                height: 150,
                width:1025,
                shrinkToFit: false,//columnas tamaÃ±o dato

                rownumbers: false,
                editurl: 'editaCli.php',
                caption: "Medicamentos",
                onSelectRow: function (id){       
                                           }                      
        });


        jQuery("#listventasfarma").jqGrid('navGrid','#pagerventasfarma',{add:false,edit:false,del:false,search:false,view:false},
                                     {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
                                                                {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
                                                                {}, //opciones del
                                                                {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                                                                {width:420} //para el view
                                );

        jQuery('#listventasfarma').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
        // boton de agregar                  
        jQuery("#listventasfarma").jqGrid('navButtonAdd','#pagerventasfarma',{
                                    caption:"",
                                    buttonicon:"ui-icon-circle-plus",
                                    onClickButton:function(){ 
                                                             $( "#contenedortablafacturad" ).dialog( "open" );
                                                             },
                                    position:"last",
                                    title:"Agregar",
                                    cursor: "pointer"});  
        //////////////////////
        //////////////////////
        //////////////////////        
        
        jQuery("#listmedicfarma").jqGrid({
                url:'farmacia/entregas/cargarmedicamentosinventario.jsp',
                datatype: "json",
                colNames:['ID','serialmed','seriallab','ATC','Nombre','Forma','Unidad de Medida','Via Admin','Cant','Laboratorio','Codigo Barras','lote','num factura'],
                colModel:[
                        {name:'id',index:'id', width:0,hidden:true,search:true,editable: true,editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'m_serial',index:'m_serial',width:80,hidden:true,editable: false},
                        {name:'l_serial',index:'l_serial',width:80,hidden:true,editable: false},
                        {name:'cod_atc',index:'cod_atc', width:(((anchoPantallaef+180)*5)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'m_producto',index:'m_producto', width:(((anchoPantallaef+180)*22)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'forma_f',index:'forma_f',width:(((anchoPantallaef+180)*14)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'unioon',index:'unioon', width:(((anchoPantallaef+180)*12)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'via_ad',index:'via_ad', width:(((anchoPantallaef+180)*10)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'existencias',index:'existencias', width:(((anchoPantallaef+180)*4)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'laboratorio',index:'laboratorio',width:(((anchoPantallaef+180)*8)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'cod_barras',index:'cod_barras', width:(((anchoPantallaef+180)*7)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'lote',index:'lote', width:(((anchoPantallaef+180)*7)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                        {name:'num_factura',index:'num_factura',width:(((anchoPantallaef+180)*7)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                         ],                         
                rowNum:11,
                rowList:[10,20,30,40,400],
                pager: '#pagermedicfarma',
                sortname: 'm.producto',//OJO AQUI
                viewrecords: true,
                sortorder: "asc",
                height: 'auto',
                width:(anchoPantallaef+180),
                shrinkToFit: false,//columnas tamaÃ±o dato

                rownumbers: false,
                editurl: 'editaCli.php',
                caption: "Medicamentos",
                onSelectRow: function (id){ }	,
                ondblClickRow: function(id){  
                            var lineap=jQuery("#listmedicfarma").jqGrid('getRowData',id);                                                                  
                            $("#idmedinv").val(id);
                            
                            
                            //  alert("222 |"+lineap.m_producto+"| |"+lineap.forma_f+"| |"+lineap.unioon+"|");  
                            $("#nombremen").html("<b>Medicamento:</b> "+lineap.m_producto+" "+lineap.forma_f+" "+lineap.unioon);
                            $("#laboratoriom").html("<b>Laboratorio:</b> "+lineap.laboratorio);
                            $("#lotem").html("<b>Lote:</b> "+lineap.lote);
                            $("#codigobam").html("<b>Codigo de Barras:</b> "+lineap.cod_barras);     
                            $("#cantimed").val(lineap.existencias);
                            
                            $("#formagregarmed").show();
                        }    
        });


        jQuery("#listmedicfarma").jqGrid('navGrid','#pagermedicfarma',{add:false,edit:false,del:false,search:false,view:false},
                                     {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
                                                                {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
                                                                {}, //opciones del
                                                                {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                                                                {width:420} //para el view
                                );

        jQuery('#listmedicfarma').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
        
        ////////////////
        
$( "#contenedortablafacturad" ).dialog({
      autoOpen: false,
      modal: true,
      dialogClass: 'no-close',
      width:""+(anchoPantallaef+200)+"px",
      open: function(event, ui) {},
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1200
      }
    });    
        

        function cargapersonacs(){
          var tipo=$("#tipoidcomf").val();
          var id=$("#ceculacomf").val();
          
          if( id == null || id.length == 0 || /^\s+$/.test(id) ) {
                                                      alert('No ingreso el número de identificación');
                                                      return false;  
                                                                      }   
                     
          $.ajax({
                  type: 'POST',
                  url: "farmacia/entregas/buscacomprador.jsp",
                  data: {tipoid:tipo,nid:id},
                  dataType: "json",
                  success: function(result){
                                     if(result.serial!=0){
                                          $("#nombrescf").html(result.nombre+" "+result.tipo+": "+result.cedula);
                                          $("#idusuariocf").val(result.serial);
                                          $("#contenedortablafactura").show();
                                          jQuery("#listventasfarma").jqGrid('setGridParam',{url:"farmacia/entregas/cargarventasfarmacia.jsp?cedulan="+id+"&tipoc="+tipo,page:1});
                                          jQuery("#listventasfarma").jqGrid('setCaption',"Medicamentos ").trigger('reloadGrid');
                                          $("#ced").val(id);
                                          $("#tipoid").val(tipo);
                                    }
                                     else{alert(result.msj);
                                          $("#nombrescf").html("");
                                          $("#idusuariocf").val("");
                                          jQuery("#listventasfarma").jqGrid('setGridParam',{url:"farmacia/entregas/cargarventasfarmacia.jsp?cedulan=0&tipoc=CC",page:1});
                                          jQuery("#listventasfarma").jqGrid('setCaption',"Medicamentos ").trigger('reloadGrid');
                                          $("#contenedortablafactura").hide();
                                          }
                   },
                  error: function( error ){
                      alert("ocurrio un error");
                      $("#nombrescf").html("");
                      $("#idusuariocf").val("");
                      jQuery("#listventasfarma").jqGrid('setGridParam',{url:"farmacia/entregas/cargarventasfarmacia.jsp?cedulan=0&tipoc=CC",page:1});
                      jQuery("#listventasfarma").jqGrid('setCaption',"Medicamentos ").trigger('reloadGrid');
                      $("#contenedortablafactura").hide();
                   }      
          });

        }

        </script>
    </head>
    <body>
    <center>    
       <br>
       <label>Tipo id:</label>&nbsp;
                <select id="tipoidcomf" value="tipoidcomf">
                    
                            <%
                                conecta_bd ba = new conecta_bd();
                                ba.ConectaDb();

                                String sqlant = "SELECT idtipo_id,descripcion FROM `ips_isalud`.`tipo_id`;";
                                //out.print(sqlant);
                                ResultSet resuant = ba.consultas(sqlant);
                                try {
                                    while (resuant.next() && resuant != null) {
                                        out.print("<option value='" + resuant.getString(1) + "' "+((resuant.getString(1).equals("CC")) ? "selected" : "")+"  >" + resuant.getString(2) + "</option>");
                                    }
                                } catch (SQLException e) {
                                } catch (Exception ex) {
                                }
                                ba.cierraResultado(resuant);
                                ba.cerrar();
                            %>       
                </select>
       &nbsp;&nbsp;&nbsp;&nbsp;
       <label>Usuario:</label>&nbsp;<input type="text" id="ceculacomf" name="ceculacomf" style="width:15%">
       &nbsp;
       <img src="/ISALUD/imagenes/fotos/buscar.png" id="busca" name="busca" class="mas" alt="falla al cargar imagen" width="18px" height="18px" onclick="cargapersonacs();">
       <br><br>
       <label id="nombrescf" name="nombrescf"> </label>
       <input type="hidden" id="idusuariocf" name="idusuariocf">
       <br><br>
       <div id="contenedortablafactura" style="display:none">
             <table id="listventasfarma" ></table>
             <div id="pagerventasfarma"></div> 
       </div>
       
       
       <div id="contenedortablafacturad" >
           <center>
               <table id="listmedicfarma" ></table>
               <div id="pagermedicfarma"></div> 
               <br>
               <div id="formagregarmed" style="text-align: left;display:none;width:600px">
                        <br>
                        <input type="hidden" name="ced" id="ced" >
                        <input type="hidden" name="tipoid" id="tipoid" >
                        <input type="hidden" name="idmedinv" id="idmedinv" >
                        <label id="nombremen" name="nombremen">Nombre:  </label><br>
                        <label id="laboratoriom" name="laboratoriom">Nombre:  </label><br>
                        <label id="lotem" name="lotem">Nombre:  </label><br>
                        <label id="codigobam" name="codigobam">Nombre:  </label><br>
                        <br>
                        <label>Cantidad:  </label><input type="text" id="cantimed" name="cantimed">                        
                        <br> 
                        <br>
                        <center><input type="button" id="aceptaventamed" name="aceptaventamed" value="Aceptar"></center>
                        <br>
                        <br> 
            </div>   
          </center>   
       </div>
       
        <div id="dialog-agregamed" >
            
       </div>
       
    </center> 
    </body>
</html>
