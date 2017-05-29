<%-- 
    Document   : sub_soli_no_post
    Created on : 9/07/2013, 02:49:19 PM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            
             $('#form_uno_soli_no_pos').submit(function() {
                            var dsp = document.getElementById("diag_solo_no_pos").value; 
                            if(dsp == 0 ){alert('Seleccione diagnostico');
                                          document.getElementById("diag_solo_no_pos").focus();
                                          return false;  
                                                                      }
                           var enfa = document.getElementById("resu_enf_actual").value; 
                            
                           if( enfa == null || enfa.length == 0 || /^\s+$/.test(enfa) ) {
                                                     alert('El resumen de la enfermedad actual es obligatoro');
                                                     document.getElementById("resu_enf_actual").focus();
                                                       return false;  
                                                                      }  
                           else if(enfa.length >= 500 ){
                                                     alert('El resumen de la enfermedad actual solo puede tener 499 caracteres');
                                                     document.getElementById("resu_enf_actual").focus();  
                                                       return false;  }
                                                   
                           var ng1 = document.getElementById("nom_generic_1").value; 
                            
                           if( ng1 == null || ng1.length == 0 || /^\s+$/.test(ng1) ) {
                                                     alert('El nombre generico uno es obligatoro');
                                                     document.getElementById("nom_generic_1").focus();
                                                       return false;  
                                                                      }  
                           else if(ng1.length >= 300 ){
                                                     alert('El nombre generico uno solo puede tener 299 caracteres');
                                                     document.getElementById("nom_generic_1").focus();
                                                       return false;  }     
                                                   
                           var nc1 = document.getElementById("present_y_concent_1").value; 
                            
                           if( nc1 == null || nc1.length == 0 || /^\s+$/.test(nc1) ) {
                                                     alert('La presentacion y concentracion son obligatorias');
                                                     document.getElementById("present_y_concent_1").focus();
                                                       return false;  
                                                                      }  
                           else if(nc1.length >= 300 ){
                                                     alert('La presentacion y concentracion solo pueden tener 299 caracteres');
                                                     document.getElementById("present_y_concent_1").focus();
                                                       return false;  } 
                                                   
                           var dfd1 = document.getElementById("dos_frec_dur_trat_1").value; 
                            
                           if( dfd1 == null || dfd1.length == 0 || /^\s+$/.test(dfd1) ) {
                                                     alert('La dosis, frecuencia y duración del tratamiento son obligatorias');
                                                     document.getElementById("dos_frec_dur_trat_1").focus();
                                                       return false;  
                                                                      }  
                           else if(dfd1.length >= 300 ){
                                                     alert('La dosis, frecuencia y duraciónsolo pueden tener 299 caracteres');
                                                     document.getElementById("dos_frec_dur_trat_1").focus();
                                                       return false;  } 
                                                   
                           var ng2 = document.getElementById("nom_generic_2").value; 
                            
                           if( ng2 == null || ng2.length == 0 || /^\s+$/.test(ng2) ) {
                                                     alert('El nombre generico dos es obligatoro');
                                                     document.getElementById("nom_generic_2").focus();
                                                       return false;  
                                                                      }  
                           else if(ng2.length >= 300 ){
                                                     alert('El nombre generico uno solo puede tener 299 caracteres');
                                                     document.getElementById("nom_generic_2").focus();
                                                       return false;  }     
                                                   
                           var nc2 = document.getElementById("present_y_concent_2").value; 
                            
                           if( nc2 == null || nc2.length == 0 || /^\s+$/.test(nc2) ) {
                                                     alert('La presentacion y concentracion son obligatorias');
                                                     document.getElementById("present_y_concent_2").focus();
                                                       return false;  
                                                                      }  
                           else if(nc2.length >= 300 ){
                                                     alert('La presentacion y concentracion solo pueden tener 299 caracteres');
                                                     document.getElementById("present_y_concent_2").focus();
                                                       return false;  } 
                                                   
                           var dfd2 = document.getElementById("dos_frec_dur_trat_2").value; 
                            
                           if( dfd2 == null || dfd2.length == 0 || /^\s+$/.test(dfd2) ) {
                                                     alert('La dosis, frecuencia y duración del tratamiento son obligatorias');
                                                     document.getElementById("dos_frec_dur_trat_2").focus();
                                                       return false;  
                                                                      }  
                           else if(dfd2.length >= 300 ){
                                                     alert('La dosis, frecuencia y duraciónsolo pueden tener 299 caracteres');
                                                     document.getElementById("dos_frec_dur_trat_2").focus();
                                                       return false;  } 
                            ///////////////////////////////////////////////////////////////7
                           var no1 = document.getElementById("n_omgeneric_1").value; 
                            
                           if( no1 == null || no1.length == 0 || /^\s+$/.test(no1) ) {
                                                     alert('El nombre generico es obligatorio');
                                                     document.getElementById("n_omgeneric_1").focus();
                                                       return false;  
                                                                      }  
                           else if(no1.length >= 200 ){
                                                     alert('El nombre generico solo puede tener 199 caracteres');
                                                     document.getElementById("n_omgeneric_1").focus();
                                                       return false;  }  
                                                   
                           var npo1 = document.getElementById("n_posologia_1").value; 
                            
                           if( npo1 == null || npo1.length == 0 || /^\s+$/.test(npo1) ) {
                                                     alert('La posologia es obligatoria');
                                                     document.getElementById("n_posologia_1").focus();
                                                       return false;  
                                                                      }  
                           else if(npo1.length >= 200 ){
                                                     alert('La posologia solo puede tener 199 caracteres');
                                                     document.getElementById("n_posologia_1").focus();
                                                       return false;  } 
                                                   
                           var pre1 = document.getElementById("n_presentac_1").value; 
                            
                           if( pre1 == null || pre1.length == 0 || /^\s+$/.test(pre1) ) {
                                                     alert('La presentación es obligatoria');
                                                     document.getElementById("n_presentac_1").focus();
                                                       return false;  
                                                                      }  
                           else if(pre1.length >= 200 ){
                                                     alert('La presentación solo puede tener 199 caracteres');
                                                     document.getElementById("n_presentac_1").focus();
                                                       return false;  }  
                                                   
                           var dos1 = document.getElementById("n_dosis_dia_1").value; 
                            
                           if( dos1 == null || dos1.length == 0 || /^\s+$/.test(dos1) ) {
                                                     alert('La dosis/dia es obligatoria');
                                                     document.getElementById("n_dosis_dia_1").focus();
                                                       return false;  
                                                                      }  
                           else if(dos1.length >= 200 ){
                                                     alert('La dosis/dia solo puede tener 199 caracteres');
                                                     document.getElementById("n_dosis_dia_1").focus();
                                                       return false;  }   
                                                   
                           var can1 = document.getElementById("nn_cantidad_1").value; 
                            
                           if( can1 == null || can1.length == 0 || /^\s+$/.test(can1) ) {
                                                     alert('La cantidad es obligatoria');
                                                     document.getElementById("nn_cantidad_1").focus();
                                                       return false;  
                                                                      }  
                           else if(can1.length >= 200 ){
                                                     alert('La cantidad solo puede tener 199 caracteres');
                                                     document.getElementById("nn_cantidad_1").focus();
                                                       return false;  }  
                                                   
                           var tie1 = document.getElementById("n_tiemp_mes_1").value; 
                            
                           if( tie1 == 0 ) {
                                                     alert('El tiempo/meses es obligatorio');
                                                     document.getElementById("n_tiemp_mes_1").focus();
                                                       return false;  
                                                                      }  
                           else if(tie1.length >= 200 ){
                                                     alert('El tiempo/meses solo puede tener 199 caracteres');
                                                     document.getElementById("n_tiemp_mes_1").focus();
                                                       return false;  }   
                                                   
                           var no2  = document.getElementById("n_omgeneric_2").value; 
                           var npo2 = document.getElementById("n_posologia_2").value;
                           var pre2 = document.getElementById("n_presentac_2").value; 
                           var dos2 = document.getElementById("n_dosis_dia_2").value; 
                           var can2 = document.getElementById("nn_cantidad_2").value;  
                           var tie2 = document.getElementById("n_tiemp_mes_2").value; 
            if(no2 == null || no2.length == 0 || /^\s+$/.test(no2) ){}
            else{  if( (npo2 == null || npo2.length == 0 || /^\s+$/.test(npo2))|| (pre2 == null || pre2.length == 0 || /^\s+$/.test(pre2))|| (dos2 == null || dos2.length == 0 || /^\s+$/.test(dos2))|| (can2 == null || can2.length == 0 || /^\s+$/.test(can2))|| (tie2 == 0)) {
                                      alert('complete datos de segundo medicamento no POS-S');
                                                     document.getElementById("n_omgeneric_2").focus();
                                                       return false; 
                                      }
            }                
                           var no3  = document.getElementById("n_omgeneric_3").value; 
                           var npo3 = document.getElementById("n_posologia_3").value;
                           var pre3 = document.getElementById("n_presentac_3").value; 
                           var dos3 = document.getElementById("n_dosis_dia_3").value; 
                           var can3 = document.getElementById("nn_cantidad_3").value;  
                           var tie3 = document.getElementById("n_tiemp_mes_3").value; 
            if(no3 == null || no3.length == 0 || /^\s+$/.test(no3) ){}
            else{  if( (npo3 == null || npo3.length == 0 || /^\s+$/.test(npo3))|| (pre3 == null || pre3.length == 0 || /^\s+$/.test(pre3))|| (dos3 == null || dos3.length == 0 || /^\s+$/.test(dos3))|| (can3 == null || can3.length == 0 || /^\s+$/.test(can3))|| (tie3 == 0)) {
                                      alert('complete datos de tercer medicamento no POS-S');
                                                     document.getElementById("n_omgeneric_2").focus();
                                                       return false; 
                                      }
            }  
                     var ck1=$("input[name='1_soli_no_pos']:checked").val();
                           if(ck1==null || (ck1!='0' && ck1!='1')) {alert("Seleccione check numero uno");
                                                                    document.getElementById("1_soli_no_pos0").focus();return false;}
                            var ck2=$("input[name='2_soli_no_pos']:checked").val();
                           if(ck2==null || (ck2!='0' && ck2!='1')) {alert("Seleccione check numero dos");
                                                                    document.getElementById("2_soli_no_pos0").focus();return false;}
                            var ck3=$("input[name='3_soli_no_pos']:checked").val();
                           if(ck3==null || (ck3!='0' && ck3!='1')) {alert("Seleccione check numero tres");
                                                                    document.getElementById("3_soli_no_pos0").focus();return false;}
                            var ck4=$("input[name='4_soli_no_pos']:checked").val();
                           if(ck4==null || (ck4!='0' && ck4!='1')) {alert("Seleccione check numero cuatro");
                                                                    document.getElementById("4_soli_no_pos0").focus();return false;}
                            var ck5=$("input[name='5_soli_no_pos']:checked").val();
                           if(ck5==null || (ck5!='0' && ck5!='1')) {alert("Seleccione check numero cinco");
                                                                    document.getElementById("5_soli_no_pos0").focus();return false;}
                            var ck6=$("input[name='6_soli_no_pos']:checked").val();
                           if(ck6==null || (ck6!='0' && ck6!='1')) {alert("Seleccione check numero seis");
                                                                    document.getElementById("6_soli_no_pos0").focus();return false;}
                           
                           var do1 = document.getElementById("efecto_deseado").value; 
                            
                           if(do1 == null || do1.length == 0 || /^\s+$/.test(do1)) {
                                                     alert('El efecto deseado del tratamiento es obligatorio');
                                                     document.getElementById("efecto_deseado").focus();
                                                       return false;  
                                                                      }  
                           else if(do1.length >= 300 ){
                                                     alert('El efecto deseado del tratamiento solo puede tener 299 caracteres');
                                                     document.getElementById("efecto_deseado").focus();
                                                       return false;  }    
                           var do2 = document.getElementById("efectos_secundarios").value; 
                            
                           if(do2 == null || do2.length == 0 || /^\s+$/.test(do2)) {
                                                     alert('Los efectos secundarios y posibes riesgos son obligatorios');
                                                     document.getElementById("efectos_secundarios").focus();
                                                       return false;  
                                                                      }  
                           else if(do2.length >= 300 ){
                                                     alert('Los efectos secundarios y posibes riesgos solo pueden tener 299 caracteres');
                                                     document.getElementById("efectos_secundarios").focus();
                                                       return false;  }   
                           var do3 = document.getElementById("tiempo_respuesta").value; 
                            
                           if(do3 == null || do3.length == 0 || /^\s+$/.test(do3)) {
                                                     alert('El tiempo de respuesta esperado es obligatorio');
                                                     document.getElementById("tiempo_respuesta").focus();
                                                       return false;  
                                                                      }  
                           else if(do3.length >= 300 ){
                                                     alert('El tiempo de respuesta esperado solo puede tener 299 caracteres');
                                                     document.getElementById("tiempo_respuesta").focus();
                                                       return false;  }              
                    // Enviamos el formulario usando AJAX
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#ifr_remision_nopos').html(data);
                                  setTimeout ('sino_nopos()',400); 
                                           }                             
                          })
                     
                          return false;
                      });
        </script>
    </head>
    <body>
           <form method="post" id="form_uno_soli_no_pos" name="form_uno_soli_no_pos" action="crea_soli_no_post.jsp">
        <center>
