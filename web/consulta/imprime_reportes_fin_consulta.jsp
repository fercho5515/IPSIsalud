<%-- 
    Document   : imprime_reportes_fin_consulta
    Created on : 11/03/2014, 10:10:49 AM
    Author     : servidor
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fin Consulta</title>
         <link rel="shortcut icon" href="../imagenes/fotos/favicon.ico">
        <link rel="stylesheet" type="text/css" media="screen" href="../jquery/css/flick/jquery-ui-1.9.2.custom.css" >
        <link rel="stylesheet" type="text/css" media="screen" href="../jquery/jqgrid/css/ui.jqgrid.css" >
        <link rel="stylesheet" type="text/css" media="screen" href="../jquery/bajados/ui.multiselect.css" >
       	<script src="../jquery/bajados/jquery.min.js" type="text/javascript"></script>
        <script src="../jquery/bajados/jquery-ui.min.js" type="text/javascript"></script> 
		<script type="text/javascript" language="javascript" src="../jquery/js/jquery-ui.js"></script>
		<script type="text/javascript" src="../jquery/bajados/jquery.ui.widget.js"></script>
		<script type="text/javascript" src="../jquery/bajados/jquery.ui.datepicker-es.js"></script>
		<script type="text/javascript" src="../jquery/bajados/jquery.ui.core.js"></script>
		
        <script src="../jquery/jqgrid/js/i18n/grid.locale-es.js" type="text/javascript"></script>
        <script src="../jquery/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
           
        <link type='text/css' href='../jquery/bajados/modal/osx.css' rel='stylesheet' media='screen'>
        <script type='text/javascript' src='../jquery/bajados/modal/jquery.simplemodal.js'></script>
