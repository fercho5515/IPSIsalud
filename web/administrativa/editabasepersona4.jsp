<%-- 
    Document   : editabasepersona4
    Created on : 29/04/2013, 10:36:00 AM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
      
<script type="text/javascript" language="javascript">
        $(function(){
		     $("#calenaci").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#calenaci').datepicker($.datepicker.regional['es']);
		     $('#calenaci').datepicker("option","showAnim","slideDown");
		     $('#calenaci').datepicker("option","dateFormat","yy-mm-dd");
		     		
	});
          $(function(){
		     $("#fec_afiliacion").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#fec_afiliacion').datepicker($.datepicker.regional['es']);
		     $('#fec_afiliacion').datepicker("option","showAnim","slideDown");
		     $('#fec_afiliacion').datepicker("option","dateFormat","yy-mm-dd");
		     		
	}); 
 $("#filef").change(function() {

    var val = $(this).val();

    switch(val.substring(val.lastIndexOf('.') + 1).toLowerCase()){
        case 'gif': case 'jpg': case 'png':
          //  alert("an image");
            break;
        default:
            $(this).val('');
            // error message here
            document.getElementById('validacioneperso').innerHTML = 'no es una imagen valida';
            $("#dialogperso").dialog( "open" ); 
            break;
    }
});   
  function calfecha(){  
                          var hoy=new Date();            
                        //La fecha nos llega en este formato (2013-01-31) 
                          var fecha=""+$("#calenaci").val()+"";
                          array_fecha = fecha.split("-") 
                          var dia=array_fecha[2] 
                          var mes=(array_fecha[1]-1) 
                          var ano=(array_fecha[0]) 
                          var nacio = new Date(ano,mes,dia); 
                          if(hoy<nacio){ 
                                        document.getElementById('validacioneperso').innerHTML = 'la fecha de nacimiento no puede ser posterior a la actual';
                                        $("#dialogperso").dialog( "open" ); 
                                        $("#calenaci").val("");
                                        $("#edad").val("");
                                        return false;
		                          } 
                          $("#divedad").load("edad.jsp?dato="+$("#calenaci").val()+"");  
                       }
   function calfechaafi(){  
                          var hoy=new Date();            
                        //La fecha nos llega en este formato (2013-01-31) 
                          var fecha=""+$("#fec_afiliacion").val()+"";
                          array_fecha = fecha.split("-") 
                          var dia=array_fecha[2] 
                          var mes=(array_fecha[1]-1) 
                          var ano=(array_fecha[0]) 
                          var nacio = new Date(ano,mes,dia); 
                          if(hoy<nacio){ 
                                        document.getElementById('validacionemp').innerHTML = 'la fecha de afiliacion no puede ser posterior a la actual';
                                        $("#dialogcreaemp").dialog( "open" );
                                        $("#fec_afiliacion").val("");
                                        return false;
		                          }  
                         }                             
    function cambiaMuni(){
                          var semuni =document.getElementById("dptoemp");
                          var semuniii=semuni.options[semuni.selectedIndex].value;
                          $("#divmuniemple").load("carga_municipios.jsp?dato="+semuniii);  
                          
                          }        
 
    $(document).ready(function() {
            $('#filef').previewInputFileImage('#previewer');
        });
	//valida tipos de archivo
 $("#filef").change(function() {

    var val = $(this).val();

    switch(val.substring(val.lastIndexOf('.') + 1).toLowerCase()){
        case 'gif': case 'jpg': case 'png':
          //  alert("an image");
            break;
        default:
            $(this).val('');
            // error message here
            document.getElementById('validacioneperso').innerHTML = 'no es una imagen valida';
            $("#dialogperso").dialog( "open" ); 
            break;
    }
});
function cambiaeps(){
                          var ep=document.getElementById("epsemp");
                          var eps=ep.options[ep.selectedIndex].value;
                          var eps2=ep.options[ep.selectedIndex].text;
                          document.getElementById("epsemptext").value=""+eps2;
                       if(eps=="ninguna"){ 
                            $("#ncarnet").val("");
                            $("#fec_afiliacion").val("");
                            $("#tipo_usu").val("");
                            $("#ncarnet").attr("disabled",true);
                            $("#fec_afiliacion").attr("disabled",true);
                            $("#tipo_usu").attr("disabled",true);
                                  }
                       else{
                            $("#ncarnet").removeAttr("disabled");
                            $("#fec_afiliacion").removeAttr("disabled");
                            $("#tipo_usu").removeAttr("disabled");
                           }       
}

