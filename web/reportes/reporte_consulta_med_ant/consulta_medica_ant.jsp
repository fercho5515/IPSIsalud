<%-- 
    Document   : consulta_medica_ant
    Created on : 8/11/2013, 12:34:07 PM
    Author     : Fercho
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
         <script src="../../jquery/bajados/jquery.min.js" type="text/javascript"></script> 
         <script src="../../jquery/bajados/jquery-ui.min.js" type="text/javascript"></script> 
        
         <link rel="shortcut icon" href="../../imagenes/fotos/favicon.ico">
         <style type="text/css">
             p {
               font-size: 10px;
               margin: -1px 5px;
             }
             label {
               font-size: 10px  
             }
             ul{
               font-size: 10px  
             }
             li{
               font-size: 10px  
             }
             input{font-size: 9px}
             td label{font-size: 9px}
             td {font-size: 9px}
             select{font-size: 9px}
             h3 {
               font-size: 12px;
               margin: 2px;    
             }
         </style>
         <%
         request.setCharacterEncoding("UTF-8");
         
         String codc=""+request.getParameter("cod_con");
      //   String resultaaa=""+request.getParameter("dato");
         
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb(); 
         
         String sqlt="select co.fecha as fecha,c.descripcion as descripcion,DATE_FORMAT(co.fecha, '%Y-%m-%d') as fechac,a.id_paciente from agenda a,procedimientos_tari p,cups c,consulta_medica co where co.id_consulta=a.id_consulta and a.id_procedimiento=p.idprocedimientos_tari and p.cod_cups=c.id_cups  and co.id_consulta = '"+codc+"' and (a.id_permiso='1' or a.id_permiso='2' or a.id_permiso='3');";
         String tit="";
         String fechacon="";
         String id_paciente="";
            ResultSet resu0=null;
           try{  resu0=ba.consultas(sqlt);}
           catch(Exception e){}
           try{
	        while (resu0.next()&&resu0!=null) {   
                        tit=""+resu0.getString(2)+" ingresada "+resu0.getString(1);//mot consulta
                        fechacon = resu0.getString(3);
                        id_paciente = resu0.getString(4);
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
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null   ){
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
            String cons_sql="select serial_historia,p.p_nom,p.s_nom,p.p_ape,p.s_ape,e.registro_prof from consulta_medica c,personas p,empleados e where c.id_medico=p.serial and e.serial_empleado=p.serial and id_consulta='"+codc+"' ";
            
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
      
        
         String sql="select p_nom,s_nom,p_ape,s_ape,id_person,fecha_naci,pa.cod_estado_civil,nivel_sisben,pe.genero,pe.id_rh,";
            sql=sql+"mu.descripcion, de.descripcion,barrio,pe.direccion,pe.email,pe.telefono,ne.descripcion,eps.nombre,nu_carnet,";
            sql=sql+"pa.cod_zona,pe.foto,pa.id_orientacion,pa.vih,tu.descripcion,tid.descripcion  from personas pe, pacientes pa,departamento de, municipio mu,tipo_usuario tu,";
            sql=sql+"nivel_educativo ne,eps,tipo_id tid where pa.serial_persona=pe.serial and pa.id_tipo_usuario=tu.id_tipo_usuario and  pe.serial='"+cod_paciente+"' ";
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
            
            <center>
                <input type="image"  id="sds" src="logo.png" style="max-width:500px;width: 100%;">
            </center>
            <center><h3><% out.print(tit); %></h3>
                                
                <h3 style="border: 1px solid;width:100%">DATOS PERSONALES</h3></center>
            <table  style="width:100%" border="0">
            <tr>
            <td style="width:20%">
            <label for="nombre1"><b>Primer Nombre</b> </label>
            </td>

            <td style="width:20%">
            <label for="nombre2"><b>Segundo Nombre </b></label>
            </td>

            <td style="width:20%">
            <label for="apellido1"><b>Primer Apellido </b></label>
            </td>

            <td style="width:20%">
            <label for="apellido2"><b>Segundo Apellido </b></label>
            </td>

            <td style="width:20%" rowspan="6">
                <input type="image" name="fo" size="25" id="fo" src="../../imagenes/fotos/<% out.print(datos[20]); %>" alt="Pintura geométrica"  onerror="this.src='../../imagenes/fotos/paciente.png'" style="width:auto;height:80px">
            </td>
            </tr>

            <!--Segunda Fila-->

            <tr>
            <td style="width:20%">
                <label><% out.print(datos[0]); %></label>
            </td>

            <td style="width:20%">
                <label><% out.print(datos[1]); %></label>
            </td>

            <td style="width:20%">
                <label><% out.print(datos[2]); %></label>
            </td>

            <td style="width:20%">
               <label><% out.print(datos[3]); %></label>
            </td>

            </tr>

            <!--Tercera Fila-->

            <tr>

            <td style="width:20%">
                <label for="numidentificacion"><b><% out.print(datos[24]); %></b></label>
            </td>

            <td style="width:20%">
            <label for="fechanacimiento"><b>Fecha de Nacimiento </b></label>
            </td>

            <td style="width:20%">
            <label for="edad"><b>Edad</b> </label>
            </td>

            <td style="width:20%">
            <label for="estadocivil"><b>Estado Civil </b></label>
            </td>
            </tr>

            <!--Cuarta Fila-->

            <tr>
            <td style="width:20%">
            <label><% out.print(datos[4]); %></label>
            </td>

            <td style="width:20%">
            <label><% out.print(datos[5]); %></label>
            </td>

            <td style="width:20%">
                <%  String fechanaci =datos[5]; 
                edad s = new edad();
                String adadcita=s.edad(fechanaci);

            %>
            <label><% out.print(adadcita); %></label>
            </td>

            <td style="width:20%">
                  <% 
                        String sql55="select idestado_civil,descripcion from estado_civil;";
                           String estadociv="";
                        ResultSet resu55=null;
                        try{  resu55=ba.consultas(sql55);
                              while (resu55.next()&&resu55!=null) {  
                                  if(datos[6].compareTo(resu55.getString(1))==0){ estadociv=resu55.getString(2);}
                                                                     }
                           }                       
                        catch(SQLException ex){}
                        catch(Exception exe){}
                        ba.cierraResultado(resu55);  
                     %>
                    <label><% out.print(estadociv); %></label>       
            </td>
            </tr>

            <!--Quinta Fila-->

            <tr>

            <td style="width:20%">
                <label for="nivelsisben"><b>Nivel Sisben</b> </label>
            </td>

            <td style="width:20%">
            <label for="sexo"><b>Sexo</b> </label>
            </td>

            <td style="width:20%">
            <label for="rh"><b>RH </b></label>
            </td>

            <td style="width:20%">
            <label for="orientacionsexual"><b>Orientacion Sexual </b></label>
            </td>

            </tr>

            <!--Sexta Fila-->

            <tr>
            <td style="width:20%">
            <label><% out.print(datos[7]); %></label>
            </td>

            <td style="width:20%">
            <label><% out.print(datos[8]); %></label>
            </td>

            <td style="width:20%">
            <!-- <input type="text" name="rh" size="25" id="rh" maxlength="30" disabled="disabled"  value="<% //out.print(datos[9]); %>" style="width:95%"> -->
             <%    
                                         String sql2="select id_rh,descripcion from rh;";
                                         String rhanter="";
                                         ResultSet resurh=null;
                                         try{  resurh=ba.consultas(sql2);
                                               while (resurh.next()&&resurh!=null) {  
                                                   if(datos[9].compareTo(resurh.getString(1))==0){ rhanter=""+resurh.getString(2);}
                                                                                                    }
                                             }                       
                                         catch(SQLException ex){}
                                         catch(Exception exe){}
                                         ba.cierraResultado(resurh);  
                                    %>        
            <label><% out.print(rhanter); %></label>
            </td>

            <td style="width:20%">
                      <% 
                        String sql7="select id_sex,descripcion from oreintacion_sex;";
                        String sex="";
                        ResultSet resuoris=null;
                        try{  resuoris=ba.consultas(sql7);
                              while (resuoris.next() && resuoris!=null) {  
                                  if(datos[21].compareTo(resuoris.getString(1))==0){sex=""+resuoris.getString(2);}
                                                                      }
                           }                       
                        catch(SQLException ex){}
                        catch(Exception exe){}
                        ba.cierraResultado(resuoris);  
                     %>
                     <label><% out.print(sex); %></label>
                   </td>
            </tr>

            <!--Septima Fila-->

            <tr>

            <td style="width:20%">
                <label for="departamento"><b>Departamento</b> </label>
            </td>

            <td style="width:20%">
            <label for="ciudad"><b>Ciudad</b> </label>
            </td>

            <td style="width:40%" colspan="2">
            <label for="direccion"><b>Direccion</b></label>
            </td>
            
            <td>
            <label for="barrio"><b>Barrio</b> </label>
            </td>
            </tr>

            <!--Octava Fila-->

            <tr>
            <td style="width:20%">
                <label><% out.print(datos[11]); %></label>
            </td>

            <td style="width:20%">
                <label><% out.print(datos[10]); %></label>
            </td>

            <td style="width:40%" colspan="2">
                <label><% out.print(datos[13]); %></label>
            </td>
            
            <td>
                <label><% out.print(datos[12]); %></label>
            </td>
            </tr>
            </table>
        
           
          
          <!--  <p style='text-align:justify'><b>Signos Fisicos de Desnutricion</b></p> -->
            <%
               
                ///////////////////////////////
                ///////////////////////////////
                ///////////////////////////////
                                   //40
           String sqlcons="select anamnesis,enf_actual,revision_por_sistemas,tension_alta,tension_baja,f_cardiaca"
                  +",f_respiratoria,temperatura,peso,talla,conducta_recomen,paraclinicos,subjetivo,plan,"
                  +"sr,sp,pdd_fecha,pdd_resultado,vih_fecha_diag,vih_estadio_inicial,vih_estadio_actual,vih_infecciones_oportunistas,"
                  +"rcv,recomienda_autocuidado,recomienda_alimentacion,recomienda_signos_alarma,recomienda_cuidados_gen,recomienda_adherencia,"
                  +"incapacidad,incapacidad_tiempo,incapacidad_texto,acompana_nombre,acompana_telefono,sintomaticopiel,sintomaticorepi,"
                  +"conducta,"
                  + "id_permiso_profecional from"
                  + " consulta_medica where id_consulta='"+codc+"'";
         
           ResultSet resuco=null;
          try{  resuco=ba.consultas(sqlcons);}
          catch(Exception e){}
           
          
            String datos2[]=new String[37];
            
            for(int i=0;i<37;i++){
                datos2[i]="";
            }
            
         
	try{
	    while (resuco.next()&&resuco!=null) {   
                         if(resuco.getString(1)!=null){datos2[0]=resuco.getString(1);}//motivo de consulta
                         if(resuco.getString(2)!=null){datos2[1]=resuco.getString(2);}//enf_actual	
                         if(resuco.getString(3)!=null){datos2[2]=resuco.getString(3);}//revision_por_sistemas
                         if(resuco.getString(4)!=null){datos2[3]=resuco.getString(4);}//tension_alta
                         if(resuco.getString(5)!=null){datos2[4]=resuco.getString(5);}//tension_baja
                         if(resuco.getString(6)!=null){datos2[5]=resuco.getString(6);}//f_cardiaca
                         if(resuco.getString(7)!=null){datos2[6]=resuco.getString(7);}//f_respiratoria
                         if(resuco.getString(8)!=null){datos2[7]=resuco.getString(8);}//temperatura
                         if(resuco.getString(9)!=null){datos2[8]=resuco.getString(9);}//peso
                         if(resuco.getString(10)!=null){datos2[9]=resuco.getString(10);}//talla
                         if(resuco.getString(11)!=null){datos2[10]=resuco.getString(11);}//conducta_recomen
                         if(resuco.getString(12)!=null){datos2[11]=resuco.getString(12);}//paraclinicos
                         if(resuco.getString(13)!=null){datos2[12]=resuco.getString(13);}//subjetivo
                         if(resuco.getString(14)!=null){datos2[13]=resuco.getString(14);}//plan
                         if(resuco.getString(15)!=null){datos2[15]=resuco.getString(15);}//sr
                         if(resuco.getString(16)!=null){datos2[16]=resuco.getString(16);}//sp
                         if(resuco.getString(17)!=null){datos2[17]=resuco.getString(17);}//pdd_fecha
                         if(resuco.getString(18)!=null){datos2[18]=resuco.getString(18);}//pdd_resultado
                         if(resuco.getString(19)!=null){datos2[19]=resuco.getString(19);}//vih_fecha_diag
                         if(resuco.getString(20)!=null){datos2[20]=resuco.getString(20);}//vih_estadio_inicial
                         if(resuco.getString(21)!=null){datos2[21]=resuco.getString(21);}//vih_estadio_actual
                         if(resuco.getString(22)!=null){datos2[22]=resuco.getString(22);}//vih_infecciones_oportunistas
                         if(resuco.getString(23)!=null){datos2[23]=resuco.getString(23);}//rcv
                         if(resuco.getString(24)!=null){datos2[24]=resuco.getString(24);}//recomienda_autocuidado
                         if(resuco.getString(25)!=null){datos2[25]=resuco.getString(25);}//recomienda_alimentacion
                         if(resuco.getString(26)!=null){datos2[26]=resuco.getString(26);}//recomienda_signos_alarma
                         if(resuco.getString(27)!=null){datos2[27]=resuco.getString(27);}//recomienda_cuidados_gen
                         if(resuco.getString(28)!=null){datos2[28]=resuco.getString(28);}//recomienda_adherencia
                         if(resuco.getString(29)!=null){datos2[29]=resuco.getString(29);}//incapacidad
                         if(resuco.getString(30)!=null){datos2[30]=resuco.getString(30);}//incapacidad_tiempo
                         if(resuco.getString(31)!=null){datos2[31]=resuco.getString(31);}//incapacidad_texto
                         if(resuco.getString(32)!=null){datos2[32]=resuco.getString(32);}//acompana_nombre
                         if(resuco.getString(33)!=null){datos2[33]=resuco.getString(33);}//acompana_telefono
                         if(resuco.getString(34)!=null){datos2[34]=resuco.getString(34);}//sintomaticopiel
                         if(resuco.getString(35)!=null){datos2[35]=resuco.getString(35);}//sintomaticorepi
                         if(resuco.getString(36)!=null){datos2[36]=resuco.getString(36);}//conducta
                         if(resuco.getString(36)!=null){datos2[14]=resuco.getString(36);}//permiso
                      }
        }
        catch(SQLException ex){}
	catch(Exception exe){}      
                 ba.cierraResultado(resuco);    
                     
                 
                    Float pe=(float)0;
                    try{  pe =Float.parseFloat(datos2[8]); }catch(Exception e){pe=(float)0;}                  
                    
                    Float ta=(float)0;
                    try{  ta =Float.parseFloat(datos2[9]); }catch(Exception e){ta=(float)0;}
                    
                    
                    Float imc=pe/((ta/100)*(ta/100));
                    String imcs=String.format("%.2f", imc);
                    String est="";
                     if(imc < 16){   est="Delgadez severa";}
                    else if(imc < 16.99){est="Delgadez moderada";}
                    else if(imc < 18.49){est="Delgadez no muy pronunciada";}
                    else if(imc < 24.99){est="Normal";}
                    else if(imc < 29.99){est="Preobeso";}
                    else if(imc < 34.99){est="Obeso tipo I";}
                    else if(imc < 39.99){est="Obeso tipo II";}
                    else if(imc >= 40){est="Obeso tipo III";}
                     
            %>
        <h3 style='text-align:justify'>Acompañante</h3>
        <p style='text-align:justify;float: left'><b>Nombre: &nbsp;</b><% out.print(datos2[32]); %></p>
        <p style='text-align:justify;float: left'><b>Telefono: &nbsp;</b><% out.print(datos2[33]); %></p><br>
        
        <center><h3 style="border: 1px solid;width:100%">Datos de Consulta</h3></center>
        <!--1.)Anamnesis-->
                
        <center><h3 style="border: 1px solid;width:100%">Anamnesis</h3></center>
        <p style='text-align:justify'><b>Motivo de Consulta: &nbsp;</b><% out.print(datos2[0]); %></p>
        <p style='text-align:justify'><b>Enfermedad Actual: &nbsp;</b><% out.print(datos2[1]); %></p>
        
        <!--2.) Revision por sistemas-->
        
        <center><h3 style="border: 1px solid;width:100%">Revision Por Sistemas</h3></center>
        
        <table style="width:90%">
            <tr>
                <td colspan="2"><p style='text-align:justify'><% out.print(datos2[2]); %></p></td>
            </tr>
            <tr>
                <!--
                <td><label><b>SR: &nbsp;</b><% if(datos2[15]!=null && datos2[15].equals("0")){out.print("NO");}else{out.print("SI");} %></label></td>
                <td><label><b>SP: &nbsp;</b><% if(datos2[16]!=null && datos2[16].equals("0")){out.print("NO");}else{out.print("SI");} %></label></td>
                -->
                <td><label><b>PPD: &nbsp;</b><% out.print(datos2[17]); %> </label></td>
                <td><label><b>Resultado :&nbsp;</b><% out.print(datos2[18]); %> </label></td>
            </tr>
        </table>
        
        <!--3.) Antecedentes-->
        <center><h3 style="border: 1px solid;width:100%">Antecedentes</h3></center>
        <table style="width:90%">
            <tr>
                <td><label><b>Fecha diagnostico: &nbsp;</b><% out.print(datos2[19]); %></label></td>
                <td><label><b>Estadio inicial: &nbsp;</b><% out.print(datos2[20]); %></label></td>
                <td><label><b>Estadio Actual: &nbsp;</b><% out.print(datos2[21]); %> </label></td>
            </tr>
            <tr>
                <td colspan="3"><label><b>Infecciones Oportunistas: &nbsp;</b><% out.print(datos2[22]); %></label></td>
            </tr>
        </table>
        <!--4.)Antecendertes personales-->
                    <center><h3 style="border: 1px solid;width:100%">Antecedentes personales</h3></center>
            <table style="width: 90%;">
            <tr>
                <td><b>Tipo</b></td>
                <td><b>Antecedente</b></td>
                <td><b>Comentario</b></td>
                <td><b>Edad</b></td>
            </tr>
           <%
         ResultSet resuf=null; 
         String sqlf="select a.id_antecedentes_personales,t.descripcion as d1 ,d.descripcion as d2,a.descripcion as d3,a.edad,a.fecha,a.id_empleado,a.id_consulta,a.id_permiso from antecedentes_personales a,tipo_antecedente t,descripcion_antecedente d where a.id_descri_antecedente=d.id_descri_antecedente and (a.id_permiso='3' || a.id_permiso='2' || a.id_permiso='1') and d.id_tipo_antecedente=t.serial and  a.id_consulta='"+codc+"' and a.id_historia_clinica='"+id_paciente+"';";
         resuf=null; 
         try{  resuf=ba.consultas(sqlf);
             while (resuf.next()&&resuf!=null) {
                out.print("<tr>");
                out.print("  <td>"+resuf.getString(2)+"</td>");
                out.print("  <td>"+resuf.getString(3)+"</td>");
                out.print("  <td>"+resuf.getString(4)+"</td>");
                out.print("   <td>"+resuf.getString(5)+"</td>");
                out.print(" </tr>");                            
             }
         }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resuf);
         
        %>
           
            
        </table>
        
           
           <center><h3 style="border: 1px solid;width:100%">Antecedentes familiares</h3></center>
            <table style="width: 90%;">
            <tr>
                <td><b>Parentesco</b></td>
                <td><b>Tipo</b></td>
                <td><b>Antecedente</b></td>
                <td><b>Comentario</b></td>
                <td><b>Vivo</b></td>
            </tr>
           <%
               
         sqlf="select a.id_antecedentes_familiares,p.descripcion as d1,t.descripcion as d2,d.descripcion as d3,a.descripcion as d4, a.vivo,a.id_empleado,a.id_consulta,a.id_permiso from antecedentes_familiares a,parentesco p,descripcion_antecedente d, tipo_antecedente t where a.id_parentesco=p.id_parentesco and  a.id_descri_antecedente=d.id_descri_antecedente and d.id_tipo_antecedente=t.serial and a.id_consulta='"+codc+"' and a.id_historia_clinica='"+id_paciente+"' ;";
         resuf=null; 
         try{  resuf=ba.consultas(sqlf);
             while (resuf.next()&&resuf!=null) {
                out.print("<tr>");
                out.print("  <td>"+resuf.getString(2)+"</td>");
                out.print("  <td>"+resuf.getString(3)+"</td>");
                out.print("  <td>"+resuf.getString(4)+"</td>");
                out.print("   <td>"+resuf.getString(5)+"</td>");
                out.print("   <td>"+resuf.getString(6)+"</td>");
                out.print(" </tr>");                            
             }
         }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resuf);
         
        %>
           
            
        </table>  
           

        <!--6.)Sintomatico-->   
        <center><h3 style="border: 1px solid;width:100%">Sintomatico</h3></center>
        
        <table style="width:90%">
            <tr>
                <td><label><b>Sintomático de piel: &nbsp;</b><% if(datos2[34]!=null && datos2[34].equals("0")){out.print("NO");}else{out.print("SI");} %></label></td>
                <td><label><b>Sintomático respiratorio: &nbsp;</b><% if(datos2[35]!=null && datos2[35].equals("0")){out.print("NO");}else{out.print("SI");} %></label></td>
            </tr>
        </table>
        <!--7.)Examen Fisico-->
        <center><h3 style="border: 1px solid;width:100%">Examen Fisico</h3></center>
        <table style="width:90%">
            <tr>
                <td><label><b>Tension Arterial: &nbsp;</b><% out.print(datos2[3]+" / "+datos2[4]); %></label></td>
                <td><label><b>Frecuencia Cardiaca: &nbsp;</b><% out.print(datos2[5]); %></label></td>
                <td><label><b>Frecuancia Respiratoria: &nbsp;</b><% out.print(datos2[6]); %></label></td>
                <td><label><b>ICM: &nbsp;</b><% out.println(imcs); %> kg/m<sup>2</sup></label></td>
            </tr>
            <tr>
                <td><label><b>Temperatura(°C): &nbsp;</b><% out.print(datos2[7]); %></label></td>
                <td><label><b>Peso(Kg): &nbsp;</b><% out.print(datos2[8]); %></label></td>
                <td><label><b>Talla(Cm): &nbsp;</b><% out.print(datos2[9]); %></label></td>
                <td><label><b>Estado Nutricional: &nbsp;</b><% out.println(est); %> </label></td>
            </tr>
        </table>
        <!--8.)Examen Cefalocaudal-->
        <center><h3 style="border: 1px solid;width:100%">Examen Cefalocaudal</h3></center>
       
        <%  
               if(datos2[14].compareTo("1")==0 || datos2[14].compareTo("2")==0){
                out.print("<center><h3 style='border: 1px solid;width:100%'>Aspecto General</h3></center>");  
                 out.print("<p  style='text-align:justify'>"+datos2[10]+"</p>");
                                                                                     }
        
        
        
        
         out.print("<center>");
         String sqlex="(select p.descripcion as parte,e.dolencia as dolecia from ex_cefalocaudal e,partes_cuerpo p where e.id_parte=p.id_parte and e.id_consulta='"+codc+"') union (select descripcion as parte,'Normal' as dolecia from partes_cuerpo where id_parte not in (select e.id_parte from ex_cefalocaudal e where e.id_consulta='"+codc+"')) order by parte";
         ResultSet resuex=null;
         try{  resuex=ba.consultas(sqlex);
             while (resuex.next()&&resuex!=null) {  
                         out.print("<p  style='text-align:justify'><b>"+resuex.getString(1)+": &nbsp;</b>"+resuex.getString(2)+"</p>");
                                                 }
            }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resuex);
        
         out.print("</center>");   
        
           if(datos2[14].compareTo("3")==0 ){
                out.print("<center><h3 style='border: 1px solid;width:100%'>Paraclinicos</h3></center>");  
                 out.print("<p  style='text-align:justify'>"+datos2[11]+"</p>");
                out.print("<center><h3 style='border: 1px solid;width:100%'>Subjetivo</h3></center>");  
                 out.print("<p  style='text-align:justify'>"+datos2[12]+"</p>");
                                                                                     }
         %>
         
        <!--9.)Diagnosticos-->
                 
        <center><h3 style="border: 1px solid;width:100%">Diagnósticos</h3></center>
        <center>
        <%
         String sqld="select i.id_subcie,s.descripcion,i.descrip,t.descripcion,c.descripcion from impre_diagno i,sub_cie10 s,tipo__diagnostico t,causa_externa c where i.id_subcie=s.id_subcie10 and i.id_tipo_diagnostico=t.idtipodiag and i.causa_externa=c.idcausa and i.id_consulta='"+codc+"' order by control";
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
                  + " </p>");
                
                        c=c+1;                        
                                               }
            }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resud);
        %>
        
        <!--10.)Recomendaciones-->
        <center><h3 style="border: 1px solid;width:100%">RECOMENDACIONES</h3></center>
        
        <table style="width:90%">
            <tr>
                <td><label><b>Auto cuidado: &nbsp;</b><% if(datos2[24]!=null && datos2[24].equals("0")){out.print("NO");}else{out.print("SI");} %></label></td>
                <td><label><b>Alimentación: &nbsp;</b><% if(datos2[25]!=null && datos2[25].equals("0")){out.print("NO");}else{out.print("SI");} %></label></td>
                <td><label><b>Signos de Alarma: &nbsp;</b><% if(datos2[26]!=null && datos2[26].equals("0")){out.print("NO");}else{out.print("SI");} %></label></td>
            </tr>
            <tr>
                <td><label><b>Cuidados generales: &nbsp;</b><% if(datos2[27]!=null && datos2[27].equals("0")){out.print("NO");}else{out.print("SI");} %></label></td>
                <td><label><b>Adherencia: &nbsp;</b><% if(datos2[28]!=null && datos2[28].equals("0")){out.print("NO");}else{out.print("SI");} %></label></td>
            </tr>
        </table>
        
        <!--11.)Conducta-->        
        <center><h3 style="border: 1px solid;width:100%">Conducta</h3></center>
        <p style='text-align:justify'><% out.print(datos2[36]); %></p>
        
        <!--12.)Incapacidad-->        
        <center><h3 style="border: 1px solid;width:100%">Incapacidad</h3></center>
        <p style='text-align:justify'><b><% if(datos2[29]!=null &&  datos2[29].equals("1")){out.print("SI");}else{out.print("NO");} %> &nbsp;</b><% out.print(datos2[31]); %></p>
        
     
            
         <%
         if(datos2[14].compareTo("3")==0 ){
                out.print("<center><h3 style='border: 1px solid;width:100%'>Plan</h3></center>");  
                 out.print("<p  style='text-align:justify'>"+datos2[13]+"</p>");
                                                                                     }
         sqlf="select m.atc as cod_atc,m.producto,m.via_adimin as via_ad,m.forma_farmaceutica as forma_f,concat(m.cantidad,' ',m.unidad_medida) as unioon,fo.cantidad,fo.tiempo_tratamiento,fo.posologia,fo.sub_cie10 from formula_medica fo, medicamentos m where fo.cod_medicamento=m.serial and fo.id_consulta='"+codc+"' ORDER BY fo.serial";
         int ifo=0;
         resuf=null;
         try{  resuf=ba.consultas(sqlf);
             while (resuf.next()&&resuf!=null) { 
                                             if(ifo==0){ifo=1;out.print("<center><h3 style='border: 1px solid;width:100%'>Formula Medica</h3></center>  <center>");}
                                          
                                                out.print("<p  style='text-align:justify'><b>Codigo: &nbsp;</b>"+resuf.getString(1)+"&nbsp;&nbsp;<b>Medicamento:&nbsp;</b>"+resuf.getString(2)+"&nbsp;&nbsp;"
                                                        + "<b>Forma farmaceutica:&nbsp;</b>"+resuf.getString(4)+"<br>"
                                                        + "<b>Concentración:&nbsp;</b>"+resuf.getString(5)+"&nbsp;&nbsp;"
                                                        + "<b>Via administración:&nbsp;</b>"+resuf.getString(3)+"&nbsp;&nbsp;"
                                                        + "<b>Cantidad:&nbsp;</b>"+resuf.getString(6)+"&nbsp;&nbsp;"
                                                        + "<b>Tiempo:&nbsp;</b>"+resuf.getString(7)+"&nbsp;&nbsp;"
                                                        + "<b>Diagnostico:&nbsp;</b>"+resuf.getString(9)+"<br>"
                                                        + "<b>Posologia:&nbsp;</b>"+resuf.getString(8)+"&nbsp;&nbsp;"
                                                        + "</p><br>");
                                                                       
                                               }
            }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resuf);
         if(ifo==1){ out.print("</center>");}
         
         
         ////////////////////////////////////////////////////
         ////////////////////////////////////////////////////
         ////////////////////////////////////////////////////
         
         
         sqlf="SELECT r.anamnesis,r.ex_fisico,r.cod_diag,s.descripcion,r.presuntivo,r.observaciones,e.descripcion from remision_espe r,sub_cie10 s,especialidades e where r.cod_diag=s.id_subcie10 and r.id_especialidad=e.cod_esp and id_consulat='"+codc+"';";
         ifo=0;
         resuf=null; 
         try{  resuf=ba.consultas(sqlf);
             while (resuf.next()&&resuf!=null) { 
                                             if(ifo==0){ifo=1;out.print("<center><h3 style='border: 1px solid;width:100%'>Remision Especialista</h3></center>  <center>");}
                                                out.print("<p  style='text-align:justify'><b>Anamnesis: &nbsp;</b>"+resuf.getString(1)+"</p>");
                                                out.print("<p  style='text-align:justify'><b>Examen Fisico: &nbsp;</b>"+resuf.getString(2)+"</p>");
                                                out.print("<p  style='text-align:justify'><b>Diagnostico: &nbsp;</b>"+resuf.getString(3)+"-"+resuf.getString(4)+"</p>");
                                                out.print("<p  style='text-align:justify'><b>Presuntivo: &nbsp;</b>"+resuf.getString(5)+"</p>");
                                                out.print("<p  style='text-align:justify'><b>Observaciones: &nbsp;</b>"+resuf.getString(6)+"</p>");
                                                out.print("<p  style='text-align:justify'><b>Especialidad a la que remite: &nbsp;</b>"+resuf.getString(7)+"</p><br>");
                                                
                                                                       
                                               }
            }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resuf);
         if(ifo==1){ out.print("</center>");}
         
         ////////////////////////////////////////////////////
         ////////////////////////////////////////////////////
         ////////////////////////////////////////////////////
         
         
         sqlf="select cup_verdadero,descripcion,descri,fecha_soli from labs_sol,cups where id_cups=id_lab  and id_consulta='"+codc+"';";
         ifo=0;
         resuf=null; 
         try{  resuf=ba.consultas(sqlf);
             while (resuf.next()&&resuf!=null) { 
                                             if(ifo==0){ifo=1;out.print("<center><h3 style='border: 1px solid;width:100%'>Laboratorios Solicitados</h3></center>  <center>");}
                                                out.print("<p  style='text-align:justify'><b>Solicitud: &nbsp;</b>"+resuf.getString(1)+"-"+resuf.getString(2)+"</p>");
                                                out.print("<p  style='text-align:justify'><b>Observaciones: &nbsp;</b>"+resuf.getString(3)+"</p><br>");
                                               }
            }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resuf);
         if(ifo==1){ out.print("</center>");}
         
         ////////////////////////////////////////////////////
         ////////////////////////////////////////////////////
         ////////////////////////////////////////////////////
         
         
         sqlf="select cup_verdadero,descripcion,descri from imgs_sol,cups where id_cups=id_img and id_consulta='"+codc+"';";
         ifo=0;
         resuf=null; 
         try{  resuf=ba.consultas(sqlf);
             while (resuf.next()&&resuf!=null) { 
                                             if(ifo==0){ifo=1;out.print("<center><h3 style='border: 1px solid;width:100%'>Imagenes Solicitadas</h3></center>  <center>");}
                                                out.print("<p  style='text-align:justify'><b>Solicitud: &nbsp;</b>"+resuf.getString(1)+"-"+resuf.getString(2)+"</p>");
                                                out.print("<p  style='text-align:justify'><b>Observaciones: &nbsp;</b>"+resuf.getString(3)+"</p><br>");
                                               }
            }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resuf);
         if(ifo==1){ out.print("</center>");}
         
         ////////////////////////////////////////////////////
         ////////////////////////////////////////////////////
         ////////////////////////////////////////////////////
         
         
         sqlf="select cup.cup_verdadero,cup.descripcion,rs.reporte from cups cup,resu_laboratorios rs,consulta_medica c where rs.cod_examen=cup.id_cups and rs.id_consulta=c.id_consulta and c.id_consulta='"+codc+"';";
         ifo=0;
         resuf=null; 
         try{  resuf=ba.consultas(sqlf);
             while (resuf.next()&&resuf!=null) { 
                                             if(ifo==0){ifo=1;out.print("<center><h3 style='border: 1px solid;width:100%'>Resultados de Solicitudes de Laboratorios Anteriores</h3></center>  <center>");}
                                                out.print("<p  style='text-align:justify'><b>Laboratorio: &nbsp;</b>"+resuf.getString(1)+"-"+resuf.getString(2)+"</p>");
                                                out.print("<p  style='text-align:justify'><b>Reporte: &nbsp;</b>"+resuf.getString(3)+"</p><br>");
                                               }
            }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resuf);
         if(ifo==1){ out.print("</center>");}
         
         ////////////////////////////////////////////////////
         ////////////////////////////////////////////////////
         ////////////////////////////////////////////////////
         
         
         sqlf="select cup.cup_verdadero,cup.descripcion,rs.reporte from cups cup,resu_img rs,consulta_medica c where rs.cod_img=cup.id_cups and rs.id_consulta=c.id_consulta and c.id_consulta='"+codc+"';";
         ifo=0;
         resuf=null; 
         try{  resuf=ba.consultas(sqlf);
             while (resuf.next()&&resuf!=null) { 
                                             if(ifo==0){ifo=1;out.print("<center><h3 style='border: 1px solid;width:100%'>Resultados de Solicitudes de Imagenes Anteriores</h3></center>  <center>");}
                                                out.print("<p  style='text-align:justify'><b>Imagen: &nbsp;</b>"+resuf.getString(1)+"-"+resuf.getString(2)+"</p>");
                                                out.print("<p  style='text-align:justify'><b>Reporte: &nbsp;</b>"+resuf.getString(3)+"</p><br>");
                                               }
            }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resuf);
         if(ifo==1){ out.print("</center>");}
         
         ////////////////////////////////////////////////////
         ////////////////////////////////////////////////////
         ////////////////////////////////////////////////////
         
         
         sqlf="select id_soli_no_post from soli_no_post where cod_consulta='"+codc+"';";
         resuf=null; 
         int cont=0;
         try{  resuf=ba.consultas(sqlf);
             while (resuf.next()&&resuf!=null) {
                                       if(cont==0){cont=1;                 
                                            out.print("<center><h3 style='border: 1px solid;width:100%'>Solicitude de Medicamentos no POS</h3></center>  <center>");
                                            out.print("<div id='soli_no_post'></div>");
                                            out.print("<script type='text/javascript'>$(\"#soli_no_post\").load(\"soli_diag_no_post.jsp?id_soli_no_pos="+resuf.getString(1)+"\");</script>");
                                               }
                                       }
            }                       
         catch(SQLException ex){}
         catch(Exception exe){}
         ba.cierraResultado(resuf);
         
        %>
            <center><h3 style="border: 1px solid;width:100%">Plan</h3></center>
           <p  style='text-align:justify'><% out.print(datos2[13]); %> </p> 
           
       
   <%  
