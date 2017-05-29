<%-- 
    Document   : subremision_uno
    Created on : 14/05/2013, 12:14:13 AM
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
            function cambiadiag(){ /*
                 var dato=$("#select_diag").val();
                 if(dato!="npa"){document.getElementById("obsevaciones_remi").value=document.getElementById(""+dato+"").value;}
                 else{document.getElementById("obsevaciones_remi").value="";}  */
             //   select_diag" name="select_diag" onchange="cambiadiag()">
               //               <option value="npa"
                  }
           
   $('#form_remision').submit(function() {
                            var nom = document.getElementById("anam_remi").value; 
                            var exa = document.getElementById("exam_remi").value; 
                            var obs = document.getElementById("obsevaciones_remi").value; 
                            var pre = document.getElementById("presuntivo").value; 
                            
                           if( nom == null || nom.length == 0 || /^\s+$/.test(nom) ) {
                                                     alert('La anamnesis es obligatoria');
                                                       return false;  
                                                                      }    
                           else if( exa == null || exa.length == 0 || /^\s+$/.test(exa) ) {
                                                     alert('El examen fisico es obligatorio');
                                                       return false;  
                                                                      } 
                                                                      
                           var sela =document.getElementById("select_diag");
                           var valsela=sela.options[sela.selectedIndex].value;                                         
                           if(valsela=="npa"){
                                                  alert('Favor seleccione diagnostico');
                                                       return false;      
                                                  }  
                           else if( pre == null || pre.length == 0 || /^\s+$/.test(pre) ) {
                                                     alert('Presuntivo es obligatorio');
                                                       return false;  
                                                                      }
                           else if( obs == null || obs.length == 0 || /^\s+$/.test(obs) ) {
                                                     alert('las observaciones son obligatorias');
                                                       return false;  
                                                                      }                                               
                           var sela2 =document.getElementById("especi_remi");
                           var valsela2=sela2.options[sela2.selectedIndex].value;                                         
                           if(valsela2=="npa"){
                                                  alert('Favor seleccione especialidad a la que remite');
                                                       return false;      
                                                  }  
            
            
                    // Enviamos el formulario usando AJAX
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#ifr_remision').html(data);
                                  setTimeout ('sino()',400); 
                                           }                             
                          })
                     
                          return false;
                      }); 
                                  
        </script>
    </head>
    <body>
           <% request.setCharacterEncoding("UTF-8");
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){
          
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
    
        conecta_bd ba = new conecta_bd();
        ba.ConectaDb(); 
          
          String datos[][]= new String[4][3];
          for(int i=0;i<4;i++){
             for(int j=0;j<3;j++){
                                 datos[i][j]=""; 
                                 }
                              }
          try {Thread.sleep(200);} catch (InterruptedException ex) {}
          
          String  sqlc="select imp.id_subcie,sub.descripcion,imp.descrip from sub_cie10 sub,impre_diagno imp where imp.id_subcie=sub.id_subcie10 and id_consulta='"+session.getAttribute("serial_consulta")+"' order by control;";
          
           ResultSet result=null;
           int i=0;
          try{  
           result=ba.consultas(sqlc);            
           while (result.next()&&result!=null) { 
                         datos[i][0]=""+result.getString(1);
                         datos[i][1]=""+result.getString(2);
                         datos[i][2]=""+result.getString(3);
                         i++;
                                               }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        ba.cierraResultado(result); 
         
         String  sq2c="select anamnesis,conducta_recomen from consulta_medica where id_consulta='"+session.getAttribute("serial_consulta")+"';";
          String anamne="";
          String examfisi="";
           ResultSet result2=null;
          try{  
           result2=ba.consultas(sq2c);            
           while (result2.next()&&result2!=null) { 
                       if(result2.getString(1)!=null && result2.getString(1).compareTo("null")!=0 ){
                                       anamne=""+result2.getString(1);                                                            
                                                                                                    }
                       if(result2.getString(2)!=null && result2.getString(2).compareTo("null")!=0 ){
                                       examfisi=""+result2.getString(2);                                                            
                                                                                                    }
                                               }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        ba.cierraResultado(result2);       
    %>
    <form id="form_remision" name="form_remision" action="nueva_remision.jsp"  >       
    <fieldset>
<legend>Remision Especialista</legend>
<table style="width:100%">

<tr><td style="width:100%"><label>Anamnesis</label></td></tr>
<tr><td><textarea rows="4" style="width:100%" id="anam_remi" name="anam_remi"><% out.print(anamne); %></textarea></td></tr>

<tr><td style="width:100%"><label>Examen Fisico</label></td></tr>
<tr><td><textarea rows="4" style="width:100%" id="exam_remi" name="exam_remi"><% out.print(examfisi); %></textarea></td></tr>

<tr><td style="width:100%"><label>Diagnostico Presuntivo</label>  
        <select style="width:85%;height:22px" id="select_diag" name="select_diag" onchange="cambiadiag()">
                              <option value="npa">Seleccione diaggnostico</option>
              <%   
                   for(int j=0;j<i;j++){ out.println("<option value='"+datos[j][0]+"'>"+datos[j][0]+" - "+datos[j][1]+"</option>"); }
              %>                              
           </select>
    </td></tr>
<tr><td style="width:100%"><label>Tratamiento</label></td></tr>
<tr><td><textarea rows="4" id="presuntivo" name="presuntivo" style="width:100%" ></textarea></td></tr>
<tr><td style="width:100%"><label>Observaciones</label></td></tr>
<tr style="display: none"><td><textarea rows="4" id="obsevaciones_remi" name="obsevaciones_remi" style="width:100%">.</textarea></td></tr>

<tr><td style="width:100%"><label>Especialidad a la que remite</label></td></tr>
<tr><td>
         <select style="width:65%;height:22px" id="especi_remi" name="especi_remi">
                 <option value="npa">Seleccione especialidad</option>
                    <%                                  
                    String  sqles="select cod_esp,descripcion from especialidades;";

                     ResultSet resulta=null;
                    try{  
                     resulta=ba.consultas(sqles);            
                     while (resulta.next()&&resulta!=null) { 
                         out.print("<option value='"+resulta.getString(1)+"'>"+resulta.getString(2)+"</option>");
                                                         }
                        }
                  catch(SQLException ex){}
                  catch(Exception exe){}
                  ba.cierraResultado(resulta);
                  %>
         </select>
   </td>
</tr>

</table>
<br>
<center><input type="submit" value="Solicitar" name="aceptar" size="25" id="aceptar" maxlength="30"></center>
</fieldset>
    </form>  
  <%  
      for(int j=0;j<i;j++){ out.println("<input type='hidden' name='"+datos[j][0]+"' id='"+datos[j][0]+"' value='"+datos[j][2]+"'>"); }
              %>
<div name="ifr_remision" id="ifr_remision" style="display:none"></div>

<br><%   ba.cerrar(); %>
    </body>
</html>
