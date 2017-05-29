<%-- 
    Document   : form_edita_resolucion
    Created on : 28/11/2013, 09:50:30 PM
    Author     : servidor
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            	$(function(){
		     $("#fech_resul2").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#fech_resul2').datepicker($.datepicker.regional['es']);
		     $('#fech_resul2').datepicker("option","showAnim","slideDown");
		     $('#fech_resul2').datepicker("option","dateFormat","yy-mm-dd");
		     		
	});
        jQuery('#num_resul2,#num_ini2,#num_fin2').keyup(function () {
        this.value = this.value.replace(/[^0-9]/g,'');
        });
        jQuery('#num_resul2,#num_ini2,#num_fin2').blur(function () {
        this.value = this.value.replace(/[^0-9]/g,'');
        });
        jQuery('#num_tifac2').keyup(function () { this.value = this.value.replace("'",""); });
        jQuery('#num_tifac2').blur(function () { this.value = this.value.replace("'","");  });
        ///////////////////////////////
        ///////////////////////////////
        ///////////////////////////////
        $(document).ready(function(){
         $('#nueva_resu_dian2').submit(function() {
                           var num_resul=document.getElementById("num_resul2").value;
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
                           var fech_resul=document.getElementById("fech_resul2").value;
                           if(fech_resul == null ||fech_resul.length == 0 || /^\s+$/.test(fech_resul)){
                                                      alert('Ingrese la Fecha de la Resolución');
                                                       return false; 
                           }
                           //////////////////////
                           var num_ini=document.getElementById("num_ini2").value;
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
                           var num_fin=document.getElementById("num_fin2").value;
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
                           var num_tifac=document.getElementById("num_tifac2").value;
                           if(num_tifac == null ||num_tifac.length == 0 || /^\s+$/.test(num_tifac)){
                                                      alert('Ingrese Tipo de Factura');
                                                       return false; 
                           }
                           
                               
                           $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              success: function(data) {;
                                  $('#result_nueva_resu2').html(data);
                                  setTimeout(function(){recargas_resol_actul()},800);                                  
                              }
                           })
                          return false;
                      }); 
             });
             function recargas_resol_actul(){
                 jQuery("#listRESU").jqGrid('setCaption',"RESOLUCIÓN DIAN ").trigger('reloadGrid');  
                 document.getElementById("result_nueva_resu222").innerHTML="";
             }
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
            String id_resul=request.getParameter("id_par"); 
            String sql="SELECT numero_resolucion,fecha_resolucion,tipo_factura,num_inicial,num_final,estado from resolucion_dian where id_resolucion_dian='"+id_resul+"'";                         
            conecta_bd ba = new conecta_bd();
            ba.ConectaDb();
            String numero_resolucion="";
            String fecha_resolucion="";
            String tipo_factura="";
            String num_inicial="";
            String num_final="";
            String estado="";
           //out.print(sql);
            ResultSet resu2=ba.consultas(sql);
            try{
                while (resu2.next()||resu2!=null) { 
                           if(resu2.getString(1)!=null ){ numero_resolucion=resu2.getString(1);}
                           if(resu2.getString(2)!=null ){ fecha_resolucion=resu2.getString(2);}
                           if(resu2.getString(3)!=null ){ tipo_factura=resu2.getString(3);}
                           if(resu2.getString(4)!=null ){ num_inicial=resu2.getString(4);}
                           if(resu2.getString(5)!=null ){ num_final=resu2.getString(5);}
                           if(resu2.getString(6)!=null ){ estado=resu2.getString(6);}
                                                  }
               }
            catch(SQLException e){}
            catch(Exception ex){}
           ba.cierraResultado(resu2);
           ba.cerrar();
         %>
         
          <center>
              <div id="result_nueva_resu2"></div>
              <div id="result_nueva_resu222">
              <br><h2>Nueva resolución de la DIAN</h2><br>
              <form id="nueva_resu_dian2" name="nueva_resu_dian2" method="post" action="resolucion_dian/edit_resol.jsp" >
                  <input type="hidden" id="id_resolucionn" name="id_resolucionn" value="<% out.print(id_resul); %>" >
                  <table>
                      <tr><td><label>Nuero de resolución</label></td><td style="padding-left:20px"><input type="text" id="num_resul2" name="num_resul2" style="text-align: center" value="<% out.print(numero_resolucion); %>" ></td>
                      <td style="padding-left:30px"><label>Fecha de resolución</label></td><td style="padding-left:20px"><input type="text" id="fech_resul2" name="fech_resul2" style="text-align: center" readonly></td></tr>
                  <tr><td><label>Numero inicial</label></td><td style="padding-left:20px"><input type="text" id="num_ini2" name="num_ini2" style="text-align: center"  value="<% out.print(num_inicial); %>"></td>
                      <td style="padding-left:30px"><label>Numero Final</label></td><td style="padding-left:20px"><input type="text" id="num_fin2" name="num_fin2" style="text-align: center"  value="<% out.print(num_final); %>"></td></tr>
                  <tr><td><label>Tipo Factura</label></td><td style="padding-left:20px" colspan="3"><input type="text" id="num_tifac2" name="num_tifac2" style="width:99%"  value="<% out.print(tipo_factura); %>"></td></tr>
                  <tr><td colspan="4">
                          <% if(estado.compareTo("0")==0){  %>
                                      <center>
                                             <label>Estado:</label>&nbsp;
                                             <select id="estado_resolucionn" name="estado_resolucionn">
                                                 <option value="0" selected>Inactiva</option>
                                                 <option value="1">Activa</option>
                                             </select>
                                      </center>
                          <%    }
                            else{out.print("<input type='hidden' id='estado_resolucionn' name='estado_resolucionn'  value='"+estado+"' >");}
                           %>            
                                     
                      </td>
                  </tr>
                  <tr><td colspan="4"><center><input type="submit" id="aceptar" name="aceptar" value="Actualizar" ></center></td></tr>
              </table>
             </form>   
               </div>            
          </center>
    <script type="text/javascript">
        $("#fech_resul2").val("<% out.print(fecha_resolucion); %>");
    </script>
    </body>
</html>
