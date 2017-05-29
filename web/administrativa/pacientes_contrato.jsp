<%-- 
    Document   : pacientes_contrato
    Created on : 20/08/2013, 06:31:46 PM
    Author     : Emmanuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
	 <link rel="shortcut icon" href="../imagenes/fotos/favicon.ico">
        <link rel="stylesheet" type="text/css" media="screen" href="../jquery/css/flick/jquery-ui-1.9.2.custom.css" >
        <link rel="stylesheet" type="text/css" media="screen" href="../jquery/jqgrid/css/ui.jqgrid.css" >
        <link rel="stylesheet" type="text/css" media="screen" href="../jquery/bajados/ui.multiselect.css" >
       	<script src="../jquery/bajados/jquery.min.js" type="text/javascript"></script> 
        <script type="text/javascript" language="javascript" src="../jquery/js/jquery-ui.js"></script>
	<script src="../jquery/jqgrid/js/i18n/grid.locale-es.js" type="text/javascript"></script>        
        <script type="text/javascript" src="../jquery/bajados/jquery.ui.datepicker-es.js"></script> 
        <script src="../jquery/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
        <link type='text/css' href='../jquery/bajados/modal/osx.css' rel='stylesheet' media='screen'>
        <script type='text/javascript' src='../jquery/bajados/modal/jquery.simplemodal.js'></script>
        <script type="text/javascript" src="../jquery/bajados/jquery.previewInputFileImage.js"></script>        
        <script src="../jquery/apprise/apprise-1.5.min.js" type="text/javascript"></script> 
        <link type='text/css' href='../jquery/apprise/apprise.min.css' rel='stylesheet' media='screen'>
        <title>JSP Page</title>
          <script type="text/javascript">
             function valida_sube_arc_pa(){
                 var archiv_per_sub=document.getElementById("archivo_perso").value; 
   
    if( archiv_per_sub == null || archiv_per_sub.length == 0 || /^\s+$/.test(archiv_per_sub) ) {
                         alert("Primero agregue archivo");
                         return false;  
                                                                      }  
             }
		$("#archivo_perso").change(function() {

                      var val = $(this).val();

                      switch(val.substring(val.lastIndexOf('.') + 1).toLowerCase()){
                                    case 'txt': case 'csv':
                                    //  alert("an image");
                                    break;
                                    default:
                                    $(this).val('');
                                    // error message here
                                    alert("no es un archivo valido, los formatos permitidos son txt y csv");
                                    break;
                                                                                   }
                                                      });  
            </script>
    </head>
    <body>
        <br>
    <center>
        <%   session.setAttribute("id_contratacion","1"); %>
        <h2>archivo con pacientes a relacioar</h2>
        <br>
        <form id="form_arch_pac" name="form_arch_pac" method="post" target="if_arch_pac" action="sube_arch_pacientes.jsp" onsubmit="return valida_sube_arc_pa();" enctype="multipart/form-data" >
        <input type="file" id="archivo_perso" name="archivo_perso">
        <input type="submit" value="aceptar">
        </form>
        <iframe id="if_arch_pac" name="if_arch_pac" src="" style="border-width:0px;height:500px;width:100%" >
       
    
    </center>
      
    </body>
</html>
