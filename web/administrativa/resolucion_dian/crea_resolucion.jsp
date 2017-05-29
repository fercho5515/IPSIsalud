<%-- 
    Document   : crea_resolucion
    Created on : 27/11/2013, 03:18:12 PM
    Author     : servidor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            	$(function(){
		     $("#fech_resul").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#fech_resul').datepicker($.datepicker.regional['es']);
		     $('#fech_resul').datepicker("option","showAnim","slideDown");
		     $('#fech_resul').datepicker("option","dateFormat","yy-mm-dd");
		     		
	});
        jQuery('#num_resul,#num_resul,#num_ini,#num_fin').keyup(function () {
        this.value = this.value.replace(/[^0-9]/g,'');
        });
        jQuery('#num_resul,#num_resul,#num_ini,#num_fin').blur(function () {
        this.value = this.value.replace(/[^0-9]/g,'');
        });
        jQuery('#num_tifac').keyup(function () { this.value = this.value.replace("'",""); });
        jQuery('#num_tifac').blur(function () { this.value = this.value.replace("'","");  });
        ///////////////////////////////
        ///////////////////////////////
        ///////////////////////////////
        $(document).ready(function(){
         $('#nueva_resu_dian').submit(function() {
                           var num_resul=document.getElementById("num_resul").value;
                           if(num_resul == null ||num_resul.length == 0 || /^\s+$/.test(num_resul)){
                                                      alert('Ingrese el Numero de la Resolución');
                                                       return false; 
                           }
                           else{   //Valida que sea un numero entero sin comas, puntos o espacios pero permite negativos   
                                  var re = /^(-)?[0-9]*$/;
                                  if (!re.test(num_resul)){//si la conversion NO fue realizada con exito
			                            alert("Numero de Resolución no Valido");
			                            return false;
		                                    }
                               }
                           //////////////////////
                           var fech_resul=document.getElementById("fech_resul").value;
                           if(fech_resul == null ||fech_resul.length == 0 || /^\s+$/.test(fech_resul)){
                                                      alert('Ingrese la Fecha de la Resolución');
                                                       return false; 
                           }
                           //////////////////////
                           var num_ini=document.getElementById("num_ini").value;
                           if(num_ini == null ||num_ini.length == 0 || /^\s+$/.test(num_ini)){
                                                      alert('Ingrese el Numero Inicial');
                                                       return false; 
                           }
                           else{   //Valida que sea un numero entero sin comas, puntos o espacios pero permite negativos   
                                  var re = /^(-)?[0-9]*$/;
                                  if (!re.test(num_ini)){//si la conversion NO fue realizada con exito
			                            alert("Numero Inicial no Valido");
			                            return false;
		                                    }
                               }
                           //////////////////////////////    
                           var num_fin=document.getElementById("num_fin").value;
                           if(num_fin == null ||num_fin.length == 0 || /^\s+$/.test(num_fin)){
                                                      alert('Ingrese el Numero Final');
                                                       return false; 
                           }
                           else{   //Valida que sea un numero entero sin comas, puntos o espacios pero permite negativos   
                                  var re = /^(-)?[0-9]*$/;
                                  if (!re.test(num_fin)){//si la conversion NO fue realizada con exito
			                            alert("Numero Final no Valido");
			                            return false;
		                                    }
                               }         
                            //////////////////////
                           var num_tifac=document.getElementById("num_tifac").value;
                           if(num_tifac == null ||num_tifac.length == 0 || /^\s+$/.test(num_tifac)){
                                                      alert('Ingrese Tipo de Factura');
                                                       return false; 
                           }
                           
                               
                           $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              success: function(data) {;
                                  $('#result_nueva_resu').html(data);
                              }
                           })
                          return false;
                      }); 
             });
        </script>
    </head>
    <body>
        <% request.setCharacterEncoding("UTF-8");
      
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
        
                out.print("<br><center><h1>Por favor ingrese adecuadamente</h1></center>");
                out.print("<br><center><a href='../index.jsp'>volver</a></center>");
                out.println("</body></html>");
                return;
            }  
           /*
           int per=Integer.parseInt(""+session.getAttribute("permiso")+"");
           if(per < 7){
                out.print("<br><center><h1>No posee permiso para realizar esta acción</h1></center>");
                out.println("</body></html>");
                return;          
                      }
           */         
         %>
          <center>
              <div id="result_nueva_resu"></div>
              <br><h2>Nueva resolución de la DIAN</h2><br>
              <form id="nueva_resu_dian" name="nueva_resu_dian" method="post" action="resolucion_dian/nueva_resol.jsp" >
              <table>
                  <tr><td><label>Nuero de resolución</label></td><td style="padding-left:20px"><input type="text" id="num_resul" name="num_resul" style="text-align: center"></td>
                      <td style="padding-left:30px"><label>Fecha de resolución</label></td><td style="padding-left:20px"><input type="text" id="fech_resul" name="fech_resul" style="text-align: center" readonly></td></tr>
                  <tr><td><label>Numero inicial</label></td><td style="padding-left:20px"><input type="text" id="num_ini" name="num_ini" style="text-align: center"></td>
                      <td style="padding-left:30px"><label>Numero Final</label></td><td style="padding-left:20px"><input type="text" id="num_fin" name="num_fin" style="text-align: center"></td></tr>
                  <tr><td><label>Tipo Factura</label></td><td style="padding-left:20px" colspan="3"><input type="text" id="num_tifac" name="num_tifac" style="width:99%"></td></tr>
                  <tr><td colspan="4"><center><input type="submit" id="aceptar" name="aceptar" value="Crear" ></center></td></tr>
              </table>
             </form>     
          </center>
    </body>
</html>
