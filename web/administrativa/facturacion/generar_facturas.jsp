<%-- 
    Document   : generar_facturas.jsp
    Created on : 17/03/2015, 07:32:21 PM
    Author     : VAIO
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">            
             $(function(){
		     $("#fechafacti").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#fechafacti').datepicker($.datepicker.regional['es']);
		     $('#fechafacti').datepicker("option","showAnim","slideDown");
		     $('#fechafacti').datepicker("option","dateFormat","yy-mm-dd");
                     
                     
		     $("#fechafactf").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#fechafactf').datepicker($.datepicker.regional['es']);
		     $('#fechafactf').datepicker("option","showAnim","slideDown");
		     $('#fechafactf').datepicker("option","dateFormat","yy-mm-dd");
		});
                
    function facturar(){
               
              var feci= document.getElementById("fechafacti").value;               
              if( feci == null || feci.length == 0 || /^\s+$/.test(feci) ) {
                           alert("Fecha inicial es obligatoria");                           
                           return false;  
              } 
       
              var fecf= document.getElementById("fechafactf").value;               
              if( fecf == null || fecf.length == 0 || /^\s+$/.test(fecf) ) {
                           alert("Fecha final es obligatoria");                           
                           return false;  
              } 
              
             var array_fechai = feci.split("-"); 
             var diai=(array_fechai[2]);
             var mesi=(array_fechai[1]-1); 
             var anoi=(array_fechai[0]); 
             var datei = new Date(anoi,mesi,diai); 
              
             var array_fechaf = fecf.split("-"); 
             var diaf=(array_fechaf[2]);
             var mesf=(array_fechaf[1]-1); 
             var anof=(array_fechaf[0]); 
             var datef = new Date(anof,mesf,diaf);
              
             if(datef<datei){
                           alert("la fecha inicial no puede ser posterior a la actual");
                           return false;  
             } 
              
              var cont= document.getElementById("contratofac").value;   
              if(cont == 0){
                           alert("Seleccione Contrato para Facturación");                           
                           return false;  
              }
              
              
              
              
              
                $.ajax({
                   type: 'POST',
                   url: "entregamedicamentos/borramedentregados.jsp", 
                   data:{contr:cont,fechi:feci,fechf:fecf},
                   dataType: 'json',
                   success: function(data) {
                                    if(data.res==1){
                                        jQuery(idtabla).trigger('reloadGrid');	
                                        alert("Operación realizada satisfactoriamente. "); 
                                    }
                                    else{alert("Falla al realizar esta operación.");}
                                            },
                   error: function (xhr, ajaxOptions, thrownError) { alert("Falla al realizar esta operación."); }  
                   });
            return false;
    }
    
            var anchoPan=$("#div_facturacion").width();

            jQuery("#list_pacientes_factura").jqGrid({
                url:'facturacion/busca_pacientes_facturar.jsp?q=2&id=0',
                datatype: "json",
                colNames:['Documeto','Primer Nombre','Segundo Nombre','Primer Apellido','Segundo Apellido'],
                colModel:[
                    {name:'id_paciente',index:'id_paciente',width:(anchoPan * 0.177),hidden:false,search:true,searchoptions:{sopt:['cn','eq']}},
                    {name:'p_nom',index:'p_nom', width:(anchoPan * 0.2),hidden:false,search:true,searchoptions:{sopt:['cn','eq']}},
                    {name:'s_nom',index:'s_nom', width:(anchoPan * 0.2),search:true,searchoptions:{sopt:['cn','eq']},align:"right"},
                    {name:'p_ape',index:'p_ape', width:(anchoPan * 0.2),search:true, searchoptions:{sopt:['cn','eq']},align:"center"},
                    {name:'s_ape',index:'s_ape', width:(anchoPan * 0.2),search:true, searchoptions:{sopt:['cn','eq']},align:"center"},
                ],
                rowNum:5,
                rowList:[5,10,20,30,100],
                pager: '#pager_pacientes_factura',
                sortname: 'p_ape',
                viewrecords: true,
                sortorder: "asc",
                height: 100,
                shrinkToFit: false,
                width:anchoPan,
                rownumbers: false,
                editurl: 'editaCli.php',
                caption: "Pacientes para Facturar",
                onSelectRow: function (){	
                    
                }
                
            });
            jQuery("#list_pacientes_factura").jqGrid('navGrid','#pager_pacientes_factura',{add:false,edit:false,del:false,search:false,view:true},
            {},//opciones edit
            { }, //opciones add
            {}, //opciones del
            {/* multipleSearch:true,closeAfterSearch: true, closeOnEscape: true */},
            {width:920} //para el view
            );
            jQuery('#list_pacientes_factura').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
           
 
            jQuery("#list_procedimientos_factura").jqGrid({
                url:'facturacion/busca_procedimientos_facturar.jsp?q=2&id=0',
                datatype: "json",
                colNames:['Agenda','CUM','Procedimiento','id_proced','id_contrato','id_paquete','Precio'],
                colModel:[
                    {name:'id_agenda',index:'id_agenda',width:(anchoPan * 0.05),hidden:true,search:true,searchoptions:{sopt:['cn','eq']}},
                    {name:'codigo_maipos',index:'codigo_maipos', width:(anchoPan * 0.05),hidden:false,search:true,searchoptions:{sopt:['cn','eq']}},
                    {name:'descripcion',index:'descripcion', width:(anchoPan * 0.3),search:true,searchoptions:{sopt:['cn','eq']},align:"left"},
                    {name:'id_procedimiento',index:'id_procedimiento', width:(anchoPan * 0.05),hidden:true,search:true, searchoptions:{sopt:['cn','eq']},align:"center"},
                    {name:'id_contrato',index:'id_contrato', width:(anchoPan * 0.05),hidden:true,search:true, searchoptions:{sopt:['cn','eq']},align:"center"},
                    {name:'id_paquete',index:'id_paquete', width:(anchoPan * 0.05),hidden:true,search:true, searchoptions:{sopt:['cn','eq']},align:"center"},
                    {name:'precio',index:'precio', width:(anchoPan * 0.05),hidden:false,search:true, searchoptions:{sopt:['cn','eq']},align:"center"},
                ],
                rowNum:5,
                rowList:[5,10,20,30,100],
                pager: '#pager_procedimientos_factura',
                sortname: 'id_agenda',
                viewrecords: true,
                sortorder: "asc",
                height: 200,
                shrinkToFit: false,
                width:anchoPan/2.03,
                rownumbers: false,
                editurl: 'editaCli.php',
                caption: "Procedimientos para Facturar",
                onSelectRow: function (){	
                    
                }
                
            });
            jQuery("#list_procedimientos_factura").jqGrid('navGrid','#pager_procedimientos_factura',{add:false,edit:false,del:false,search:false,view:true},
            {},//opciones edit
            { }, //opciones add
            {}, //opciones del
            {/* multipleSearch:true,closeAfterSearch: true, closeOnEscape: true */},
            {width:920} //para el view
            );
            jQuery('#list_procedimientos_factura').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
           

            jQuery("#list_medicamentos_factura").jqGrid({
                url:'facturacion/busca_pacientes_facturar.jsp?q=2&id=0',
                datatype: "json",
                colNames:['Documeto','Primer Nombre','Segundo Nombre','Primer Apellido','Segundo Apellido'],
                colModel:[
                    {name:'id_paciente',index:'id_paciente',width:(anchoPan * 0.177),hidden:false,search:true,searchoptions:{sopt:['cn','eq']}},
                    {name:'p_nom',index:'p_nom', width:(anchoPan * 0.2),hidden:false,search:true,searchoptions:{sopt:['cn','eq']}},
                    {name:'s_nom',index:'s_nom', width:(anchoPan * 0.2),search:true,searchoptions:{sopt:['cn','eq']},align:"right"},
                    {name:'p_ape',index:'p_ape', width:(anchoPan * 0.2),search:true, searchoptions:{sopt:['cn','eq']},align:"center"},
                    {name:'s_ape',index:'s_ape', width:(anchoPan * 0.2),search:true, searchoptions:{sopt:['cn','eq']},align:"center"},
                ],
                rowNum:5,
                rowList:[5,10,20,30,100],
                pager: '#pager_medicamentos_factura',
                sortname: 'p_ape',
                viewrecords: true,
                sortorder: "asc",
                height: 200,
                shrinkToFit: false,
                width:anchoPan/2.03,
                rownumbers: false,
                editurl: 'editaCli.php',
                caption: "Medicamentos para Facturar",
                onSelectRow: function (){	
                    
                }
                
            });
            jQuery("#list_medicamentos_factura").jqGrid('navGrid','#pager_medicamentos_factura',{add:false,edit:false,del:false,search:false,view:true},
            {},//opciones edit
            { }, //opciones add
            {}, //opciones del
            {/* multipleSearch:true,closeAfterSearch: true, closeOnEscape: true */},
            {width:920} //para el view
            );
            jQuery('#list_medicamentos_factura').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});
                      
   
             $(function(){
             $("#dia_facturacion").datepicker({
                //inline:true
                showOn:'both',
                buttonImageOnly:true,
                buttonImage:'../imagenes/fotos/calendar.gif',
                firstDay:1,
                changeMonth:true,
                changeYear:true,
                yearRange: "1900:2040"
            });	
            $('#dia_facturacion').datepicker($.datepicker.regional['es']);
            $('#dia_facturacion').datepicker("option","showAnim","slideDown");
            $('#dia_facturacion').datepicker("option","dateFormat","yy-mm-dd");
        });
   
        </script>
    </head>
    <body>
        
        <div style="margin-bottom: 10px">
            <label>Cambiar dia de Facturación: </label>
            <input type="text" name="dia_facturacion" id="dia_facturacion" placeholder="aaaa-mm-dd" onchange="cargar_servicios()">
        </div>
        
        <div style="width: 100%" id="div_facturacion">
            <div>
                <table id="list_pacientes_factura" ></table>
                <div id="pager_pacientes_factura"></div>
            
            </div>
        </div>
        <div>
            <center> <h2>Facturar</h2> </center>
        </div>
        <div style="width: 100%">
            <div style="float: left;width: 49%">
                <table id="list_procedimientos_factura" ></table>
                <div id="pager_procedimientos_factura"></div>
            </div>
            
            <div style="float: left;margin-left: 20px;width: 49%">
                <table id="list_medicamentos_factura" ></table>
                <div id="pager_medicamentos_factura"></div>
            </div>
        </div>
        
                
