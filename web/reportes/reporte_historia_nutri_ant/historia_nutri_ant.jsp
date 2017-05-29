<%-- 
    Document   : historia_medica_ant
    Created on : 10/11/2013, 05:03:57 PM
    Author     : servidor
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
               font-size: 10px  
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
               font-size: 12px  
             }
         </style>
         <%
         request.setCharacterEncoding("UTF-8");
         
         String cod_paciente=""+request.getParameter("id_paci");
       //  String permi=""+request.getParameter("permi");
         
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb(); 
       
         String titu="";
      /*   if(permi.compareTo("1")==0){titu="Historia Clinica de Enfermeria";}
         else if(permi.compareTo("2")==0){titu="Historia Clinica de Medicina General";}
         else if(permi.compareTo("3")==0){titu="Historia Clinica de Medicina Interna";} */
         titu="Historia Clinica de Nutrición";
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
            
            <center><h1  style="border: 1px solid;width:100%"><% out.print(titu); %></h1>
                                
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
                <input type="image" name="fo" size="25" id="fo" src="../../imagenes/fotos/<% out.print(datos[20]); %>" alt="Pintura geométrica"  onerror="this.src='../../imagenes/fotos/paciente.png'" style="width:auto;height:150px">
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
                String adadcita="";
                try{adadcita=s.edad(fechanaci);}catch(Exception e){}

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
             </div>
            <br>
            
          <%  
           
            String sqlc="select id_consulta from consulta_nutri where id_historia='"+cod_paciente+"' and guardado='1' order by fecha";
            ResultSet resuc=null;
           int conut=0;
                        try{  resuc=ba.consultas(sqlc);
                              while (resuc.next()&&resuc!=null) {  
                                               out.print("<div id='contenedor_consulta_"+conut+"'></div><br> ");
                                               out.print("<script type='text/javascript'>$(\"#contenedor_consulta_"+conut+"\").load(\"consulta_nutri_ant.jsp?cod_con="+resuc.getString(1)+"\");</script>");
                                               conut=conut+1;
                                                                     }
                           }                       
                        catch(SQLException ex){}
                        catch(Exception exe){}
                        ba.cierraResultado(resuc); 
          
          %>
           
      
          </center>     
           <% ba.cerrar(); %>    
    </body>
</html>

