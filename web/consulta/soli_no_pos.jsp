<%-- 
    Document   : soli_no_pos
    Created on : 8/07/2013, 10:49:15 AM
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
        <style type="text/css">
                legend{
                           font-family:"Eras Medium ITC";
                           color:#2779aa;
                       font-size:8pt;
                      }
               fieldset{border:0px #2779aa solid;}
               p{padding:0px 0px 0px 0px;
                 font-family:"Eras Medium ITC";
                     color:#2779aa;
                 font-size:8pt;

                }
                #tdp{
                 font-family:"Eras Medium ITC";
                     color:#2779aa;
                 font-size:8pt;
                }                
                #tdp input{
                 font-family:"Eras Medium ITC";
                 color:#2779aa;
                 font-size:8pt;
                }
                #tdp textarea{
                 font-family:"Eras Medium ITC";
                 color:#2779aa;
                 font-size:8pt;
                }
                #titulisoli{
                 font-family:"Eras Medium ITC";
                     color:#2779aa;
                 font-size:16pt;
                }

              .etnia,.despla,.lye{
                           padding:0px 0px 0px 0px;
                   }
              table,td,tr,input,p{padding:0px 0px 0px 0px;}
              #tablap{border:1px #2779aa solid;
                       -webkit-border-radius: 10px;
                       -moz-border-radius: 10px;
                       border-radius: 10px;}
              #tdp{border:1px #2779aa solid;
                  /*   -webkit-border-radius: 10px;
                       -moz-border-radius: 10px;
                       border-radius: 10px;*/
                       }         
              </style>
        <script type="text/javascript">  
            function soli_cargandoo(dato){
                        if(dato==0){ $("#contenido").load("sub_soli_no_post.jsp");}
                   else if(dato==1){ $("#contenido").load("sub_soli_no_post_dos.jsp");}
            }
              function sino_nopos(){var dato=""+document.getElementById("result_form_nopos").value+"";
                  //alert("dato "+dato );
                        if(dato==0){ alert("Falla al realizar solicitud de medicamentos no POS-S");}
                   else if(dato==1){ $("#contenido").load("sub_soli_no_post_dos.jsp");alert("Solicitud de medicamentos no POS-S realizada con exito");}
                                    }
             function sino_nopos2(){var dato=""+document.getElementById("result_form2_nopos").value+"";
                        if(dato==0){ alert("Falla al realizar actualizacion de la solicitud de medicamentos no POS-S");}
                   else if(dato==1){ alert("Solicitud de medicamentos no POS-S actualizada con exito");}
            }       
               function borrasolinposs(){
                               apprise("¿Esta seguro de eliminar la solicitud de medicamentos no POS-S realizada? ", {'verify':true}, function(opcion) {
                                            if(opcion) {  
                                                    $("#respuesta").load("borra_soli_no_poss.jsp");
                                                     setTimeout ('bborasnposs()',400); 
                                                    }
                                           });
                         
            }
            function bborasnposs(){
                        var dato=""+document.getElementById("result_form3_nopos").value+"";
                        if(dato==0){ alert("Falla al borrar solicitud de medicamentos no POS-S ");}
                   else if(dato==1){  $("#contenido").load("sub_soli_no_post.jsp");alert("Solicitud de medicamentos no POS-S borrada con exito");}
                            }
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
        
         String  sqlc="select count(id_soli_no_post) from soli_no_post where cod_consulta='"+session.getAttribute("serial_consulta")+"' ;";
        //System.out.println("consu "+sqlc);  
           ResultSet result=null;
           int cant=0;
          try{  
           result=ba.consultas(sqlc);            
           while (result.next()&&result!=null) { 
                         cant=Integer.parseInt(""+result.getString(1)+"");
                                               }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        ba.cierraResultado(result);  
        ba.cerrar();
     if(cant==0){out.print("<script type='text/javascript'>soli_cargandoo(0);</script>");}//solo guardar
            else{out.print("<script type='text/javascript'>soli_cargandoo(1);</script>");}//actualizar y borrar                 
    %>
    <div id="respuesta" name="respuesta"></div>
    <div id="contenido" name="contenido"></div>
 
 
</html>