</script>   
</head>
 <body>  
     <% request.setCharacterEncoding("UTF-8");
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     <% 
        out.println("</body></html>");
        return;
        }
          conecta_bd ba = new conecta_bd();
          ba.ConectaDb(); 
          
          String serial=request.getParameter("dato");
          String sqpri="select p_nom,s_nom,p_ape,s_ape,fecha_naci,tipo_id,id_person,genero,id_rh,id_muni,barrio,direccion,telefono,email,id_eps,foto from personas where serial='"+serial+"'";
          
          String datos[]=new String[17];
          ResultSet resupri=null;
           try{  resupri=ba.consultas(sqpri);
                 while (resupri.next()&&resupri!=null) {  
                         if(resupri.getString(1)==null || resupri.getString(1).compareTo("null")==0){datos[0]="";}else{ datos[0]=""+resupri.getString(1);}
                         if(resupri.getString(2)==null || resupri.getString(2).compareTo("null")==0){datos[1]="";}else{ datos[1]=""+resupri.getString(2);}
                         if(resupri.getString(3)==null || resupri.getString(3).compareTo("null")==0){datos[2]="";}else{ datos[2]=""+resupri.getString(3);}
                         if(resupri.getString(4)==null || resupri.getString(4).compareTo("null")==0){datos[3]="";}else{ datos[3]=""+resupri.getString(4);}
                         if(resupri.getString(5)==null || resupri.getString(5).compareTo("null")==0){datos[4]="";}else{ datos[4]=""+resupri.getString(5);}
                         if(resupri.getString(6)==null || resupri.getString(6).compareTo("null")==0){datos[5]="";}else{ datos[5]=""+resupri.getString(6);}
                         if(resupri.getString(7)==null || resupri.getString(7).compareTo("null")==0){datos[6]="";}else{ datos[6]=""+resupri.getString(7);}
                         if(resupri.getString(8)==null || resupri.getString(8).compareTo("null")==0){datos[7]="";}else{ datos[7]=""+resupri.getString(8);}
                         if(resupri.getString(9)==null || resupri.getString(9).compareTo("null")==0){datos[8]="";}else{ datos[8]=""+resupri.getString(9);}
                         if(resupri.getString(10)==null || resupri.getString(10).compareTo("null")==0){datos[9]="";}else{ datos[9]=""+resupri.getString(10);}
                         if(resupri.getString(11)==null || resupri.getString(11).compareTo("null")==0){datos[10]="";}else{ datos[10]=""+resupri.getString(11);}
                         if(resupri.getString(12)==null || resupri.getString(12).compareTo("null")==0){datos[11]="";}else{ datos[11]=""+resupri.getString(12);}
                         if(resupri.getString(13)==null || resupri.getString(13).compareTo("null")==0){datos[12]="";}else{ datos[12]=""+resupri.getString(13);}
                         if(resupri.getString(14)==null || resupri.getString(14).compareTo("null")==0){datos[13]="";}else{ datos[13]=""+resupri.getString(14);}
                         if(resupri.getString(15)==null || resupri.getString(15).compareTo("null")==0){datos[14]="";}else{ datos[14]=""+resupri.getString(15);}
                         if(resupri.getString(16)==null || resupri.getString(16).compareTo("null")==0){datos[16]="";}else{ datos[16]=""+resupri.getString(16);}
                         datos[15]="";
                                                  }
              }                       
           catch(SQLException ex){}
           catch(Exception exe){}
           ba.cierraResultado(resupri);  
         
           String depar="select id_depto from municipio where id_muni='"+datos[9]+"'";
            //out.println("sql ==>"+depar);
           ResultSet resupri2=null;
           try{  resupri2=ba.consultas(depar);
                 while (resupri2.next()&&resupri2!=null) {  
                         if(resupri2.getString(1)==null || resupri2.getString(1).compareTo("null")==0){datos[15]="";}else{ datos[15]=""+resupri2.getString(1);}
                                                         }
              }                       
           catch(SQLException ex){}
           catch(Exception exe){}
           ba.cierraResultado(resupri); 
           
     %>         
    <form name="form_edita_pac" id="form_edita_pac" target="upload_target_pac" action="edita_paciente.jsp" method="post"  onsubmit="return validacreapaciente();" enctype="multipart/form-data" >     
      
        <input type="hidden" name="serial_per" id="serial_per" value="<% out.print(serial); %>" >
        <input type="hidden" name="cambia" id="cambia" value="" >
        <input type="hidden" name="cambio_datospe" id="cambio_datospe" value="0" >
        <input type="hidden" name="cambio_datospa" id="cambio_datospa" value="0" >
        
 <table style="width:100%;padding-top:2px" align="center" border="0">
<tr>
<td valign="top">
<fieldset>
<legend>
Datos Personales
</legend>
<table style="width:100%">
<tr>
<td style="width:16%">
<label >Primer Nombre: </label>
</td>
<td style="width:16%">
<label >Segundo Nombre: </label>
</td>
<td style="width:16%">
<label >Primer Apellido: </label>
</td>
<td style="width:16%">
<label >Segundo Apellido: </label>
</td>
<td style="width:16%">
<label >Fecha de Nacimiento </label>
</td>
<td rowspan="6" style="width:20%">
    <img src="../imagenes/fotos/<% out.print(datos[16]); %>" name="previewer" id="previewer" alt="imagen no encontrada" height="150px" width="100%"  onerror="this.src='../imagenes/fotos/paciente.png'">

