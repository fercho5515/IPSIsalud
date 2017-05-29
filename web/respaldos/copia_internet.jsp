<%-- 
    Document   : copia_internet
    Created on : 26-ago-2013, 9:45:17
    Author     : servidor
--%>


<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" >
         /*   function genera_copia_int(){
                document.getElementById("resu_copia_int").innerHTML="<br><img src='../imagenes/fotos/cargando.gif' alt='cargando'  style='height:200px'>";
                 $("#resu_copia_local").load("../respaldos/comprime_1.jsp");
            }*/
            
    $('#fomr_copi_correo').submit(function() {
                            var correo = document.getElementById("correo_en").value;               
                           if( correo  == null || correo.length == 0 || /^\s+$/.test(correo ) ) {
                                                alert("Correo del cual de envía es obligatorio");  
                                                  return false;  
                                                                      }
                            var correo_c = document.getElementById("correo_en_c").value;               
                           if( correo_c  == null || correo_c.length == 0 || /^\s+$/.test(correo_c) ) {
                                                alert("La clave del correo del cual de envía es obligatorio");  
                                                  return false;  
                                                                      }
                            var correo_de = document.getElementById("correo_de").value;               
                           if( correo_de  == null || correo_de.length == 0 || /^\s+$/.test(correo_de) ) {
                                                alert("Los destinatarios son obligatorios");  
                                                  return false;  
                                                                      }
                                                      
                           
                            var correo_as = document.getElementById("correo_as").value;               
                           if( correo_as  == null || correo_as.length == 0 || /^\s+$/.test(correo_as) ) {
                                                alert("El asunto es obligatorio");  
                                                  return false;  
                                                                      }
                            var correo_me = document.getElementById("correo_me").value;               
                           if( correo_me  == null || correo_me.length == 0 || /^\s+$/.test(correo_me) ) {
                                                alert("El mensaje es obligatorio");  
                                                  return false;  
                                                                      }
            
                           document.getElementById("resu_copia_int").innerHTML="<br><img src='../imagenes/fotos/cargando.gif' alt='cargando'  style='height:100px'>";
               
                    // Enviamos el formulario usando AJAX
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#resu_copia_local').html(data);
                                   document.getElementById("resu_copia_int").innerHTML="";
               
                              }                             
                          })
                     
                          return false;
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
           String per=""+session.getAttribute("permiso");
           if(per.compareTo("10")!=0){
                out.print("<br><center><h1>Solo la gerencia posee permiso para realizar esta acción</h1></center>");
                out.println("</body></html>");
                return;          
          } 
 Calendar cal1 = Calendar.getInstance();
	            String dia=""+cal1.get(Calendar.DATE)+"";
	                   dia=dia.trim();
	            String mes=""+(1+Integer.parseInt(""+cal1.get(Calendar.MONTH)+""))+"";
	                   mes=mes.trim();
	            if(dia.length()==1){dia="0"+dia;} 
	            if(mes.length()==1){mes="0"+mes;} 	      
                  String fecha=""+dia+"-"+mes+"-"+cal1.get(Calendar.YEAR)+"-"+cal1.get(Calendar.HOUR)+"-"+cal1.get(Calendar.MINUTE)+"-"+cal1.get(Calendar.SECOND)+"-"+cal1.get(Calendar.MILLISECOND);
                      
   %>
 <center>
     <br><h2>Copia a correo electronico</h2>
     <form id="fomr_copi_correo" name="fomr_copi_correo" method="post" action="../respaldos/comprime_2.jsp">
         <table style="width:60%">
             <tr><td style="width:100px"><label>Enviado desde:</label></td><td><input type="text" id="correo_en" name="correo_en" style="width:99%" value="emmanuelariasriascos@gmail.com" readonly></td>
                 <td style="width:50px"><label style="padding-left:5px">Clave:</label></td><td style="width:100px"><input type="password" id="correo_en_c" name="correo_en_c" style="width:99%" value="cometa123" readonly></td></tr>
        </table>
         <table style="width:90%">
             <tr><td style="width:65px"><label>Destinatarios:</label></td><td><input type="text" id="correo_de" name="correo_de" style="width:99%"></td></tr>
             <tr><td><label>Asunto:</label></td><td><input type="text" id="correo_as" name="correo_as" style="width:99%" value="copia de seguridad IPS ISALUD TOTAL S.A.S"></td></tr>
             <tr><td><label>Mensaje:</label></td></tr>
             <tr><td colspan="2"><textarea id="correo_me" name="correo_me" rows="6" style="width:99%" readonly> copia de seguridad IPS ISALUD TOTAL S.A.S <% out.print("\n realizada por: "+(String)session.getAttribute("nombre")+" \n "+fecha); %></textarea></td></tr>
         </table>
         <br><input type="submit" value="Enviar copia" id="aceptar" name="aceptar">    

     </form>
     <br><div id="resu_copia_int" name="resu_copia_int"></div>
     
 
 </center>
    </body>
</html>
