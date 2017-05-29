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
           /*  p {
               font-size: 10px  
             }
             label {
               font-size: 10px  
             }
             h3 {
               font-size: 12px  
             } */
         </style>
         <%
         request.setCharacterEncoding("UTF-8");
         
         String codc="0";
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb(); 
           
         String sql="select max(id_consulta) from consulta_psico where id_tipo='2' and guardado='3' and id_historia='"+request.getParameter("codpac")+"'";
    
            ResultSet resu=null;
          try{  resu=ba.consultas(sql); 
          
             while (resu.next()&&resu!=null) {   
                       if(resu.getString(1)==null || resu.getString(1).compareTo("null")==0){codc="0";}
                                             else{codc=""+resu.getString(1);}                             
                     }
        }
        catch(SQLException ex){codc="0";}
	catch(Exception exe){codc="0";}
       
        ba.cierraResultado(resu); 
           
       if(codc.compareTo("0")==0){
                         out.println("</head> <body style=\"font-family: 'Arial', serif; \">");    
                         out.println("<br><center><h1>No existen consultas completas anteriores</h1></center>");
                         out.println("</body></html>");
                         return;
                                 }           
         
         String sqlt="select co.fecha as fecha,c.descripcion as descripcion from agenda a,procedimientos_tari p,cups c,consulta_psico co where a.id_procedimiento=p.idprocedimientos_tari and p.cod_cups=c.id_cups and co.id_consulta=a.id_consulta and co.id_consulta = "+codc+"";
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
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){
          
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            } 
        
         



          // 1 visita   
          // 2 consulta
          // 3 evolucion
        
        
            String cons_sql="select mot_consulta,evo_problema,histi_fam_soci,historia_personal,perso_premorvida,examen_mental,pronostico,postu_trata,fecha,id_tipo,per.p_nom,per.s_nom,per.p_ape,per.s_ape,emp.registro_prof,c.id_historia,analisis_descri,familia from consulta_psico c, empleados emp,personas per where c.id_profecional=per.serial and per.serial=emp.serial_empleado and c.id_consulta='"+codc+"' ";
            
            //out.print(cons_sql);
            
            ResultSet resu2=null;
           try{  resu2=ba.consultas(cons_sql);}
           catch(Exception e){}
           
          
            String datos2[]=new String[18];
            
            for(int i=0;i<18;i++){ datos2[i]="";  }
            
         
	   try{
	        while (resu2.next()&&resu2!=null) {   
                         if(resu2.getString(1)!=null){datos2[0]=resu2.getString(1);}//mot consulta
                         if(resu2.getString(2)!=null){datos2[1]=resu2.getString(2);}//evo_problema
                         if(resu2.getString(3)!=null){datos2[2]=resu2.getString(3);}//histo fam soci
                         if(resu2.getString(4)!=null){datos2[3]=resu2.getString(4);}//historia personal
                         if(resu2.getString(5)!=null){datos2[4]=resu2.getString(5);}//personalidad premorvida
                         if(resu2.getString(6)!=null){datos2[5]=resu2.getString(6);}//examen mental
                         if(resu2.getString(7)!=null){datos2[6]=resu2.getString(7);}//pronostico
                         if(resu2.getString(8)!=null){datos2[7]=resu2.getString(8);}//postu trata
                         if(resu2.getString(9)!=null){datos2[8]=resu2.getString(9);}//fecha
                         if(resu2.getString(10)!=null){datos2[9]=resu2.getString(10);}//tipo de consulta
                         if(resu2.getString(11)!=null){datos2[10]=resu2.getString(11);}//primer nom medico
                         if(resu2.getString(12)!=null){datos2[11]=resu2.getString(12);}//segundo nom medico
                         if(resu2.getString(13)!=null){datos2[12]=resu2.getString(13);}//primer apellido medico
                         if(resu2.getString(14)!=null){datos2[13]=resu2.getString(14);}//segundo apellido medico
                         if(resu2.getString(15)!=null){datos2[14]=resu2.getString(15);}//registro profecional medico
                         if(resu2.getString(16)!=null){datos2[15]=resu2.getString(16);}//id de paciente                          
                         if(resu2.getString(17)!=null){datos2[16]=resu2.getString(17);}// analisis_descri                        
                         if(resu2.getString(18)!=null){datos2[17]=resu2.getString(18);}// familia
                           }
              }
              catch(SQLException ex){}
              catch(Exception exe){}
             ba.cierraResultado(resu2);
         
         //////////////////////////
             //////////////////////7
       
