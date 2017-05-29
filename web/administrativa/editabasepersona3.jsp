<%-- 
    Document   : editabasepersona3
    Created on : 25/04/2013, 11:54:00 AM
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">     
<script type="text/javascript" language="javascript">
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

</script>   
</head>
 <body>        <% request.setCharacterEncoding("UTF-8");
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
          
          String serial="";
          try{ serial=request.getParameter("dato");}catch(Exception e){}
          String sqpri="select p_nom,s_nom,p_ape,s_ape,fecha_naci,tipo_id,id_person,genero,id_rh,id_muni,barrio,direccion,telefono,email,id_eps,foto,id_depto from personas where serial='"+serial+"'";
          
          String datos[]=new String[17];
          
          for(int i=0;i<17;i++){datos[i]="";}
          
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
                         if(resupri.getString(17)==null || resupri.getString(17).compareTo("null")==0){datos[15]="";}else{ datos[15]=""+resupri.getString(17);}
                        
                                                  }
              }                       
           catch(SQLException ex){}
           catch(Exception exe){}
           ba.cierraResultado(resupri);  
         
         
     %>         
    
        <input type="hidden" name="serial_per" id="serial_per" value="<% out.print(serial); %>" >
        <input type="hidden" name="cambia" id="cambia" value="" >
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
    <img src="../imagenes/fotos/<% out.print(datos[16]); %>" name="previewer" id="previewer" alt="imagen no encontrada" height="150px" width="100%"  onerror="this.src='../imagenes/fotos/paciente.png'" >

</td>
</tr>

<!--------2da Fila------------>

<tr>
<td style="width:16%">
<input type="text" name="nombre1" size="16" id="nombre1" maxlength="74" style="width:90%" value="<% out.print(datos[0]); %>" readonly>
</td>
<td style="width:16%">
<input type="text" name="nombre2" size="16" id="nombre2" maxlength="74" style="width:90%" value="<% out.print(datos[1]); %>"  readonly>
</td>
<td style="width:16%">
<input type="text" name="apellido1" size="16" id="apellido1" maxlength="74" style="width:90%" value="<% out.print(datos[2]); %>" readonly>
</td>
<td style="width:16%">
<input type="text" name="apellido2" size="16" id="apellido2" maxlength="74" style="width:90%" value="<% out.print(datos[3]); %>" readonly >
</td>
<td style="width:16%">
    <input type="text" id="calenaci" name="calenaci" style="width:70%"  onchange="calfecha()" readonly>
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
<input type="text" name="edad" size="13" id="edad" maxlength="30" readonly  style="width:100%" >
</div>
</td>
<td style="width:16%">
    <select name="tipoid" size="1" id="tipoid" style="width:90%" disabled="disabled">
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

</td>
<td style="width:16%">
    <input type="text" name="id" size="16" id="id" maxlength="64" style="width:90%"  onkeyup="quita()" value="<% out.print(datos[6]); %>" readonly >
</td>
<td style="width:16%">
<select  name="sexo" size="1" id="sexo" style="width:90%" disabled="disabled">
    <% if("Masculino".compareTo(datos[7])==0){
                                             out.print("<option value='Masculino' SELECTED>Masculino</option>");
                                             out.print("<option  value='Femenino'>Femenino</option>"); 
                                              }
                                          else{
                                             out.print("<option value='Masculino'>Masculino</option>");
                                             out.print("<option  value='Femenino' SELECTED>Femenino</option>"); 
                                              }                      
     %>
    
        
</select>   
</td>
<td style="width:16%">
    <select id="rh" name="rh" style="width:40%;text-align:right" style="width:90%" disabled="disabled">
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
    <select name="dptoemp" size="1" id="dptoemp" onchange="cambiaMuni()" style="width:95%" disabled="disabled">
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
</td>
<td style="width:16%"><% String ciu=""; %>
<div id="divmuniemple" name="divmuniemple" style="width:95%">   
    <select name="ciudad" size="1" id="ciudad" style="width:95%" onchange="quita()" disabled="disabled">
        
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
</td>
<td style="width:16%">
    <input type="text" name="barrio" size="16" id="barrio" maxlength="399" style="width:90%" value="<% out.print(datos[10]); %>" readonly >
</td>
<td style="width:32%" colspan="2">
<input type="text" name="direcc" size="16" id="direcc" maxlength="149" style="width:90%" value="<% out.print(datos[11]); %>" readonly >
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
<input type="text" name="telefono" size="16" id="telefono" maxlength="44" style="width:90%"  value="<% out.print(datos[12]); %>" readonly >
</td>
<td style="width:16%" colspan="2">
<input type="text" name="email" size="40" id="email" maxlength="199" style="width:95%" value="<% out.print(datos[13]); %>" readonly >
</td>
<td style="width:32%" colspan="2">
    <select name="epsemp" size="1" id="epsemp" style="width:95%" disabled="disabled">
    <option value='ninguna'>Seleccione Eps</option>
    <%   String eps="";
         String sql4="select ideps,nombre from eps order by nombre;";

         ResultSet resu4=null;
         try{  resu4=ba.consultas(sql4);
               while (resu4.next()&&resu4!=null) {  
                    if(resu4.getString(1).compareTo( datos[14])==0){out.print("<option value='"+resu4.getString(1)+"' SELECTED>"+resu4.getString(2)+"</option>"); eps=""+resu4.getString(2);}
                                                               else{out.print("<option value='"+resu4.getString(1)+"'>"+resu4.getString(2)+"</option>");}
                                                 }
            }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resu4);  
     %>  
</select>
</td>
<td  style="width:16%"> 
</td>
</tr>
</table>
</fieldset>


</td>
</tr>

</table>

         
<script type="text/javascript" language="javascript">
                    var ff="<% out.print(datos[4]); %>";
                       document.getElementById('calenaci').value=""+ff;
                                $("#divedad").load("edad.jsp?dato="+ff+"");                                          
</script>  
<% ba.cerrar(); %>  



</body>
</html>

