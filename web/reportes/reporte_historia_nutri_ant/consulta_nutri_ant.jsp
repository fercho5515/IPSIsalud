<%-- 
    Document   : muestra_reportes
    Created on : 19/05/2013, 12:22:32 PM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="../../imagenes/fotos/favicon.ico">
         <style type="text/css">
         </style>
         <%
         request.setCharacterEncoding("UTF-8");
         
         String codc=""+request.getParameter("cod_con");
      //   String resultaaa=""+request.getParameter("dato");
         
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb(); 
         
         String sqlt="select co.fecha as fecha,c.descripcion as descripcion from agenda a,procedimientos_tari p,cups c,consulta_nutri co where a.id_procedimiento=p.idprocedimientos_tari and p.cod_cups=c.id_cups and co.id_consulta=a.id_consulta and co.id_consulta = "+codc+" and a.id_permiso='4'";
         String tit="";
            ResultSet resu0=null;
           try{  resu0=ba.consultas(sqlt);}
           catch(Exception e){}
           try{
	        while (resu0.next()&&resu0!=null) {   
                        tit=""+resu0.getString(2)+" realizada "+resu0.getString(1);//mot consulta
                          }
              }
              catch(SQLException ex){}
              catch(Exception exe){}
             ba.cierraResultado(resu0);
            out.print("<title>"+tit+"</title>");
       %>
        
    </head>
   <!-- <body style="background-color:#e4f1fb"> -->
   <body style="font-family: 'Arial', serif; ">    
        <% 
        //  out.print("nom "+session.getAttribute("nombre")+" clave "+session.getAttribute("clave")+" id "+session.getAttribute("id")+" permiso "+session.getAttribute("permiso")+" s agenda "+session.getAttribute("serial_agenda" )+" s paciente"+session.getAttribute("serial_pacinete"));
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null  ){
          
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            } 
        
         



          // 1 visita   
          // 2 consulta
          // 3 evolucion
        
        
            String cons_sql="select id_historia,p.p_nom,p.s_nom,p.p_ape,p.s_nom,e.registro_prof from consulta_nutri c,personas p,empleados e where c.profecional=p.serial and e.serial_empleado=p.serial and id_consulta='"+codc+"' ";
            
            //out.print(cons_sql);
            
            ResultSet resu2=null;
           try{  resu2=ba.consultas(cons_sql);}
           catch(Exception e){}
           
          String cod_paciente=""; 
          String nombreprof="";
          String registro_prof="";                             
         
	   try{
	        while (resu2.next()&&resu2!=null) {   
                         if(resu2.getString(1)!=null){cod_paciente=resu2.getString(1);}
                         if(resu2.getString(2)!=null){nombreprof=resu2.getString(2);}
                         if(resu2.getString(3)!=null){nombreprof=nombreprof+" "+resu2.getString(3);}
                         if(resu2.getString(4)!=null){nombreprof=nombreprof+" "+resu2.getString(4);}
                         if(resu2.getString(5)!=null){nombreprof=nombreprof+" "+resu2.getString(5);}
                         if(resu2.getString(6)!=null){registro_prof=resu2.getString(6);}
                                                   }
              }
              catch(SQLException ex){}
              catch(Exception exe){}
             ba.cierraResultado(resu2);
         
         //////////////////////////
             //////////////////////7
         
       
