<!doctype html>
<html lang="es">
<head>
<meta charset="utf-8"/>
<title>Sin título 1</title>

<script type="text/javascript" language="javascript">

function cambia_c10(){
  var cambiarc10=document.getElementById("cie10").value;
  cambiarc10=cambiarc10.replace(/ /gi,'*');  
  $("#divc10").load("cambia_c10.jsp?dato="+cambiarc10+"");
}

function comprueba_sdiag(){
  var compsd=document.getElementById("subcie10").value;
  compsd=compsd.replace(/ /gi,'*');
  $("#divcomp_sd").load("comprob_sd.jsp?dato="+compsd+"");
}
$('#formsubcie10').submit(function() {
                           var vcie10=document.getElementById("cie10").value;
                           if(vcie10 == null ||vcie10.length == 0 || /^\s+$/.test(vcie10)){
                                                      alert('Codigo Cie10 es obligatorio ');
                                                       return false; 
                           }
                           var vc10=document.getElementById("c10").value;
                           if(vc10 == null ||vc10.length == 0 ||vc10=='Cie10 no Valido' || /^\s+$/.test(vsubcie10)){
                                                      alert('Codigo Cie10 no valido ');
                                                       return false; 
                           }
                           var vsubcie10=document.getElementById("subcie10").value;
                           if(vsubcie10 == null ||vsubcie10.length == 0 || /^\s+$/.test(vsubcie10)){
                                                      alert('Codigo Subcie10 es obligatorio ');
                                                       return false; 
                           }
                                                      
                           pos=vsubcie10.indexOf("*");
                           
                           if(pos>=0){
                               alert('No puedes utiliar * en el codigo cie10');
                               return false;
                           }
                           
                           
                           var vsub_d=document.getElementById("sub_d").value;
                           if(vsub_d == null ||vsub_d.length == 0 ||vsub_d=='existe' || /^\s+$/.test(vsub_d)){
                                                      alert('Codigo Subcie10 repetido');
                                                       return false; 
                           }
                           
                           
                           var x=vcie10.length;
                           var lista = vsubcie10.substring(0, x);
                          
                           if(lista != vcie10 || /^\s+$/.test(vsubcie10)){
                                                      alert('Codigo Subcie10 no compatible');
                                                       return false; 
                           }
                           
                           var vdiagnostico=document.getElementById("diagnostico").value;
                           if(vdiagnostico == null ||vdiagnostico.length == 0 || /^\s+$/.test(vdiagnostico)){
                                                      alert('Diagnostico es obligatorio ');
                                                       return false; 
                           }
                           
                           
                           var vedadmin=document.getElementById("edadmin").value;
                           var vedadmin2=$("input[name='edadmin2']:checked").val();
                           if(vedadmin.length != 0 || /^\s+$/.test(vedadmin)){
                                    var comp = parseInt(vedadmin);
                                    if (isNaN(comp)) {
                                    alert('Edad minima no valida');
                                    return false;
                                    }
                                    else if(comp!=vedadmin || comp.toString()!=vedadmin.toString()){
                                    alert('Edad minima no valida');
                                    return false;
                                    }
                                    if(vedadmin2==0){
                                    alert('Debes escoger una unidad para Edad Minima');
                                    return false;
                                    }
                           }
                            else if(vedadmin.length == 0){
                               if(vedadmin2==1||vedadmin2==2||vedadmin2==3){
                                   alert('Debes escribir una Edad Minima');
                                   return false;
                               }
                           } 
                           
                           var vedadmax=document.getElementById("edadmax").value;
                           var vedadmax2=$("input[name='edadmax2']:checked").val();
                           if(vedadmax.length != 0 || /^\s+$/.test(vedadmax)){
                                    var comp2 = parseInt(vedadmax);
                                    if (isNaN(comp2)) {
                                    alert('Edad maxima no valida');
                                    return false;
                                    }
                                    else if(comp2!=vedadmax || comp2.toString()!=vedadmax.toString()){
                                    alert('Edad maxima no valida');
                                    return false;
                                    }
                                    if(vedadmax2==0){
                                    alert('Debes escoger una unidad para Edad Maxima');
                                    return false;
                                    }
                           }
                           else if(vedadmax.length == 0){
                               if(vedadmax2==1||vedadmax2==2||vedadmax2==3){
                                   alert('Debes escribir una Edad Maxima');
                                   return false;
                               }
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
                      </script>
</head>

<body>

<form id="formsubcie10" name="formsubcie10" method="post" action="insertsubcie10.jsp">
    
<table>
<tr>
<td>
    <fieldset><legend>CIE10</legend> 
        
        <table>
            <tr>
            <td>
            <label>Codigo: </label><input type="text" name="cie10" size="10" id="cie10" maxlength="30" onkeyup="cambia_c10();">
            </td>
            </tr>
            <tr>
            <td>
            <div id="divc10" name="divc10">
            <label>Nombre: </label><input type="text" name="c10" size="100" id="c10" maxlength="388" readonly>
            </div> 
            <br>
            </td>
            </tr>
        </table>
        
    </fieldset>
</td>
</tr>

<tr>
<td>
<label>Codigo SUB-CIE10: </label>
</td>
</tr>

<tr>
<td>
<input type="text" name="subcie10" size="10" id="subcie10" maxlength="30" onkeyup="comprueba_sdiag();">
<div id="divcomp_sd"><input type="text" id="sub_d" name="sub_d" style="display: none"></div>
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
<td>
<label>Sexo:</label>
<label>Masculino</label><input type="radio" id="sexo" name="sexo" value="1">
<label>Femenino</label> <input type="radio" id="sexo" name="sexo" value="2">
<label>Ambos</label>    <input type="radio" id="sexo" name="sexo" value="3" checked>

</td>
</tr>

<tr>
<td>
<label>Edad Minima</label>
<input type="text" size="6" maxlength="6" id="edadmin" name="edadmin">
<label>en:</label>
<input type="radio" id="edadmin2" name="edadmin2" value="0" style="display: none" checked>
<input type="radio" id="edadmin2" name="edadmin2" value="1"><label>semanas</label>
<input type="radio" id="edadmin2" name="edadmin2" value="2"><label>meses</label>
<input type="radio" id="edadmin2" name="edadmin2" value="3"><label>años</label>
</td>
</tr>

<tr>
<td>
<label>Edad Maxima</label>
<input type="text" name="edadmax" size="6" id="edadmax" maxlength="6">
<label>en: </label>
<input type="radio" id="edadmax2" name="edadmax2" value="0" style="display: none" checked>
<input type="radio" id="edadmax2" name="edadmax2" value="1"><label>semanas</label>
<input type="radio" id="edadmax2" name="edadmax2" value="2"><label>meses</label>
<input type="radio" id="edadmax2" name="edadmax2" value="3"><label>años</label>
</td>
</tr>

<tr>
<td style="text-align:left;width:70%">
<input type="submit" value="Guardar" name="aceptar" size="25" id="aceptar" maxlength="30"><br>
</td>
</tr>

</table>
<div id="resucie10" name="resucie10"></div>
</form>
</body>

</html>
