<%-- 
    Document   : generar_facturas.jsp
    Created on : 17/03/2015, 07:32:21 PM
    Author     : VAIO
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">            
             $(function(){
		     $("#fechafacti").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#fechafacti').datepicker($.datepicker.regional['es']);
		     $('#fechafacti').datepicker("option","showAnim","slideDown");
		     $('#fechafacti').datepicker("option","dateFormat","yy-mm-dd");
                     
                     
		     $("#fechafactf").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true
		     });	
		     $('#fechafactf').datepicker($.datepicker.regional['es']);
		     $('#fechafactf').datepicker("option","showAnim","slideDown");
		     $('#fechafactf').datepicker("option","dateFormat","yy-mm-dd");
		});
                
    function facturar(){
               
              var feci= document.getElementById("fechafacti").value;               
              if( feci == null || feci.length == 0 || /^\s+$/.test(feci) ) {
                           alert("Fecha inicial es obligatoria");                           
                           return false;  
              } 
       
              var fecf= document.getElementById("fechafactf").value;               
              if( fecf == null || fecf.length == 0 || /^\s+$/.test(fecf) ) {
                           alert("Fecha final es obligatoria");                           
                           return false;  
              } 
              
             var array_fechai = feci.split("-"); 
             var diai=(array_fechai[2]);
             var mesi=(array_fechai[1]-1); 
             var anoi=(array_fechai[0]); 
             var datei = new Date(anoi,mesi,diai); 
              
             var array_fechaf = fecf.split("-"); 
             var diaf=(array_fechaf[2]);
             var mesf=(array_fechaf[1]-1); 
             var anof=(array_fechaf[0]); 
             var datef = new Date(anof,mesf,diaf);
              
             if(datef<datei){
                           alert("la fecha inicial no puede ser posterior a la actual");
                           return false;  
             } 
              
              var cont= document.getElementById("contratofac").value;   
              if(cont == 0){
                           alert("Seleccione Contrato para Facturación");                           
                           return false;  
              }
              
              
              
              
              
                $.ajax({
                   type: 'POST',
                   url: "entregamedicamentos/borramedentregados.jsp", 
                   data:{contr:cont,fechi:feci,fechf:fecf},
                   dataType: 'json',
                   success: function(data) {
                                    if(data.res==1){
                                        jQuery(idtabla).trigger('reloadGrid');	
                                        alert("Operación realizada satisfactoriamente. "); 
                                    }
                                    else{alert("Falla al realizar esta operación.");}
                                            },
                   error: function (xhr, ajaxOptions, thrownError) { alert("Falla al realizar esta operación."); }  
                   });
            return false;
    }
   
        </script>
    </head>
    <body>
       <center>
           <h1 style="color:#2779aa;">Facturación automática</h1>
    
        <label>Fecha Inicial:</label>&nbsp;
        <input type="text" id="fechafacti" name="fechafacti" >&nbsp;&nbsp;
        <label>Fecha Final:</label>&nbsp;
        <input type="text" id="fechafactf" name="fechafactf" >
        <br><br>
        <label> Contrato a facturar: </label> &nbsp;
        <select id="contratofac" name="contratofac">
            <option value="0">Seleccione contrato</option>
            <%
                                        String sql="select c.id_contratacion,c.nombre,c.cod_eps,e.nombre,c.f_inicio,c.f_fin from contratacion c,eps e where c.cod_eps=e.ideps and f_fin >= curdate() and activo='1'";
                                        ResultSet resu55=null;
                                        conecta_bd ba = new conecta_bd();
                                        ba.ConectaDb(); 
                                        try{  resu55=ba.consultas(sql);
                                            while (resu55.next()&&resu55!=null) {  
                                                out.print("<option value='"+resu55.getString(1)+"' >"+resu55.getString(2)+" con: "+resu55.getString(3)+"-"+resu55.getString(4)+" de:"+resu55.getString(5)+" a "+resu55.getString(6)+" </option>");
                                                                                }
                                        }                       
                                        catch(SQLException ex){}
                                        catch(Exception exe){}
                                        ba.cierraResultado(resu55); 
                                        ba.cerrar(); 
                                    %>
        </select>        
        <br><br>
        <input type="button" id="aceptarfactu" name="aceptarfactu" value="Aceptar" onclick="facturar();">
       </center>
    </body>
</html>
