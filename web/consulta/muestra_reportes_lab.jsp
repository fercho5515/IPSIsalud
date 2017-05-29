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
        <title>Reportes</title>
    </head>
    <body style="background-color:#e4f1fb">
        <% request.setCharacterEncoding("UTF-8");
        //  out.print("nom "+session.getAttribute("nombre")+" clave "+session.getAttribute("clave")+" id "+session.getAttribute("id")+" permiso "+session.getAttribute("permiso")+" s agenda "+session.getAttribute("serial_agenda" )+" s paciente"+session.getAttribute("serial_pacinete"));
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){
          
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            } 
         String d="";
         if(session.getAttribute("serial_pacinete")!=null){d=""+session.getAttribute("serial_pacinete");}
         
         String pide=""+request.getParameter("dato2");
         String resultaaa=""+request.getParameter("dato");
         
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb(); 
         
         String sql="select p_nom,s_nom,p_ape,s_ape,id_person,fecha_naci,pa.cod_estado_civil,nivel_sisben,pe.genero,pe.id_rh,";
            sql=sql+"mu.descripcion, de.descripcion,barrio,pe.direccion,pe.email,pe.telefono,ne.descripcion,eps.nombre,nu_carnet,";
            sql=sql+"pa.cod_zona,pe.foto,pa.id_orientacion,pa.vih,tu.descripcion,tid.descripcion  from personas pe, pacientes pa,departamento de, municipio mu,tipo_usuario tu,";
            sql=sql+"nivel_educativo ne,eps,tipo_id tid where pa.serial_persona=pe.serial and pa.id_tipo_usuario=tu.id_tipo_usuario and  pe.serial='"+d+"' ";
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
        <div style="width:75%"> 
        <center><h2>DATOS PERSONALES</h2></center>
        <div id="datos_per" name="datos_per" style="text-align:left">
            <table  style="width:100%" border="0">
            <tr>
            <td style="width:20%">
            <label for="nombre1">Primer Nombre </label>
            </td>

            <td style="width:20%">
            <label for="nombre2">Segundo Nombre </label>
            </td>

            <td style="width:20%">
            <label for="apellido1">Primer Apellido </label>
            </td>

            <td style="width:20%">
            <label for="apellido2">Segundo Apellido </label>
            </td>

            <td style="width:20%" rowspan="6">
                <input type="image" name="fo" size="25" id="fo" src="../imagenes/fotos/<% out.print(datos[20]); %>" alt="Pintura geométrica"  onerror="this.src='../imagenes/fotos/paciente.png'" style="width:auto;height:150px">
            </td>
            </tr>

            <!--Segunda Fila-->

            <tr>
            <td style="width:20%">
                <input type="text" name="nombre1" size="25" id="nombre1" maxlength="30" disabled="disabled" value="<% out.print(datos[0]); %>" style="width:95%">
            </td>

            <td style="width:20%">
            <input type="text" name="nombre2" size="25" id="nombre2" maxlength="30" disabled="disabled"  value="<% out.print(datos[1]); %>" style="width:95%">
            </td>

            <td style="width:20%">
            <input type="text" name="apellido1" size="25" id="apellido1" maxlength="30" disabled="disabled"  value="<% out.print(datos[2]); %>" style="width:95%">
            </td>

            <td style="width:20%">
            <input type="text" name="apellido2" size="25" id="apellido2" maxlength="30" disabled="disabled"  value="<% out.print(datos[3]); %>" style="width:95%">
            </td>

            </tr>

            <!--Tercera Fila-->

            <tr>

            <td style="width:20%">
            <label for="numidentificacion"><% out.print(datos[24]); %></label>
            </td>

            <td style="width:20%">
            <label for="fechanacimiento">Fecha de Nacimiento </label>
            </td>

            <td style="width:20%">
            <label for="edad">Edad </label>
            </td>

            <td style="width:20%">
            <label for="estadocivil">Estado Civil </label>
            </td>
            </tr>

            <!--Cuarta Fila-->

            <tr>
            <td style="width:20%">
            <input type="text" name="numidentificacion" size="25" id="numidentificacion" maxlength="30" disabled="disabled" value="<% out.print(datos[4]); %>" style="width:95%">
            </td>

            <td style="width:20%">
            <input type="text" name="fechanacimiento" size="25" id="fechanacimiento" maxlength="30" disabled="disabled" value="<% out.print(datos[5]); %>" style="width:95%">
            </td>

            <td style="width:20%">
                <%  String fechanaci =datos[5]; 
                edad s = new edad();
                String adadcita=s.edad(fechanaci);

            %>
            <input type="text" name="edad" size="25" id="edad" maxlength="30" disabled="disabled" value="<% out.print(adadcita); %>" style="width:95%">
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
                     <input type="text" name="estado_civilant" id="estado_civilant" value="<% out.print(estadociv); %>" style="width:95%" disabled="disabled">         
            </td>
            </tr>

            <!--Quinta Fila-->

            <tr>

            <td style="width:20%">
            <label for="nivelsisben">Nivel Sisben </label>
            </td>

            <td style="width:20%">
            <label for="sexo">Sexo </label>
            </td>

            <td style="width:20%">
            <label for="rh">RH </label>
            </td>

            <td style="width:20%">
            <label for="orientacionsexual">Orientacion Sexual </label>
            </td>

            </tr>

            <!--Sexta Fila-->

            <tr>
            <td style="width:20%">
            <input type="text" name="nivelsisben" size="25" id="nivelsisben" maxlength="30" disabled="disabled" value="<% out.print(datos[7]); %>">
            </td>

            <td style="width:20%">
            <input type="text" name="sexo" size="25" id="sexo" maxlength="30" disabled="disabled"  value="<% out.print(datos[8]); %>" style="width:95%">
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
            <input type='text' name='rhant' id='rhant' value='<% out.print(rhanter); %>' style="width:95%" disabled="disabled">
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
                     <input type="text" name="orientacion_sexant" id="orientacion_sexant" value="<% out.print(sex); %>" style="width:95%" disabled="disabled"> 
                   </td>
            </tr>

            <!--Septima Fila-->

            <tr>

            <td style="width:20%">
            <label for="departamento">Departamento </label>
            </td>

            <td style="width:20%">
            <label for="ciudad">Ciudad </label>
            </td>

            <td style="width:40%" colspan="2">
            <label for="direccion">Direccion</label>
            </td>
            
            <td>
            <label for="barrio">Barrio </label>
            </td>
            </tr>

            <!--Octava Fila-->

            <tr>
            <td style="width:20%">
            <input type="text" name="departamento" size="25" id="departamento" maxlength="30" disabled="disabled"  value="<% out.print(datos[11]); %>" style="width:95%">
            </td>

            <td style="width:20%">
            <input type="text" name="ciudad" size="25" id="ciudad" maxlength="30" disabled="disabled" value="<% out.print(datos[10]); %>" style="width:95%">
            </td>

            <td style="width:40%" colspan="2">
                <input type="text" name="direccion" size="25" id="direccion" maxlength="30" disabled="disabled" value="<% out.print(datos[13]); %>" style="width:98%">
            </td>
            
            <td>
             <input type="text" name="barrio" size="25" id="barrio" maxlength="30" disabled="disabled" value="<% out.print(datos[12]); %>" style="width:95%">
            </td>
            </tr>
            </table>
        
            <center><h2>DATOS DE LABORATORIO</h2></center>
               <%             String datrs0[] = new String[6];
                        datrs0[0]="";datrs0[1]="";datrs0[2]="";datrs0[3]="";datrs0[4]="";datrs0[5]="";
                        String sqlrs0="select cu.cup_verdadero,cu.descripcion,p_nom,s_nom,p_ape,s_ape,ls.fecha_soli,ls.descri,ls.archi_lab from labs_sol ls,personas p,consulta_medica c,cups cu where ls.id_consulta=c.id_consulta and c.id_medico=p.serial and cu.id_cups=ls.id_lab and ls.serial='"+pide+"'";
                        ResultSet resurs0=null;
                        try{  resurs0=ba.consultas(sqlrs0);
                              while (resurs0.next() && resurs0!=null) {  
                                          if(resurs0.getString(1)!=null && resurs0.getString(1).compareTo("")!=0){datrs0[0]=""+resurs0.getString(1);}
                                          if(resurs0.getString(2)!=null && resurs0.getString(2).compareTo("")!=0){datrs0[1]=""+resurs0.getString(2);}
                                          if(resurs0.getString(3)!=null && resurs0.getString(3).compareTo("")!=0){datrs0[2]=""+resurs0.getString(3);}
                                          if(resurs0.getString(4)!=null && resurs0.getString(4).compareTo("")!=0){datrs0[2]=datrs0[2]+" "+resurs0.getString(4);}
                                          if(resurs0.getString(5)!=null && resurs0.getString(5).compareTo("")!=0){datrs0[2]=datrs0[2]+" "+resurs0.getString(5);}
                                          if(resurs0.getString(6)!=null && resurs0.getString(6).compareTo("")!=0){datrs0[2]=datrs0[2]+" "+resurs0.getString(6);}
                                          if(resurs0.getString(7)!=null && resurs0.getString(7).compareTo("")!=0){datrs0[3]=""+resurs0.getString(7);}
                                          if(resurs0.getString(8)!=null && resurs0.getString(8).compareTo("")!=0){datrs0[4]=""+resurs0.getString(8);}
                                          if(resurs0.getString(9)!=null && resurs0.getString(9).compareTo("")!=0){datrs0[5]=""+resurs0.getString(9);}
                                          }
                              int bl= datrs0[3].indexOf(" ");
                              datrs0[3] = datrs0[3].substring(0,bl);
                           }                       
                        catch(SQLException ex){}
                        catch(Exception exe){}
                        ba.cierraResultado(resurs0);
                       
   %>
            <table border="0"  style="width:100%">
             <tr>
                 <td style="width:5%">
                     <label><b>Codigo:</b></label>
                 </td>
                  <td style="width:10%">
                      <label><% out.print(datrs0[0]); %></label>
                  </td>
                  <td style="width:10%;text-align:right;padding-right:10px;">
                    <label><b>Descripcion</b>:</label>
                  </td>
                  <td style="width:75%;">
                       <label><% out.print(datrs0[1]); %></label>
                  </td>
             </tr>  
           </table>
         <h3>Solicitud</h3>
         <table border="0"  style="width:100%">
             <tr>
                 <td style="width:15%">
                     <label><b>Ordenado por:</b></label>
                 </td>
                  <td style="width:70%">
                      <input type="text" size="25" disabled="disabled" style="width:95%" value="<% out.print(datrs0[2]); %>">
                  </td>
                  <td style="width:5%;text-align:right;padding-right:10px;">
                    <label><b>Fecha:</b></label>
                  </td>
                  <td style="width:10%;">
                      <input type="text" size="25" disabled="disabled" style="width:95%;" value="<% out.print(datrs0[3]); %>">
                  </td>
             </tr> 
             <tr>
                 <td style="width:15%">
                     <label><b>Comentario:</b></label>
                 </td>
                 <td style="width:85%" colspan="3">   
             <label style="text-align:justify"><% out.print(datrs0[4]); %></label>
                 </td>
             </tr>
         </table>
         <h3>Resultado</h3>
         <%             String datrs[] = new String[4];
                        datrs[0]="";datrs[1]="";datrs[2]="";datrs[3]="";
                        String sqlrs="select p_nom,s_nom,p_ape,s_ape,rs.fecha,rs.reporte,rs.ruta from resu_laboratorios rs,personas p,consulta_medica c where rs.id_consulta=c.id_consulta and c.id_medico=p.serial and id_lab='"+resultaaa+"';";
                        ResultSet resurs=null;
                        try{  resurs=ba.consultas(sqlrs);
                              while (resurs.next() && resurs!=null) {  
                                          if(resurs.getString(1)!=null && resurs.getString(1).compareTo("")!=0){datrs[0]=""+resurs.getString(1);}
                                          if(resurs.getString(2)!=null && resurs.getString(2).compareTo("")!=0){datrs[0]=datrs[0]+" "+resurs.getString(2);}
                                          if(resurs.getString(3)!=null && resurs.getString(3).compareTo("")!=0){datrs[0]=datrs[0]+" "+resurs.getString(3);}
                                          if(resurs.getString(4)!=null && resurs.getString(4).compareTo("")!=0){datrs[0]=datrs[0]+" "+resurs.getString(4);}
                                          if(resurs.getString(5)!=null && resurs.getString(5).compareTo("")!=0){datrs[1]=""+resurs.getString(5);}
                                          if(resurs.getString(6)!=null && resurs.getString(6).compareTo("")!=0){datrs[2]=""+resurs.getString(6);}
                                          if(resurs.getString(7)!=null && resurs.getString(7).compareTo("")!=0){datrs[3]=""+resurs.getString(7);}
                                          }
                           }                       
                        catch(SQLException ex){}
                        catch(Exception exe){}
                        ba.cierraResultado(resurs);
   %>
         <table border="0"  style="width:100%">
             <tr>
                 <td style="width:15%">
                     <label><b>Ingresadp por:</b></label>
                 </td>
                  <td style="width:70%">
                      <input type="text" size="25" disabled="disabled" style="width:95%" value="<% out.print(datrs[0]); %>">
                  </td>
                  <td style="width:5%;text-align:right;padding-right:10px;">
                    <label><b>Fecha:</b></label>
                  </td>
                  <td style="width:10%;">
                      <input type="text" size="25" disabled="disabled" style="width:95%;" value="<% out.print(datrs[1]); %>">
                  </td>
             </tr> 
             <tr>
                 <td style="width:15%" colspan="1">
                     <label><b>Analisis:</b></label>
                 </td>
                 <td style="width:85%" colspan="3">   
                 <label style="text-align:justify"><% out.print(datrs[2]); %></label>
                 </td>
             </tr>
         </table>
         </div>   
          <center><h2>Archivos</h2></center>
          <br>
          <%  if(datrs[3]==null || datrs[3].compareTo("")==0 || datrs[3].compareTo("null")==0){
              out.print("<center><h3>No existen archivos subidos por el medico</h3></center>");
              }
              else{%>
            <a href='../archivos/laboratorios/<% out.print(datrs[3]);  %>' >descargar si archivo esta en formato no compatible</a> 
            <div align="center">
            <embed src='../archivos/laboratorios/<% out.print(datrs[3]);  %>' width="100%" height="100%" style="min-height:750px"></embed> 
            </div>
           <% } %>
           <br>
            <%  if(datrs0[5]==null || datrs0[5].compareTo("")==0 || datrs0[5].compareTo("null")==0 || datrs0[5].compareTo("nada")==0){
              out.print("<center><h3>No existen archivos previos relacionados</h3></center>");
             // out.print("<h1>dato:"+datrs0[5]+"</h1>");
              }
              else{%>
            <a href='../archivos/laboratorios/<% out.print(datrs0[5]);  %>' >descargar si archivo esta en formato no compatible</a> 
            <div align="center">
            <embed src='../archivos/laboratorios/<% out.print(datrs0[5]);  %>' width="100%" height="100%" style="min-height:750px"></embed> 
            </div>
           <% } %> 
        </div></center>
        <% ba.cerrar(); %>    
    </body>
</html>
