<%-- 
    Document   : cont_tem_farma_m
    Created on : 16/03/2013, 05:26:40 PM
    Author     : EMMANUEL
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="pac.conecta_bd"%>
<%@page import="pac.diasMes"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script type="text/javascript" language="javascript">
          
          $('#form_farma_mes').submit(function() {
                       
                           var sela =document.getElementById("mes_tem_f");
                           var valsela=sela.options[sela.selectedIndex].value;                                         
                           if(valsela=="w"){
                                                  alert('Favor seleccione mes');
                                                       return false;      
                                                  }   
                           var selb =document.getElementById("ano_tem_f");
                           var valselb=selb.options[selb.selectedIndex].value;                                         
                           if(valselb=="w"){
                                                  alert('Favor seleccione año');
                                                       return false;      
                                                  } 
                            document.getElementById("ano_tem_f2").value=valselb;   
                            document.getElementById("mes_tem_f2").value=valsela;                   
                    // Enviamos el formulario usando AJAX
                    // alert("dgdfgfdg");
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#farma_mes').html(data);
                                  
                                  $("#mes_tem_f option[value='w']").attr("selected",true);
                                  $("#ano_tem_f option[value='w']").attr("selected",true);
                                  document.getElementById("bot").style.display="block";
                                  //borrar los campos cuando crre
                                }                             
                          })
                     
                          return false;
                      });  
       function imprime_farma_mes(){
               var f1=document.getElementById("ano_tem_f2").value;   
               var f2=document.getElementById("mes_tem_f2").value;
               window.open("recarga_farma_m.jsp?ano_tem_f="+f1+"&mes_tem_f="+f2+"&lt=1");
       }            
            
                      
                      
       </script>
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
            }
                                              
            %>
    <center>  
        <form action="recarga_farma_m.jsp" method="post" id="form_farma_mes" name="form_farma_mes">
        <table border="0">
            <tr>
               
                <td ><center><label>Mes:</label></center></td>
                <td ><center>
                       <select name="mes_tem_f" id="mes_tem_f">
                           <option value="w">Seleccione mes</option>
                           <option value="0">Enero</option>
                           <option value="1">Febrero</option>
                           <option value="2">Marzo</option>
                           <option value="3">Abril</option>
                           <option value="4">Mayo</option>
                           <option value="5">Junio</option>
                           <option value="6">Julio</option>
                           <option value="7">Agosto</option>
                           <option value="8">Septiembre</option>
                           <option value="9">Octubre</option>
                           <option value="10">Nobiembre</option>
                           <option value="11">Diciembre</option>
                       </select>
                     </center>
                </td>
                <td ><center><label>Año:</label></center></td>
                <td >
                     <center>
                           <select name="ano_tem_f" id="ano_tem_f">
                           <option value="w">Seleccione año</option>
                           <%
                           for(int i=2013;i<=2090;i++){
                                    out.println("<option value='"+i+"'>"+i+"</option>");
                                                      }                           
                           %>
                       </select>
                     </center>
                </td>
                <td>
                    <center>
                        <input type="submit" value="generar" name="aceptar" id="aceptar">
                    </center>
                </td>
            </tr>            
        </table>
        </form>  
        <br>        
        <div name="farma_mes" id="farma_mes"></div>  
        <br>
        <div id="bot" style="display:none" >
           <input type="button" value="Imprimir" id="aceptar" onclick="imprime_farma_mes()">
        </div>
        
        <input type="hidden" id="mes_tem_f2" name="mes_tem_f2" value="">  
        <input type="hidden" id="ano_tem_f2" name="ano_tem_f2" value="">         
      </center>  
    </body>
</html>
