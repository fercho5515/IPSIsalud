
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" language="javascript">
                      $('#form_edita_cie10').submit(function() {
                           var vcie10=document.getElementById("nuevo_diag").value;
                           if(vcie10 == null ||vcie10.length == 0 || /^\s+$/.test(vcie10)){
                                                      alert('Nuevo Codigo Cie10 es obligatorio ');
                                                       return false; 
                           }
                           pos=vcie10.indexOf("*");
                           if(pos>=0){
                               alert('No puedes utiliar * en el codigo cie10');
                               return false;
                           }
                           var vdiag=document.getElementById("nuevo_diag").value;
                           if(vdiag == null ||vdiag.length == 0 ||vdiag=='existe' || /^\s+$/.test(vdiag)){
                                                      alert('Codigo Cie10 repetido');
                                                       return false; 
                           }
                           var vdiagnostico=document.getElementById("nuevo_diag2").value;
                           if(vdiagnostico == null ||vdiagnostico.length == 0 || /^\s+$/.test(vdiagnostico)){
                                                      alert('Diagnostico es obligatorio ');
                                                       return false; 
                           }
                           $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              success: function(data) {;
                                  $('#resu_edita_cie10').html(data);
                                  $("#div_edita_confcie10").load("<label>Exito</label>"); 
                              }
                           })
                          return false;
                      }); 
                      function cargar_diagnosticos(){
                      var compd=document.getElementById("comp_diag").value;
                      compd=compd.replace(/ /gi,'*');
                      $("#divedita_diag").load("cargar_edita_diag.jsp?dato="+compd+"");
                      }
    </script>
    </head>
    <body>
        <div id="div_edita_confcie10" name="div_edita_confcie10"></div>
        <form name="form_edita_cie10" id="form_edita_cie10" method="post" action="update_cie10.jsp">
        <table>
            <tr>
                <td>
                    <h2>Editar Diagnostico</h2>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Digite Codigo de Diagnostico:</label>
                    <input type="text" id="comp_diag" name="comp_diag" onkeyup="cargar_diagnosticos();">
                </td>
            </tr>
            <tr>
                <td>
                    <div id="divedita_diag" name="divedita_diag">
                    <label>Nuevo Codigo de Diagnostico:</label>
                    <input type="text" id="nuevo_diag" name="nuevo_diag" readonly>
                    <br>
                    <label>Diagnostico:</label>
                    <input type="text" id="nuevo_diag2" name="nuevo_diag2" size="90" readonly>  
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" id="aceptar" name="aceptar" value="Guardar"> 
                </td>
            </tr>
        </table>
        </form>
        <div id="resu_edita_cie10" name="resu_edita_cie10"></div>
    </body>
</html>
