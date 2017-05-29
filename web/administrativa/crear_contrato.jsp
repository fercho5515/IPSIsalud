<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8">

        
<script type="text/javascript" language="javascript">
 $(function() {
     $( "#dialogcc" ).dialog({
      autoOpen: false,
      modal: false,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1200
      }
    });}); 
function enviaf(){
               // 
                   //$('#resuuuuu').html(document.forms.sube_archivo.submit());
             //      $('#sube_archivo').ajaxForm({target:'#resuuuuu'});  
               //     document.forms.sube_archivo.submit(); 
                }
function carga(num){
                     if(num==1){
                                var a=document.getElementById("tab1");
                                    a.style.display="block";
                                var b=document.getElementById("tab2");
                                    b.style.display="none";
                                var c=document.getElementById("tab3");
                                    c.style.display="none";                     
                               }
		             if(num==2){
		                        var a=document.getElementById("tab1");
                                    a.style.display="none";
                                var b=document.getElementById("tab2");
                                    b.style.display="block";
                                var c=document.getElementById("tab3");
                                    c.style.display="none";
		                       }
		             if(num==3){
		                       var a=document.getElementById("tab1");
                                    a.style.display="none";
                                var b=document.getElementById("tab2");
                                    b.style.display="none";
                                var c=document.getElementById("tab3");
                                    c.style.display="block";
		                       }
		           }
 $(function() {
        $( "#tabs22" ).tabs();
    });


 $(function(){
		     $("#fcontratod").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#fcontratod').datepicker($.datepicker.regional['es']);
		     $('#fcontratod').datepicker("option","showAnim","slideDown");
		     $('#fcontratod').datepicker("option","dateFormat","yy-mm-dd");
		});
 $(function(){
		     $("#fcontratoh").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#fcontratoh').datepicker($.datepicker.regional['es']);
		     $('#fcontratoh').datepicker("option","showAnim","slideDown");
		     $('#fcontratoh').datepicker("option","dateFormat","yy-mm-dd");
		});
 
 
            $('#form_crea_contrato').submit(function() {
       
                  var ncont= document.getElementById("nom_cont").value;               
                           if( ncont == null || ncont.length == 0 || /^\s+$/.test(ncont) ) {
                                                      document.getElementById('validacione1').innerHTML = 'Nombre del contrato es obligatorio';
                                                      $("#dialogcc").dialog( "open" );
                                                      return false;  
                                                                      } 
       
                            var noco= document.getElementById("nocontrato").value;               
                           if( noco == null || noco.length == 0 || /^\s+$/.test(noco) ) {
                                                      document.getElementById('validacione1').innerHTML = 'Numero de contrato es obligatorio';
                                                      $("#dialogcc").dialog( "open" );
                                                      return false;  
                                                                      }     
                           var re = /^(-)?[0-9]*$/;
                           var f1= document.getElementById("fcontratod").value;               
                           if( f1 == null || f1.length == 0 || /^\s+$/.test(f1) ) {
                                                      document.getElementById('validacione1').innerHTML = 'Fecha de inicio es obligatoria';
                                                      $("#dialogcc").dialog( "open" );
                                                      return false;  
                                                                      }    
                           var f2= document.getElementById("fcontratoh").value;               
                           if( f2 == null || f2.length == 0 || /^\s+$/.test(f2) ) {
                                                      document.getElementById('validacione1').innerHTML = 'Fecha de fin es obligatoria';
                                                      $("#dialogcc").dialog( "open" );
                                                      return false;  
                                                                      }     
                           var objc= document.getElementById("objetocontrato").value;               
                           if( objc == null || objc.length == 0 || /^\s+$/.test(objc) ) {
                                                      document.getElementById('validacione1').innerHTML = 'Objeto del contrato es obligatorio';
                                                      $("#dialogcc").dialog( "open" );
                                                      return false;  
                                                                      } 
                          var resc= document.getElementById("resumencontrato").value;               
                           if( resc == null || resc.length == 0 || /^\s+$/.test(resc) ) {
                                                      document.getElementById('validacione1').innerHTML = 'Resumen del contrato es obligatorio';
                                                      $("#dialogcc").dialog( "open" );
                                                      return false;  
                                                                      }
                           var modalidad=$("input[name='modalidadcontrato']:checked").val();                              
                          //var modalidad= document.getElementById("modalidadcontrato").value;  
                          if(modalidad=='undefined'||modalidad==null){
                                                document.getElementById('validacione1').innerHTML = 'Seleccione modalidad del contrato';
                                                $("#dialogcc").dialog( "open" );
                                                return false;  
                                                      }
                                                    
                         
                                          
                          var numaf= document.getElementById("numafiliados").value;               
                           if( numaf == null || numaf.length == 0 || /^\s+$/.test(numaf) ) { }     
                           else{
                                 var ree = /^(-)?[0-9]*$/;
                                if (!ree.test(numaf)){//si la conversion NO fue realizada con exito
			                        document.getElementById('validacione1').innerHTML = 'El numero de afiliados debe ser entero';
                                                $("#dialogcc").dialog( "open" );
                                                document.getElementById('numafiliados').value="";
                                                return false;  
                                                   }
                               }
                          var regimen=$("input[name='regimencontrato']:checked").val();          
                          if(regimen=='undefined'||regimen==null){
                                                document.getElementById('validacione1').innerHTML = 'Seleccione regimen del contrato';
                                                $("#dialogcc").dialog( "open" );
                                                return false;  
                                                      }
                 if(modalidad==1||modalidad==3){
                         var vc= document.getElementById("contratovalorcano").value;               
                           if( vc == null || vc.length == 0 || /^\s+$/.test(vc) ) {
                                                 document.getElementById('validacione1').innerHTML = 'El valor capitado año es onligatorio';
                                                $("#dialogcc").dialog( "open" );
                                                return false;  
                                                   }
                          else{
                               var reec = /^(-)?[0-9]*$/;
                               if (!reec.test(vc)){//si la conversion NO fue realizada con exito
			                        document.getElementById('validacione1').innerHTML = 'El valor capitado año debe ser entero';
                                                $("#dialogcc").dialog( "open" );
                                                document.getElementById('numafiliados').value="";
                                                return false;  
                                                   }}
                          vc= document.getElementById("contratovalorcmes").value;               
                           if( vc == null || vc.length == 0 || /^\s+$/.test(vc) ) {
                                                 document.getElementById('validacione1').innerHTML = 'El valor capitado mes es onligatorio';
                                                $("#dialogcc").dialog( "open" );
                                                return false;  
                                                   }
                          else{
                          reec = /^(-)?[0-9]*$/;
                          if (!reec.test(vc)){//si la conversion NO fue realizada con exito
			                        document.getElementById('validacione1').innerHTML = 'El valor capitado mes debe ser entero';
                                                $("#dialogcc").dialog( "open" );
                                                document.getElementById('numafiliados').value="";
                                                return false;  
                                                   }
                                              }
                         vc= document.getElementById("alaraunocontraen").value;               
                           if( vc == null || vc.length == 0 || /^\s+$/.test(vc) ) {
                                                 document.getElementById('validacione1').innerHTML = 'Alarma en es onligatoria';
                                                $("#dialogcc").dialog( "open" );
                                                return false;  
                                                   }
                          else{
                          reec = /^(-)?[0-9]*$/;
                          if (!reec.test(vc)){//si la conversion NO fue realizada con exito
			                        document.getElementById('validacione1').innerHTML = 'El valor de alarma en, debe ser entero';
                                                $("#dialogcc").dialog( "open" );
                                                document.getElementById('numafiliados').value="";
                                                return false;  
                                                   }
                                    }
                           ////////////////////////////////77
                           //////////////////////////////////
                           ///////////////////////////////////
                           ///////////////////////////////////
                           vc= document.getElementById("contratovalorfano").value;               
                           if( vc == null || vc.length == 0 || /^\s+$/.test(vc) ) {
                                                 document.getElementById('validacione1').innerHTML = 'El valor facturado año es onligatorio';
                                                $("#dialogcc").dialog( "open" );
                                                return false;  
                                                   }
                          else{
                               reec = /^(-)?[0-9]*$/;
                               if (!reec.test(vc)){//si la conversion NO fue realizada con exito
			                        document.getElementById('validacione1').innerHTML = 'El valor facturado año debe ser entero';
                                                $("#dialogcc").dialog( "open" );
                                                document.getElementById('numafiliados').value="";
                                                return false;  
                                                   }}
                          vc= document.getElementById("contratovalorfmes").value;               
                           if( vc == null || vc.length == 0 || /^\s+$/.test(vc) ) {
                                                 document.getElementById('validacione1').innerHTML = 'El valor facturado mes es onligatorio';
                                                $("#dialogcc").dialog( "open" );
                                                return false;  
                                                   }
                          else{
                          reec = /^(-)?[0-9]*$/;
                          if (!reec.test(vc)){//si la conversion NO fue realizada con exito
			                        document.getElementById('validacione1').innerHTML = 'El valor facturado mes debe ser entero';
                                                $("#dialogcc").dialog( "open" );
                                                document.getElementById('numafiliados').value="";
                                                return false;  
                                                   }
                                              }
                         vc= document.getElementById("alaradoscontraen").value;               
                           if( vc == null || vc.length == 0 || /^\s+$/.test(vc) ) {
                                                 document.getElementById('validacione1').innerHTML = 'Alarma en es onligatoria';
                                                $("#dialogcc").dialog( "open" );
                                                return false;  
                                                   }
                          else{
                          reec = /^(-)?[0-9]*$/;
                          if (!reec.test(vc)){//si la conversion NO fue realizada con exito
			                        document.getElementById('validacione1').innerHTML = 'El valor de alarma en, debe ser entero';
                                                $("#dialogcc").dialog( "open" );
                                                document.getElementById('numafiliados').value="";
                                                return false;  
                                                   }
                                    }
                          
                        }  
                  
                 var habifa=0; 
                if($("#contrahabifactu").is(':checked')) {   habifa=1;   }                       
                // Enviamos el formulario usando AJAX
                    
                      var jForm = new FormData();
                      jForm.append("nom_cont",document.getElementById("nom_cont").value );
                      jForm.append("ideps",document.getElementById("ideps").value );
                      jForm.append("nocontrato", document.getElementById("nocontrato").value);
                      jForm.append("fcontratod",document.getElementById("fcontratod").value );
                      jForm.append("fcontratoh",document.getElementById("fcontratoh").value);
                      jForm.append("objetocontrato",document.getElementById("objetocontrato").value);
                      jForm.append("resumencontrato",document.getElementById("resumencontrato").value );
                      jForm.append("modalidadcontrato",$("input[name='modalidadcontrato']:checked").val() );
                      jForm.append("numafiliados",document.getElementById("numafiliados").value);
                      jForm.append("regimencontrato",$("input[name='regimencontrato']:checked").val());
                      jForm.append("contratovalorcano",document.getElementById("contratovalorcano").value);
                      jForm.append("contratovalorcmes",document.getElementById("contratovalorcmes").value );
                      jForm.append("alaraunocontraen", document.getElementById("alaraunocontraen").value);
                      jForm.append("contratovalorfano",document.getElementById("contratovalorfano").value );
                      jForm.append("contratovalorfmes",document.getElementById("contratovalorfmes").value );
                      jForm.append("alaradoscontraen",document.getElementById("alaradoscontraen").value );
                      jForm.append("porcentajeupc",document.getElementById("porcentajeupc").value );
                      jForm.append("contrahabifactu", habifa );
                      jForm.append("file", $('#file').get(0).files[0]); 
                      
                      
                  
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
                                                         alert(data.msj);
                                },
                                error: function (xhr, ajaxOptions, thrownError) {    alert("Falla al crear contrato");}                               
                            });  
                            return false;
                    
            });    
