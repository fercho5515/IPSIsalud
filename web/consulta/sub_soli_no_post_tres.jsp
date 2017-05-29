<%-- 
    Document   : sub_soli_no_post_tres
    Created on : 15/11/2013, 09:55:17 AM
    Author     : servidor
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
            
             $('#form_dos_soli_no_pos_tres').submit(function() {
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
                        var r = confirm("Esta seguro de realizar esta solicitud ?");
                        if (r == true)  { }
                        else { return false; }

                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#ifr_remision_nopos_dos').html(data);
                                  setTimeout ('sino_nopos33()',1000); 
                                           }                             
                          })
                     
                          return false;
                      });
        function sino_nopos33(){
                        var resu=document.getElementById("result_form_nopos3").value;
                        if(resu==1){alert("Solicitud creada con éxito");}
                        else{alert("Falla a realizar solicitud");}
                        jQuery("#listSolinoP").jqGrid('setCaption',"Solicitudes de Medicamentos no pos disponibles para reactivar").trigger('reloadGrid');
                        jQuery("#listSolinoP2").jqGrid('setCaption',"Solicitudes de medicamentos no pos realizadas").trigger('reloadGrid');
                        document.getElementById("carga_soli_no_pos_med_gen").innerHTML="";  
                      }     
       function borra_med(numm){
                  
                                document.getElementById("n_omgeneric_"+numm+"").value="";
                                document.getElementById("n_posologia_"+numm+"").value="";
                                document.getElementById("n_presentac_"+numm+"").value="";
                                document.getElementById("n_dosis_dia_"+numm+"").value="";
                                document.getElementById("nn_cantidad_"+numm+"").value="";
                                document.getElementById("n_tiemp_mes_"+numm+"").value="0";
                                document.getElementById("n_re_invima_"+numm+"").value="";
                             
                                }               
        </script>
    </head>
    <body>