</td>
</tr>

<!--------2da Fila------------>

<tr>
<td style="width:16%">
<input type="text" name="nombre1" size="16" id="nombre1" maxlength="74" style="width:90%" value="<% out.print(datos[0]); %>" onkeyup="quita()">
<input type="hidden" name="nombre1ant" id="nombre1ant" value="<% out.print(datos[0]); %>">
</td>
<td style="width:16%">
<input type="text" name="nombre2" size="16" id="nombre2" maxlength="74" style="width:90%" value="<% out.print(datos[1]); %>"  >
<input type="hidden" name="nombre2ant" id="nombre2ant" value="<% out.print(datos[1]); %>">
</td>
<td style="width:16%">
<input type="text" name="apellido1" size="16" id="apellido1" maxlength="74" style="width:90%" value="<% out.print(datos[2]); %>" onkeyup="quita()">
<input type="hidden" name="apellido1ant" id="apellido1ant" value="<% out.print(datos[2]); %>">
</td>
<td style="width:16%">
<input type="text" name="apellido2" size="16" id="apellido2" maxlength="74" style="width:90%" value="<% out.print(datos[3]); %>"  >
<input type="hidden" name="apellido2ant" id="apellido2ant" value="<% out.print(datos[3]); %>">
</td>
<td style="width:16%">
    <input type="text" id="calenaci" name="calenaci" style="width:70%" onchange="calfecha()" readonly>
    <input type="hidden" name="calenaciant" id="calenaciant" value="<% out.print(datos[4]); %>">
</td>
</tr>

<!----------3ra fila--------------->

<tr>
<td style="width:16%">
<label for="edad">Edad: </label>
</td>
<td style="width:16%">
<label for="tipoid">Tipo de Identificacion: </label>
</td>
<td style="width:16%">
<label for="id">Identificacion: </label>
</td>
<td style="width:16%">
<label for="sexo">Sexo: </label>
</td>
<td style="width:16%">
<label for="rh">RH: </label>
</td>
</tr>

<!-----------4ta fila-------------->

<tr>
<td style="width:16%">
<div id="divedad" name="divedad" style="width:90%">    
<input type="text" name="edad" size="13" id="edad" maxlength="30" readonly  style="width:100%">
</div>
</td>
<td style="width:16%">
<select name="tipoid" size="1" id="tipoid" style="width:90%">
                      <% String tipid="";
                         String sql="select idtipo_id,descripcion from tipo_id;";

                             ResultSet resu=null;
                             try{  resu=ba.consultas(sql);
                                   while (resu.next()&&resu!=null) { 
                                        if(datos[5].compareTo(resu.getString(1))==0){out.print("<option value='"+resu.getString(1)+"' SELECTED>"+resu.getString(2)+"</option>");tipid=""+resu.getString(2);}                                       
                                                                                else{out.print("<option value='"+resu.getString(1)+"'>"+resu.getString(2)+"</option>");}
                                                                    }
                                 }                       
                             catch(SQLException ex){}
                             catch(Exception exe){}
                             ba.cierraResultado(resu);  
                        %>   
</select>
<input type="hidden" name="tipoidant" id="tipoidant" value="<% out.print(tipid); %>">
</td>
<td style="width:16%">
    <input type="text" name="id" size="16" id="id" maxlength="64" style="width:90%"  onkeyup="quita()" value="<% out.print(datos[6]); %>">
    <input type="hidden" name="idant" id="idant" value="<% out.print(datos[6]); %>">
</td>
<td style="width:16%">
<select  name="sexo" size="1" id="sexo" style="width:90%">
    <% // System.out.print("datos7 "+datos[7]+" ");
       if(datos[7].compareTo("Masculino")==0){
                                             out.print("<option value='Masculino' SELECTED>Masculino</option>");
                                             out.print("<option  value='Femenino'>Femenino</option>"); 
                                              }
                                          else{
                                             out.print("<option value='Masculino'>Masculino</option>");
                                             out.print("<option  value='Femenino' SELECTED>Femenino</option>"); 
                                              }               
     %>
    
        
</select>
<input type="hidden" name="sexoant" id="sexoant" value="<% out.print(datos[7]); %>">     
</td>
<td style="width:16%">
<select id="rh" name="rh" style="width:40%;text-align:right" style="width:90%">
                      <%     String rhh="";
                             String sql2="select id_rh,descripcion from rh;";

                             ResultSet resu2=null;
                             try{  resu2=ba.consultas(sql2);
                                   while (resu2.next()&&resu2!=null) {  
                                       if(datos[8].compareTo(resu2.getString(1))==0){ out.print("<option value='"+resu2.getString(1)+"' SELECTED>"+resu2.getString(2)+"</option>");rhh=""+resu2.getString(2);}
                                                                                else{ out.print("<option value='"+resu2.getString(1)+"'>"+resu2.getString(2)+"</option>");}
                                                                    }
                                 }                       
                             catch(SQLException ex){}
                             catch(Exception exe){}
                             ba.cierraResultado(resu2);  
                        %>  
