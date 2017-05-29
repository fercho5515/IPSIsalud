<%-- 
    Document   : ingreso
    Created on : 18/02/2013, 05:47:45 PM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="imagenes/fotos/favicon.ico">
         <script src="jquery/apprise/apprise-1.5.min.js" type="text/javascript"></script>
         <link rel="stylesheet" type="text/css" media="screen" href="jquery/css/flick/jquery-ui-1.9.2.custom.css" >
         <link type='text/css' href='jquery/apprise/apprise.min.css' rel='stylesheet' media='screen'>
	 <script src="jquery/bajados/jquery.min.js" type="text/javascript"></script> 
         <script type="text/javascript" language="javascript" src="jquery/js/jquery-ui.js"></script>
	 
        <script type="text/javascript"  language="javascript" >
             if(document.getElementById) {
                                          window.alert = function(txt) { apprise(txt); }
                                         }

           function volver(){
                     location.href="index.jsp";                 
                           }
             function cierra(){
                               location.href="cierra_sesion.jsp";    
                            }        
           function editar(){
                     location.href="edita_datos_personales.jsp";                 
                           } 
           function abrirPanel(dato){
                            document.getElementById("permiso").value=dato;
                                 if(dato==1||dato==2||dato==3||dato==4||dato==6){                                
                                        document.forms.form1.action="agenda_consulta.jsp";//si esta basio recarga en la misma pagina
	                                }
                            else if(dato==5){document.forms.form1.action="agenda_psicologia.jsp";}            
                            else if(dato==7){document.forms.form1.action="administrativa/contenedormedicamentos.jsp";}
                            else if(dato==8){document.forms.form1.action="farmacia_entrega/contenedor_farmacia_entrega.jsp";}
                            else if(dato==9){document.forms.form1.action="contenedor_contabilidad.jsp";}
                            else if(dato==10){document.forms.form1.action="administrativa/contenedoradmin.jsp";}                            
                            else if(dato==11){document.forms.form1.action="administrativa/contenedoradmin.jsp";}
                            else if(dato==12){document.forms.form1.action="administrativa/contenedoradmin.jsp";}
                            else if(dato==13){document.forms.form1.action="citas/contenedor_citas.jsp";}
                            else if(dato==14){document.forms.form1.action="agenda_consulta.jsp";}
                            else if(dato==15){document.forms.form1.action="agenda_consulta.jsp";}
                            document.forms.form1.submit(); 
                                }       
 function valida_contra(){
     var uno=document.getElementById("clave_nue1").value;
     var dos=document.getElementById("clave_nue2").value;
     if(uno==dos){ document.getElementById("mensaj_contra").innerHTML="Las Contraseñas Coinciden"; 
                   document.getElementById('mensaj_contra').style.color = "green";}
     else{ document.getElementById("mensaj_contra").innerHTML="Las Contraseñas no Coinciden";
           document.getElementById('mensaj_contra').style.color = "red";   }
                        }
                        
function validacreaemp(){
     var ant=document.getElementById("clave_ant").value;
     var uno=document.getElementById("clave_nue1").value;
     var dos=document.getElementById("clave_nue2").value;
         
     var uno1 = uno.indexOf("'");
     if(uno1 != "-1"){alert("El caracter ' no es valido"); return false;}
     var uno2 = dos.indexOf("'");
     if(uno2 != "-1"){alert("El caracter ' no es valido"); return false;}
                
     if( ant == null || ant.length == 0 || /^\s+$/.test(ant) ) {
                                                      alert('no se ingreso la contraseña antigua');
                                                      return false;  
                                                               }   
     
     if( uno == null || uno.length == 0 || /^\s+$/.test(uno) ) {
                                                      alert('no se ingreso la nueva contraseña');
                                                      return false;  
                                                               }
                
     if( dos == null || dos.length == 0 || /^\s+$/.test(dos) ) {
                                                      alert('no se ingreso la confirmación de nueva contraseña');
                                                      return false;  
                                                               }
                                                               
     if(uno != dos){
                    alert('Las contraseñas no coinciden');
                    return false;  
                   }                                                          
                                                               
                                                           }
 function dialog_contra(){  
     document.getElementById("clave_ant").value="";
     document.getElementById("clave_nue1").value="";
     document.getElementById("clave_nue2").value="";
     document.getElementById("mensaj_contra").innerHTML="";
     $( "#dialo_cambia_cont" ).dialog("open"); }   
 
