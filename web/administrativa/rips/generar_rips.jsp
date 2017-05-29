<%-- 
    Document   : generar_rips
    Created on : 4/12/2013, 12:04:26 PM
    Author     : servidor
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            <%
               Calendar CALENDARIO_GREGORIANO= new GregorianCalendar();
	       String FECHA_DIA=Integer.toString(CALENDARIO_GREGORIANO.get(Calendar.DATE));
	       String FECHA_MES=Integer.toString(CALENDARIO_GREGORIANO.get(Calendar.MONTH));
	       String FECHA_ANO=Integer.toString(CALENDARIO_GREGORIANO.get(Calendar.YEAR));  
               out.print("var hoycpr = new Date("+FECHA_ANO+","+FECHA_MES+","+FECHA_DIA+"); ");
            %>
            $(function(){
		     $("#fecha_inicial_rips").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true,
                            maxDate:hoycpr
		     });	
		     $('#fecha_inicial_rips').datepicker($.datepicker.regional['es']);
		     $('#fecha_inicial_rips').datepicker("option","showAnim","slideDown");
		     $('#fecha_inicial_rips').datepicker("option","dateFormat","yy-mm-dd");
		     		
	});
         $(function(){
		     $("#fecha_final_rips").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true,
                            maxDate:hoycpr
		     });	
		     $('#fecha_final_rips').datepicker($.datepicker.regional['es']);
		     $('#fecha_final_rips').datepicker("option","showAnim","slideDown");
		     $('#fecha_final_rips').datepicker("option","dateFormat","yy-mm-dd");
		     		
	});
   function oculta_img_rips(){
        document.getElementById("fecha_inicial_rips").value="";
        document.getElementById("fecha_final_rips").value="";
        document.getElementById('img_carg_rips').style.display = 'none';} 
    
    function valida_rips(){
                           var contrat=document.getElementById("contrato_arch_rips").value;
                           if(contrat == -1){
                                           alert('Seleccione Contrato');
                                           return false; 
                                          }
                           var fechain=document.getElementById("fecha_inicial_rips").value;
                           if(fechain == null || fechain.length == 0 || /^\s+$/.test(fechain)){
                                           alert('Seleccione Fecha Inicial');
                                           return false; 
                                           }     
                           var fechafi=document.getElementById("fecha_final_rips").value;
                           if(fechafi == null || fechafi.length == 0 || /^\s+$/.test(fechafi)){
                                           alert('Seleccione Fecha Final');
                                           return false; 
                                           } 
                           var ano1=fechain.substring(0,4);
                           var mes1=fechain.substring(5,7);
                           var dia1=fechain.substring(8,10);
                           var fecha1=new Date(ano1,mes1,dia1);
                           
                           var ano2=fechafi.substring(0,4);
                           var mes2=fechafi.substring(5,7);
                           var dia2=fechafi.substring(8,10);
                           var fecha2=new Date(ano2,mes2,dia2);
                          // alert("fecha1 |"+fecha1+"|   fecha2 |"+fecha2+"|");return false;
                           if(fecha1>fecha2){
                                           alert('La fecha final no puede ser anterior a la inicial');
                                           return false; 
                                            }
                                          
                           document.getElementById('img_carg_rips').style.display = 'block';
                           document.getElementById('generando_rips').contentDocument.write("");
        }
 function cambiaPaqInt(){
         var id_cont=document.getElementById("contrato_arch_rips").value;   
         $("#div_paquete_inte").load("rips/paquete_int.jsp?id_cont="+id_cont+"");
        }
        </script>
    </head>
    <body>   <% 
      
           request.setCharacterEncoding("UTF-8");
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="/ISALUD/index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            } %>
            <center>
               <form action="rips/crea_rips.jsp" id="form_rips" name="form_rips" method="post" target="generando_rips" onsubmit="return valida_rips()" ><br><br>
                  <table>
                    <tr>
                        <td colspan="3">
                           <center>
                               <select id="contrato_arch_rips" name="contrato_arch_rips" onchange="cambiaPaqInt()">
                                    <option value="-1">Seleccione un Contrato de la Lista</option>
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
                            </center>  
                        </td>     
                    </tr>
                    <tr>
                        <td colspan="3">
                           <center>
                              <div id="div_paquete_inte"> 
                              <select id="paquet_int_arch_rips" name="paquet_int_arch_rips">
                                    <option value="-1">Seleccione un Paquete de la Lista</option>
                              </select>
                              </div>     
                            </center>  
                        </td>     
                    </tr>  
                    <tr>
                        <td><center><label>Fecha Inicial</label></center></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td><center><label>Fecha Final</label></center></td>
                    </tr>
                    <tr>
                        <td><center><input type="text" id="fecha_inicial_rips" name="fecha_inicial_rips" style="text-align: center"></center></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td><center><input type="text" id="fecha_final_rips" name="fecha_final_rips" style="text-align: center"></center></td>
                    </tr>
                    <tr>
                        <td colspan="3"><center><input type="submit" value="Generar" id="aceptar"></center></td>
                    </tr>
                </table>
                </form>   
                <br><br>
                <div id='img_carg_rips' name='img_carg_rips' style="display:none"> <input type='image' id='fo' src='/ISALUD/imagenes/fotos/cargando.gif' alt='cargando'  onerror="this.src='../imagenes/fotos/cargando.gif'" >  </div>
                <iframe onload="oculta_img_rips()" id="generando_rips" name="generando_rips" src="" style="border-width:0px;width:90%;height:300px"></iframe>
            </center>
    </body>
</html>