<style type="text/css">
	body{
		font: 62.5% "Trebuchet MS", sans-serif;
		margin: 5px;
	}
	label,option,select{font-family:"Eras Medium ITC";
	      color:#2779aa;
          font-size:11pt;}
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
	h2,h1{
		color:#2779aa;
	}
        img:hover{ cursor: pointer}
        /* para efetxo hover */
        .element {
            background: none repeat scroll 0 0 #FFFFFF;
            border: 1px solid #E5E5E5;
            height: 222px;
            padding: 2px;/*cuadrito de alrederos*/
            width: 220px;
            float:left;
            margin-left:10px;
        }

        a.image {
            display: block;
            overflow: hidden;
        }
        a.image1 {
            display: block;
            overflow: hidden;
        }
        a.image2 {
            display: block;
            overflow: hidden;
        }
        a.image3 {
            display: block;
            overflow: hidden;
        }
        a.image4 {
            display: block;
            overflow: hidden;
        }

        .contenthover {
            width:100px;
            height:300px;
            background-color: #0099CC;
            opacity:0.7;
            position:absolute;
            top:222px;
            left:-9px;
            color:#FFFFFF;
            font-size:14px;
            text-align:center;
            padding-top:30px;
        }
	</style>

        <script type="text/javascript">
               function muestra_formu_imp(){ $("#resu_Hitro_rep_imp" ).dialog( "open" ); }
               function muestra_labo_imp(){  $("#resu_lab_rep_imp" ).dialog( "open" );   }
               function muestra_imag_imp(){  $("#resu_img_rep_imp" ).dialog( "open" );   }
            
              function imprime_from_imag_imp(iidd){
                   $("#resu_Hitro_rep_imp" ).dialog( "close" );
                  if(iidd==1){  window.open("../reportes/reporte_formula_med/formulas.jsp?cod_con="+<% out.print(""+session.getAttribute("serial_consulta")+""); %>+""); }
                         else{  window.open("../reportes/reporte_formula_med/formula.jsp?cod_con="+<% out.print(""+session.getAttribute("serial_consulta")+""); %>+""); }
                                         }
                                         
              function imprime_imag_imp(iidd){
                   $("#resu_img_rep_imp" ).dialog( "close" );
                  if(iidd==1){  window.open("../reportes/imagenes/imagen.jsp?cod_con="+<% out.print(""+session.getAttribute("serial_consulta")+""); %>+""); }
                         else{  window.open("../reportes/imagenes/imagenes.jsp?cod_con="+<% out.print(""+session.getAttribute("serial_consulta")+""); %>+""); }
                                         }
              function imprime_labo_imp(iidd){
                   $("#resu_lab_rep_imp" ).dialog( "close" );
                  if(iidd==1){  window.open("../reportes/laboratorios/laboratorio.jsp?cod_con="+<% out.print(""+session.getAttribute("serial_consulta")+""); %>+""); }
                         else{  window.open("../reportes/laboratorios/laboratorios.jsp?cod_con="+<% out.print(""+session.getAttribute("serial_consulta")+""); %>+""); }
                                         }
                                         
            function muestra_rem(ids){
                                window.open("../reportes/remision/remision.jsp?cod_rem="+ids+""); 
                                    }   
                                    
            function soli_no_p(cod_r){
                        var numm= prompt("Introdusca numero para el reporte");
                        window.open("../reportes/no_pos/soli_no_pos.jsp?cod_sol="+cod_r+"&numero="+numm+"");                                  
                                 }
                                 
            function histo_imp(cod_r){
                        window.open("../reportes/reporte_consulta_med_ant/consulta_medica_ant.jsp?cod_con="+cod_r+"");                                  
                                 }
            
            $(function() { 
                        $( "#resu_Hitro_rep_imp" ).dialog({
                         autoOpen: false,
                         modal: true,
                         height:100,
                         width: 200,
                         dialogClass: 'no-close',
                         /*open: function(event, ui) {
                               $(this).closest('.ui-dialog').find('.ui-dialog-titlebar-close').hide();
                             },*/
                         show: {
                           effect: "blind",
                           duration: 1000
                         },
                         hide: {
                           effect: "explode",
                           duration: 1200
                         }
                       });});  
                 
            $(function() { 
                        $( "#resu_img_rep_imp" ).dialog({
                         autoOpen: false,
                         modal: true,
                         height:100,
                         width: 200,
                         dialogClass: 'no-close',
                         /*open: function(event, ui) {
                               $(this).closest('.ui-dialog').find('.ui-dialog-titlebar-close').hide();
                             },*/
                         show: {
                           effect: "blind",
                           duration: 1000
                         },
                         hide: {
                           effect: "explode",
                           duration: 1200
                         }
                       });});    
                   
            $(function() { 
                        $( "#resu_lab_rep_imp" ).dialog({
                         autoOpen: false,
                         modal: true,
                         height:100,
                         width: 200,
                         dialogClass: 'no-close',
                         /*open: function(event, ui) {
                               $(this).closest('.ui-dialog').find('.ui-dialog-titlebar-close').hide();
                             },*/
                         show: {
                           effect: "blind",
                           duration: 1000
                         },
                         hide: {
                           effect: "explode",
                           duration: 1200
                         }
                       });});    
            ///para el efecto hover
            $(document).ready(function(){
                           $('.image').hover(function(){ 
                                    $(this).find('.contenthover').stop().animate({top:'0px'}, 500);  
                                                        },
                                            function() { 
                                                 $(this).find('.contenthover').stop().animate({top:'222px'}, 500); 
                                                       }
                                            );
                                      });
            $(document).ready(function(){
                           $('.image1').hover(function(){ 
                                    $(this).find('.contenthover').stop().animate({top:'0px'}, 500);  
                                                        },
                                            function() { 
                                                 $(this).find('.contenthover').stop().animate({top:'222px'}, 500); 
                                                       }
                                            );
                                      });
            $(document).ready(function(){
                           $('.image2').hover(function(){ 
                                    $(this).find('.contenthover').stop().animate({top:'0px'}, 500);  
                                                        },
                                            function() { 
                                                 $(this).find('.contenthover').stop().animate({top:'222px'}, 500); 
                                                       }
                                            );
                                      });
            $(document).ready(function(){
                           $('.image3').hover(function(){ 
                                    $(this).find('.contenthover').stop().animate({top:'0px'}, 500);  
                                                        },
                                            function() { 
                                                 $(this).find('.contenthover').stop().animate({top:'222px'}, 500); 
                                                       }
                                            );
                                      });
            $(document).ready(function(){
                           $('.image4').hover(function(){ 
                                    $(this).find('.contenthover').stop().animate({top:'0px'}, 500);  
                                                        },
                                            function() { 
                                                 $(this).find('.contenthover').stop().animate({top:'222px'}, 500); 
                                                       }
                                            );
                                      });
        </script>
   
    </head>
    <body style="background-color:#F2F5F7" >
        <% 
      
              request.setCharacterEncoding("UTF-8");
                      
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || (request.getParameter( "permiso" )==null&&session.getAttribute("permiso")==null)){
            %>
               <br><center><h1>Por favor ingrese adecuadamente</h1></center>
               <br><center><a href="index.jsp">volver</a></center>
  
            <% 
              out.println("</body></html>");
              return;
            }
               String permi=(String)session.getAttribute("permiso");
               String consu=(String)session.getAttribute("serial_consulta");
               String seria=(String)session.getAttribute("serial_pacinete");
         
          if(permi.compareTo("2")!=0 && permi.compareTo("3")!=0){
                out.println("<script type='text/javascript' >"
                          + "location.href='../agenda_consulta.jsp'"
                          + "</script>");
               }     
           String sql_for="SELECT count(id_consulta) as cant FROM ips_isalud.formula_medica where id_consulta='"+consu+"';";           
           String sql_lab="SELECT count(id_consulta) as cant FROM ips_isalud.labs_sol WHERE id_consulta='"+consu+"';";
           String sql_img="SELECT count(id_consulta) as cant FROM ips_isalud.imgs_sol WHERE id_consulta='"+consu+"';";
           String sql_rem="SELECT count(serial),serial FROM ips_isalud.remision_espe where id_consulat='"+consu+"';";
           String sql_snp="SELECT count(id_soli_no_post),id_soli_no_post FROM ips_isalud.soli_no_post where cod_consulta='"+consu+"';";
           
           int c_for=0;
           int c_lab=0;
           int c_img=0;           
           int c_rem=0;
           String cod_rem="";
           int c_snp=0;
           String cod_snp="";
           
           conecta_bd ba = new conecta_bd();
                                    
           ba.ConectaDb();
           
           ResultSet re_f=ba.consultas(sql_for);
           try{ while(re_f.next() && re_f!=null) { c_for=Integer.parseInt(""+re_f.getString(1)+"");}}
           catch(SQLException e){c_for=0;}catch(Exception ex){c_for=0;}
           ba.cierraResultado(re_f);
           
           ResultSet re_l=ba.consultas(sql_lab);
           try{ while(re_l.next() && re_l!=null) { c_lab=Integer.parseInt(""+re_l.getString(1)+"");}}
           catch(SQLException e){c_lab=0;}catch(Exception ex){c_lab=0;}
           ba.cierraResultado(re_l);
           
           ResultSet re_i=ba.consultas(sql_img);
           try{ while(re_i.next() && re_i!=null) { c_img=Integer.parseInt(""+re_i.getString(1)+"");}}
           catch(SQLException e){c_img=0;}catch(Exception ex){c_img=0;}
           ba.cierraResultado(re_i);
            
           ResultSet re_rem=ba.consultas(sql_rem);
           try{ while(re_rem.next() && re_rem!=null) { c_rem=Integer.parseInt(""+re_rem.getString(1)+"");
                                                       cod_rem=""+re_rem.getString(2);      }}
           catch(SQLException e){c_rem=0;}catch(Exception ex){c_rem=0;}
           ba.cierraResultado(re_rem);
           
           ResultSet re_snp=ba.consultas(sql_snp);
           try{ while(re_snp.next() && re_snp!=null) { c_snp=Integer.parseInt(""+re_snp.getString(1)+"");
                                                       cod_snp=""+re_snp.getString(2);      }}
           catch(SQLException e){c_snp=0;}catch(Exception ex){c_snp=0;}
           ba.cierraResultado(re_snp);
           
           
           
         //  if(c_for>0 || c_lab>0 || c_img>0 || c_rem>0 || c_snp>0){
           %>
           <center><br><br><br><br><br><br>
               <h1>Consulta Guardada</h1>
               <table border='0'>
                   <tr><td colspan="5"><center><h2>IMPRIMIR</h2></center></td></tr>
                   <tr>
                       <%
                       if(c_for>0 ){out.print("<td>&nbsp;&nbsp;&nbsp;<center>"
                               + "<div class='element' style='height:100px;width: auto' onclick='muestra_formu_imp()' ><a class='image' href='#' style='position:relative;height:100px;width: auto'><div class='contenthover'><center><b>Formula<br>Medica</b></center></div>"
                                           +"<img src='../imagenes/fotos/ico_formula.png' alt='formula' style='height:100px;width: auto'>"
                               + "</a></div>"
                               + "</center>&nbsp;&nbsp;&nbsp;</td>");}
                       if(c_img>0 ){out.print("<td>&nbsp;&nbsp;&nbsp;<center>"
                               + "<div class='element' style='height:100px;width: auto' onclick='muestra_imag_imp()'><a class='image1' href='#' style='position:relative;height:100px;width: auto'><div class='contenthover'><center><b>Imagenes<br>Diagnosticas</b></center></div>"
                                          + "<img src='../imagenes/fotos/imagen4.png' alt='imagenes' style='height:100px;width: auto'>"
                               + "</a></div>"
                               + "</center>&nbsp;&nbsp;&nbsp;</td>");}
                       
                       if(c_lab>0 ){out.print("<td>&nbsp;&nbsp;&nbsp;<center>"
                               + "<div class='element' style='height:100px;width: auto' onclick='muestra_labo_imp()'><a class='image2' href='#' style='position:relative;height:100px;width: auto'><div class='contenthover'><center><b>Paraclinicos</b></center></div>"
                                          + "<img src='../imagenes/fotos/laboratorio.png' alt='laboratorios' style='height:100px;width: auto'>"
                               + "</a></div>"
                               + "</center>&nbsp;&nbsp;&nbsp;</td>");}
                       if(c_rem>0 ){out.print("<td>&nbsp;&nbsp;&nbsp;<center>"
                               + "<div class='element' style='height:100px;width: auto' onclick='muestra_rem("+cod_rem+")'><a class='image3' href='#' style='position:relative;height:100px;width: auto'><div class='contenthover'><center><b>Remisiones</b></center></div>"
                                            + "<img src='../imagenes/fotos/remision.png' alt='remisiones' style='height:100px;width: auto'>"
                               + "</a></div>" 
                               + "</center>&nbsp;&nbsp;&nbsp;</td>");}
                       if(c_snp>0 ){out.print("<td>&nbsp;&nbsp;&nbsp;<center>"
                               + "<div class='element' style='height:100px;width: auto' onclick='soli_no_p("+cod_snp+")'><a class='image4' href='#' style='position:relative;height:100px;width: auto'><div class='contenthover'><center><b>Solicitud<br>no POS</b></center></div>"
                                            + "<img src='../imagenes/fotos/farmacia.png' alt='no pos' style='height:100px;width: auto'>"
                               + "</a></div>" 
                               + "</center>&nbsp;&nbsp;&nbsp;</td>");}
                       %>     
                       
                       
                       
                        <td>
                            <center>
                               <div class='element' style='height:100px;width: auto' onclick='histo_imp(<%= consu %>)'>
                                   <a class='image4' href='#' style='position:relative;height:100px;width: auto'>
                                        <div class='contenthover'><center><b>Consulta</b></center></div>
                                        <img src='../imagenes/fotos/imagen5.png' alt='no pos' style='height:100px;width: auto'>
                                   </a>
                               </div>
                            </center>
                        </td>
                       
                       
                   </tr>
               </table>
           </center>           
           <%
      /*     }  
           else{
                  out.println("<script type='text/javascript' >"
                          + "location.href='../agenda_consulta.jsp'"
                          + "</script>"); 
               }*/
        %>
        <br><br>
        <center><a href="../agenda_consulta.jsp" style="font-size:14px">Volver a la Agenda</a></center>
        
        
        
        
        <div id="resu_Hitro_rep_imp" ><center><br>
                <input type="button" value="Sencilla" id="aceptar" onclick="imprime_from_imag_imp(1)">    &nbsp;  &nbsp;           
                <input type="button" value="Doble" id="aceptar"  onclick="imprime_from_imag_imp(2)">
            </center>
        </div>
     
        <div id="resu_img_rep_imp"><center><br>
                <input type="button" value="Sencilla" id="aceptar" onclick="imprime_imag_imp(1)">    &nbsp;  &nbsp;           
                <input type="button" value="Doble" id="aceptar"  onclick="imprime_imag_imp(2)">
            </center>
        </div>
        
        <div id="resu_lab_rep_imp"><center><br>
                <input type="button" value="Sencilla" id="aceptar" onclick="imprime_labo_imp(1)">    &nbsp;  &nbsp;           
                <input type="button" value="Doble" id="aceptar"  onclick="imprime_labo_imp(2)">
            </center>
        </div>
    </body>
    <% ba.cerrar(); %>
    
</html>
