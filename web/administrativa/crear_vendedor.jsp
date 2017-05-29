<%-- 
    Document   : crear_vendedor
    Created on : 14/03/2013, 02:58:27 PM
    Author     : EMMANUEL
--%>
<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <script type="text/javascript" language="javascript">
           $('#nuevo_vendedor').submit(function() {
                                                       
                               if($("#nombres_vend").val().length < 1) { 
                                                        document.getElementById('alertas_vendedor').innerHTML = "<h2 style='color:red'>Los nombres es obligatorio</h2><br>  ";
                                                       return false;  
                                                                      } 
                          else if($("#nombres_vend").val().length > 399) { 
                                                        document.getElementById('alertas_vendedor').innerHTML = "<h2 style='color:red'>Los nombres tienen como maximo 399 caracteres</h2><br>  ";
                                                       return false;  
                                                                      } 
                         else if($("#apellidos_vend").val().length < 1) { 
                                                        document.getElementById('alertas_vendedor').innerHTML = "<h2 style='color:red'>Los apellidos son obligatoria</h2><br>  ";
                                                       return false;  
                                                                      } 
                          else if($("#apellidos_vend").val().length > 399) { 
                                                        document.getElementById('alertas_vendedor').innerHTML = "<h2 style='color:red'>Los apellidos tienen como maximo 399 caracteres</h2><br>  ";
                                                       return false;  
                                                                      }
                          else if($("#cedula_vend").val().length > 44) { 
                                                        document.getElementById('alertas_vendedor').innerHTML = "<h2 style='color:red'>La cedula tiene como maximo 44 caracteres</h2><br>  ";
                                                       return false;  
                                                                      }  
                         else if($("#telefono_vend").val().length > 199) { 
                                                        document.getElementById('alertas_vendedor').innerHTML = "<h2 style='color:red'>El telefono tiene como maximo 199 caracteres</h2><br>  ";
                                                       return false;  
                                                                      }
                         else if($("#celular_vend").val().length > 199) { 
                                                        document.getElementById('alertas_vendedor').innerHTML = "<h2 style='color:red'>El celular tiene como maximo 199 caracteres</h2><br>  ";
                                                       return false;  
                                                                      }
                         else if($("#direccion_vend").val().length > 399) { 
                                                        document.getElementById('alertas_vendedor').innerHTML = "<h2 style='color:red'>La direccion tiene como maximo 399 caracteres</h2><br>  ";
                                                       return false;  
                                                                      }                                             
                    // Enviamos el formulario usando AJAX
               //     alert("dgdfgfdg");
                          $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              
                              success: function(data) {
                                  $('#alertas_vendedor').html(data);
                                  document.getElementById("nombres_vend").value="";
                                  document.getElementById("apellidos_vend").value="";
                                  document.getElementById("cedula_vend").value="";
                                  document.getElementById("telefono_vend").value="";
                                  document.getElementById("celular_vend").value="";
                                  document.getElementById("direccion_vend").value="";
                                  //borrar los campos cuando crre
                                }                             
                          })
                     
                          return false;
                      });      
      </script>       
    </head>
    <body>
          <% 
            request.setCharacterEncoding("UTF-8");
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }%>
        <br>
        <center><div name="alertas_vendedor" id="alertas_vendedor"></div></center>
        <form name="nuevo_vendedor" id="nuevo_vendedor" action="nuevo_vendedor.jsp" method="post">
        <center>
        <div style="width: 80%;text-align:left">
        <label>Distribuidores</label>  &nbsp;&nbsp;  
        <select id="cod_distribuidor" name="cod_distribuidor">
             <%
                            conecta_bd ba = new conecta_bd();
                            ba.ConectaDb(); 

                            String sql="select id_distri,nombre from distribuidores order by nombre;";

                             ResultSet resu=null;
                             try{  resu=ba.consultas(sql);
                                   while (resu.next()&&resu!=null) {  
                                        out.print("<option value='"+resu.getString(1)+"'>"+resu.getString(2)+"</option>");
                                                                    }
                                 }                       
                             catch(SQLException ex){}
                             catch(Exception exe){}
                             ba.cierraResultado(resu); 
                             ba.cerrar();                             
                        %>    
        </select>
        </div>     <br>  
        <fieldset style="text-align:left;width:80%">
            <legend>Datos del vendedor</legend>   
            <table style="width:100%" >
            <tr>
                <td>
                    <label>Nombres:</label>   
                </td>
                <td style="padding-left:20px">
                    <label>Apellidos:</label>
                </td>
                <td style="padding-left:20px">
                    <label>Cedula:</label>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="nombres_vend" id="nombres_vend" maxlength="399"  style="width:100%">  
                </td>
                <td style="padding-left:20px">
                    <input type="text" name="apellidos_vend" id="apellidos_vend" maxlength="399"  style="width:100%"> 
                </td>
                <td style="padding-left:20px">
                    <input type="text" name="cedula_vend" id="cedula_vend" maxlength="44"  style="width:100%"> 
                </td>
            </tr>  
            <tr>
                <td>
                    <label>Telefono:</label>   
                </td>
                <td colspan="2" style="padding-left:20px">
                    <label>Celular:</label>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="telefono_vend" id="telefono_vend" maxlength="199"  style="width:100%">  
                </td>
                <td colspan="2" style="padding-left:20px">
                    <input type="text" name="celular_vend" id="celular_vend" maxlength="199" style="width:100%"> 
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <label>Direccion:</label>
                </td>
            </tr>
             <tr>
                 <td colspan="3">
                    <input type="text" name="direccion_vend" id="direccion_vend" maxlength="399"  style="width:100%"> 
                </td>
            </tr>
        </table>
        </fieldset><br>
        <input type="submit" value="crear" id="aceptar" name="aceptar">
        </center>   
        </form>
    </body>
    
</html>
