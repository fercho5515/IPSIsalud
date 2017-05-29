 <!doctype html>
<html lang="es">

<head>
<meta charset="utf-8"/>
<title>Sin título 1</title>
<script type="text/javascript" language="javascript">

$('#formcie10').submit(function() {
                           var vcie10=document.getElementById("cie10").value;
                           if(vcie10 == null ||vcie10.length == 0 || /^\s+$/.test(vcie10)){
                                                      alert('Codigo Cie10 es obligatorio ');
                                                       return false; 
                           }
                           
                           pos=vcie10.indexOf("*");
                           
                           if(pos>=0){
                               alert('No puedes utiliar * en el codigo cie10');
                               return false;
                           }
                           var vdiag=document.getElementById("diag").value;
                           if(vdiag == null ||vdiag.length == 0 ||vdiag=='existe' || /^\s+$/.test(vdiag)){
                                                      alert('Codigo Cie10 repetido');
                                                       return false; 
                           }
                           var vdiagnostico=document.getElementById("diagnostico").value;
                           if(vdiagnostico == null ||vdiagnostico.length == 0 || /^\s+$/.test(vdiagnostico)){
                                                      alert('Diagnostico es obligatorio ');
                                                       return false; 
                           }
                           
                          
                     
                           $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              success: function(data) {;
                                  $('#resucie10').html(data);
                                  $("#divconfcie10").load("<label>Exito</label>"); 
                              }
                           })
                          return false;
                      }); 
                      
                      function comprueba_diag(){
                      var compd=document.getElementById("cie10").value;
                      compd=compd.replace(/ /gi,'*');
                      $("#divcomp_diag").load("comprob_diag.jsp?dato="+compd+"");
                        }
                      
                      </script>



</head>
<body>
<div id="divconfcie10" name="divconfcie10"> </div>
<form id="formcie10" name="formcie10" method="post" action="insertcie10.jsp">
<table>
<tr>
<td>
<h2>Crear Diagnostico</h2>
</td>
</tr>

<tr>
<td>
<label>Codigo CIE10: </label>
</td>
</tr>

<tr>
<td>
<input type="text" name="cie10" size="10" id="cie10" maxlength="30" onkeyup="comprueba_diag();">
<div id="divcomp_diag"><input type="text" id="diag" name="diag" style="display: none"></div>
<br>
</td>
</tr>

<tr>
<td>
<label>Diagnostico: </label>
</td>
</tr>

<tr>
<td>
<input type="text" name="diagnostico" size="80" id="diagnostico" maxlength="150">
<br>
</td>
</tr>

<tr>
<td style="text-align:left;width:70%">
<input type="submit" value="Guardar" name="aceptar" size="25" id="aceptar" maxlength="30"><br>
</td>
</tr>
</table>
</form>
    <div id="resucie10" name="resucie10"></div>
</body>
</html>
