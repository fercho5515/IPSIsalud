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
             p {
               font-size: 10px  
             }
             label {
               font-size: 10px  
             }
             h3 {
               font-size: 12px  
             }
         </style>
         <%
         request.setCharacterEncoding("UTF-8");
         
         String codc=""+request.getParameter("cod_con");
      //   String resultaaa=""+request.getParameter("dato");
         
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb(); 
         
         String sqlt="select co.fecha as fecha,c.descripcion as descripcion from agenda a,procedimientos_tari p,cups c,consulta_psico co where a.id_procedimiento=p.idprocedimientos_tari and p.cod_cups=c.id_cups and co.id_consulta=a.id_consulta and co.id_consulta = "+codc+"  and (a.id_permiso='5' or a.id_permiso='14')";
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
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            } 
        
         



          // 1 visita   
          // 2 consulta
          // 3 evolucion
        
        
            String cons_sql="select "
                            +"    id_consulta,"
                            +"     actitud_psicologia,"
                            +"     ap.descripcion,"
                            +"     pronostico,"
                            +"     mot_consulta,"
                            +"     desusupadienfer,"
                            +"     historia_familiar,"
                            +"     aspectos_psico_enf,"
                            +"     porte_actidud,"
                            +"     conciencia,"
                            +"     humor_afectividad,"
                            +"     caracteristicas_lenguaje,"
                            +"     senso_percepcion,"
                            +"     pensamiento,"
                            +"     alteracion_ritmos,"
                            +"     juicio,"
                            +"     memoria,"
                            +"     atencion,"
                            +"     psicomotricidad,"
                            +"     postulacion_trat,"
                            +"     observacionesc,"
                            +"     fecha,"
                            +"     id_profecional,"
                            +"     facturado,"
                            +"     id_tipo,"
                            +"     guardado,"
                            +"     per.p_nom,"
                            +"     per.s_nom,"
                            +"     per.p_ape,"
                            +"     per.s_ape,"
                            +"     emp.registro_prof,"
                            +"     cp.id_historia,"
                            +"     actitudtext"
                            +" from consulta_psico as cp left join actitud_psicologia as ap on (cp.actitud_psicologia=ap.id)"
                            +"                          inner join personas as per on (cp.id_profecional=per.serial )"
                            +"                          left join empleados emp on (per.serial=emp.serial_empleado)     " 
                            +"     WHERE `id_consulta`='"+codc+"' ";
            
         //   out.print(cons_sql);
            
            ResultSet resu2=null;
           try{  resu2=ba.consultas(cons_sql);}
           catch(Exception e){}
           
          
            String datos2[]=new String[34];
            
            for(int i=0;i<18;i++){ datos2[i]="";  }
            
         
	   try{
	        while (resu2.next()&&resu2!=null) {   
                         if(resu2.getString(1)!=null){datos2[0]=resu2.getString(1);}//id_consulta
                         if(resu2.getString(2)!=null){datos2[1]=resu2.getString(2);}//actitud_psicologia
                         if(resu2.getString(3)!=null){datos2[2]=resu2.getString(3);}//ap.descripcion
                         if(resu2.getString(4)!=null){datos2[3]=resu2.getString(4);}//pronostico
                         if(resu2.getString(5)!=null){datos2[4]=resu2.getString(5);}//mot_consulta
                         if(resu2.getString(6)!=null){datos2[5]=resu2.getString(6);}//desusupadienfer
                         if(resu2.getString(7)!=null){datos2[6]=resu2.getString(7);}//historia_familiar
                         if(resu2.getString(8)!=null){datos2[7]=resu2.getString(8);}//aspectos_psico_enf
                         if(resu2.getString(9)!=null){datos2[8]=resu2.getString(9);}//porte_actidud
                         if(resu2.getString(10)!=null){datos2[9]=resu2.getString(10);}//conciencia
                         if(resu2.getString(11)!=null){datos2[10]=resu2.getString(11);}//humor_afectividad
                         if(resu2.getString(12)!=null){datos2[11]=resu2.getString(12);}//senso_percepcion
                         if(resu2.getString(13)!=null){datos2[12]=resu2.getString(13);}//pensamiento
                         if(resu2.getString(14)!=null){datos2[13]=resu2.getString(14);}//alteracion_ritmos
                         if(resu2.getString(15)!=null){datos2[14]=resu2.getString(15);}//juicio
                         if(resu2.getString(16)!=null){datos2[15]=resu2.getString(16);}//memoria                          
                         if(resu2.getString(17)!=null){datos2[16]=resu2.getString(17);}//atencion                     
                         if(resu2.getString(18)!=null){datos2[17]=resu2.getString(18);}// psicomotricidad                    
                         if(resu2.getString(19)!=null){datos2[18]=resu2.getString(19);}//                    
                         if(resu2.getString(20)!=null){datos2[19]=resu2.getString(20);}// postulacion_trat                    
                         if(resu2.getString(21)!=null){datos2[20]=resu2.getString(21);}// observacionesc                   
                         if(resu2.getString(22)!=null){datos2[21]=resu2.getString(22);}//  fecha                     
                         if(resu2.getString(23)!=null){datos2[22]=resu2.getString(23);}//  id_profecional                  
                         if(resu2.getString(24)!=null){datos2[23]=resu2.getString(24);}// facturado                     
                         if(resu2.getString(25)!=null){datos2[24]=resu2.getString(25);}//  id_tipo                  
                         if(resu2.getString(26)!=null){datos2[25]=resu2.getString(26);}// guardado                    
                         if(resu2.getString(27)!=null){datos2[26]=resu2.getString(27);}// per.p_nom                 
                         if(resu2.getString(28)!=null){datos2[27]=resu2.getString(28);}// per.s_nom              
                         if(resu2.getString(29)!=null){datos2[28]=resu2.getString(29);}// per.p_ape            
                         if(resu2.getString(30)!=null){datos2[29]=resu2.getString(30);}// per.s_ape        
                         if(resu2.getString(31)!=null){datos2[30]=resu2.getString(31);}// emp.registro_prof     
                         if(resu2.getString(32)!=null){datos2[31]=resu2.getString(32);}// idhistoria     
                         if(resu2.getString(33)!=null){datos2[32]=resu2.getString(33);}// actitudtext
                           }
              }
              catch(SQLException ex){}
              catch(Exception exe){}
             ba.cierraResultado(resu2);
         
         //////////////////////////
             //////////////////////7
         
         String sql="select p_nom,s_nom,p_ape,s_ape,id_person,fecha_naci,pa.cod_estado_civil,nivel_sisben,pe.genero,pe.id_rh,";
            sql=sql+"mu.descripcion, de.descripcion,barrio,pe.direccion,pe.email,pe.telefono,ne.descripcion,eps.nombre,nu_carnet,";
            sql=sql+"pa.cod_zona,pe.foto,pa.id_orientacion,pa.vih,tu.descripcion,tid.descripcion  from personas pe, pacientes pa,departamento de, municipio mu,tipo_usuario tu,";
            sql=sql+"nivel_educativo ne,eps,tipo_id tid where pa.serial_persona=pe.serial and pa.id_tipo_usuario=tu.id_tipo_usuario and  pe.serial='"+datos2[31]+"' ";
            sql=sql+"and tid.idtipo_id=pe.tipo_id ";
            sql=sql+"and mu.id_muni=pe.id_muni and de.id_departo=pe.id_depto and mu.id_depto=de.id_departo ";
            sql=sql+"and ne.id_nivel=pa.id_nivel_educativo ";
            sql=sql+"and eps.ideps=pe.id_eps;";
        
            ResultSet resu=null;
          try{  resu=ba.consultas(sql);}
          catch(Exception e){}
           
          
            String datos[]=new String[25];
            
            for(int i=0;i<25;i++){
                datos[i]="";
            }
            
         
	try{
	    while (resu.next()&&resu!=null) {   
                         if(resu.getString(1)!=null){datos[0]=resu.getString(1);}//primer nonbre
                         if(resu.getString(2)!=null){datos[1]=resu.getString(2);}//segundo nombre
                         if(resu.getString(3)!=null){datos[2]=resu.getString(3);}//primer apellido
                         if(resu.getString(4)!=null){datos[3]=resu.getString(4);}//segundo apellido
                         if(resu.getString(5)!=null){datos[4]=resu.getString(5);}//cedula
                         if(resu.getString(6)!=null){datos[5]=resu.getString(6);}//fecha nacimiento
                         if(resu.getString(7)!=null){datos[6]=resu.getString(7);}//estado civil
                         if(resu.getString(8)!=null){datos[7]=resu.getString(8);}//nivel sisven
                         if(resu.getString(9)!=null){datos[8]=resu.getString(9);}//genero
                         if(resu.getString(10)!=null){datos[9]=resu.getString(10);}//rh
                         if(resu.getString(11)!=null){datos[10]=resu.getString(11);}//municipio
                         if(resu.getString(12)!=null){datos[11]=resu.getString(12);}//departamento
                         if(resu.getString(13)!=null){datos[12]=resu.getString(13);}//barrio
                         if(resu.getString(14)!=null){datos[13]=resu.getString(14);}//direccion
                         if(resu.getString(15)!=null){datos[14]=resu.getString(15);}//email
                         if(resu.getString(16)!=null){datos[15]=resu.getString(16);}//telefono
                         if(resu.getString(17)!=null){datos[16]=resu.getString(17);}//nivel educativo
                         if(resu.getString(18)!=null){datos[17]=resu.getString(18);}//eps
                         if(resu.getString(19)!=null){datos[18]=resu.getString(19);}//numero carnet
                         if(resu.getString(20)!=null){datos[19]=resu.getString(20);}//zona
                         if(resu.getString(21)!=null){datos[20]=resu.getString(21);}//foto
                         if(resu.getString(22)!=null){datos[21]=resu.getString(22);}//orientacion sexual
                         if(resu.getString(23)!=null){datos[22]=resu.getString(23);}//vih
                         if(resu.getString(24)!=null){datos[23]=resu.getString(24);}//tipo usuario
                         if(resu.getString(25)!=null){datos[24]=resu.getString(25);}//tipo identificacion
                     }
        }
        catch(SQLException ex){}
	catch(Exception exe){}
         
        
            
        ba.cierraResultado(resu); 