<!--       <center>
           <h1 style="color:#2779aa;">Facturación automática</h1>
    
        <label>Fecha Inicial:</label>&nbsp;
        <input type="text" id="fechafacti" name="fechafacti" >&nbsp;&nbsp;
        <label>Fecha Final:</label>&nbsp;
        <input type="text" id="fechafactf" name="fechafactf" >
        <br><br>
        <label> Contrato a facturar: </label> &nbsp;
        <select id="contratofac" name="contratofac">
            <option value="0">Seleccione contrato</option>
            <%
                                        String sql="select c.id_contratacion,c.nombre,c.cod_eps,e.nombre,c.f_inicio,c.f_fin from contratacion c,eps e where c.cod_eps=e.ideps and f_fin >= curdate() and activo='1'";
                                        ResultSet resu55=null;
                                        conecta_bd ba = new conecta_bd();
                                        ba.ConectaDb(); 
                                        try{  resu55=ba.consultas(sql);
                                            while (resu55.next()&&resu55!=null) {  
                                                out.print("<option value='"+resu55.getString(1)+"' >"+resu55.getString(2)+" con: "+resu55.getString(3)+"-"+resu55.getString(4)+" de:"+resu55.getString(5)+" a "+resu55.getString(6)+" </option>");
                                                                                }
                                        }                       
                                        catch(SQLException ex){}
                                        catch(Exception exe){}
                                        ba.cierraResultado(resu55); 
                                        ba.cerrar(); 
                                    %>
        </select>        
        <br><br>
        <input type="button" id="aceptarfactu" name="aceptarfactu" value="Aceptar" onclick="facturar();">
       </center>
    -->

</body>
</html>