$(function() { 
     $( "#dialo_cambia_cont" ).dialog({
      autoOpen: false,
      modal: true,
      width: 500,
      dialogClass: 'no-close',
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1200
      }
    });}); 
        </script>
        <style type="text/css">
            #figu:hover{
                                background-color:#3baae3;
                                cursor:pointer;
                                border-radius: 10px;
                           }
       	body{
		font: 62.5% "Trebuchet MS", sans-serif;
		margin: 5px;
	}
	#dsa{padding: 5px 5px 0px 5px;}
	label,option,select{font-family:"Eras Medium ITC";
	      color:#2779aa;
          font-size:11pt;}
        figcaption{font-family:"Eras Medium ITC";
	      color:#2779aa;
          font-size:9pt;}
        
	legend{font-family:"Eras Bold ITC";
	       font-size:11pt;
    	   color:#2779aa;}
    fieldset{border:1px #2779aa solid;
             -webkit-border-radius: 10px;
             -moz-border-radius: 10px;
             border-radius: 10px;} 
   #aceptar{font-family:"Eras Medium ITC";
   			color:#2779aa;
          font-size:11pt; background:white;
         
          -webkit-border-radius: 10px;
          -moz-border-radius: 10px;
           border-radius: 10px;
         }
    #aceptar:hover {
     	 background: #3baae3;
 	     border-top-color: #3baae3;
         color: #ffffff;
         cursor: pointer;
		}
	h2{
		color:#2779aa;
	}


	 
          </style>

        <title>IPS ISALUD TOTAL S.A.S</title>
    </head>
    <body>
        <%
        session.setAttribute("permiso",null); 
        String usu = request.getParameter( "usuario" );
        String cla = request.getParameter( "clave" );
       if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("cedula")==null){
          
           if(usu==null || usu.trim().compareTo("null")==0||cla==null || cla.trim().compareTo("null")==0  ){
                      %>
                         <script type="text/javascript"  language="javascript" >
                             volver();
                         </script>
                      <%     
                      out.print("</body></html>");           
                      return;
                    }
       }
        else{
            
          usu = (String)session.getAttribute("cedula");
          cla = (String)session.getAttribute( "clave" );
          
        }
         String serial="nada";                 
        
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb(); 
         
         String sql="select p.serial,p.id_person,p.p_nom,p.s_nom,p.p_ape,p.s_ape,p.foto,c.descripcion,per.id_permi,per.descripcion from personas p,empleados e,permiso_empleado pe,permisos per,cargo c where e.id_cargo=c.id_cargo and pe.id_permi=per.id_permi and e.serial_empleado=pe.serial_empleado and e.serial_empleado=p.serial and p.id_person='"+usu+"' and e.clave=password('"+cla+"') and e.activo='1' and (pe.id_permi != 9 and pe.id_permi!=8 and pe.id_permi != 14 and pe.id_permi != 15) ;";
 // out.println("sql ==>"+sql);
          ResultSet resu=ba.consultas(sql);
          
          String cedula="";
          String p_nombre="";
          String s_nombre="";
	  String p_apellido="";
          String s_apellido="";
          String imagen="";
          String cargo="";
          
          int bandera=0;
	try{
	    while (resu.next()&&resu!=null) {   
                      
                     if(bandera==0){
                      
                      serial=resu.getString(1);  
                      if(resu.getString(2)!=null){cedula=resu.getString(2)+" ";}  
                      if(resu.getString(3)!=null){p_nombre=resu.getString(3)+" ";}  
                      if(resu.getString(4)!=null){s_nombre=resu.getString(4)+" ";} 
                      if(resu.getString(5)!=null){p_apellido=resu.getString(5)+"";}  
                      if(resu.getString(6)!=null){s_apellido=resu.getString(6)+"";}  
                      if(resu.getString(7)!=null){imagen=resu.getString(7)+"";}                       
                      if(resu.getString(8)!=null){cargo=resu.getString(8)+" ";}   
                        
                         
                      %>
          
        <table style="height:100%;width:80%;background:#deedf7;padding-top:5px" align="center">
<tbody valign="top">
<tr style="height:150px">
<td>
<center><img src="imagenes/fotos/baner.png" alt="imagen no encontrada" height="150px" width="100%"></center>
</td>
</tr>

<tr style="height:150px">
<td>

<table style="padding-top:5px;width:100%">
<tbody valign="top">
<tr>
<td style="width:30%">
<img src="imagenes/fotos/<% out.println(imagen);%>" onerror="this.src='imagenes/fotos/silueta.png'" alt="imagen no encontrada" height="150px" width="auto">
</td>
<td style="text-align:right;width:70%">
<h2 align="right">Bienvenid@ <%out.println(""+p_nombre+" "+s_nombre+""+p_apellido+" "+s_apellido+"" );%></h2>
<h2 align="right"> <% out.println(cedula);%> </h2>
<input type="button" value="Cerrar Sesion" name="aceptar" size="25" id="aceptar" onclick="cierra();" maxlength="30"><br>
<input type="button" value="Cambiar Contraseña" name="aceptar" size="25" id="aceptar" onclick="dialog_contra();" maxlength="30">
</td>
</tr>
</tbody>

</table>
</td>
</tr>
</tbody>
</table>
        
<table style="height:100%;width:80%;background:#deedf7;padding-top:5px" align="center">
<tr>
<td>
<table align="center">




        <%
                 }
                     bandera++;
        if(bandera==1||bandera==6||bandera==11||bandera==16){out.println("<tr>");}             
     %>
        

        
<td style="height:30px;width:30px">
    

    <figure id="figu" name="figu" style=" display:inline-block;" onclick="abrirPanel(<% out.print(""+resu.getString(9)+""); %>)">
        <center>				 
    <img src="imagenes/fotos/permi<% out.print(""+resu.getString(9)+""); %>.png" width="60px" height="60px">
    </center>	
    <figcaption><center><% out.print(""+resu.getString(10)+""); %></center></figcaption>
    </figure>

</td>

   <%
         if(bandera==5||bandera==10||bandera==15){out.println("</tr>");}                   
    

       
            }
            
	    }
	catch(SQLException ex){}
	catch(Exception exe){}
        
        ba.cierraResultado(resu);     
        ba.cerrar();     
          
        if(bandera!=6||bandera!=11||bandera!=16){out.println("</tr>");}  

       
       session.setAttribute("id",serial);
       session.setAttribute("cedula",cedula); 
       session.setAttribute("imagen",imagen); 
       session.setAttribute("clave",cla);
       session.setAttribute("nombre",""+p_nombre+" "+s_nombre+""+p_apellido+" "+s_apellido+"");             
       %>
       
       </table>
