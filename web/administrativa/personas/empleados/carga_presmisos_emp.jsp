<%-- 
    Document   : carga_presmisos_emp
    Created on : 24/04/2013, 09:46:53 PM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" language="javascript">
           function poneretiraper(id,estado,serial){
               //estado si 1 para otorgar si 0 para revocar
               if (document.getElementById(""+id+"_ck").checked) {
                       $("#divresult").load("personas/empleados/cambia_per.jsp?estado=1&serial="+serial+"&id="+id+"");
                          }
                 else { $("#divresult").load("personas/empleados/cambia_per.jsp?estado=0&serial="+serial+"&id="+id+""); }
                         
                   setTimeout('muestramen()',200);       
                        
                         
           }
           function muestramen(){
                        var dat=document.getElementById('resultado').value;
                   //     alert(dat);
                        document.getElementById('validacioneperso').innerHTML = ''+dat+'';
                        $("#dialogperso").dialog( "open" );
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
          
          String serial=request.getParameter("dato");
     %>
        
           <form name="formpermisos" id="formpermisos" method="post">
               <fieldset>
                
         <legend>Permisos</legend>
         <center>
             <table>  
                 <tr>
                     <td>
                         <div name="divresult" id="divresult">
                                      <input type="hidden" name="resultado" id="resultado" value="">
                         </div>
                     </td>
                 </tr>
             <%  
                                  
                         String sql6="select id_permi,descripcion from permisos pe where (pe.id_permi != 9 and pe.id_permi!=8 and pe.id_permi != 14 and pe.id_permi != 15 and pe.id_permi != 13 and pe.id_permi != 11);";
                         int bandc=0;
                         
                             ResultSet resu6=null;
                             try{  resu6=ba.consultas(sql6);
                                   while (resu6.next()&&resu6!=null) { 
                                       if(resu6.getString(1).compareTo("11")==0||resu6.getString(2).compareTo("Ingenieros")==0){}
                                        else{
                                            if(bandc==0){out.print("<tr>");}

                                            /// aca veo si tien el permiso para chequearlo
                                            String sq="select count(id_permi) from permiso_empleado where serial_empleado='"+serial+"' and id_permi='"+resu6.getString(1)+"'";
                                            ///
                                            int cat=0;
                                            ResultSet resuper=null;
                                               try{  resuper=ba.consultas(sq);
                                                    while (resuper.next()&&resuper!=null) {cat=Integer.parseInt(""+resuper.getString(1)+""); }}
                                               catch(SQLException ex){}
                                               catch(Exception exe){}
                                            ba.cierraResultado(resuper);

                                            if(cat==0){out.print("<td><input type='checkbox' name='"+resu6.getString(1)+"_ck' id='"+resu6.getString(1)+"_ck' value='"+resu6.getString(2)+"'  onchange="+'"'+"poneretiraper('"+resu6.getString(1)+"','"+resu6.getString(2)+"','"+serial+"')"+'"'+"><label>"+resu6.getString(2)+"</label></td>");}
                                                 else{out.print("<td><input type='checkbox' name='"+resu6.getString(1)+"_ck' id='"+resu6.getString(1)+"_ck' value='"+resu6.getString(2)+"'  onchange="+'"'+"poneretiraper('"+resu6.getString(1)+"','"+resu6.getString(2)+"','"+serial+"')"+'"'+"checked><label>"+resu6.getString(2)+"</label></td>");}

                                            if(bandc==3){out.print("</tr>");bandc=-1;}                         
                                               bandc++;
                                        }
                                        
                                                                      }
                                 }                       
                             catch(SQLException ex){}
                             catch(Exception exe){}
                             if(bandc==1||bandc==2||bandc==0){out.print("</tr>");}
                             ba.cierraResultado(resu6);
                ba.cerrar();                              
            %>  
            </table>
         </center > 
        </fieldset>
            </form>
    </body>
</html>
