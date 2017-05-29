<%-- 
    Document   : medicamentos_no_pos_solisitado
    Created on : 12/08/2013, 08:35:21 PM
    Author     : Emmanuel
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
        <script type="text/javascript">
            var datojs="";
            function cambia_estado_soli(dato){
                datojs=dato; 
                var valhi=$("#id_soli_no_post_hi").val();                
                $("#id_soli_np").val(valhi);
             
                var d = document.getElementById("estado"+dato+"").value;
                  
                if(d==1){ 
                             apprise("¿Está seguro de rechazar la solicitud de medicamento no POS?", {'verify':true}, function(opcion) {
                                                            if(opcion) {                                                                      
                                                                      $("#resu_soli_no_postd").load("modif_estado_soli_no_post.jsp?id_soli_np="+valhi+"&dato="+dato+"&nuevoe=1");
                                                                       setTimeout (function(){ mesjre('r',dato); }, 1100); 
                                                                        }
                                                            else{$("#estado"+dato+"").val("0");}            
                                                           }); 
                     
                           ///   setTimeout(mesjre('r',dato),6000);
                         }
                 else if(d==2){
                               $("#estado"+dato+"").val("0");
                               $("#seriar_medic").val("");
                                $("#nuevoe").val("2");
                                $("#dato").val(datojs);
                                $("#datos_medicina").val(""); 
                                $("#fechai_medicnp").val("");
                                $("#fechaf_medicnp").val("");
                                $("#archivo_apro_mnp").val("");
                                jQuery("#list_mednp").jqGrid('setCaption',"Medicamentos").trigger('reloadGrid');
                               $( "#si_apobado_med" ).dialog( "open" );
                         }      
                         
                }
         function respuesta_slnp(){
                        
                                setTimeout (function(){
                                    var resu=frames.resu_soli_no_postd2.document.getElementById("resu_soli_d2").value;
                                                     if(resu==1){
                                                                     $("#estado"+datojs+"").val("2");
                                                                     $("#estado"+datojs+"").attr("disabled", "disabled");
                                                                     alert("Solicitud de medicamentos no POS aprobada con éxito");
                                                                  } 
                                                        else if(resu==0){
                                                                     alert("Falla al aprobar solicitud de medicamento no POS");
                                                                   } 
                                } , 800); }
         function mesjre(r,dato){
                               var resu=document.getElementById("resu_soli_d").value;
                                 if(resu==1){
                                                  $("#estado"+dato+"").val("1");
                                                  $("#estado"+dato+"").attr("disabled", "disabled");
                                             if(r=='r'){alert("Solicitud de medicamentos no POS rechazada con éxito");}
                                            } 
                                 else if(resu==0){
                                             if(r=='r'){alert("Falla al rechazar solicitud de medicamento no POS");}
                                            }           
                          // $("#estado1").attr("disabled", "disabled");
                                } 
                   
         $(document).ready(function(){
      
    jQuery("#list_mednp").jqGrid({
   	url:'carga_medicamentos_no_pos.jsp?sln=<% out.print(""+request.getParameter("id_soli_no_pos")+""); %>',
	datatype: "json",
    // select DISTINCT m.serial,m.producto,,m.cod_tres,v.descripcion,f.descripcion,m.concentracion,u.descripcion from medicamentos m,forma_farmaceutica f,via_admin v,unidad_medida u where m.forma_farmaceutica=f.id_forma_farmaceutica and m.via_administracion=v.id_via_admin and m.unidad_medida=u.id_unidad_medida
        colNames:['serial','Descripción','Via Administración','Forma Farmacéutica','Concentración'],
   	colModel:[
                {name:'id',index:'id',hidden:true,width:0,editable: false,required : true,editoptions:{maxlength: 63}},
   		{name:'producto',index:'producto', width:440,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'descripcion',index:'d0', width:130,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'f',index:'d1', width:130,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   		{name:'d2',index:'d2', width:130,search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
   	 ],
   	rowNum:6,
   	rowList:[6,10,20,30],
   	pager: '#pager_mednp',
   	sortname: 'm.producto',
        viewrecords: true,
        sortorder: "asc",
        height:139,
        width:865,
        shrinkToFit: false,//columnas tamaño dato
        rownumbers: false,
        editurl: 'editaCli.php',
	caption: "Medicamentos",
	ondblClickRow: function(id){ 
                                    var ret = jQuery("#list_mednp").jqGrid('getRowData',id);
                               //   alert(""+ret.producto+" "+ret.descripcion+" "+ret.f+" "+ret.d2+""); 
                                    $("#seriar_medic").val(id);
                                    $("#datos_medicina").val(""+ret.producto+" "+ret.descripcion+" "+ret.f+" "+ret.d2+"");
                                    
                                    //aca el ajax
                             $.ajax({
                                    type: 'GET',
                                    url: "entregamedicamentos/cargatarifarios_para_medicamento.jsp?idmed="+id, 
                                    dataType: 'html',
                                    success: function(data) {
                                         $('#select_tarifario').empty();
                                         $('#select_tarifario').append(data);
                                            },
                                      error: function (xhr, ajaxOptions, thrownError) { }  
                                  });
                              }	
});

  
          jQuery("#list_mednp").jqGrid('navGrid','#pager_mednp',{add:false,edit:false,del:false,search:false,view:false},
                             {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
							{closeAfterAdd: true, closeOnEscape: true,afterSubmit: function(){   } }, //opciones add
							{}, //opciones del
 							{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
 							{width:420} //para el view
 			);
              
        jQuery('#list_mednp').jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false});                        


 });
 
 
 // function valida_sube_soli_np(){
  $('#form_medic_np').submit(function() {
                             var codmed=document.getElementById("seriar_medic").value; 
     var datos_medi=document.getElementById("datos_medicina").value;
     var datos_tari=document.getElementById("select_tarifario").value;
   
    if( codmed == null || codmed.length == 0 || /^\s+$/.test(codmed) ) {
                         alert("Primero seleccione medicamento a asignar");
                         return false;  
                                                                      }  
                                                                      
   else if( datos_medi == null || datos_medi.length == 0 || /^\s+$/.test(datos_medi) ) {
                         alert("Primero seleccione medicamento a asignar");
                         return false;  
                                                                      }  
   else if( datos_tari == null || datos_tari == 0  ) {
                         alert("Seleccione un tarifario");
                         return false;  
   }
         
    var f1=document.getElementById("fechai_medicnp").value;
    var f2=document.getElementById("fechaf_medicnp").value;
      if( f1 == null || f1.length == 0 || /^\s+$/.test(f1) ) {
                         alert("Primero seleccione fecha uno?");
                         return false;  
                                                             } 
      if( f2 == null || f2.length == 0 || /^\s+$/.test(f2) ) {
                         alert("Primero seleccione fecha dos?");
                         return false;  
                                                              } 
                                                                      
      if (Date.parse(f1) >= Date.parse(f2)) {
                                            alert("La segunda fecha debe ser posterior a la primera");
                                            return false;
                                            }
       
 /*     apprise("¿Está seguro de aprobar la solicitud de medicamento no POS?", {'verify':true}, function(opcion) {
          if(opcion) { */
       var statusConfirm = confirm("¿Está seguro de aprobar la solicitud de medicamento no POS?");
if (statusConfirm == true)
{
       
                      $( "#si_apobado_med" ).dialog( "close" );
                                            
                      
                      var jForm = new FormData();
                      jForm.append("id_soli_np", $('#id_soli_np').val());
                      jForm.append("seriar_medic", $('#seriar_medic').val());
                      jForm.append("nuevoe", $('#nuevoe').val());
                      jForm.append("dato", $('#dato').val());
                      jForm.append("datos_medicina", $('#datos_medicina').val());
                      jForm.append("select_tarifario", $('#select_tarifario').val());
                      jForm.append("fechai_medicnp", $('#fechai_medicnp').val());
                      jForm.append("fechaf_medicnp", $('#fechaf_medicnp').val());
                      jForm.append("archivo_apro_mnp", $('#archivo_apro_mnp').get(0).files[0]); 
                      
                      
                  
                       $.ajax({                   
                                url: $(this).attr('action'),
                                data:jForm,
                                type: "POST",
                                mimeType: "multipart/form-data",
                                contentType: false,
                                cache: false,
                                processData: false,                                
                                dataType: "json",
                                success: function(data) {
                                        if(data.res==1){
                                                    $("#estado"+datojs+"").val("2");
                                                    $("#estado"+datojs+"").attr("disabled", "disabled");
                                                    alert("Solicitud de medicamentos no POS aprobada con éxito");
                                                   } 
                                        else{
                                                    alert("Falla al aprobar solicitud de medicamento no POS ");
                                                   } 
                                },
                                error: function (xhr, ajaxOptions, thrownError) {    alert("Falla al aprobar solicitud de medicamento no POS");}                               
                            });  
                            return false;
                    //  setTimeout (function(){ mesjre('a',datojs); }, 1100);
                     }
         else{return false;}            
                                              //             }); 
                          
                     
                      }); 


 
  //dialog  
  $(function() {
     $( "#si_apobado_med" ).dialog({
      autoOpen: false,
      modal: false,
      width:'900',
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1200
      }
    });}); 
 $(function(){
		     $("#fechai_medicnp").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#fechai_medicnp').datepicker($.datepicker.regional['es']);
		     $('#fechai_medicnp').datepicker("option","showAnim","slideDown");
		     $('#fechai_medicnp').datepicker("option","dateFormat","yy-mm-dd");
		     		
	});
 $(function(){
		     $("#fechaf_medicnp").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#fechaf_medicnp').datepicker($.datepicker.regional['es']);
		     $('#fechaf_medicnp').datepicker("option","showAnim","slideDown");
		     $('#fechaf_medicnp').datepicker("option","dateFormat","yy-mm-dd");
		     		
	});        
        </script>
    </head>
    <body>
         <% 
                    request.setCharacterEncoding("UTF-8");
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null ){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp" >volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            } 
        %>
        <h2>Medicamentos no POS solicitados</h2>
        <br>
        <center>
        <% 
          String sql="select concat(nom_generc_uno,' ',presentacion_uno) as n1,estado_m1,concat(nom_generc_dos,' ',presentacion_dos) as n2,estado_m2,concat(nom_generc_tres,' ',presentacion_tres) as n3,estado_m3 from soli_no_post where id_soli_no_post='"+request.getParameter("id_soli_no_pos")+"'";
         
          
   conecta_bd ba = new conecta_bd();
              ba.ConectaDb(); 
                          
     ResultSet result0=null;
           
          try{  
           result0=ba.consultas(sql); 
           int c=1;                     
           while (result0.next()&&result0!=null) { 
                        if(result0.getString(1)!=null  && result0.getString(1).compareTo("null")!=0 ){
                             out.print("<table><tr><td>");
                            out.print("<label>"+result0.getString(1)+"</label></td><td style='padding-left:20px'>");
                            String d1="";
                            if(result0.getString(2)!=null && (result0.getString(2).compareTo("1")==0 || result0.getString(2).compareTo("2")==0)){d1=" disabled='disabled' ";}
                            out.print("<select id='estado1' name='estado1' "+d1+" onchange='cambia_estado_soli(1)'> ");

                            out.print("     <option value='0' >Sin revisar</option>");

                            if(result0.getString(2)!=null && result0.getString(2).compareTo("1")==0){out.print("<option value='1' SELECTED>Rechazado</option>");}
                            else{out.print("<option value='1'>Rechazado</option>");}

                            if(result0.getString(2)!=null && result0.getString(2).compareTo("2")==0){out.print("<option value='2' SELECTED>Aprobado</option>");}
                            else{out.print("<option value='2'>Aprobado</option>");}

                            out.print("</select></td><td>");  
                if(result0.getString(2)!=null && result0.getString(2).compareTo("2")==0){
                     out.print("<a href='muestra_arch_soli_mnp.jsp?id_soli_no="+request.getParameter("id_soli_no_pos")+"&id_num_med=1' target='_blank'>ver archivo</a>");
                                                                                        }
                                                                
                             out.print("</td></tr>");
                   //-------------------------------------------------------------------------
                   if(result0.getString(3)!= null || result0.getString(3).length() <= 0 ){
                            out.print("<tr><td>");
                           out.print("<label>"+result0.getString(3)+"</label></td><td style='padding-left:20px'>");
                               String d2="";
                           if(result0.getString(4)!=null && (result0.getString(4).compareTo("1")==0 || result0.getString(4).compareTo("2")==0)){d2=" disabled='disabled' ";}
                           out.print("<select id='estado2' name='estado2' "+d2+" onchange='cambia_estado_soli(2)'> ");

                           out.print("     <option value='0' >Sin revisar</option>");

                           if(result0.getString(4)!=null && result0.getString(4).compareTo("1")==0){out.print("<option value='1' SELECTED>Rechazado</option>");}
                           else{out.print("<option value='1'>Rechazado</option>");}

                           if(result0.getString(4)!=null && result0.getString(4).compareTo("2")==0){out.print("<option value='2' SELECTED>Aprobado</option>");}
                           else{out.print("<option value='2'>Aprobado</option>");}

                            out.print("</select></td><td>");  
                if(result0.getString(4)!=null && result0.getString(4).compareTo("2")==0){
                     out.print("<a href='muestra_arch_soli_mnp.jsp?id_soli_no="+request.getParameter("id_soli_no_pos")+"&id_num_med=2' target='_blank'>ver archivo</a>");
                                                                                        }
                                                                
                             out.print("</td></tr>");
                   }
                   //-------------------------------------------------------------------------
                   if(result0.getString(5)!= null || result0.getString(5).length() <= 0 ){
                                     
                            out.print("<tr><td>");
                           out.print("<label>"+result0.getString(5)+"</label></td><td style='padding-left:20px'>");
                                String d3="";
                           if(result0.getString(6)!=null && (result0.getString(6).compareTo("1")==0 || result0.getString(6).compareTo("2")==0)){d3=" disabled='disabled' ";}
                           out.print("<select id='estado3' name='estado3' "+d3+" onchange='cambia_estado_soli(3)'> ");


                           out.print("     <option value='0' >Sin revisar</option>");

                           if(result0.getString(6)!=null && result0.getString(6).compareTo("1")==0){out.print("<option value='1' SELECTED>Rechazado</option>");}
                           else{out.print("<option value='1'>Rechazado</option>");}

                           if(result0.getString(6)!=null && result0.getString(6).compareTo("2")==0){out.print("<option value='2' SELECTED>Aprobado</option>");}
                           else{out.print("<option value='2'>Aprobado</option>");}

                            out.print("</select></td><td>");  
                if(result0.getString(6)!=null && result0.getString(6).compareTo("2")==0){
                     out.print("<a href='muestra_arch_soli_mnp.jsp?id_soli_no="+request.getParameter("id_soli_no_pos")+"&id_num_med=3' target='_blank'>ver archivo</a>");
                                                                                        }
                                                                
                             out.print("</td></tr>");                                                                     
                           out.print("</table>");
                                     }
                                                                                         }
                                               }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        ba.cierraResultado(result0); 
         
         ba.cerrar();
        %>
        
        
        
        </center>
        <br>
        <a href="datos_soli_no_pos.jsp?id_soli_no_pos=<% out.print(""+request.getParameter("id_soli_no_pos")+""); %>" target="_blank">ver formulario de solicitud</a>
       
       
        <div name="resu_soli_no_postd" id="resu_soli_no_postd"></div>
        
    
        <div id="si_apobado_med" name="si_apobado_med" title="Aprobación medicamentos no POS">
            <fieldset>
                <form action="modif_estado_soli_no_post2.jsp" method="post" target="resu_soli_no_postd2" id="form_medic_np" name="form_medic_np"  enctype="multipart/form-data">
                <legend>MEDICAMENTO NO POS </legend>
                <br>
                <table id="list_mednp" ></table>
                <div id="pager_mednp"></div>    
                
                <br>
                <input type="hidden" id="id_soli_np" name="id_soli_np" >
                <input type="hidden" id="seriar_medic" name="seriar_medic" >
                <input type="hidden" id="nuevoe" name="nuevoe" value="2" ><!-- para saber nuevo estado -->
                <input type="hidden" id="dato" name="dato" ><!-- para saber que nuemro de medicamento escogio 1,2 o 3 -->
                <label>Medicamento: </label><input type="text" id="datos_medicina" name="datos_medicina" style="width:85%" readonly>
                <br><br>
                <label>Tarifario: </label><select id="select_tarifario" name="select_tarifario" >
                                               <option value="0">Seleccione </option>                        
                                          </select>
                
                <center><br>
                    <h2>Periodo de tratamiento</h2><br>
                    <label>Fecha de inicio:</label>
                    <input type="text" id="fechai_medicnp" name="fechai_medicnp" style="width:70px" readonly>
                    <label style="padding-left:30px">Fecha de fin:</label>
                    <input type="text" id="fechaf_medicnp" name="fechaf_medicnp" style="width:70px" readonly><br><br>
                    <input type="file" name="archivo_apro_mnp" id="archivo_apro_mnp"><br><br>
                    <input type="submit" value="Aceptar" id="aceptar" name="aceptar" ></center>
                 </form>   
            </fieldset>
        </div><br>
        <iframe onload="respuesta_slnp()"  id="resu_soli_no_postd2" name="resu_soli_no_postd2" src="" style="border-width:0px;height:100px;width:100%" >
       
    </body>
</html>