</td>
</tr>

</table>
     <%
     if(bandera==0){
     %>
                    <br> 
                    <center>
                        <h1>Fallo al iniciar sesión, verifique los datos por favor</h1>
                        <br><a href="index.jsp">volver</a>
                    </center>
     <%
                   }
     %>
       
       
       
       <form name="form1" id="form1" action="" method="post">
           <input type="hidden" name="permiso" id="permiso" >           
       </form>


    <div id="dialo_cambia_cont" title="Cambiar Contraseña">
        <center>
            <br>
            <iframe id="if_form_contraseña_us" name="if_form_contraseña_us" src="" style="border-width:0px;width:90%;height:60px">
            </iframe>
            <form id="form_contraseña_us" name="form_contraseña_us" method="post" action="contrasena/cambia_contrasena.jsp" target="if_form_contraseña_us" onsubmit="return validacreaemp();" >
                <table>
                    <tr><td><label>Contraseña Actual</label></td><td style="padding-left:25px"><input type="password" id="clave_ant" name="clave_ant" style="width:200px;text-align: center" ></td></tr>
                    <tr><td><label>Nueva Contraseña:</label></td><td style="padding-left:25px"><input type="password" id="clave_nue1" name="clave_nue1" style="width:200px;text-align: center" onkeyup="valida_contra()" onblur="valida_contra()" ></td></tr>
                    <tr><td><label>Confirmar Contraseña:</label></td><td style="padding-left:25px"><input type="password" id="clave_nue2" name="clave_nue2" style="width:200px;text-align: center" onkeyup="valida_contra()" onblur="valida_contra()"  ></td></tr>
                    <tr><td colspan="2" ><center><label id="mensaj_contra"></label></center></td></tr>        
                    <tr><td colspan="2" ><center><input type="submit" id="aceptar" name="aceptar" value="Cambiar" ></center></td></tr>        
                </table>
            </form>    
        </center>
    </div>

      


</body>

</html>