<%
   conecta_bd ba = new conecta_bd();
              ba.ConectaDb(); 
   
   String daatics[]=new String[39];
   for(int i=0;i<39;i++){daatics[i]="";}                          
    String id_soli=request.getParameter("id_soli_n_p");          
   String sql0="select diagnostico,resu_enf_act,nom_generico_uno,presen_concen_uno,dosis_fecuencia_uno,nom_generico_dos,presen_concen_dos,dosis_fecuencia_dos,uno,dos,tres,cuatro,cinco,seis,efecto_trata,efecto_secu,tiempo_resp_espe,especialidad,nom_generc_uno,posologia_uno,presentacion_uno,dosis_uno,cantidad_uno,tiempo_uno,reg_invima_uno,nom_generc_dos,posologia_dos,presentacion_dos,dosis_dos,cantidad_dos,tiempo_dos,reg_invima_dos,nom_generc_tres,posologia_tres,presentacion_tres,dosis_tres,cantidad_tres,tiempo_tres,reg_invima_tres from soli_no_post where id_soli_no_post='"+id_soli+"'";
      ResultSet result0=null;
           
          try{  
           result0=ba.consultas(sql0);            
           while (result0.next()&&result0!=null) { 
               if(result0.getString(1)!=null  && result0.getString(1).compareTo("null")!=0 ){daatics[0] =result0.getString(1);}
               if(result0.getString(2)!=null  && result0.getString(2).compareTo("null")!=0 ){daatics[1] =result0.getString(2);}
               if(result0.getString(3)!=null  && result0.getString(3).compareTo("null")!=0 ){daatics[2] =result0.getString(3);}
               if(result0.getString(4)!=null  && result0.getString(4).compareTo("null")!=0 ){daatics[3] =result0.getString(4);}
               if(result0.getString(5)!=null  && result0.getString(5).compareTo("null")!=0 ){daatics[4] =result0.getString(5);}
               if(result0.getString(6)!=null  && result0.getString(6).compareTo("null")!=0 ){daatics[5] =result0.getString(6);}
               if(result0.getString(7)!=null  && result0.getString(7).compareTo("null")!=0 ){daatics[6] =result0.getString(7);}
               if(result0.getString(8)!=null  && result0.getString(8).compareTo("null")!=0 ){daatics[7] =result0.getString(8);}
               if(result0.getString(9)!=null  && result0.getString(9).compareTo("null")!=0 ){daatics[8] =result0.getString(9);}
               if(result0.getString(10)!=null && result0.getString(10).compareTo("null")!=0){daatics[9] =result0.getString(10);}
               if(result0.getString(11)!=null && result0.getString(11).compareTo("null")!=0){daatics[10]=result0.getString(11);}
               if(result0.getString(12)!=null && result0.getString(12).compareTo("null")!=0){daatics[11]=result0.getString(12);}
               if(result0.getString(13)!=null && result0.getString(13).compareTo("null")!=0){daatics[12]=result0.getString(13);}
               if(result0.getString(14)!=null && result0.getString(14).compareTo("null")!=0){daatics[13]=result0.getString(14);}
               if(result0.getString(15)!=null && result0.getString(15).compareTo("null")!=0){daatics[14]=result0.getString(15);}
               if(result0.getString(16)!=null && result0.getString(16).compareTo("null")!=0){daatics[15]=result0.getString(16);}
               if(result0.getString(17)!=null && result0.getString(17).compareTo("null")!=0){daatics[16]=result0.getString(17);}
               if(result0.getString(18)!=null && result0.getString(18).compareTo("null")!=0){daatics[17]=result0.getString(18);}
               if(result0.getString(19)!=null && result0.getString(19).compareTo("null")!=0){daatics[18]=result0.getString(19);}
               if(result0.getString(20)!=null && result0.getString(20).compareTo("null")!=0){daatics[19]=result0.getString(20);}
               if(result0.getString(21)!=null && result0.getString(21).compareTo("null")!=0){daatics[20]=result0.getString(21);}
               if(result0.getString(22)!=null && result0.getString(22).compareTo("null")!=0){daatics[21]=result0.getString(22);}
               if(result0.getString(23)!=null && result0.getString(23).compareTo("null")!=0){daatics[22]=result0.getString(23);}
               if(result0.getString(24)!=null && result0.getString(24).compareTo("null")!=0){daatics[23]=result0.getString(24);}
               if(result0.getString(25)!=null && result0.getString(25).compareTo("null")!=0){daatics[24]=result0.getString(25);}
               if(result0.getString(26)!=null && result0.getString(26).compareTo("null")!=0){daatics[25]=result0.getString(26);}
               if(result0.getString(27)!=null && result0.getString(27).compareTo("null")!=0){daatics[26]=result0.getString(27);}
               if(result0.getString(28)!=null && result0.getString(28).compareTo("null")!=0){daatics[27]=result0.getString(28);}
               if(result0.getString(29)!=null && result0.getString(29).compareTo("null")!=0){daatics[28]=result0.getString(29);}
               if(result0.getString(30)!=null && result0.getString(30).compareTo("null")!=0){daatics[29]=result0.getString(30);}
               if(result0.getString(31)!=null && result0.getString(31).compareTo("null")!=0){daatics[30]=result0.getString(31);}
               if(result0.getString(32)!=null && result0.getString(32).compareTo("null")!=0){daatics[31]=result0.getString(32);}
               if(result0.getString(33)!=null && result0.getString(33).compareTo("null")!=0){daatics[32]=result0.getString(33);}
               if(result0.getString(34)!=null && result0.getString(34).compareTo("null")!=0){daatics[33]=result0.getString(34);}
               if(result0.getString(35)!=null && result0.getString(35).compareTo("null")!=0){daatics[34]=result0.getString(35);}
               if(result0.getString(36)!=null && result0.getString(36).compareTo("null")!=0){daatics[35]=result0.getString(36);}
               if(result0.getString(37)!=null && result0.getString(37).compareTo("null")!=0){daatics[36]=result0.getString(37);}
               if(result0.getString(38)!=null && result0.getString(38).compareTo("null")!=0){daatics[37]=result0.getString(38);}
               if(result0.getString(39)!=null && result0.getString(39).compareTo("null")!=0){daatics[38]=result0.getString(39);}
                                               }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        ba.cierraResultado(result0); 
%>        
           <form method="post" id="form_dos_soli_no_pos_tres" name="form_dos_soli_no_pos_tres" action="resolicita_soli_no_pos.jsp">
               <input type="hidden" id="soli_no_pos_origi" name="soli_no_pos_origi" value="<% out.print(id_soli); %>">
        <center>
<br/>
<label name="titulisoli" id="titulisoli">FORMULARIO DE SOLICITUD DE MEDICAMENTOS NO POS-S</label><br/><br/>
<table id="tablap" name="tablap" border="1" style="width:100%">
 <tr><td id="tdp" name="tdp" style="border-radius: 10px 10px 0px 0px;"><label>&nbsp;&nbsp;&nbsp;Diagnostico</label><br/>
         <center>
           <!--
             <select id="diag_solo_no_pos" name="diag_solo_no_pos" style="width:98%">
             <option value="0">Seleccione diagnostico</option>
           -->
           
     <%    String  sql1="SELECT descripcion FROM ips_isalud.sub_cie10 where id_subcie10='"+daatics[0]+"';";
           
           ResultSet result1=null;
           
          try{  
           result1=ba.consultas(sql1);            
           while (result1.next()&&result1!=null) { 
                   out.print("<input type='hidden' id='diag_solo_no_pos' name='diag_solo_no_pos' value='"+daatics[0]+"' >");
                   out.print("<input type='text'  value='"+daatics[0]+"-"+result1.getString(1)+"' style='width:100%' readonly>");                            
                                                 }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        ba.cierraResultado(result1); 
         %>   
         </select></center>
     </td></tr>
 <tr><td id="tdp" name="tdp" style="border-radius: 0px 0px 10px 10px;"><label>&nbsp;&nbsp;&nbsp;Resumen enfermedad actual</label><br/>
 <center>   <textarea style="width:98%" rows="5" name="resu_enf_actual" id="resu_enf_actual" maxlength="499" ><% out.print(daatics[1]); %></textarea></center> 
 </td></tr>
</table>
<br/>

<table id="tablap" name="tablap" border="1" style="width:100%">
<tr><td colspan="4" id="tdp" name="tdp" style="border-radius: 10px 10px 0px 0px;"><center><label>Medicamentos POS-S utilizados previamente para el manejo de esta patología sin obtener respuesta clínica o paraclinica satisfactoria en el término previsto de sus indicadores.</label></center></td></tr>
<tr><td valign="top" id="tdp" name="tdp" style="width:25%"><label>&nbsp;&nbsp;&nbsp;Medicamento del POS-S utilizado</label></td>
    <td valign="top" id="tdp" name="tdp" rowspan="3" style="width:25%;text-align:center"><label>Dosis, freciencia y </label><br/> <label>Duracion del tratamiento</label>
    <textarea style="width:95%" rows="5" name="dos_frec_dur_trat_1"  maxlength="299" id="dos_frec_dur_trat_1"> <% out.print(daatics[4]); %></textarea>
    </td>
    <td valign="top" id="tdp" name="tdp" style="width:25%"><label>&nbsp;&nbsp;&nbsp;Medicamento del POS-S utilizada</label></td>
    <td valign="top" id="tdp" name="tdp" rowspan="3" style="width:25%;text-align:center;border-radius: 0px 0px 10px 0px;"><label>Dosis, freciencia y </label><br/><label>Duracion del tratamiento</label>
    <textarea style="width:95%" rows="5" name="dos_frec_dur_trat_2"  maxlength="299" id="dos_frec_dur_trat_2"> <% out.print(daatics[7]); %></textarea>
    </td></tr>
<tr><td id="tdp" name="tdp">&nbsp;&nbsp;&nbsp;Nombre Generico<br/> <center><input type="text" name="nom_generic_1" id="nom_generic_1" maxlength="299" style="width:95%" value="<% out.print(daatics[2]); %>" /></center></td>
    <td id="tdp" name="tdp">&nbsp;&nbsp;&nbsp;Nombre Generico<br/> <center><input type="text" name="nom_generic_2" id="nom_generic_2" maxlength="299" style="width:95%" value="<% out.print(daatics[5]); %>" /></center></td></tr>
<tr><td id="tdp" name="tdp" style="border-radius: 0px 0px 0px 10px;">&nbsp;&nbsp;&nbsp;Presentación y concentración<br/> <center><input type="text" name="present_y_concent_1"  maxlength="299" id="present_y_concent_1" style="width:95%"  value="<% out.print(daatics[3]); %>"/></center></td>
    <td id="tdp" name="tdp">&nbsp;&nbsp;&nbsp;Presentación y concentración<br/> <center><input type="text" name="present_y_concent_2"  maxlength="299"id="present_y_concent_2" style="width:95%" value="<% out.print(daatics[6]); %>"/></center></td></tr>

</table>
<br/>
<table id="tablap" name="tablap" style="width:100%" border="1">
   <tr><td colspan="9" id="tdp" name="tdp" style="border-radius: 10px 10px 0px 0px;"><center><label>MEDICAMENTOS NO POS-S</label></center></td></tr>
   <tr>
       <td id="tdp" name="tdp" style="width:3%"><center><label></label></center></td>
       <!-- <td id="tdp" name="tdp" style="width:3%"><center><label>No</label></center></td> -->
       <td id="tdp" name="tdp" style="width:22%"><center><label>Nombre Genérico</label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label>Posología</label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label>Presentación</label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label>Dosis / Día</label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label>Cantidad</label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label>Tiempo/Meses</label><br/><label>NO > 3 m</label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label>No. Registro</label><br/><label>INVIA(Opcional)</label></center></td>
   </tr>
   <tr>
       <td id="tdp" name="tdp" style="width:3%"><center><img src="../imagenes/fotos/borrar.png" id="mano" style="width:20px;height:20px" onclick="borra_med('1')"></center></td>
       <!-- <td id="tdp" name="tdp" style="width:3%"><center><label>1</label></center></td> -->
     <td id="tdp" name="tdp" style="width:22%"><center><label><input type="text" name="n_omgeneric_1" maxlength="199" id="n_omgeneric_1" style="width:98%"  value="<% out.print(daatics[18]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" name="n_posologia_1" maxlength="199" id="n_posologia_1" style="width:98%"  value="<% out.print(daatics[19]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" name="n_presentac_1" maxlength="199" id="n_presentac_1" style="width:98%"  value="<% out.print(daatics[20]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" name="n_dosis_dia_1" maxlength="199" id="n_dosis_dia_1" style="width:98%"  value="<% out.print(daatics[21]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" name="nn_cantidad_1" maxlength="199" id="nn_cantidad_1" style="width:98%"  value="<% out.print(daatics[22]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><select name="n_tiemp_mes_1" id="n_tiemp_mes_1" style="width:98%" readonly >
                                                            <option value="0"></option>
                                                            <option value="1" <% if(daatics[23].compareTo("1")==0){out.print("SELECTED");}  %> >1</option>
                                                            <option value="2" <% if(daatics[23].compareTo("2")==0){out.print("SELECTED");}  %> >2</option>
                                                            <option value="3" <% if(daatics[23].compareTo("3")==0){out.print("SELECTED");}  %> >3</option>
                                            </select></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" name="n_re_invima_1" maxlength="199" id="n_re_invima_1" style="width:95%;border-radius: 0px 0px 0px 0px;" value="<% out.print(daatics[24]); %>" readonly /></label></center></td>
   </tr>
   <tr>
       <td id="tdp" name="tdp" style="width:3%"><center><img src="../imagenes/fotos/borrar.png" id="mano" style="width:20px;height:20px" onclick="borra_med('2')"></center></td>
       <!-- <td id="tdp" name="tdp" style="width:3%"><center><label>2</label></center></td> -->
       <td id="tdp" name="tdp" style="width:22%"><center><label><input type="text" name="n_omgeneric_2" maxlength="199" id="n_omgeneric_2" style="width:98%" value="<% out.print(daatics[25]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" name="n_posologia_2" maxlength="199" id="n_posologia_2" style="width:98%" value="<% out.print(daatics[26]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" name="n_presentac_2" maxlength="199" id="n_presentac_2" style="width:98%" value="<% out.print(daatics[27]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" name="n_dosis_dia_2" maxlength="199" id="n_dosis_dia_2" style="width:98%" value="<% out.print(daatics[28]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" name="nn_cantidad_2" maxlength="199" id="nn_cantidad_2" style="width:98%" value="<% out.print(daatics[29]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><select name="n_tiemp_mes_2" id="n_tiemp_mes_2" style="width:98%" >
                                                            <option value="0"></option>
                                                            <option value="1" <% if(daatics[30].compareTo("1")==0){out.print("SELECTED");}  %> >1</option>
                                                            <option value="2" <% if(daatics[30].compareTo("2")==0){out.print("SELECTED");}  %> >2</option>
                                                            <option value="3" <% if(daatics[30].compareTo("3")==0){out.print("SELECTED");}  %> >3</option>
                                            </select></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" name="n_re_invima_2" maxlength="199" id="n_re_invima_2" style="width:95%;border-radius: 0px 0px 0px 0px;" value="<% out.print(daatics[31]); %>" readonly /></label></center></td>
   </tr>
   <tr>
       <td id="tdp" name="tdp" style="width:3%;border-radius: 0px 0px 0px 10px;"><center><img src="../imagenes/fotos/borrar.png" id="mano" style="width:20px;height:20px" onclick="borra_med('3')"></center></td>
       <!-- <td id="tdp" name="tdp" style="width:3%"><center><label>3</label></center></td> -->
       <td id="tdp" name="tdp" style="width:22%"><center><label><input type="text" name="n_omgeneric_3" maxlength="199" id="n_omgeneric_3" style="width:98%" value="<% out.print(daatics[32]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" name="n_posologia_3" maxlength="199" id="n_posologia_3" style="width:98%" value="<% out.print(daatics[33]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" name="n_presentac_3" maxlength="199" id="n_presentac_3" style="width:98%" value="<% out.print(daatics[34]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" name="n_dosis_dia_3" maxlength="199" id="n_dosis_dia_3" style="width:98%" value="<% out.print(daatics[35]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" name="nn_cantidad_3" maxlength="199" id="nn_cantidad_3" style="width:98%" value="<% out.print(daatics[36]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><select name="n_tiemp_mes_3" id="n_tiemp_mes_3" style="width:98%" >
                                                            <option value="0"></option>
                                                            <option value="1" <% if(daatics[37].compareTo("1")==0){out.print("SELECTED");}  %>>1</option>
                                                            <option value="2" <% if(daatics[37].compareTo("2")==0){out.print("SELECTED");}  %>>2</option>
                                                            <option value="3" <% if(daatics[37].compareTo("3")==0){out.print("SELECTED");}  %>>3</option>
                                            </select></label></center></td>
       <td id="tdp" name="tdp" style="width:13%;border-radius: 0px 0px 10px 0px;"><center><label><input type="text" name="n_re_invima_3" maxlength="199" id="n_re_invima_3" style="width:95%;border-radius: 0px 0px 10px 0px;" value="<% out.print(daatics[38]); %>" readonly /></label></center></td>
   </tr>

</table>
<br/>
<table id="tablap" name="tablap" style="width:100%" border="1" >
 <tr>
     <td id="tdp" name="tdp" style="border-radius: 10px 10px 0px 0px;" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>1. Se agotaron todas las posibilidades terapeuticas del manual de medicamentos del POS-S sin obtener respuesta clinica satisfactoria?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="1_soli_no_pos0" name="1_soli_no_pos" <% if(daatics[8].compareTo("0")==0){out.print("checked");}  %>></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="1_soli_no_pos1" name="1_soli_no_pos" <% if(daatics[8].compareTo("1")==0){out.print("checked");}  %>></td>
                                             </tr>
         </table>
     </td >
</tr>
 <tr>
     <td id="tdp" name="tdp" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>2. Se evidencia intolerancia o efectos secundarios con el uso de medicamentos POS-S?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="2_soli_no_pos0" name="2_soli_no_pos" <% if(daatics[9].compareTo("0")==0){out.print("checked");}  %>></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="2_soli_no_pos1" name="2_soli_no_pos" <% if(daatics[9].compareTo("1")==0){out.print("checked");}  %>></td>
                                             </tr>
         </table>
     </td>
</tr>
 <tr>
     <td id="tdp" name="tdp" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>3. Existe riesgo inminente o para la vida y salud del paciente si no se suministra?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="3_soli_no_pos0" name="3_soli_no_pos" <% if(daatics[10].compareTo("0")==0){out.print("checked");}  %>></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="3_soli_no_pos1" name="3_soli_no_pos" <% if(daatics[10].compareTo("1")==0){out.print("checked");}  %>></td>
                                             </tr>
         </table>
     </td>
</tr>

 <tr>
     <td id="tdp" name="tdp" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>4. El medicamento se encuentra debidamente autorizado para su comercializacion y expendio en el pais?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="4_soli_no_pos0" name="4_soli_no_pos" <% if(daatics[11].compareTo("0")==0){out.print("checked");}  %>></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="4_soli_no_pos1" name="4_soli_no_pos" <% if(daatics[11].compareTo("1")==0){out.print("checked");}  %>></td>
                                             </tr>
         </table>
     </td>
</tr>

 <tr>
     <td id="tdp" name="tdp" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>5. Se identifica suficiente evidencia cientifica que apoye la decisión de utilizar en medicamento solicitado?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="5_soli_no_pos0" name="5_soli_no_pos" <% if(daatics[12].compareTo("0")==0){out.print("checked");}  %>></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="5_soli_no_pos1" name="5_soli_no_pos" <% if(daatics[12].compareTo("1")==0){out.print("checked");}  %>></td>
                                             </tr>
         </table>
     </td>
</tr>

 <tr>
     <td id="tdp" name="tdp" style="border-radius: 0px 0px 10px 10px;" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>6. Se trata de continuidad de medicamentos ya arobados por el CTC a pacientes crónicos?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="6_soli_no_pos0" name="6_soli_no_pos" <% if(daatics[13].compareTo("0")==0){out.print("checked");}  %>></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="6_soli_no_pos1" name="6_soli_no_pos" <% if(daatics[13].compareTo("1")==0){out.print("checked");}  %>></td>
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
        <center><textarea style="width:98%" rows="2" name="efecto_deseado" maxlength="299" id="efecto_deseado"> <% out.print(daatics[14]); %></textarea></center> 
        </td>
   </tr>
   <tr>
        <td id="tdp" name="tdp" ><label>&nbsp;&nbsp;&nbsp;Efectos secundarios y posibles riesgos al tratamiento</label><br/>
        <center><textarea style="width:98%" rows="2" name="efectos_secundarios" maxlength="299" id="efectos_secundarios"><% out.print(daatics[15]); %></textarea></center> 
        </td>
   </tr>
   <tr>
        <td id="tdp" name="tdp"  style="border-radius: 0px 0px 10px 10px;" ><label>&nbsp;&nbsp;&nbsp;Tiempo de respuesta esperado</label><br/>
        <center><textarea style="width:98%" rows="2" name="tiempo_respuesta" maxlength="299" id="tiempo_respuesta"><% out.print(daatics[16]); %></textarea></center> 
        </td>
   </tr>

</table>
         <br>
         <input type="submit" value="Solicitar" name="aceptar" style="font-size:22px;width:130px" id="aceptar" >
        </center>
    </form>
    
    
 <div name="ifr_remision_nopos_dos" id="ifr_remision_nopos_dos" style="display:none"></div>
    </body>
</html>
<% ba.cerrar(); %>