<br/>
<label name="titulisoli" id="titulisoli">FORMULARIO DE SOLICITUD DE MEDICAMENTOS NO POS-S</label><br/><br/>
<table id="tablap" name="tablap" border="1" style="width:100%">
 <tr><td id="tdp" name="tdp" style="border-radius: 10px 10px 0px 0px;"><label>&nbsp;&nbsp;&nbsp;Diagnostico</label><br/>
         <center><select id="diag_solo_no_pos" name="diag_solo_no_pos" style="width:98%">
             <option value="0">Seleccione diagnostico</option>
     <%    String  sql1="select imp.id_subcie,sub.descripcion,imp.descrip from sub_cie10 sub,impre_diagno imp where imp.id_subcie=sub.id_subcie10 and id_consulta='"+session.getAttribute("serial_consulta")+"' order by control;";
           conecta_bd ba = new conecta_bd();
           ba.ConectaDb(); 
           ResultSet result1=null;
           
          try{  
           result1=ba.consultas(sql1);            
           while (result1.next()&&result1!=null) { 
                  out.print("<option value='"+result1.getString(1)+"'>"+result1.getString(1)+" - "+result1.getString(2)+"</option>");
                                               }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        ba.cierraResultado(result1); 
         %>   
         </select></center>
     </td></tr>
 <tr><td id="tdp" name="tdp" style="border-radius: 0px 0px 10px 10px;"><label>&nbsp;&nbsp;&nbsp;Resumen enfermedad actual</label><br/>
 <center>   <textarea style="width:98%" rows="5" name="resu_enf_actual" id="resu_enf_actual" maxlength="499"></textarea></center> 
 </td></tr>
</table>
<br/>

<table id="tablap" name="tablap" border="1" style="width:100%">
<tr><td colspan="4" id="tdp" name="tdp" style="border-radius: 10px 10px 0px 0px;"><center><label>Medicamentos POS-S utilizados previamente para el manejo de esta patología sin obtener respuesta clínica o paraclinica satisfactoria en el término previsto de sus indicadores.</label></center></td></tr>
<tr><td valign="top" id="tdp" name="tdp" style="width:25%"><label>&nbsp;&nbsp;&nbsp;Medicamento del POS-S utilizado</label></td>
    <td valign="top" id="tdp" name="tdp" rowspan="3" style="width:25%;text-align:center"><label>Dosis, freciencia y </label><br/> <label>Duracion del tratamiento</label>
    <textarea style="width:95%" rows="5" name="dos_frec_dur_trat_1"  maxlength="299" id="dos_frec_dur_trat_1"></textarea>
    </td>
    <td valign="top" id="tdp" name="tdp" style="width:25%"><label>&nbsp;&nbsp;&nbsp;Medicamento del POS-S utilizada</label></td>
    <td valign="top" id="tdp" name="tdp" rowspan="3" style="width:25%;text-align:center;border-radius: 0px 0px 10px 0px;"><label>Dosis, freciencia y </label><br/><label>Duracion del tratamiento</label>
    <textarea style="width:95%" rows="5" name="dos_frec_dur_trat_2"  maxlength="299" id="dos_frec_dur_trat_2"></textarea>
    </td></tr>
<tr><td id="tdp" name="tdp">&nbsp;&nbsp;&nbsp;Nombre Generico<br/> <center><input type="text" name="nom_generic_1" id="nom_generic_1" maxlength="299" style="width:95%" /></center></td>
    <td id="tdp" name="tdp">&nbsp;&nbsp;&nbsp;Nombre Generico<br/> <center><input type="text" name="nom_generic_2" id="nom_generic_2" maxlength="299" style="width:95%" /></center></td></tr>
<tr><td id="tdp" name="tdp" style="border-radius: 0px 0px 0px 10px;">&nbsp;&nbsp;&nbsp;Presentación y concentración<br/> <center><input type="text" name="present_y_concent_1"  maxlength="299"id="present_y_concent_1" style="width:95%" /></center></td>
    <td id="tdp" name="tdp">&nbsp;&nbsp;&nbsp;Presentación y concentración<br/> <center><input type="text" name="present_y_concent_2"  maxlength="299"id="present_y_concent_2" style="width:95%" /></center></td></tr>

</table>
<br/>
<table id="tablap" name="tablap" style="width:100%" border="1">
   <tr><td colspan="8" id="tdp" name="tdp" style="border-radius: 10px 10px 0px 0px;"><center><label>MEDICAMENTOS NO POS-S</label></center></td></tr>
   <tr>
       <td id="tdp" name="tdp" style="width:3%"><center><label>No</label></center></td>
       <td id="tdp" name="tdp" style="width:22%"><center><label>Nombre Genérico</label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label>Posología</label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label>Presentación</label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label>Dosis / Día</label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label>Cantidad</label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label>Tiempo/Meses</label><br/><label>NO > 3 m</label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label>No. Registro</label><br/><label>INVIA(Opcional)</label></center></td>
   </tr>
   <tr>
       <td id="tdp" name="tdp" style="width:3%"><center><label>1</label></center></td>
     <td id="tdp" name="tdp" style="width:22%"><center><label><input type="text" name="n_omgeneric_1" maxlength="199" id="n_omgeneric_1" style="width:98%" /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" name="n_posologia_1" maxlength="199" id="n_posologia_1" style="width:98%" /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" name="n_presentac_1" maxlength="199" id="n_presentac_1" style="width:98%" /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" name="n_dosis_dia_1" maxlength="199" id="n_dosis_dia_1" style="width:98%" /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" name="nn_cantidad_1" maxlength="199" id="nn_cantidad_1" style="width:98%" /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><select name="n_tiemp_mes_1" id="n_tiemp_mes_1" style="width:98%" >
                                                            <option value="0"></option>
                                                            <option value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                            </select></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" name="n_re_invima_1" maxlength="199" id="n_re_invima_1" style="width:95%;border-radius: 0px 0px 0px 0px;" /></label></center></td>
   </tr>
   <tr>
       <td id="tdp" name="tdp" style="width:3%"><center><label>2</label></center></td>
       <td id="tdp" name="tdp" style="width:22%"><center><label><input type="text" name="n_omgeneric_2" maxlength="199" id="n_omgeneric_2" style="width:98%" /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" name="n_posologia_2" maxlength="199" id="n_posologia_2" style="width:98%" /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" name="n_presentac_2" maxlength="199" id="n_presentac_2" style="width:98%" /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" name="n_dosis_dia_2" maxlength="199" id="n_dosis_dia_2" style="width:98%" /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" name="nn_cantidad_2" maxlength="199" id="nn_cantidad_2" style="width:98%" /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><select name="n_tiemp_mes_2" id="n_tiemp_mes_2" style="width:98%" >
                                                            <option value="0"></option>
                                                            <option value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                            </select></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" name="n_re_invima_2" maxlength="199" id="n_re_invima_2" style="width:95%;border-radius: 0px 0px 0px 0px;" /></label></center></td>
   </tr>
   <tr>
       <td id="tdp" name="tdp" style="width:3%;border-radius: 0px 0px 0px 10px;"><center><label>3</label></center></td>
       <td id="tdp" name="tdp" style="width:22%"><center><label><input type="text" name="n_omgeneric_3" maxlength="199" id="n_omgeneric_3" style="width:98%" /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" name="n_posologia_3" maxlength="199" id="n_posologia_3" style="width:98%" /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" name="n_presentac_3" maxlength="199" id="n_presentac_3" style="width:98%" /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" name="n_dosis_dia_3" maxlength="199" id="n_dosis_dia_3" style="width:98%" /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" name="nn_cantidad_3" maxlength="199" id="nn_cantidad_3" style="width:98%" /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><select name="n_tiemp_mes_3" id="n_tiemp_mes_3" style="width:98%" >
                                                            <option value="0"></option>
                                                            <option value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                            </select></label></center></td>
       <td id="tdp" name="tdp" style="width:13%;border-radius: 0px 0px 10px 0px;"><center><label><input type="text" name="n_re_invima_3" maxlength="199" id="n_re_invima_3" style="width:95%;border-radius: 0px 0px 10px 0px;" /></label></center></td>
   </tr>

</table>
<br/>
<table id="tablap" name="tablap" style="width:100%" border="1" >
 <tr>
     <td id="tdp" name="tdp" style="border-radius: 10px 10px 0px 0px;" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>1. Se agotaron todas las posibilidades terapeuticas del manual de medicamentos del POS-S sin obtener respuesta clinica satisfactoria?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="1_soli_no_pos0" name="1_soli_no_pos"></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="1_soli_no_pos1" name="1_soli_no_pos"></td>
                                             </tr>
         </table>
     </td >
</tr>
 <tr>
     <td id="tdp" name="tdp" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>2. Se evidencia intolerancia o efectos secundarios con el uso de medicamentos POS-S?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="2_soli_no_pos0" name="2_soli_no_pos"></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="2_soli_no_pos1" name="2_soli_no_pos"></td>
                                             </tr>
         </table>
     </td>
</tr>
 <tr>
     <td id="tdp" name="tdp" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>3. Existe riesgo inminente o para la vida y salud del paciente si no se suministra?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="3_soli_no_pos0" name="3_soli_no_pos"></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="3_soli_no_pos1" name="3_soli_no_pos"></td>
                                             </tr>
         </table>
     </td>
</tr>

 <tr>
     <td id="tdp" name="tdp" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>4. El medicamento se encuentra debidamente autorizado para su comercializacion y expendio en el pais?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="4_soli_no_pos0" name="4_soli_no_pos"></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="4_soli_no_pos1" name="4_soli_no_pos"></td>
                                             </tr>
         </table>
     </td>
</tr>

 <tr>
     <td id="tdp" name="tdp" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>5. Se identifica suficiente evidencia cientifica que apoye la decisión de utilizar en medicamento solicitado?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="5_soli_no_pos0" name="5_soli_no_pos"></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="5_soli_no_pos1" name="5_soli_no_pos"></td>
                                             </tr>
         </table>
     </td>
</tr>

 <tr>
     <td id="tdp" name="tdp" style="border-radius: 0px 0px 10px 10px;" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>6. Se trata de continuidad de medicamentos ya arobados por el CTC a pacientes crónicos?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="6_soli_no_pos0" name="6_soli_no_pos"></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="6_soli_no_pos1" name="6_soli_no_pos"></td>
                                             </tr>
         </table>
     </td>
</tr>

</table>
<br/>
<table id="tablap" name="tablap" style="width:100%" border="1">
   <tr><td colspan="8" id="tdp" name="tdp"  style="border-radius: 10px 10px 0px 0px;" ><center><label>INDICACIONES CLARAS DEL TRATAMIENTO CON MEDICAMENTOS NO POS-S</label></center></td></tr>
   <tr>
        <td id="tdp" name="tdp" ><label>&nbsp;&nbsp;&nbsp;Efecto deseado del tratamiento</label><br/>
        <center><textarea style="width:98%" rows="2" name="efecto_deseado" maxlength="299" id="efecto_deseado"></textarea></center> 
        </td>
   </tr>
   <tr>
        <td id="tdp" name="tdp" ><label>&nbsp;&nbsp;&nbsp;Efectos secundarios y posibles riesgos al tratamiento</label><br/>
        <center><textarea style="width:98%" rows="2" name="efectos_secundarios" maxlength="299" id="efectos_secundarios"></textarea></center> 
        </td>
   </tr>
   <tr>
        <td id="tdp" name="tdp"  style="border-radius: 0px 0px 10px 10px;" ><label>&nbsp;&nbsp;&nbsp;Tiempo de respuesta esperado</label><br/>
        <center><textarea style="width:98%" rows="2" name="tiempo_respuesta" maxlength="299" id="tiempo_respuesta"></textarea></center> 
        </td>
   </tr>

</table>
         <br>
         <input type="submit" value="Solicitar" name="aceptar"   style="font-size:22px;width:130px" id="aceptar" ></center>
    </form>
    
    
 <div name="ifr_remision_nopos" id="ifr_remision_nopos" style="display:none"></div>
    </body>
</html>
<%  ba.cerrar(); %>
