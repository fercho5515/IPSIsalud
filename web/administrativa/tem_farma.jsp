<%-- 
    Document   : tem_farma
    Created on : 16/03/2013, 05:21:36 PM
    Author     : EMMANUEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script type="text/javascript" language="javascript">
           function recar(){$("#tabla_todo").load("recarga_farma.jsp");}  
           $('#fguardafarma').submit(function() {
                       
                           var sela =document.getElementById("tempef");
                           var valsela=sela.options[sela.selectedIndex].value;                                         
                           if(valsela=="w"){
                                                  alert('Favor seleccione temperatura');
                                                       return false;      
                                                  }   
                           var selb =document.getElementById("humef");
                           var valselb=selb.options[selb.selectedIndex].value;                                         
                           if(valselb=="w"){
                                                  alert('Favor seleccione dato en humedad');
                                                       return false;      
                                                  }    
                           var selc =document.getElementById("cadff");
                           var valselc=selc.options[selc.selectedIndex].value;                                         
                           if(valselc=="w"){
                                                  alert('Favor seleccione dato en cadena de frio');
                                                       return false;      
                                                  }                            
                    // Enviamos el formulario usando AJAX
                    // alert("dgdfgfdg");
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#resu_temp_farma').html(data);
                                  $("#cadff option[value='w']").attr("selected",true);
                                  $("#tempef option[value='w']").attr("selected",true);
                                  $("#humef option[value='w']").attr("selected",true);
                                  $("#tabla_todo").load("recarga_farma.jsp");
                                  //borrar los campos cuando crre
                                }                             
                          })
                     
                          return false;
                      });  
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
            }%>
    <center>
        <br>
        <form id="fguardafarma" name="fguardafarma" action="guarda_farma.jsp" method="post">
        <table>
            <tr>
                <td rowspan="2" style="padding-right:10px">
                   <center><label>Agregar</label></center>
                </td>
                <td style="padding-left:10px">
                   <center><label>Temperatura</label></center>
                </td> 
                <td>
                    <center><label>Humedad</label></center>
                </td>  
                <td  style="padding-right:10px">
                    <center><label>Cadena frio</label></center>
                </td>  
                <td rowspan="2" style="padding-left:10px">
                 <center>
                    <input type="image" src="../imagenes/fotos/agregar.png" style="width:30px;height:30px" alt="fallo">
                </center>
                </td>  
            </tr>
            <tr>
                 <td>
                     <select id="tempef" name="tempef" style="text-align:center">
                         <option value="w" style="text-align:center">Seleccione temperatura</option>
                         <%
                            for(int i=13;i<=30;i++){
                                 out.print("<option value='"+i+"' style='text-align:center'>"+i+"° C</option>");
                                }
                         %>
                     </select>
                </td> 
                <td>
                    <select id="humef" name="humef">
                         <option value="w" style="text-align:center">Seleccione humedad</option>
                         <%
                            for(int i=61;i<=71;i++){
                                 out.print("<option value='"+i+"' style='text-align:center'>"+i+" %</option>");
                                }
                         %>
                     </select>
                </td>  
                <td>
                    <select id="cadff" name="cadff">
                         <option value="w" style="text-align:center">Seleccione cadena de frio</option>
                         <%
                            for(int i=0;i<=10;i++){
                                 out.print("<option value='"+i+"' style='text-align:center'>"+i+"° C</option>");
                                }
                         %>
                     </select>
                </td>  
            </tr>
        </table>
       </form>              
                     <br>
      <div name="tabla_todo" id="tabla_todo">              
       <table border="1" style="border-radius:15px">
           <tr>
               <td style="text-align:center;padding-left:20px;padding-right:10px;border-radius:15px 0px 0px 0px">
                   <label>Hora:</label>  
               </td>
               <td style="text-align:center;padding-left:10px;padding-right:10px">
                   <label>Temperatura</label>  
               </td>
               <td style="text-align:center;padding-left:10px;padding-right:10px">
                   <label>Humedad Relativa</label>  
               </td>
               <td style="text-align:center;padding-left:10px;padding-right:20px;border-radius:0px 15px 0px 0px">
                   <label>Cadena de Frio</label>  
               </td>
           </tr>    
           <% 
              for(int i=5;i<=19;i++){
               String color="yellow";
               String r1="";
               String r2="";
               int dato=i;
                    if(dato==12){color="blue";} 
               else if(dato>12) {color="blue"; dato=dato-12;}      
                    if(i==19) {r1=";border-radius:0px 0px 0px 15px";r2=";border-radius:0px 0px 15px 0px";}                                                        
                  
               out.print("    <tr>");
               out.print("        <td style='text-align:center"+r1+"'>");
               out.print("            <center><label>"+dato+" - "+(dato+1)+"</label></center>");
               out.print("        </td>");
               out.print("        <td style='text-align:center;background-color:"+color+"' >");
               out.print("            <center><label></label></center>");
               out.print("        </td>");
               out.print("        <td style='text-align:center;background-color:"+color+"' >");
               out.print("            <center><label></label></center>");
               out.print("        </td>");
               out.print("        <td style='text-align:center;background-color:"+color+""+r2+"' >");
               out.print("            <center><label></label></center>");
               out.print("        </td>");
               out.print("    </tr>");
           
              }
           %>
       </table>  
       </div> 
    </center>
       <div id="resu_temp_farma" name="resu_temp_farma"></div>
       <script type="text/javascript" language="javascript">
           recar();
       </script>
    </body>
</html>
