<%-- 
    Document   : crear_eps
    Created on : 12-abr-2013, 16:33:55
    Author     : Fercho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" language="javascript">
            
            $('#formeps').submit(function() {
                           var veps=document.getElementById("eps").value;
                           if(veps == null ||veps.length == 0 || /^\s+$/.test(veps)){
                                                      alert('Codigo de la EPS es obligatorio ');
                                                       return false; 
                           }
                           var veps1=document.getElementById("eps1").value;
                           if(veps1 == null ||veps1.length == 0 ||veps1=='existe' || /^\s+$/.test(veps1)){
                                                      alert('Codigo de Eps repetido');
                                                       return false; 
                           }
                           var vnomeps=document.getElementById("nomeps").value;
                           if(vnomeps == null ||vnomeps.length == 0 || /^\s+$/.test(vnomeps)){
                                                      alert('Nombre de la EPS es obligatorio ');
                                                       return false; 
                           }
                           
                           $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              success: function(data) {;
                                  $('#resueps').html(data);
                                  $("#diveps").load("<label>Exito</label>"); 
                              }
                           })
                          return false;
                      }); 
                     
            function comprueba_eps(){
                        var comp_eps=document.getElementById("eps").value;
                         $("#divcomp_eps").load("comprob_eps.jsp?dato="+comp_eps+"");
                        }
         </script>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="diveps" name="diveps"></div>
        <form id="formeps" name="formeps" method="post" action="insert_eps.jsp">
        <table>
            <tr>
                <td>
                    <h2>EPS</h2>
                </td>
                <td></td>
            </tr>
            <tr>
                <td style="text-align: right"><label>Codigo EPS:</td>
                <td></label><input type="text" id="eps" name="eps" maxlength="98" size="20" onkeyup="comprueba_eps();">
                <div id="divcomp_eps" name="divcomp_eps">
                    <input type="text" name="eps1" id="eps1" style="display: none" value="noexiste" readonly>
                </div></td>
            </tr>
            <tr>
                <td style="text-align: right"><label>Nombre EPS:</label></td>
                <td><input type="text" id="nomeps" name="nomeps" maxlength="398" size="80"></td>
            </tr>
            <tr>
                <td style="text-align: right"><label>Nit:</label></td>
                <td><input type="text" id="nit" name="nit" maxlength="98" size="20"></td>
            </tr>
            <tr>
                <td style="text-align: right"><label>Direccion EPS:</label></td>
                <td><input type="text" id="direccion" name="direccion" maxlength="398" size="50"></td>
            </tr>
            <tr>
                <td style="text-align: right"><label>Ciudad EPS:</label></td>
                <td><input type="text" id="ciudad" name="ciudad" maxlength="198" size="50"></td>
            </tr>
            <tr>
                <td style="text-align: right"><label>Telefono EPS:</label></td>
                <td><input type="text" id="telefono" name="telefono" maxlength="398" size="15"></td>
            </tr>
            <tr>
                <td style="text-align: right"><label>Tipo EPS:</label></td>
                <td><input type="text" id="tipo" name="tipo" maxlength="198" size="50"></td>
            </tr>
            <tr>
                <td style="text-align: center"><input type="submit" id="aceptar" name="aceptar" value="Guardar"></td>
                <td></td>
            </tr>
        </table>
        </form>
        <div id="resueps" name="resueps"></div>
    </body>
</html>