</select>
<input type="hidden" name="rhant" id="rhant" value="<% out.print(rhh); %>">  
</td>
</tr>

<!-----------5ta fila--------------->

<tr>
<td style="width:16%">
<label for="dpto">Departamento: </label>
</td>
<td style="width:16%">
<label for="ciudad">Ciudad: </label>
</td>
<td style="width:16%">
<label for="barrio">Barrio: </label>
</td>
<td style="width:32%" colspan="2">
<label for="direccion">Direccion: </label>
</td>

</tr>

<!-----------6ta fila--------------->

<tr>
<td style="width:16%">
<select name="dptoemp" size="1" id="dptoemp" onchange="cambiaMuni()" style="width:95%">
    <option value="nssdu">Seleccionar Departamento</option>
    <%   String depart="";
         String sql3="select id_departo,descripcion from departamento;";

         ResultSet resu3=null;
         try{  resu3=ba.consultas(sql3);
           while (resu3.next()&&resu3!=null) { 
             if(datos[15].compareTo(resu3.getString(1))==0){out.print("<option value='"+resu3.getString(1)+"' SELECTED>"+resu3.getString(2)+"</option>"); depart=""+resu3.getString(2);}         
                                                      else{out.print("<option value='"+resu3.getString(1)+"'>"+resu3.getString(2)+"</option>");}
                                             }
            }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resu3);  
     %>  
</select>
<input type="hidden" name="dptoempant" id="dptoempant" value="<% out.print(depart); %>"> 
</td>
<td style="width:16%"><% String ciu=""; %>
<div id="divmuniemple" name="divmuniemple" style="width:95%">   
    <select name="ciudad" size="1" id="ciudad" style="width:95%" onchange="quita()">
        
     <option value="nssdu">Seleccionar Departamento</option>
      <% 
         String sqlmun="select id_muni,descripcion from municipio where id_depto='"+datos[15]+"'";

         ResultSet resmun=null;
         try{  resmun=ba.consultas(sqlmun);
               while (resmun.next()&&resmun!=null) {  
                        if(datos[9].compareTo(resmun.getString(1))==0){  out.print("<option value='"+resmun.getString(1)+"' SELECTED>"+resmun.getString(2)+"</option>");ciu=""+resmun.getString(2);}
                                                                  else{  out.print("<option value='"+resmun.getString(1)+"'>"+resmun.getString(2)+"</option>");}
                                                 }
            }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resmun);  
     %>  
</select>
</div>   
<input type="hidden" name="ciudadant" id="ciudadant" value="<% out.print(ciu); %>">  
</td>
<td style="width:16%">
    <input type="text" name="barrio" size="16" id="barrio" maxlength="399" style="width:90%" value="<% out.print(datos[10]); %>">
    <input type="hidden" name="barrioant" id="barrioant" value="<% out.print(datos[10]); %>">  
</td>
<td style="width:32%" colspan="2">
<input type="text" name="direcc" size="16" id="direcc" maxlength="149" style="width:90%" value="<% out.print(datos[11]); %>">
 <input type="hidden" name="direccant" id="direccant" value="<% out.print(datos[11]); %>">
</td>
</tr>

<!---------------7ma fila----------->

<tr>
<td style="width:16%">
<label for="dpto">Telefono: </label>
</td>
<td style="width:16%" colspan="2">
<label for="ciudad">Email: </label>
</td>
<td style="width:32%" colspan="2">
<label for="fechanac">EPS Afiliado </label>
</td>
<td></td>
</tr>

<!---------------8va fila----------->

<tr>
<td style="width:16%">
<input type="text" name="telefono" size="16" id="telefono" maxlength="44" style="width:90%"  value="<% out.print(datos[12]); %>">
 <input type="hidden" name="telefonoant" id="telefonoant" value="<% out.print(datos[12]); %>">
</td>
<td style="width:16%" colspan="2">
<input type="text" name="email" size="40" id="email" maxlength="199" style="width:95%" value="<% out.print(datos[13]); %>">
<input type="hidden" name="emailant" id="emailant" value="<% out.print(datos[13]); %>">
</td>
<td style="width:32%" colspan="2">
    <select name="epsemp" size="1" id="epsemp" style="width:95%" onchange="cambiaeps()">
    <option value='ninguna'>Seleccione Eps</option>
    <%   String eps="Seleccione Eps";
         String sql4="select ideps,nombre from eps order by nombre;";
         String nombreeps="Seleccione Eps";
         ResultSet resu4=null;
         try{  resu4=ba.consultas(sql4);
               while (resu4.next()&&resu4!=null) {  
                    if(resu4.getString(1).compareTo(datos[14])==0){out.print("<option value='"+resu4.getString(1)+"' SELECTED>"+resu4.getString(2)+"</option>"); eps=resu4.getString(2);  nombreeps=""+resu4.getString(2);}
                                                               else{out.print("<option value='"+resu4.getString(1)+"'>"+resu4.getString(2)+"</option>");}
                                                                 
                                                 }
            }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resu4);  
     %>  