%>      
    <center>     <div style="width:98%"> 
            
           <h3><% out.print(tit); %></h3>
                            
               
            <center><h3 style="border: 1px solid;width:100%">Datos Profesional</h3></center>
            <p  style='text-align:justify'><b>Nombre:&nbsp;</b><% out.print(datos2[10]+" "+datos2[11]+" "+datos2[12]+" "+datos2[13]); %>  &nbsp;&nbsp;&nbsp;&nbsp;<b style="padding-left: 50px">Registro medico:&nbsp;</b><% out.print(datos2[14]); %> </p> 
        <%
         
             if(datos2[9].compareTo("1")==0){out.print("<center><h3 style='border: 1px solid;width:100%'>Visita por psicológia</h3></center>"); }
        else if(datos2[9].compareTo("2")==0){out.print("<center><h3 style='border: 1px solid;width:100%'>Consulta psicológica</h3></center>"); }
        else if(datos2[9].compareTo("3")==0){out.print("<center><h3 style='border: 1px solid;width:100%'>Evolución psicológica</h3></center>"); }
            
            
         if(datos2[9].compareTo("1")==0 || datos2[9].compareTo("2")==0 ){ out.print(" <p style='text-align:justify'><b>Motivo de Consulta</b><br>"+datos2[0]+"</p>"); }    
         out.print(" <p style='text-align:justify'><b>Evolucion del Problema</b><br>"+datos2[1]+"</p>");   
         if(datos2[9].compareTo("3")==0 ){ out.print(" <p style='text-align:justify'><b>Análisis descriptivo del paciente ante el padecimiento de la enfermedad</b><br>"+datos2[16]+"</p>"); }    
         if(datos2[9].compareTo("1")==0 ){ out.print(" <p style='text-align:justify'><b>Aspectos psicológicos relacionados con la interacción familiar</b><br>"+datos2[17]+"</p>"); }    
         
                 
         if(datos2[9].compareTo("2")==0 ){ 
             out.print(" <p style='text-align:justify'><b>Historia Familiar y Social</b><br>"+datos2[2]+"</p>");
             out.print(" <p style='text-align:justify'><b>Historia Personal</b><br>"+datos2[3]+"</p>");
             out.print(" <p style='text-align:justify'><b>Actitud del paciente en la consulta</b><br>"+datos2[4]+"</p>");
             out.print(" <p style='text-align:justify'><b>Examen Mental</b><br>"+datos2[5]+"</p>");
             out.print(" <p style='text-align:justify'><b>Pronostico</b><br>"+datos2[6]+"</p>");
             out.print(" <p style='text-align:justify'><b>Postulacion del Tratamiento</b><br>"+datos2[7]+"</p>");
                                         }    
        
 %>        
        
        <center><h3 style="border: 1px solid;width:100%">Diagnósticos</h3></center>
        
        <%
         String sqld="select i.id_subcie,s.descripcion,i.descrip,t.descripcion,c.descripcion from impre_diagno_psico i,sub_cie10 s,tipo__diagnostico t,causa_externa c where i.id_subcie=s.id_subcie10 and i.id_tipo_diagnostico=t.idtipodiag and i.causa_externa=c.idcausa and i.id_consulta_psico='"+codc+"' order by control";
         String diag[] = new String[4];
         diag[0]="Diagnóstico Principal ";
         diag[1]="Diagnóstico Relacionado Uno ";
         diag[2]="Diagnóstico Relacionado Dos ";
         diag[3]="Diagnóstico Relacionado Tres ";
         //out.print(sqld);
         int c=0;
         ResultSet resud=null;
         try{  resud=ba.consultas(sqld);
             while (resud.next()&&resud!=null) {  
                
             
         out.print("<p  style='text-align:justify'><b>"+diag[c]+"</b><br>"
                  + "<b>Codigo:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+resud.getString(1)+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b> Diagnóstico:</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+resud.getString(2)+" <br>"
                  + "<b>Causa externa:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "+resud.getString(5)+"   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b> Tipo de diagnostico:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+resud.getString(4)+" <br>"
                  + "<b>Comentario:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+resud.getString(3)+""
                  + " </p><br>");
                
                        c=c+1;                        
                                               }
            }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resud);
        %>
        
        </div> </center> 
        <% ba.cerrar(); %>    
    </body>
</html>