if(datos[8].compareTo("Femenino")==0){
     %>  
     
<td>    
<%
 String dato="select gestaciones,partos,cesaria,vaginales,abortos,ectopico,mueren,menarquia,fum,fup,panifica,cual,ultima_citologia,resultado from ante_obstreticos where id_historia_clinica='"+id_paciente+"' and id_consulta='"+codc+"';";
 /// System.out.println("dfd=>"+dato);
  String datosobst[]=new String[14];
 for(int i=0;i<14;i++){datosobst[i]="";}
 int b=0;
  ResultSet resudat=null; 
  resudat=ba.consultas(dato);
  
 
%>


           <center><h3 style="border: 1px solid;width:100%">Antecedentes Obstetricos</h3></center>
<%
   try{
      while (resudat.next()&&resudat!=null) { b++;
         if(resudat.getString(1)!=null && resudat.getString(1).compareTo("null")!=0){datosobst[0]=""+resudat.getString(1);}
         if(resudat.getString(2)!=null && resudat.getString(2).compareTo("null")!=0){datosobst[1]=""+resudat.getString(2);}
         if(resudat.getString(3)!=null && resudat.getString(3).compareTo("null")!=0){datosobst[2]=""+resudat.getString(3);}
         if(resudat.getString(4)!=null && resudat.getString(4).compareTo("null")!=0){datosobst[3]=""+resudat.getString(4);}
         if(resudat.getString(5)!=null && resudat.getString(5).compareTo("null")!=0){datosobst[4]=""+resudat.getString(5);}
         if(resudat.getString(6)!=null && resudat.getString(6).compareTo("null")!=0){datosobst[5]=""+resudat.getString(6);}
         if(resudat.getString(7)!=null && resudat.getString(7).compareTo("null")!=0){datosobst[6]=""+resudat.getString(7);}
         if(resudat.getString(8)!=null && resudat.getString(8).compareTo("null")!=0){datosobst[7]=""+resudat.getString(8);}
         if(resudat.getString(9)!=null && resudat.getString(9).compareTo("null")!=0){datosobst[8]=""+resudat.getString(9);}
         if(resudat.getString(10)!=null && resudat.getString(10).compareTo("null")!=0){datosobst[9]=""+resudat.getString(10);}
         if(resudat.getString(11)!=null && resudat.getString(11).compareTo("null")!=0){datosobst[10]=""+resudat.getString(11);}
         if(resudat.getString(12)!=null && resudat.getString(12).compareTo("null")!=0){datosobst[11]=""+resudat.getString(12);}
         if(resudat.getString(13)!=null && resudat.getString(13).compareTo("null")!=0){datosobst[12]=""+resudat.getString(13);}
         if(resudat.getString(14)!=null && resudat.getString(14).compareTo("null")!=0){datosobst[13]=""+resudat.getString(14);}
         
         %>
<table width="100%">
    <tr>
        <td>
            <label for="gestaciones">Gestaciones:</label>
        </td>
        <td>
            <label ><% out.print(datosobst[0]); %></label>
        </td>
        <td>
            <label for="partos">Partos:</label>
        </td>
        <td>
            <label ><% out.print(datosobst[1]); %></label>
        </td>
        <td>
            <label for="cesareas">Cesareas:</label>
        </td>
        <td>
            <label ><% out.print(datosobst[2]); %></label>
        </td>
        <td>
            <label for="vaginales">Vaginales:</label>
        </td>
        <td>
            <label ><% out.print(datosobst[3]); %></label>
        </td>
    </tr>

<!--segunda fila-->

    <tr>
        <td>
            <label for="m">Muertos:</label>
        </td>
        <td>
            <label ><% out.print(datosobst[6]); %></label>
        </td>
        <td>
            <label for="abortos">Abortos:</label>
        </td>
        <td>
            <label ><% out.print(datosobst[4]); %></label>
        </td>
        <td>
            <label for="e">Ectopicos:</label>
        </td>
        <td>
            <label ><% out.print(datosobst[5]); %></label>
        </td>
        <td>

        </td>
        <td>

        </td>
    </tr>

</table>


<table style="width:  100%;">

    <tr>
        <td width="10%">
            <label for="menarquia">Menarquia:</label>
        </td>
        <td width="19%">
            <label ><% out.print(datosobst[7]); %></label>
        </td>
        <td width="13%">
            <label for="fum">FUM:</label>
        </td>
        <td width="19%">
            <label ><% out.print(datosobst[8]); %></label>
        </td>
        <td width="6%">
            <label for="fup">FUP:</label>
        </td>
        <td  width="19%">
            <label ><% out.print(datosobst[9]); %></label>
        </td>
    </tr>
    <tr>
        <td colspan="6" style="text-align:left;">
            <label for="metodo">Metodo Planificacion:</label>
            <label><%
                                   sql="select * from metodos_anticonceptivos order by id_met_anticon;";    
                                    ResultSet resumac=ba.consultas(sql);
                                    try{
                                        while (resumac.next()&&resumac!=null) {  
                                                  if(datosobst[11].compareTo(""+resumac.getString(1)+"")==0){out.print(""+resumac.getString(2)+"");}                                

                                        }}
                                    catch(SQLException e){}
                                    catch(Exception ex){}
                                    ba.cierraResultado(resumac);

            %></label>
        </td>
    </tr>
</table>

<p style="    text-align: left;"><label>Ultima Citologia: </label><% out.print(datosobst[12]); %> </p>

<p style="    text-align: left;"><label>Resultado: </label><% out.print(datosobst[13]); %> </p>

           
           
           <%
         
         
      }     
  }
  catch(SQLException e){}
  catch(Exception ex){}
  
  try{  ba.cierraResultado(resudat);}catch(Exception ex){}
   b++; 

%>




<% } %>
           
           <center><h3 style="border: 1px solid;width:100%">Datos Profesional</h3></center>
           <p  style='text-align:justify'><b>Nombre:&nbsp;</b><% out.print(nombreprof); %>  &nbsp;&nbsp;&nbsp;&nbsp;<b style="padding-left: 50px">Registro medico:&nbsp;</b><% out.print(registro_prof); %> </p> 
    
           
           <% ba.cerrar(); %>     
    </body>
</html>