function validacreacont(){
       
                                    
                           
                      } 

function respuesta(){
                     document.getElementById("nom_cont").value="";               
                     document.getElementById("nocontrato").value="";               
                     document.getElementById("fcontratod").value="";               
                     document.getElementById("fcontratoh").value="";               
                     document.getElementById("objetocontrato").value="";               
                     document.getElementById("resumencontrato").value="";                                               
                   //document.form_crea_contrato.modalidadcontrato.checked=false;                
                     document.getElementById("numafiliados").value="";
                     document.getElementById("porcentajeupc").value="";
                   //document.form_crea_contrato.regimencontrato.checked=false;                 
                     document.getElementById("contratovalorcano").value="";               
                     document.getElementById("contratovalorcmes").value="";               
                     document.getElementById("alaraunocontraen").value="";               
                     document.getElementById("contratovalorfano").value="";               
                     document.getElementById("contratovalorfmes").value="";               
                     document.getElementById("alaradoscontraen").value="";               
                     document.getElementById("file").value="";    
 }
    
                     
</script>
<title>Sin título 1</title>
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
     <center>        
     <iframe onload="respuesta()" id="upload_target" name="upload_target" src="" style="border-width:0px;width:90%;height:30px">
     </iframe>
     </center>      
     <!--onsubmit="return validacreacont();" -->
    <form name="form_crea_contrato" id="form_crea_contrato" target="upload_target" action="nuevo_contrato.jsp" method="post"  enctype="multipart/form-data" > 
        <table style="width:100%"><tr><td style="text-align:left">
        <table >
             <tr>
                  <td ><label>Nombre Contrato</label></td>
                  <td><input type="text" id="nom_cont" name="nom_cont" maxlength="250" style="width: 100%"></td>
             </tr>
             <tr>
                  <td><label>EPS Contratante</label></td>
                  <td>
                       <select  id="ideps" name="ideps" >                     
                        <%
                            conecta_bd ba = new conecta_bd();
                            ba.ConectaDb(); 

                            String sql="select ideps,nombre from eps order by nombre;";

                             ResultSet resu=null;
                             try{  resu=ba.consultas(sql);
                                   while (resu.next()&&resu!=null) {  
                                        out.print("<option value='"+resu.getString(1)+"'>"+resu.getString(2)+"</option>");
                                                                    }
                                 }                       
                             catch(SQLException ex){}
                             catch(Exception exe){}
                             ba.cierraResultado(resu);  
                        %>                       
                      </select>
                  </td>
             </tr>
        </table>
       </td>
       <td style="text-align:right"><center><input type="submit" value="guardar" id="aceptar" ></center> </td>
       </tr>
       </table> 
       
    
            
        <br><br>
  		<div id="tabs22">
				    <ul>
				    <li><a href="#tab1" onclick="carga(1)">Datos Generales</a></li>
				    <li><a href="#tab2" onclick="carga(2)">Clase Contrato</a></li>
				    <li><a href="#tab3" onclick="carga(3)">Monto Contratación</a></li>
				  </ul>
				  
				  <div id="tab1">
				            <fieldset>
				                     <table>
				                            <tr>
				                                <td style="padding-top:8px;" valign="middle">
				                                    <fieldset style="height:40px"> 
				                                               <table  style="padding-top:8px;" >
												                     <tr><td>No. Contrato:</td><td><input type="text" name="nocontrato" id="nocontrato"></td></tr>
												               </table>
												    </fieldset>
				                                </td>
				                                 <td>
				                                    <fieldset> 
				                                           <legend>Vigencia</legend>    
				                                               <table>
												                     <tr>
                                                                                                                         <td>Desde</td><td><input type="text" name="fcontratod" id="fcontratod" readonly>&nbsp;</td>
												                         <td>Hasta</td><td><input type="text" name="fcontratoh" id="fcontratoh" readonly></td>
												                     </tr>
												               </table>
												    </fieldset>
				                                </td>
				                            </tr>
				                     </table>				            
				            </fieldset><br>
				            <fieldset>
				                     <table style="width:100%">
				                            <tr>
				                                <td>Objeto del Contrato:</td>
				                            </tr>
				                            <tr>    
				                                <td style="width:100%">
                                                                    <textarea name="objetocontrato" id="objetocontrato" style="width:100%" rows="3" ></textarea>
				                                </td>
				                            </tr>
				                            <tr>
				                                <td>Resumen del Contrato:</td>
				                            </tr>
				                            <tr>    
				                                <td style="width:100%">
				                                  <textarea name="resumencontrato" id="resumencontrato" style="width:100%" rows="8"></textarea>
				                                </td>
				                            </tr>
  
				                     </table>				            
				            </fieldset>	 <br>
                                            <input type="checkbox" name="contrahabifactu" id="contrahabifactu" checked="checked">Contrato Habilitado Para Facturación<br>  				            	  
				  </div>
				  
				  <div id="tab2" style="display:none">
				       <table style="width:100%">
				              <tr>
				                  <td  style="width:50%;height:100%">
				                     <fieldset  style="height:120px">
				                     <legend>Modalidad</legend>
				                              <br>
				                            <center><br>
				                             <table>
				                                    <tr>
                                                                        <td><input type="radio" name="modalidadcontrato" id="modalidadcontrato" value="1"></td><td>Capacitación&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				                                        <td><input type="radio" name="modalidadcontrato" id="modalidadcontrato" value="2"></td><td>Evento&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				                                        <td><input type="radio" name="modalidadcontrato" id="modalidadcontrato" value="3"></td><td>Mixto</td>
			                                        </tr>
			                                        
				                             </table>
				                             </center>
				                             <br>
				                     </fieldset>
				                  </td>				                     
				                  <td style="padding-top:10px;width:50%;height:60px" >
				                     <fieldset style="height:100%">
				                        <table style="width:100%;height:100%">
				                               <tr>
				                                   <td style="width:18%">No. Afiliados:</td>
				                                   <td style="width:32%"><input type="text" name="numafiliados" id="numafiliados"></td>
                                                   <td style="width:10%">&nbsp;&nbsp;&nbsp;%UPC:</td>
				                                   <td style="width:40%"><input type="text" name="porcentajeupc" id="porcentajeupc"></td>
				                               </tr>
				                        </table>
				                     </fieldset>
				                  </td>
				              </tr>

				              <tr>
				                  <td colspan="2">
				                         <fieldset>
					                     <legend>Régimen</legend>
					                      <center>
					                      <table>
					                            <tr>
                                                                        <%
                                                                        
                                                                             sql="select id_tipo_usuario,descripcion from tipo_usuario;";

                                                                             ResultSet resu2=null;
                                                                             try{  resu2=ba.consultas(sql);
                                                                                   while (resu2.next()&&resu2!=null) {  
                                                                                       out.print("<td><input type='radio' name='regimencontrato' id='regimencontrato' value='"+resu2.getString(1)+"'></td>");
					                                               out.print("<td>"+resu2.getString(2)+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>");
                                                                                                                    }
                                                                                 }                       
                                                                             catch(SQLException ex){}
                                                                             catch(Exception exe){}
                                                                             ba.cierraResultado(resu2);  
                                                                        %>  
					                               
					                            </tr>
					                      </table>
					                      </center>
					                     </fieldset>
				                  </td>
				              </tr>
				       </table>          			  
				  </div>
				  
                  <div id="tab3" style="display:none">
                  <fieldset>
                    <center>
                      <table>
                              <tr>
                                 <td>Vr. Capitado año:</td><td>Vr. Capitado mes:</td><td>Alarma en:</td>
                              </tr>
                              <tr>   
                                 <td><input type="text" name="contratovalorcano" id="contratovalorcano" style="text-align:center">
                                 </td>
                                 <td><input type="text" name="contratovalorcmes" id="contratovalorcmes" style="text-align:center">
                                 </td>
                                 <td><input type="text" name="alaraunocontraen" id="alaraunocontraen" style="text-align:center">
                                 </td>
                              </tr> 
                              <tr>  
                                 <td>Vr. Facturado año:</td><td>Vr. Facturado mes:</td><td>Alarma en:</td>
                              </tr>
                              <tr>   
                                 <td><input type="text" name="contratovalorfano" id="contratovalorfano" style="text-align:center">
                                 </td>
                                 <td><input type="text" name="contratovalorfmes" id="contratovalorfmes" style="text-align:center">
                                 </td>
                                 <td><input type="text" name="alaradoscontraen" id="alaradoscontraen" style="text-align:center">
                                 </td>
                             </tr> 
                      </table>
                    </center>
                  </fieldset>
				  </div>
				  
			  
		</div><br>
                <br>
            <input type="file" name="file" id="file"> 
</form>
                                                                        
       
             <div id="resu_crea_cont">
                    <input type='hidden' name='id_cont' id='id_cont'>
                    <input type='hidden' name='nombre_arc' id='nombre_arc'>
                    <input type='hidden' name='fallo' id='fallo'>
              </div>     


<div id="resuuuuu" name="resuuuuu"></div>
<div id="dialogcc" title="Advertencia!!!" >
     <center><p id="validacione1" name="validacione1" style="color: red"></p></center>    
</div> 

            
<% ba.cerrar(); %>  



</body>

</html>