</select>
<input type="hidden" name="epsempant" id="epsempant" value="<% out.print(eps); %>">
</td>
<td  style="width:16%">
<center>  
    <input type="file" value="Subir foto" name="filef" size="25" id="filef" style="width:95%" data-previewer="#previewer"  accept="image/*" >
</center>  
</td>
</tr>
</table>
</fieldset>
</td>
</tr>
<%
         String sqlemp="select cod_estado_civil,id_nivel_educativo,nivel_sisben,id_orientacion,nu_carnet,fecha_afi,id_tipo_usuario,cod_zona,vih,fosiga,estado_fosiga,nomips,cod_modalidad,idtpob,embarazo_activo,activo from pacientes where serial_persona='"+serial+"'";
          
          String datospac[]=new String[16];
          ResultSet resemp=null;
           try{  resemp=ba.consultas(sqlemp);
                 while (resemp.next()&&resemp!=null) {  
                         if(resemp.getString(1)==null || resemp.getString(1).compareTo("null")==0){  datospac[0]=""; }else{ datospac[0]=""+resemp.getString(1);}
                         if(resemp.getString(2)==null || resemp.getString(2).compareTo("null")==0){  datospac[1]=""; }else{ datospac[1]=""+resemp.getString(2);}
                         if(resemp.getString(3)==null || resemp.getString(3).compareTo("null")==0){  datospac[2]=""; }else{ datospac[2]=""+resemp.getString(3);}
                         if(resemp.getString(4)==null || resemp.getString(4).compareTo("null")==0){  datospac[3]=""; }else{ datospac[3]=""+resemp.getString(4);}
                         if(resemp.getString(5)==null || resemp.getString(5).compareTo("null")==0){  datospac[4]=""; }else{ datospac[4]=""+resemp.getString(5);}
                         if(resemp.getString(6)==null || resemp.getString(6).compareTo("null")==0){  datospac[5]=""; }else{ datospac[5]=""+resemp.getString(6);}
                         if(resemp.getString(7)==null || resemp.getString(7).compareTo("null")==0){  datospac[6]=""; }else{ datospac[6]=""+resemp.getString(7);}
                         if(resemp.getString(8)==null || resemp.getString(8).compareTo("null")==0){  datospac[7]=""; }else{ datospac[7]=""+resemp.getString(8);}
                         if(resemp.getString(9)==null || resemp.getString(9).compareTo("null")==0){  datospac[8]=""; }else{ datospac[8]=""+resemp.getString(9);}
                         if(resemp.getString(10)==null || resemp.getString(10).compareTo("null")==0){datospac[9]=""; }else{ datospac[9]=""+resemp.getString(10);}
                         if(resemp.getString(11)==null || resemp.getString(11).compareTo("null")==0){datospac[10]="";}else{ datospac[10]=""+resemp.getString(11);}
                         if(resemp.getString(12)==null || resemp.getString(12).compareTo("null")==0){datospac[11]="";}else{ datospac[11]=""+resemp.getString(12);}
                         if(resemp.getString(13)==null || resemp.getString(13).compareTo("null")==0){datospac[12]="";}else{ datospac[12]=""+resemp.getString(13);}
                         if(resemp.getString(14)==null || resemp.getString(14).compareTo("null")==0){datospac[13]="";}else{ datospac[13]=""+resemp.getString(14);}
                         if(resemp.getString(15)==null || resemp.getString(15).compareTo("null")==0){datospac[14]="";}else{ datospac[14]=""+resemp.getString(15);}
                         if(resemp.getString(16)==null || resemp.getString(16).compareTo("null")==0){datospac[15]="";}else{ datospac[15]=""+resemp.getString(16);}
                                                     }
              }                       
           catch(SQLException ex){}
           catch(Exception exe){}
           ba.cierraResultado(resemp);  
%>
<tr>
    <td>
      <fieldset>
<legend>Datos de Afiliación </legend>

