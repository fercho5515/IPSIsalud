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
             ul{
               font-size: 10px  
             }
             li{
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
         
         String sqlt="select co.fecha as fecha,c.descripcion as descripcion from agenda a,procedimientos_tari p,cups c,consulta_trabajo_social co where co.id_consulta_trabajo_social=a.id_consulta and a.id_procedimiento=p.idprocedimientos_tari and p.cod_cups=c.id_cups  and co.id_consulta_trabajo_social = '"+codc+"' and (a.id_permiso='6' or a.id_permiso='15');";
         String tit="";
            ResultSet resu0=null;
           try{  resu0=ba.consultas(sqlt);}
           catch(Exception e){}
           try{
	        while (resu0.next()&&resu0!=null) {   
                        tit=""+resu0.getString(2)+" ingresada "+resu0.getString(1);//mot consulta
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
    <br><center><a href="../../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            } 
        
         



          // 1 visita   
          // 2 consulta
          // 3 evolucion
            String cons_sql="select id_historia,p.p_nom,p.s_nom,p.p_ape,p.s_nom,e.registro_prof from consulta_trabajo_social c,personas p,empleados e where c.id_profecional=p.serial and e.serial_empleado=p.serial and id_consulta_trabajo_social='"+codc+"' ";
            
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
            <center><h3 style="border: 1px solid;width:100%">Datos Profesional</h3></center>
           <p  style='text-align:justify'><b>Nombre:&nbsp;</b><% out.print(nombreprof); %>  &nbsp;&nbsp;&nbsp;&nbsp;<b style="padding-left: 50px">Registro medico:&nbsp;</b><% out.print(registro_prof); %> </p> 
    
           <center><h3 style="border: 1px solid;width:100%">Datos de Consulta</h3></center>
          
          <!--  <p style='text-align:justify'><b>Signos Fisicos de Desnutricion</b></p> -->
            <%
               
                ///////////////////////////////
                ///////////////////////////////
                ///////////////////////////////
                                   //40
           String sqlcons="select id_historia,fecha,id_profecional,ingreso_eco,vivienda,educacion,transporte,salud,otros,"
                   + "cual,vivienda_t,n_habitaciones,per_por_habitacion,sala,comedor,cocina,sanitario,agua,luz,"
                   + "alcantarillado,telefono,aseo,gas,ladrillo,bareque,guadua,madera,otro,des_otro,tierra,baldosa,"
                   + "mineral,otro_piso,animal,basura,describasu,entidad,dinamica_interna,obser_recoo,fecha_real,des_otro_piso "
                   + "from consulta_trabajo_social where id_consulta_trabajo_social='"+codc+"'";
         
          //   String sqlcons="select sist_musc_atro,esque_rosa_cost,caract_gen,desayuno,refrigerio1,almuerzo,refrigerio2,comida,complementario,al_favoritos,al_rechazados,comple_al,cual,peso,altura,pcefalico,interpre_peso_ed,interpre_tall_ed,interpre_peso_talla,interpre_imc,recomendaciones,observaciones,observaciones_menu,diesta_menu from consulta_nutri c where id_consulta='"+codc+"' ";                       
         //  System.out.println("cons tabs ant: "+sqlcons);
                  ResultSet resuco=null;
          try{  resuco=ba.consultas(sqlcons);}
          catch(Exception e){}
           
          
            String datos2[]=new String[41];
            
            for(int i=0;i<41;i++){
                datos2[i]="";
            }
            
         
	try{
	    while (resuco.next()&&resuco!=null) {   
                         if(resuco.getString(1)!=null){datos2[0]=resuco.getString(1);}//id_historia
                         if(resuco.getString(2)!=null){datos2[1]=resuco.getString(2);}//fecha	
                         if(resuco.getString(3)!=null){datos2[2]=resuco.getString(3);}//id_profecional
                         if(resuco.getString(4)!=null){datos2[3]=resuco.getString(4);}//ingreso_eco
                         if(resuco.getString(5)!=null){datos2[4]=resuco.getString(5);}//vivienda
                         if(resuco.getString(6)!=null){datos2[5]=resuco.getString(6);}//educacion
                         if(resuco.getString(7)!=null){datos2[6]=resuco.getString(7);}//transporte
                         if(resuco.getString(8)!=null){datos2[7]=resuco.getString(8);}//salud
                         if(resuco.getString(9)!=null){datos2[8]=resuco.getString(9);}//otros
                         if(resuco.getString(10)!=null){datos2[9]=resuco.getString(10);}//cual
                         if(resuco.getString(11)!=null){datos2[10]=resuco.getString(11);}//vivienda_t
                         if(resuco.getString(12)!=null){datos2[11]=resuco.getString(12);}//n_habitaciones
                         if(resuco.getString(13)!=null){datos2[12]=resuco.getString(13);}//per_por_habitacion
                         if(resuco.getString(14)!=null){datos2[13]=resuco.getString(14);}//sala
                         if(resuco.getString(15)!=null){datos2[14]=resuco.getString(15);}//comedor
                         if(resuco.getString(16)!=null){datos2[15]=resuco.getString(16);}//cocina
                         if(resuco.getString(17)!=null){datos2[16]=resuco.getString(17);}//sanitario
                         if(resuco.getString(18)!=null){datos2[17]=resuco.getString(18);}//agua
                         if(resuco.getString(19)!=null){datos2[18]=resuco.getString(19);}//luz
                         if(resuco.getString(20)!=null){datos2[19]=resuco.getString(20);}//alcantarillado
                         if(resuco.getString(21)!=null){datos2[20]=resuco.getString(21);}//telefono
                         if(resuco.getString(22)!=null){datos2[21]=resuco.getString(22);}//aseo
                         if(resuco.getString(23)!=null){datos2[22]=resuco.getString(23);}//gas
                         if(resuco.getString(24)!=null){datos2[23]=resuco.getString(24);}//ladrillo
                         if(resuco.getString(25)!=null){datos2[24]=resuco.getString(25);}//bareque
                         if(resuco.getString(26)!=null){datos2[25]=resuco.getString(26);}//guadua
                         if(resuco.getString(27)!=null){datos2[26]=resuco.getString(27);}//madera
                         if(resuco.getString(28)!=null){datos2[27]=resuco.getString(28);}//otro
                         if(resuco.getString(29)!=null){datos2[28]=resuco.getString(29);}//des_otro
                         if(resuco.getString(30)!=null){datos2[29]=resuco.getString(30);}//tierra
                         if(resuco.getString(31)!=null){datos2[30]=resuco.getString(31);}//baldosa
                         if(resuco.getString(32)!=null){datos2[31]=resuco.getString(32);}//mineral
                         if(resuco.getString(33)!=null){datos2[32]=resuco.getString(33);}//otro_piso
                         if(resuco.getString(34)!=null){datos2[33]=resuco.getString(34);}//animal
                         if(resuco.getString(35)!=null){datos2[34]=resuco.getString(35);}//basura	
                         if(resuco.getString(36)!=null){datos2[35]=resuco.getString(36);}//describasu
                         if(resuco.getString(37)!=null){datos2[36]=resuco.getString(37);}//entidad
                         if(resuco.getString(38)!=null){datos2[37]=resuco.getString(38);}//dinamica_interna
                         if(resuco.getString(39)!=null){datos2[38]=resuco.getString(39);}//obser_recoo
                         if(resuco.getString(40)!=null){datos2[39]=resuco.getString(40);}//fecha_real
                         if(resuco.getString(41)!=null){datos2[40]=resuco.getString(41);}//descripcion otro piso
                         
                     }
        }
        catch(SQLException ex){}
	catch(Exception exe){}      
                 ba.cierraResultado(resuco);    
                     
                     
            %>
                   
        <h3>Fecha </h3>
        <label><% out.print(datos2[39]); %></label>
        <br>     
            
        <table style="width: 100%" border="0">
            <tr>
                <td style="width: 20%" colspan="5"> 
                    <h3>Aspecto Economico</h3>
                </td>
            </tr>
            <tr>
                <td >
                    <label>Ingresos Economicos</label>
                </td>
                <td colspan="4"><label><% out.print(datos2[3]); %></label></td>
            </tr>
            <tr>
                <td>
                    <label>Egresos Economicos</label>
                </td>
                <td><center><input type="checkbox" id="chec_vivi" name="chec_vivi" <% if(datos2[4].compareTo("1")==0){out.print("checked");} %> disabled="disabled"><label>Vivienda</label></center></td>
                <td><center><input type="checkbox" id="chec_educ" name="chec_educ" <% if(datos2[5].compareTo("1")==0){out.print("checked");} %> disabled="disabled"><label>Educacion</label></center></td>
                <td><center><input type="checkbox" id="chec_tran" name="chec_tran" <% if(datos2[6].compareTo("1")==0){out.print("checked");} %> disabled="disabled"><label>Transporte</label></center></td>
                <td><center><input type="checkbox" id="chec_salu" name="chec_salu" <% if(datos2[7].compareTo("1")==0){out.print("checked");} %> disabled="disabled"><label>Salud</label></center></td>
            </tr>      
            
        </table>
        
        
        <h3>Vivienda</h3>
            
        <table style="width:70%"  rules="all" border="1">
            <tr>
                <td style="width: 20%"><label></label></td>
                <td style="width: 20%"><center><label>Propia</label></center></td>
                <td style="width: 20%"><center><label>Arrendada</label></center></td>
                <td style="width: 20%"><center><label>Casa familiar</label></center></td>
                <td style="width: 20%"><center><label>La esta pagando</label></center></td>
            </tr>
            <tr>
                <td><label style="padding-left:5px">Pieza</label></td>
                <td><center><input type="radio" name="casa" id="casa1" disabled="disabled"></center></td>
                <td><center><input type="radio" name="casa" id="casa2" disabled="disabled"></center></td>
                <td><center><input type="radio" name="casa" id="casa3" disabled="disabled"></center></td>
                <td><center><input type="radio" name="casa" id="casa4" disabled="disabled"></center></td>
                
            </tr>
            <tr>
                <td><label style="padding-left:5px">Casa</label></td>
                <td><center><input type="radio" name="casa" id="casa5" disabled="disabled"></center></td>
                <td><center><input type="radio" name="casa" id="casa6" disabled="disabled"></center></td>
                <td><center><input type="radio" name="casa" id="casa7" disabled="disabled"></center></td>
                <td><center><input type="radio" name="casa" id="casa8" disabled="disabled"></center></td>
                
            </tr>
            <tr>
                <td><label style="padding-left:5px">Inquilinato</label></td>
                <td><center><input type="radio" name="casa" id="casa9"  disabled="disabled"></center></td>
                <td><center><input type="radio" name="casa" id="casa10" disabled="disabled"></center></td>
                <td><center><input type="radio" name="casa" id="casa11" disabled="disabled"></center></td>
                <td><center><input type="radio" name="casa" id="casa12" disabled="disabled"></center></td>
                
            </tr>
            <tr>
                <td><label style="padding-left:5px">Apartameto </label></td>
                <td><center><input type="radio" name="casa" id="casa13" disabled="disabled"></center></td>
                <td><center><input type="radio" name="casa" id="casa14" disabled="disabled"></center></td>
                <td><center><input type="radio" name="casa" id="casa15" disabled="disabled"></center></td>
                <td><center><input type="radio" name="casa" id="casa16" disabled="disabled"></center></td>
                
            </tr>
            <tr>
                <td><label style="padding-left:5px">Cambuche </label></td>
                <td><center><input type="radio" name="casa" id="casa17" disabled="disabled"></center></td>
                <td><center><input type="radio" name="casa" id="casa18" disabled="disabled"></center></td>
                <td><center><input type="radio" name="casa" id="casa19" disabled="disabled"></center></td>
                <td><center><input type="radio" name="casa" id="casa20" disabled="disabled"></center></td>
            </tr>
            
        </table>
        <script type="text/javascript">
            document.getElementById("casa<% out.print(datos2[10]); %>").checked = true;
        </script>
        
        <br>
        
        <table style="width: 100%" border="0">
            <tr><td ><h3>Distribucion de la Vivienda</h3></td></tr>
            <tr>
                <td><label style="padding-right: 5px">Numero de Habitaciones:</label><label><% out.print(datos2[11]); %></label>
                    <label style="padding-right: 5px;padding-left:20px">Personas por Habitacion</label><label><% out.print(datos2[12]); %></label>
                    <label  style="padding-right: 5px;padding-left:20px">Sala</label><input type="checkbox" id="sala" name="sala"  <% if(datos2[13].compareTo("1")==0){out.print("checked");} %> disabled="disabled">
                <label  style="padding-right: 5px;padding-left:20px">Comedor</label><input type="checkbox" id="comedor" name="comedor"  <% if(datos2[14].compareTo("1")==0){out.print("checked");} %> disabled="disabled" >
                <label  style="padding-left:20px">Cocina</label><input type="checkbox" id="cocina" name="cocina"  <% if(datos2[15].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
            </tr>
            
        </table>
        <br>
        
        <table style="width: 100%" border="0">
            <tr><td ><h3>Servicio sanitario</h3></td></tr>
            <tr>
                <td>
                    <label style="padding-right: 5px">Letrina:</label><input type="radio" name="sanitario" id="sanitario1"  disabled="disabled">
                    <label style="padding-right: 5px;padding-left:20px">Inodoro:</label><input type="radio" id="sanitario2" name="sanitario"  disabled="disabled">
                    <label  style="padding-left:20px">No tiene:</label><input type="radio" name="sanitario" id="sanitario3"  disabled="disabled">
                </td>
            </tr>
            
        </table>
        <script type="text/javascript">
            document.getElementById("sanitario<% out.print(datos2[16]); %>").checked = true;
        </script>
        <br>
        <table style="width: 100%" border="0">
          <tr><td><h3>Servicios publicos</h3></td></tr>
          <tr>
               <td>
                   <label style="padding-right: 5px">Agua</label><input type="checkbox" id="servi_agua" name="servi_agua"  <% if(datos2[17].compareTo("1")==0){out.print("checked");} %> disabled="disabled" >
                    <label style="padding-right: 5px;padding-left:20px">Luz</label><input type="checkbox" id="servi_luz" name="servi_luz"  <% if(datos2[18].compareTo("1")==0){out.print("checked");} %> disabled="disabled" >
                    <label style="padding-right: 5px;padding-left:20px">Alcantarillado</label><input type="checkbox"  id="servi_alcan" name="servi_alcan"  <% if(datos2[19].compareTo("1")==0){out.print("checked");} %> disabled="disabled" >
                    <label style="padding-right: 5px;padding-left:20px">Telefono</label><input type="checkbox"  id="servi_tele" name="servi_tele"  <% if(datos2[20].compareTo("1")==0){out.print("checked");} %> disabled="disabled" >
                    <label style="padding-right: 5px;padding-left:20px">Aseo</label><input type="checkbox"  id="servi_aseo" name="servi_aseo"  <% if(datos2[21].compareTo("1")==0){out.print("checked");} %> disabled="disabled" >
                    <label  style="padding-left:20px">Gas</label><input type="checkbox"  id="servi_gas" name="servi_gas"  <% if(datos2[22].compareTo("1")==0){out.print("checked");} %> disabled="disabled" >
               </td>
          </tr>
        </table><br>
        
        <table style="width: 100%" border="0">
          <tr><td><h3>Materiales de construccion</h3></td></tr>
          <tr>
               <td>
                   <label style="padding-right: 5px">Ladrillo</label><input type="checkbox" name="material1" id="material1" <% if(datos2[23].compareTo("1")==0){out.print("checked");} %> disabled="disabled" >
                    <label style="padding-right: 5px;padding-left:20px">Bareque</label><input type="checkbox" name="material2" id="material2" <% if(datos2[24].compareTo("1")==0){out.print("checked");} %> disabled="disabled" >
                    <label style="padding-right: 5px;padding-left:20px">Guadua</label><input type="checkbox" name="material3" id="material3" <% if(datos2[25].compareTo("1")==0){out.print("checked");} %> disabled="disabled" >
                    <label style="padding-right: 5px;padding-left:20px">Madera</label><input type="checkbox" name="material4" id="material4" <% if(datos2[26].compareTo("1")==0){out.print("checked");} %> disabled="disabled" >
                    <label style="padding-right: 5px;padding-left:20px">Otro</label><input type="checkbox" name="material5" id="material5" <% if(datos2[27].compareTo("1")==0){out.print("checked");} %> disabled="disabled" >
                    <label  style="padding-right: 5px;padding-left:20px">Cual?  </label><label> <% if(datos2[27].compareTo("1")==0){out.print(datos2[28]);} %>   </label>
               </td>
          </tr>
        </table><br>
        
        <table style="width: 100%" border="0">
          <tr><td><h3>Piso</h3></td></tr>
          <tr>
               <td>
                    <label style="padding-right: 5px">Tierra</label><input type="checkbox" name="piso1" id="piso1" <% if(datos2[29].compareTo("1")==0){out.print("checked");} %> disabled="disabled" >
                    <label style="padding-right: 5px;padding-left:20px">Balsoda</label><input type="checkbox" name="piso2" id="piso2" <% if(datos2[30].compareTo("1")==0){out.print("checked");} %> disabled="disabled" >
                    <label style="padding-right: 5px;padding-left:20px">Mineral</label><input type="checkbox" name="piso3" id="piso3" <% if(datos2[31].compareTo("1")==0){out.print("checked");} %> disabled="disabled" >
                    <label style="padding-right: 5px;padding-left:20px">Otro</label><input type="checkbox" name="piso4" id="piso4" <% if(datos2[32].compareTo("1")==0){out.print("checked");} %> disabled="disabled" >
                    <label style="padding-right: 5px;padding-left:20px">Cual?  </label><label> <% if(datos2[32].compareTo("1")==0){out.print(datos2[40]);} %>   </label>
              </td>
          </tr>
        </table><br>
        
        <table style="width: 100%" border="0">
          <tr><td><h3>Animales Dentro de la Casa</h3></td></tr>
          <tr>
               <td>
                    <label style="padding-right: 5px">Si</label><input type="radio" name="animal" id="animal1" disabled="disabled" >
                    <label  style="padding-left:20px">No</label><input type="radio" name="animal" id="animal2" disabled="disabled" >
               </td>
          </tr>
        </table><br>
        <script type="text/javascript">
            document.getElementById("animal<% out.print(datos2[33]); %>").checked = true;
        </script>
        
        <table style="width: 100%" border="0">
          <tr><td><h3>Manejo de Basura</h3></td></tr>
          <tr>
               <td>
                    <label style="padding-right: 5px">Quemada</label><input type="radio" name="basura" id="basura1" disabled="disabled" >
                    <label style="padding-right: 5px;padding-left:20px">Enterrada</label><input type="radio" name="basura" id="basura2" disabled="disabled" >
                    <label style="padding-right: 5px;padding-left:20px">Recogida</label><input type="radio" name="basura" id="basura3" disabled="disabled" >
                    <label style="padding-left:20px">Tirada</label><input type="radio" name="basura" id="basura4" disabled="disabled" >
                    <label style="padding-right: 5px;padding-left:20px">Otro</label><input type="radio" name="basura" id="basura5" disabled="disabled" >
                    <label style="padding-right: 5px;padding-left:20px">Cual?  </label><label> <% if(datos2[34].compareTo("5")==0){out.print(datos2[35]);} %>   </label>
               </td>
          </tr>
        </table><br>
        <script type="text/javascript">
            document.getElementById("basura<% out.print(datos2[34]); %>").checked = true;
        </script>
        
        <table style="width: 100%" border="0">
          <tr><td><h3>Salud</h3></td></tr>
          <tr>
               <td>
                   <%
                       String sqll0="select nombre from eps where ideps='"+datos2[36]+"' ";
                      
                       ResultSet resuu20=null;
                      try{  
                       resuu20=ba.consultas(sqll0);
                       while (resuu20.next()&&resuu20!=null) {   
                                     out.print("<label>"+datos2[36]+" - "+resuu20.getString(1)+"</label>");
                                 }
                          }
                    catch(SQLException ex){}
                    catch(Exception exe){}

                    ba.cierraResultado(resuu20);
                            %>
                  </td>
          </tr>
        </table><br>
            
      
      <table style="width: 100%" border="0">
          <tr><td><h3>Dinamica Interna</h3></td></tr>
          <tr>
               <td>
                   <p style='text-align:justify;width:100%'><% out.print(datos2[37]); %></p>
               </td>
          </tr>
        </table><br>
      
         
      <table style="width: 100%" border="0">
          <tr><td><h3>Observaciones y/o Recomendaciones</h3></td></tr>
          <tr>
               <td>                  
                   <p style='text-align:justify;width:100%'><% out.print(datos2[38]); %></p>
               </td>
          </tr>
        </table><br>
        <center><h3 style="border: 1px solid;width:100%">Diagnósticos</h3></center>
        
        <%
         String sqld="select i.id_subcie,s.descripcion,i.descrip,t.descripcion,c.descripcion from impre_diagno_trabajo_soci i,sub_cie10 s,tipo__diagnostico t,causa_externa c where i.id_subcie=s.id_subcie10 and i.id_tipo_diagnostico=t.idtipodiag and i.causa_externa=c.idcausa and i.id_consulta_trabajo_soci='"+codc+"' order by control";
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
                 <center><h3 style="border: 1px solid;width:100%">Composición Familiar </h3></center>
       <%
       
           String sqlfam="select nombre_apellidos,p.descripcion,edad,e.descripcion,o.descripcion,observaciones "
                       + "from comp_fami c,parentesco_trab_soci p,escolaridad_trab_soci e,ocupacion_trabajo_soci "
                       + "o where c.parentesco=p.idparentesco and c.escolaridad=e.idescolaridad_trab_soci and"
                       + " c.ocupacion=o.idocupacion_trabajo_soci and id_cons_trab_soci='"+codc+"'";
         
            int contro=0;            
            
            ResultSet resuu20f=null;
            try{  
               resuu20f=ba.consultas(sqlfam);
                while (resuu20f.next()&&resuu20f!=null) { 
                       if(contro==0){contro=1;
                                    String tabla=" <table border='1' style='width:100%'>"
                                                +"<tr>"
                                                +"<td style='width:40%'><center><label><b>Nombres y Apellidos</b></label></center></td>"
                                                +"<td style='width:11%'><center><label><b>Parentesco </b></label></center></td>"
                                                +"<td style='width:7%'><center><label><b>Edad</b></label></center></td>"
                                                +"<td style='width:11%'><center><label><b>Escolaridad</b></label></center></td>"
                                                +"<td style='width:11%'><center><label><b>Ocupación </b></label></center></td>"
                                                +"<td style='width:20%'><center><label><b>Observaciones</b></label></center></td>"
                                           +"</tr>";
                                    out.print(tabla);
                                 }
                         String tabla2="<tr>"
                                      +"<td style='width:40%'><center><label>"+resuu20f.getString(1)+"</label></center></td>"
                                      +"<td style='width:11%'><center><label>"+resuu20f.getString(2)+"</label></center></td>"
                                      +"<td style='width:7%'><center><label>"+resuu20f.getString(3)+"</label></center></td>"
                                      +"<td style='width:11%'><center><label>"+resuu20f.getString(4)+"</label></center></td>"
                                      +"<td style='width:11%'><center><label>"+resuu20f.getString(5)+"</label></center></td>"
                                      +"<td style='width:20%'><center><label>"+resuu20f.getString(6)+"</label></center></td>"
                                      +"</tr>";            
                       out.print(tabla2);
                                }
                          }
                    catch(SQLException ex){}
                    catch(Exception exe){}

                    ba.cierraResultado(resuu20f);
           
             if(contro==1){
                          out.print("</table>");
                          }       
             else{
                  out.print("<h3>No existen familiares relacionados</h3>");
                  }
       %>
      
       
            
            </center>   
           <% ba.cerrar(); %>    
    </body>
</html>