%>      <center>
        <div style="width:90%"> 
            
            <center><h3><% out.print(tit); %></h3>
                                
            <center><h3 style="border: 1px solid;width:100%">Datos Profesional</h3></center>
            <p  style='text-align:justify'><b>Nombre:&nbsp;</b><% out.print(datos2[26]+" "+datos2[27]+" "+datos2[28]+" "+datos2[29]); %>  &nbsp;&nbsp;&nbsp;&nbsp;<b style="padding-left: 50px">Registro medico:&nbsp;</b><% out.print(datos2[30]); %> </p> 
        <%
         
             if(datos2[9].compareTo("1")==0){out.print("<center><h3 style='border: 1px solid;width:100%'>Visita por psicológia</h3></center>"); }
        else if(datos2[9].compareTo("2")==0){out.print("<center><h3 style='border: 1px solid;width:100%'>Consulta psicológica</h3></center>"); }
        else if(datos2[9].compareTo("3")==0){out.print("<center><h3 style='border: 1px solid;width:100%'>Evolución psicológica</h3></center>"); }
            %>
            
            <center><h3 style="border: 1px solid;width:100%">Datos Consulta</h3></center>
            <p style='text-align:justify'><b>Motivo de Consulta</b><br><%= datos2[4] %></p>
            <p style='text-align:justify'><b>Actitud ante el encuentro inicial: <%= datos2[2] %></b><br><%= datos2[32]%> </p>
            <p style='text-align:justify'><b>Descripción del usuario ante el padecimiento de la enfermedad:</b><br><%= datos2[5]%> </p>
            <p style='text-align:justify'><b>Historia Personal y Familiar:</b><br><%= datos2[6]%> </p>
            <p style='text-align:justify'><b>Aspectos Psicológicos de la enfermedad:</b><br><%= datos2[7]%> </p>
            
            <center><h3 style="border: 1px solid;width:100%">Examen mental</h3></center>
            
            <p style='text-align:justify'><b>Porte y actitud:</b><br><%= datos2[8]%> </p>
            <p style='text-align:justify'><b>Consciencia:</b><br><%= datos2[9]%> </p>
            <p style='text-align:justify'><b>Humor y afectividad:</b><br><%= datos2[10]%> </p>
            <p style='text-align:justify'><b>Características del lenguaje:</b><br><%= datos2[11]%> </p>
            <p style='text-align:justify'><b>Senso - percepción:</b><br><%= datos2[12]%> </p>
            <p style='text-align:justify'><b>Pensamiento:</b><br><%= datos2[13]%> </p>
            <p style='text-align:justify'><b>Alteración de ritmos Vitales (Sueño, sexualidad, conducta alimentaria):</b><br><%= datos2[14]%> </p>
            <p style='text-align:justify'><b>Juicio:</b><br><%= datos2[15]%> </p>
            <p style='text-align:justify'><b>Memoria:</b><br><%= datos2[16]%> </p>
            <p style='text-align:justify'><b>Atención:</b><br><%= datos2[17]%> </p>
            <p style='text-align:justify'><b>Psicomotricidad:</b><br><%= datos2[18]%> </p>
            
            
            
            
            
            
            
            <%/*
         if(datos2[9].compareTo("1")==0 || datos2[9].compareTo("2")==0 ){ out.print(" "); }    
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
        */
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
        
        
            <p style='text-align:justify'><b>Pronostico:</b><br><%= datos2[3]%> </p>
            <p style='text-align:justify'><b>Plan de manejo:</b><br><%= datos2[19]%> </p>
            <p style='text-align:justify'><b>Observaciones:</b><br><%= datos2[20]%> </p>
        
        
        </div>
        <% ba.cerrar(); %>    
    </body>
</html>
