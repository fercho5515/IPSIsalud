<%-- 
    Document   : crea_eps
    Created on : 28-ago-2013, 12:19:33
    Author     : servidor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
        
    $('#form_nueva_epss').submit(function() {
                           var cod = document.getElementById("codigo_eps").value;               
                           if( cod  == null || cod.length == 0 || /^\s+$/.test(cod) ) {
                                                alert("El codigo de la eps obligatorio");  
                                                  return false;  
                                                                      }
                           else if(cod.length>99){alert("El código de la EPS tiene como máximo 99 caracteres");
                                             return false; } 
               
                            var nom = document.getElementById("nombre_eps").value;               
                           if( nom == null || nom.length == 0 || /^\s+$/.test(nom) ) {
                                                alert("El nombre de la eps obligatorio");  
                                                  return false;  
                                                                      }
                           else if(nom.length>399){alert("El nombre de la EPS tiene como máximo 399 caracteres"); 
                                              return false; } 
                                                         
                            var nit = document.getElementById("nit_eps").value;     
                           if(nit.length>99){alert("El nit de la EPS tiene como máximo 99 caracteres"); 
                                              return false; } 
                                                                      
                            var dir = document.getElementById("direcc_eps").value;     
                           if(dir.length>399){alert("La dirección de la EPS tiene como máximo 399 caracteres"); 
                                              return false; }  
                                                                      
                            var ciu = document.getElementById("ciudad_eps").value;     
                           if(ciu.length>199){alert("La ciudad de la EPS tiene como máximo 199 caracteres"); 
                                              return false; }  
                                                                      
                            var tel = document.getElementById("telefo_eps").value;     
                           if(tel.length>399){alert("El telefono de la EPS tiene como máximo 399 caracteres"); 
                                              return false; } 
                                                                      
                            var tip = document.getElementById("tipo_eps").value;     
                           if(tip.length>44){alert("El tipo de la EPS tiene como máximo 44 caracteres"); 
                                              return false; } 
                    // Enviamos el formulario usando AJAX
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#resu_nueva_eps').html(data);
                                  setTimeout ('bora_d_n_e()',1000); 
                              }                             
                          })
                     
                          return false;
                      }); 
          function bora_d_n_e(){
              var c_eps=document.getElementById("res_cre_eps").value;
              if(c_eps==1){alert("EPS creada con éxito");
                           document.getElementById("codigo_eps").value="";               
                           document.getElementById("nombre_eps").value="";               
                           document.getElementById("nit_eps").value="";     
                           document.getElementById("direcc_eps").value="";     
                           document.getElementById("ciudad_eps").value="";     
                           document.getElementById("telefo_eps").value="";     
                           document.getElementById("tipo_eps").value="";    
          }
              else{alert("Falla al crear EPS");}
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
           int per=Integer.parseInt(""+session.getAttribute("permiso")+"");
           if(per < 7){
                out.print("<br><center><h1>No posee permiso para realizar esta acción</h1></center>");
                out.println("</body></html>");
                return;          
          }         
         %>
        <center>
            <h2>CREAR EPS</h2>
            <br>
            <div id="resu_nueva_eps" name="resu_nueva_eps"></div>
            <br>
            <form id="form_nueva_epss" name="form_nueva_epss" method="post" action="eps/crear_nueva_eps.jsp"> 
            <table style="width:80%" border="0">
                <tr><td style="width:80px"><label>Codigo:</label></td>
                    <td><input type="text" id="codigo_eps" name="codigo_eps" maxlength="99" style="width:200px"></td>            
                </tr>
            </table>
            <table style="width:80%" border="0">
                <tr><td style="width:80px"><label>Nombre:</label></td><td style="width:60%"><input type="text" id="nombre_eps" name="nombre_eps" maxlength="399" style="width:99%"></td>
                    <td style="width:50px"><label style="padding-left:10px">Nit:</label><td ><input type="text" id="nit_eps" name="nit_eps" maxlength="99" style="width:97%"></td></tr>
                <tr><td ><label>Dirección:</label></td><td colspan="3"><input type="text" id="direcc_eps" name="direcc_eps" maxlength="399" style="width:99%"></td></tr> 
            </table>
            <table style="width:80%">
                <tr><td style="width:80px"><label>Ciudad:</label></td><td><input type="text" id="ciudad_eps" name="ciudad_eps" maxlength="199" style="width:98%"></td>
                    <td style="width:60px"><label style="padding-left:10px">Telefono:</label></td><td><input type="text" id="telefo_eps" name="telefo_eps" maxlength="399" style="width:98%"></td>
                    <td style="width:50px"><label style="padding-left:10px">Tipo:</label></td><td><input type="text" id="tipo_eps" name="tipo_eps" maxlength="44" style="width:98%"></td></tr>
            </table>
             <br> 
             <input type="submit" value="aceptar" id="aceptar" name="aceptar">
             <form>   
        </center>
         
         
    </body>
</html>
