<%-- 
    Document   : index
    Created on : 2/03/2013, 06:59:18 PM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" >
            
            $("#file_ap").change(function() {

                    var val = $(this).val();

                    switch(val.substring(val.lastIndexOf('.') + 1).toLowerCase()){
                        case 'txt':
                        //  alert("an image");
                            break;
                        default:
                            $(this).val('');
                            // error message here
                            alert("no es un archivo valido, el formato permitido es txt");
                            break;
                    }
                });
      function valida_sube_arch(){
                            var cont_arc=document.getElementById("contrato_arch").value;
                           if(cont_arc=="-1"){
                                           alert('Seleccione Contrato');
                                           return false; 
                                           }     
                           var file_ap=document.getElementById("file_ap").value;
                           if(file_ap == null ||file_ap.length == 0 || /^\s+$/.test(file_ap)){
                                                      alert('Seleccione archivo');
                                                       return false; 
                                                      } 
         document.getElementById('img_carg').style.display = 'block';
                                   }
    function oculta_img_c(){
        document.getElementById("contrato_arch").value="-1";
        document.getElementById("file_ap").value="";
        document.getElementById('img_carg').style.display = 'none';}                               
        </script>
    </head>
    <body>
               <% request.setCharacterEncoding("UTF-8");
      
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="/ISALUD/index.jsp">volver</a></center>
     
     
    <% 
             
              return;
            } 
%>
    <center>
        <form action="cargar_pac_arch/sube_arch_pacientes.jsp" id="form_sube_pac" name="form_sube_pac" method="post" target="result_carga_pac" onsubmit="return valida_sube_arch()" enctype="multipart/form-data" ><br><br>
            <select id="contrato_arch" name="contrato_arch">
                <option value="-1">Seleccione un Contrato de la Lista</option>
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
            </select><br><br>
            <label><b>archivo</b></label> <input type="file" name="file_ap" id="file_ap" ><br><br>
            <input type="submit" value="enviar" name="Subir" id="aceptar" />
        </form>
        <br><br>
        <div id='img_carg' name='img_carg' style="display:none"> <input type='image' id='fo' src='/ISALUD/imagenes/fotos/cargando.gif' alt='cargando'  onerror="this.src='../imagenes/fotos/cargando.gif'" >  </div>
        <iframe onload="oculta_img_c()" id="result_carga_pac" name="result_carga_pac" src="" style="border-width:0px;width:90%;height:300px">
        </iframe>
      </center>    
    </body>
</html>