%>      <center>
        <div style="width:90%"> 
            
            <center><h3><% out.print(tit); %></h3>
                                
            </center>
            
            <center><h3 style="border: 1px solid;width:100%">Datos Profesional</h3></center>
           <p  style='text-align:justify'><b>Nombre:&nbsp;</b><% out.print(nombreprof); %>  &nbsp;&nbsp;&nbsp;&nbsp;<b style="padding-left: 50px">Registro medico:&nbsp;</b><% out.print(registro_prof); %> </p> 
    
           <center><h3 style="border: 1px solid;width:100%">Datos de Consulta</h3></center><br>
           <center><h3 style="border: 1px solid;width:100%">Signos Fisicos de Desnutricion</h3></center>
           
          <!--  <p style='text-align:justify'><b>Signos Fisicos de Desnutricion</b></p> -->
            <%
               String sqlsig="(select sig.descripcion as d1,sub.decripcion as d2,h.coment as d3 from histo_subsig h,signos_desnu sig,sub_signos sub where h.id_sub_sig=sub.id_sub_signos and sub.id_signos=sig.id_signos and h.id_consulta='"+codc+"') "
                            +"union " 
                            +"(select sig.descripcion as d1,sub.decripcion as d2,\"No\" as d3 from signos_desnu sig,sub_signos sub where sub.id_signos=sig.id_signos and sub.id_sub_signos not in (select sub.id_sub_signos from histo_subsig h,signos_desnu sig,sub_signos sub where h.id_sub_sig=sub.id_sub_signos and sub.id_signos=sig.id_signos and h.id_consulta='"+codc+"')) "
                            +"order by d1,d2";
              
                out.print("<table style='width:95%'>"); 
                String sigtemp="";
                int cont=0;                                             
               ResultSet reslsig=null;
               try{  reslsig=ba.consultas(sqlsig);
                   while (reslsig.next()&&reslsig!=null) {  
                            if(cont==0){out.print("<tr>");}
                                if(reslsig.getString(1).compareTo(sigtemp)!=0){
                                       sigtemp=reslsig.getString(1);
                                       if(cont==0){out.print("<td>");}
                                       else if(cont==3){out.print("</ul></td></tr><tr><td>");cont=0;}
                                       else{out.print("</ul></td><td>");}
                                       out.print("<center><label><b>"+sigtemp+"</b></label> </center>");
                                       out.print("<ul>");                                       
                                       cont++;      
                                                                                    
                                                                              }
                            out.print("<li type='disc'><b>"+reslsig.getString(2)+":</b> "+reslsig.getString(3)+"</li>");             
                            
                            
                                
                                                        }
                  }                       
               catch(SQLException ex){}
               catch(Exception exe){}
               ba.cierraResultado(reslsig);  
                out.print("</ul></td></tr></table>");
                
                ///////////////////////////////
                ///////////////////////////////
                ///////////////////////////////
             String sqlcons="select sist_musc_atro,esque_rosa_cost,caract_gen,desayuno,refrigerio1,almuerzo,refrigerio2,comida,complementario,al_favoritos,al_rechazados,comple_al,cual,peso,altura,pcefalico,interpre_peso_ed,interpre_tall_ed,interpre_peso_talla,interpre_imc,recomendaciones,observaciones,observaciones_menu,diesta_menu from consulta_nutri c where id_consulta='"+codc+"' ";                       
           
                  ResultSet resuco=null;
          try{  resuco=ba.consultas(sqlcons);}
          catch(Exception e){}
           
          
            String datos2[]=new String[24];
            
            for(int i=0;i<24;i++){
                datos2[i]="";
            }
            
         
	try{
	    while (resuco.next()&&resuco!=null) {   
                         if(resuco.getString(1)!=null){ String a=resuco.getString(1);
                                                        if(a.compareTo("1")==0){datos2[0]="Si";}
                                                        else{datos2[0]="No";}}//Atrofia Muscular
                         if(resuco.getString(2)!=null){String a=resuco.getString(2);
                                                        if(a.compareTo("1")==0){datos2[1]="Si";}
                                                        else{datos2[1]="No";}}//Rosario Costal	
                         if(resuco.getString(3)!=null){datos2[2]=resuco.getString(3);}//Caracteristicas Generales
                         if(resuco.getString(4)!=null){datos2[3]=resuco.getString(4);}//Desayuno
                         if(resuco.getString(5)!=null){datos2[4]=resuco.getString(5);}//Refrigerio1:
                         if(resuco.getString(6)!=null){datos2[5]=resuco.getString(6);}//Almuerzo:
                         if(resuco.getString(7)!=null){datos2[6]=resuco.getString(7);}//Refrigerio2:
                         if(resuco.getString(8)!=null){datos2[7]=resuco.getString(8);}//Comida:
                         if(resuco.getString(9)!=null){datos2[8]=resuco.getString(9);}//Complemento:
                         if(resuco.getString(10)!=null){datos2[9]=resuco.getString(10);}//Alimentos Favoritos:
                         if(resuco.getString(11)!=null){datos2[10]=resuco.getString(11);}//Alimentos Rechazados:
                         if(resuco.getString(12)!=null){datos2[11]=resuco.getString(12);
                                                        String a=resuco.getString(12);
                                                        if(a.compareTo("1")==0){datos2[11]="Si";}
                                                        else{datos2[11]="No";}}//Participa en programa de complementacion alimentaria
                         if(resuco.getString(13)!=null && resuco.getString(12).compareTo("1")==0){
                                                          datos2[12]="<b>Cual?</b>&nbsp;";
                                                          if(resuco.getString(13).compareTo("1")==0){datos2[12]=datos2[12]+" Donacion barrio ";}
                                                          else if(resuco.getString(13).compareTo("2")==0){datos2[12]=datos2[12]+" Donacion iglesia";}
                                                          else{datos2[12]=datos2[12]+" Otro";}}//cual
                         if(resuco.getString(14)!=null){datos2[13]=resuco.getString(14);}//Peso Actual(kg):
                         if(resuco.getString(15)!=null){datos2[14]=resuco.getString(15);}//Longitud Actual(cm):	
                         if(resuco.getString(16)!=null){datos2[15]=resuco.getString(16);}//P. Cefalico(cm)
                         if(resuco.getString(17)!=null){datos2[16]="No refiere";
                                                        String sqldiag="select descripcion from sub_cie10 where id_subcie10='"+resuco.getString(17)+"'";
                                                        ResultSet resurhd=null;
                                                        try{  resurhd=ba.consultas(sqldiag);
                                                              while (resurhd.next()&&resurhd!=null) {  
                                                                   datos2[16]=""+resuco.getString(17)+" - "+resurhd.getString(1);
                                                                                                                   }
                                                            }                       
                                                        catch(SQLException ex){datos2[16]="No refiere";}
                                                        catch(Exception exe){datos2[16]="No refiere";}
                                                        ba.cierraResultado(resurhd);  
                                                        }//Interpretacion 1
                         else{datos2[16]="No refiere";}
                         if(resuco.getString(18)!=null){datos2[17]="No refiere";
                                                        String sqldiag="select descripcion from sub_cie10 where id_subcie10='"+resuco.getString(18)+"'";
                                                        ResultSet resurhd=null;
                                                        try{  resurhd=ba.consultas(sqldiag);
                                                              while (resurhd.next()&&resurhd!=null) {  
                                                                   datos2[17]=""+resuco.getString(18)+" - "+resurhd.getString(1);
                                                                                                                   }
                                                            }                       
                                                        catch(SQLException ex){datos2[17]="No refiere";}
                                                        catch(Exception exe){datos2[17]="No refiere";}
                                                        ba.cierraResultado(resurhd);  
                                                        }//Interpretacion 1
                         else{datos2[17]="No refiere";}//Interpretacion 2
                         if(resuco.getString(19)!=null){datos2[18]="No refiere";
                                                        String sqldiag="select descripcion from sub_cie10 where id_subcie10='"+resuco.getString(19)+"'";
                                                        ResultSet resurhd=null;
                                                        try{  resurhd=ba.consultas(sqldiag);
                                                              while (resurhd.next()&&resurhd!=null) {  
                                                                   datos2[18]=""+resuco.getString(19)+" - "+resurhd.getString(1);
                                                                                                                   }
                                                            }                       
                                                        catch(SQLException ex){datos2[18]="No refiere";}
                                                        catch(Exception exe){datos2[18]="No refiere";}
                                                        ba.cierraResultado(resurhd);  
                                                        }//Interpretacion 1
                         else{datos2[18]="No refiere";}//Interpretacion 3
                         if(resuco.getString(20)!=null){datos2[19]="No refiere";
                                                        String sqldiag="select descripcion from sub_cie10 where id_subcie10='"+resuco.getString(20)+"'";
                                                        ResultSet resurhd=null;
                                                        try{  resurhd=ba.consultas(sqldiag);
                                                              while (resurhd.next()&&resurhd!=null) {  
                                                                   datos2[19]=""+resuco.getString(20)+" - "+resurhd.getString(1);
                                                                                                                   }
                                                            }                       
                                                        catch(SQLException ex){datos2[19]="No refiere";}
                                                        catch(Exception exe){datos2[19]="No refiere";}
                                                        ba.cierraResultado(resurhd);  
                                                        }//Interpretacion 1
                         else{datos2[19]="No refiere";}//Interpretacion 4
                         if(resuco.getString(21)!=null){datos2[20]=resuco.getString(21);}//RECOMENDACIONES
                         if(resuco.getString(22)!=null){datos2[21]=resuco.getString(22);}//OBSERVACIONES
                         if(resuco.getString(23)!=null){datos2[22]=resuco.getString(23);}//Comentario:
                         if(resuco.getString(24)!=null){datos2[23]=resuco.getString(24);}//Dieta:
                     }
        }
        catch(SQLException ex){}
	catch(Exception exe){}      
                 ba.cierraResultado(resuco);    
                     
                     
            %>
            <br>
            <label><b>Atrofia Muscular:</b> &nbsp; <% out.print(datos2[0]); %> </label><label style="padding-left:50px"><b>Rosario Costal:</b> &nbsp; <% out.print(datos2[1]); %></label>
            <p  style='text-align:justify'>
                <b>Caracteristicas Generales:(signos de maltrato,descuido etc)</b><br>
                <% out.print(datos2[2]); %>
            </p>
            <br>
           <center><h3 style="border: 1px solid;width:100%">Recordatorio de 24 Horas</h3></center>
            <table style='width:100%' border="0">
                <tr>
                    <td style="width:120px"><label><b>Desayuno:</b></label></td>
                    <td><p  style='text-align:justify;width:95%'><% out.print(datos2[3]); %></p></td>
                </tr>                    
                <tr>    
                    <td ><label><b>Refrigerio1:</b></label></td>
                    <td><p  style='text-align:justify;width:95%'><% out.print(datos2[4]); %></p></td>
                </tr>                    
                <tr>     
                    <td ><label><b>Almuerzo:</b></label></td>
                    <td><p  style='text-align:justify;width:95%'><% out.print(datos2[5]); %></p></td>
                </tr>                    
                <tr>     
                    <td ><label><b>Refrigerio2:</b></label></td>
                    <td><p  style='text-align:justify;width:95%'><% out.print(datos2[6]); %></p></td>
                </tr>                    
                <tr>     
                    <td ><label><b>Comida:</b></label></td>
                    <td><p  style='text-align:justify;width:95%'><% out.print(datos2[7]); %></p></td>
                </tr>                    
                <tr>     
                    <td ><label><b>Complemento:</b></label></td>
                    <td><p  style='text-align:justify;width:95%'><% out.print(datos2[8]); %></p></td>
                </tr>                    
                <tr>     
                    <td ><label><b>Alimentos Favoritos:</b></label></td>
                    <td><p  style='text-align:justify;width:95%'><% out.print(datos2[9]); %></p></td>
                </tr>                    
                <tr>     
                    <td ><label><b>Alimentos Rechazados:</b></label></td>
                    <td><p  style='text-align:justify;width:95%'><% out.print(datos2[10]); %></p></td>
                </tr>
            </table>  
            <br>
            <label>Participa en programa de complementacion alimentaria? <% out.print(datos2[11]+"  "+datos2[12]); %></label>
            <br>
            <center><h3 style="border: 1px solid;width:100%">Componente Antropometrico</h3></center>
           
            <table style="width:50%">
                   <tr>
                       <td><label><b>Peso Actual(kg):</b></label></td>
                       <td><label><% out.print(datos2[13]); %></label></td>
                       <td style="padding-left:50px"><label><b>Longitud Actual(cm):</b></label></td>
                       <td><label><% out.print(datos2[14]); %></label></td>
                       <td style="padding-left:50px"><label><b>P. Cefalico(cm):</b></label></td>
                       <td><label><% out.print(datos2[15]); %></label></td>
                   </tr>
            </table> <br>
            <table style="width:100%" border="1">
                   <tr>
                       <td style="width:20%;text-align:center"><label><b>Indicador: Ref.NCHS</b></label></td>
                       <td style="width:10%;text-align:center"><label><b>D.E.</b></label></td>
                       <td style="width:10%;text-align:center"><label><b>Valor p 50</b></label></td>
                       <td style="width:10%;text-align:center"><label><b>Percentil</b></label></td>
                       <td style="width:50%;text-align:center"><label><b>Interpretacion Indicador</b></label></td>
                   </tr>
                   <tr>
                       <td style="text-align:center"><label>Peso/Edad</label></td>
                       <td style="text-align:center"><label></label></td>
                       <td style="text-align:center"><label></label></td>
                       <td style="text-align:center"><label></label></td>
                       <td><label><% out.print(datos2[16]); %></label></td>
                   </tr>
                   <tr>
                       <td style="text-align:center"><label>Talla/Edad</label></td>
                       <td style="text-align:center"><label></label></td>
                       <td style="text-align:center"><label></label></td>
                       <td style="text-align:center"><label></label></td>
                       <td><label><% out.print(datos2[17]); %></label></td>
                   </tr>
                   <tr>
                       <td style="text-align:center"><label>Peso/Talla</label></td>
                       <td style="text-align:center"><label></label></td>
                       <td style="text-align:center"><label></label></td>
                       <td style="text-align:center"><label></label></td>
                       <td><label><% out.print(datos2[18]); %></label></td>
                   </tr>
                   <tr>
                       <td style="text-align:center"><label>ICM para < > 9años</label></td>
                       <td style="text-align:center"><label></label></td>
                       <td style="text-align:center"><label></label></td>
                       <td style="text-align:center"><label></label></td>
                       <td><label><% out.print(datos2[19]); %></label></td>
                   </tr>
            </table>
            <br>
            <p  style='text-align:justify'>
                <b>RECOMENDACIONES</b><br>
                <% out.print(datos2[20]); %>
            </p>
            <p  style='text-align:justify'>
                <b>OBSERVACIONES</b><br>
                <% out.print(datos2[21]); %>
            </p>
             <center><h3 style="border: 1px solid;width:100%">Menu</h3></center>
          <%
          
            String sqlmenu="select h.descripcion,c.descripcion,m.cantidad from menu_comida m,hora_comida h,comida c where c.id_comida=m.id_comida and h.id_hora_comida=c.id_hora_comida and m.id_consulta_nutri='"+codc+"' order by h.id_hora_comida,c.descripcion";


                out.print("<table style='width:95%'>"); 
                sigtemp="";
                cont=0;                                             
                ResultSet reslsig2=null;
               try{  reslsig2=ba.consultas(sqlmenu);
                   while (reslsig2.next()&&reslsig2!=null) {  
                            if(cont==0){out.print("<tr>");}
                                if(reslsig2.getString(1).compareTo(sigtemp)!=0){
                                       sigtemp=reslsig2.getString(1);
                                       if(cont==0){out.print("<td>  ");}
                                       else if(cont==3){out.print("</ul></td></tr><tr><td>");cont=0;}
                                       else{out.print("</ul></td><td>");}
                                       out.print("<center><label><b>"+sigtemp+"</b></label> </center>");
                                       out.print("<ul>");                                       
                                       cont++;      
                                                                                    
                                                                              }
                            out.print("<li type='disc'><b>"+reslsig2.getString(2)+":</b> "+reslsig2.getString(3)+"</li>");             
                            
                            
                                
                                                        }
                  }                       
               catch(SQLException ex){}
               catch(Exception exe){}
               ba.cierraResultado(reslsig2);  
                out.print("</ul></td></tr></table>");

                
                
           %>	
            <br>
            <p  style='text-align:justify'>
                <b>Comentario:</b><br>
                <% out.print(datos2[22]); %>
            </p>
            <p  style='text-align:justify'>
                <b>Dieta:</b><br>
                <% out.print(datos2[23]); %>
            </p>			
            
             </div>
            </center>   
           <% ba.cerrar(); %>    
    </body>
</html>