<table style="width:100%" >
    <tr >
        <td style="width:25%"><label>Estado Civil</label></td>
        <td style="width:25%"><label>Nivel Educativo</label></td>
        <td style="width:25%"><label>Nivel Sisben</label></td>
        <td style="width:25%"><label>Orientacion Sexual</label></td>
    </tr>
    <tr >
        <td>
         <select id="estado_civil" name="estado_civil" style="width:90%" >
          <% 
            String sql55="select idestado_civil,descripcion from estado_civil;";
               String estadociv="";
            ResultSet resu55=null;
            try{  resu55=ba.consultas(sql55);
                  while (resu55.next()&&resu55!=null) {  
                      if(datospac[0].compareTo(resu55.getString(1))==0){ out.print("<option value='"+resu55.getString(1)+"' SELECTED>"+resu55.getString(2)+"</option>");estadociv=resu55.getString(2);}
                      else{ out.print("<option value='"+resu55.getString(1)+"'>"+resu55.getString(2)+"</option>");}
                                                       }
               }                       
            catch(SQLException ex){}
            catch(Exception exe){}
            ba.cierraResultado(resu55);  
         %>
         </select> 
         <input type="hidden" name="estado_civilant" id="estado_civilant" value="<% out.print(estadociv); %>">         
        </td>
     <td >
              <select id="nivel_educadivo" name="nivel_educadivo" style="width:90%" >
          <% 
            String sql6="select id_nivel,descripcion from nivel_educativo;";
            String neducat="";
            ResultSet resu6=null;
            try{  resu6=ba.consultas(sql6);
                  while (resu6.next()&&resu6!=null) {  
                if(datospac[1].compareTo(resu6.getString(1))==0){out.print("<option value='"+resu6.getString(1)+"' SELECTED >"+resu6.getString(2)+"</option>");  neducat=""+resu6.getString(2);  }
                                                            else{out.print("<option value='"+resu6.getString(1)+"'>"+resu6.getString(2)+"</option>");}          
                                                     }
               }                       
            catch(SQLException ex){}
            catch(Exception exe){}
            ba.cierraResultado(resu6);  
         %>
         </select>   
         <input type="hidden" name="nivel_educadivoant" id="nivel_educadivoant" value="<% out.print(neducat); %>">           
       </td>
       <td>
           <select id="nivel_sisben" name="nivel_sisben" style="width:90%">
               <% String nsisben="";
                 if(datospac[2].compareTo("N")==0){out.print("<option value='N' SELECTED>No Aplica</option>");nsisben="No Aplica";} 
                                              else{out.print("<option value='N'>No Aplica</option>");}  
                 if(datospac[2].compareTo("1")==0){out.print("<option value='1' SELECTED>1</option>");nsisben="1";} 
                                              else{out.print("<option value='1'>1</option>");} 
                 if(datospac[2].compareTo("2")==0){out.print("<option value='2' SELECTED>2</option>");nsisben="2";} 
                                              else{out.print("<option value='2'>2</option>");} 
                 if(datospac[2].compareTo("3")==0){out.print("<option value='3' SELECTED>3</option>");nsisben="3";} 
                                              else{out.print("<option value='3'>3</option>");} 
             %>
           </select>
           <input type="hidden" name="nivel_sisbenant" id="nivel_sisbenant" value="<% out.print(nsisben); %>"> 
       </td>
       <td>
              <select id="orientacion_sex" name="orientacion_sex" style="width:90%" >
          <% 
            String sql7="select id_sex,descripcion from oreintacion_sex;";
            String sex="";
            ResultSet resu7=null;
            try{  resu7=ba.consultas(sql7);
                  while (resu7.next()&&resu7!=null) {  
                      if(datospac[3].compareTo(resu7.getString(1))==0){out.print("<option value='"+resu7.getString(1)+"' SELECTED>"+resu7.getString(2)+"</option>");sex=""+resu7.getString(2);}
                      else{ out.print("<option value='"+resu7.getString(1)+"'>"+resu7.getString(2)+"</option>");}
                                                    }
               }                       
            catch(SQLException ex){}
            catch(Exception exe){}
            ba.cierraResultado(resu7);  
         %>
         </select> 
           <input type="hidden" name="orientacion_sexant" id="orientacion_sexant" value="<% out.print(sex); %>"> 
       </td>
    </tr>
    <tr>
        <td><label>EPS</label></td>
        <td><label>Numero Carnet</label></td>
        <td><label>Fecha Afiliación</label></td>
        <td><label>Tipo Usuario</label></td>
    </tr>
    <tr>
        <td>
            <input type="text" id="epsemptext" name="epsemptext" value="<% out.print(nombreeps); %>"  style="width:90%" readonly>
       
        </td>
        <td>
            <%
               if(nombreeps.compareTo("")==0){
                    out.print("<input type='text' id='ncarnet' name='ncarnet' value='"+datospac[4]+"' style='width:90%' disabled='disabled' >");
                                               }
               else{out.print("<input type='text' id='ncarnet' name='ncarnet' value='"+datospac[4]+"' style='width:90%'  >");}
            %>
           <input type="hidden" name="ncarnetant" id="ncarnetant" value="<% out.print(datospac[4]); %>"> 
        </td>
        <td>
            <%
               if(nombreeps.compareTo("")==0){
                    out.print("<input type='text' id='fec_afiliacion' name='fec_afiliacion' value='' style='width:80%' onchange='calfechaafi()' disabled='disabled' readonly >");
                                               }
               else{out.print("<input type='text' id='fec_afiliacion' name='fec_afiliacion' value='' style='width:80%' onchange='calfechaafi()' readonly >");}
            %>
            <input type="hidden" name="fec_afiliacionant" id="fec_afiliacionant" value="<% out.print(datospac[5]); %>"> 
        </td>
        <td>            
          <% 
            if(nombreeps.compareTo("")==0){out.print("<select id='tipo_usu' name='tipo_usu' style='width:90%' disabled='disabled'>");  }
                                      else{out.print("<select id='tipo_usu' name='tipo_usu' style='width:90%'>");  }
            
            String sql9="select id_tipo_usuario,descripcion from tipo_usuario;";
            String tipou="";
            ResultSet resu9=null;
            try{  resu9=ba.consultas(sql9);
                  int b=0;
                  while (resu9.next()&&resu9!=null) { if(b==0){b=1;tipou=resu9.getString(2);} 
                        if(datospac[6].compareTo(resu9.getString(1))==0){out.print("<option value='"+resu9.getString(1)+"' SELECTED>"+resu9.getString(2)+"</option>");tipou=""+resu9.getString(2);}
                                                                   else{ out.print("<option value='"+resu9.getString(1)+"'>"+resu9.getString(2)+"</option>");}
                                                    }
               }                       
            catch(SQLException ex){}
            catch(Exception exe){}
            ba.cierraResultado(resu9);  
         %>
            </select>
             <input type="hidden" name="tipo_usuant" id="tipo_usuant" value="<% out.print(tipou); %>"> 
        </td>
    </tr>
    <tr>
        <td><label>Zona</label></td>
        <td><label>VIH</label></td>
        <td><label>Fosiga</label></td>
        <td><label>Estado Fosiga</label></td>
    </tr>
    <tr>
        <td>
             <select id="zona" name="zona" style="width:90%">
           <% 
            String sql10="select idzona,descrizona from zona;";
            String zonilla="";
            ResultSet resu10=null;
            try{  resu10=ba.consultas(sql10);
                  while (resu10.next()&&resu10!=null) {  
                      //System.out.println("ento datos 7 "+datospac[7]+" result:"+resu9.getString(1));
                           if(datospac[7].compareTo(resu10.getString(1))==0){  out.print("<option value='"+resu10.getString(1)+"' SELECTED>"+resu10.getString(2)+"</option>");zonilla=""+resu10.getString(2);}
                                                                       else{  out.print("<option value='"+resu10.getString(1)+"'>"+resu10.getString(2)+"</option>");}
                                                      }
               }                       
            catch(SQLException ex){}
            catch(Exception exe){}
            ba.cierraResultado(resu10);  
         %>
            </select>
            <input type="hidden" name="zonaant" id="zonaant" value="<% out.print(zonilla); %>"> 
        </td>
        <td>
             <select id="vih" name="vih" style="width:90%">
               <% //System.out.println("vih "+datospac[8]);
                  if(datospac[8].compareTo("Negativo")==0){ 
                                      out.print("<option value='Negativo' SELECTED>Negativo</option>");
                                      out.print("<option value='Positivo'>Positivo</option>");
                                                          } 
                          else{
                                out.print("<option value='Negativo'>Negativo</option>");
                                out.print("<option value='Positivo' SELECTED>Positivo</option>");
                            }
            %>
           </select>
             <input type="hidden" name="vihant" id="vihant" value="<% out.print(datospac[8]); %>">
        </td>
        <td>
            <select id="fosiga" name="fosiga" style="width:90%" onchange="activaestfodi()">
               <%  String fosiga="";
                    if(datospac[9].compareTo("CARGADO AL FOSYGA")==0){ 
                                      fosiga="Cargado al Fosiga";
                                      out.print("<option value='0'>No Aplica</option>");
                                      out.print("<option value='CARGADO AL FOSYGA' SELECTED>CARGADO AL FOSYGA</option>");
                                      out.print("<option value='NO CARGADO AL FOSYGA'>NO CARGADO AL FOSYGA</option>");
                                         } 
                  else if(datospac[9].compareTo("NO CARGADO AL FOSYGA")==0){ 
                                      fosiga="No Cargado al Fosiga";
                                      out.print("<option value='0'>No Aplica</option> ");
                                      out.print("<option value='CARGADO AL FOSYGA'>CARGADO AL FOSYGA</option>");
                                      out.print("<option value='NO CARGADO AL FOSYGA' SELECTED>NO CARGADO AL FOSYGA</option>");
                                          }
                   else{              fosiga="No Aplica";
                                      out.print("<option value='0' SELECTED>No Aplica</option> ");
                                      out.print("<option value='CARGADO AL FOSYGA'>CARGADO AL FOSYGA</option>");
                                      out.print("<option value='NO CARGADO AL FOSIGA'>NO CARGADO AL FOSYGA</option>");
                                        } 
              %>
           </select>
            <input type="hidden" name="fosigaant" id="fosigaant" value="<% out.print(fosiga); %>">
        </td>
        <td>
            <% String fosi="";
              if(datospac[9].compareTo("CARGADO AL FOSYGA")==0){
                             out.print("<select id='estadofosiga' name='estadofosiga'  style='width:90%'>");
                             
                             if(datospac[10].compareTo("Activo")==0){
                                  out.print("<option value='Activo' SELECTED>Activo</option>");
                                  out.print("<option value='Pendiente cargar al fosyga'>Pendiente cargar al fosyga</option>");
                                  fosi="Activo";
                                  }
                             else{
                                  out.print("<option value='Activo'>Activo</option>");
                                  out.print("<option value='Pendiente cargar al fosyga' SELECTED>Pendiente cargar al fosyga</option>");
                                  fosi="Pendiente cargar al fosyga";
                                  }
                             out.print("</select>");
                                               }
                        else{fosi="Activo";
                             out.print("<select id='estadofosiga' name='estadofosiga'  style='width:90%' disabled='disabled'>");
                             out.print("<option value='Activo'>Activo</option>");
                             out.print("<option value='Pendiente cargar al fosyga'>Pendiente cargar al fosyga</option>");
                             out.print("</select>");
                           }
            
        %>
             <input type="hidden" name="estadofosigaant" id="estadofosigaant" value="<% out.print(fosi); %>">
        </td>
    </tr>
    <tr>
        <td><label>NOMIPS</label></td>
        <td><label>Modalidad</label></td>
        <td><label>IDTPOB</label></td>
        <td><label id="labelemb" name="labelemb" <% if(datos[7].compareTo("Masculino")==0){out.print("style='display:none'"); } %> >Embarazo</label></td>
    </tr>
    <tr>
        <td><input type="text" id="nomips" name="nomips" value="<% out.print(datospac[11]); %>">
            <input type="hidden" id="nomipsant" name="nomipsant" value="<% out.print(datospac[11]); %>">
        </td>
        <td><input type="text" id="modalidad" name="modalidad" value="<% out.print(datospac[12]); %>">
            <input type="hidden" id="modalidadant" name="modalidadant" value="<% out.print(datospac[12]); %>">
        </td>
        <td><input type="text" id="idtpob" name="idtpob" value="<% out.print(datospac[13]); %>">
            <input type="hidden" id="idtpobant" name="idtpobant" value="<% out.print(datospac[13]); %>">
        </td>
        <td>
             <select id="embarazo" name="embarazo"  style="width:90%; <% if(datos[7].compareTo("Masculino")==0){out.print("display:none;"); } %>" >
                <%
                  String emba="";
                  if(datospac[14].compareTo("0")==0){
                                          out.print("<option value='0' SELECTED>Inactivo</option>"); 
                                          out.print("<option value='1'>Activo</option>");
                                          emba="Inactivo";
                                                     }
                         else{
                                 out.print("<option value='0'>Inactivo</option>"); 
                                 out.print("<option value='1' SELECTED>Activo</option>");
                                 emba="Activo";
                            }
                %> 
             </select>
             <input type="hidden" id="embarazoant" name="embarazoant" value="<% out.print(emba); %>">   
        </td>
    </tr>
    <tr> 
        <td colspan="4">
            <center>
            <label>Estado: &nbsp;</label>
            <select id="estadopaci" name="estadopaci">
                <% 
                  String estadopaci="";
                  if(datospac[15].compareTo("0")==0){
                                          out.print("<option value='0' SELECTED>Inactivo</option>"); 
                                          out.print("<option value='1'>Activo</option>");
                                          estadopaci="Inactivo";
                                                     }
                         else{
                                 out.print("<option value='0'>Inactivo</option>"); 
                                 out.print("<option value='1' SELECTED>Activo</option>");
                                 estadopaci="Activo";
                            }
                 %>
            </select>
            <input type="hidden" id="estadopaciant" name="estadopaciant" value="<% out.print(estadopaci); %>">  
            </center>
        </td>
    </tr>
</table>
</fieldset>
    </td>
</tr>
<tr>
<td valign="top">
<br><center><input type="submit" value="Actualizar" name="aceptar" size="25" id="aceptar"></center><br>
    
</td>
</tr>


</table>

<script type="text/javascript" language="javascript">
                    var ff="<% out.print(datos[4]); %>";
                       document.getElementById('calenaci').value=""+ff;
                                $("#divedad").load("edad.jsp?dato="+ff+""); 
                                
                     var ff2="<% out.print(datospac[5]); %>";
                       document.getElementById('fec_afiliacion').value=""+ff2;    
</script>           

<% ba.cerrar(); %>  



</body>
</html>
