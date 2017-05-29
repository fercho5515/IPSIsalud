<%-- 
    Document   : muestra_reportes
    Created on : 19/05/2013, 12:22:32 PM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="pac.ruta"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="../../imagenes/fotos/favicon.ico">
        <% ruta r=new ruta(); %>
         <style type="text/css"> </style>
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
            out.print("<title></title>");
       %>
        
    </head>
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
      
        
      
%>      <center>
        <div style="width:90%"> 
            
            <center><h3><% out.print(tit); %></h3>
                                
            <center><h3 style="border: 1px solid;width:100%">Datos Profesional</h3></center>
           <p  style='text-align:justify'><b>Nombre:&nbsp;</b><% out.print(nombreprof); %>  &nbsp;&nbsp;&nbsp;&nbsp;<b style="padding-left: 50px">Registro medico:&nbsp;</b><% out.print(registro_prof); %> </p> 
    
           <center><h3 style="border: 1px solid;width:100%">Datos de Consulta 1</h3></center>
          
          <!--  <p style='text-align:justify'><b>Signos Fisicos de Desnutricion</b></p> -->
            <%
               
                ///////////////////////////////
                ///////////////////////////////
                ///////////////////////////////
                                   //40
           String sqlcons="select id_historia,fecha,id_profecional,ingreso_eco,vivienda,educacion,transporte,salud,otros,"
                   + "cual,vivienda_t,n_habitaciones,per_por_habitacion,sala,comedor,cocina,sanitario,agua,luz,"
                   + "alcantarillado,telefono,aseo,gas,ladrillo,bareque,guadua,madera,otro,des_otro,tierra,baldosa,"
                   + "mineral,otro_piso,animal,basura,describasu,entidad,dinamica_interna,obser_recoo,fecha_real,des_otro_piso,factores_riesgo,"
                   + "tipologia,salario,pension,arrendamiento,servicios,alimentacion,recreacion,otro_copy1,egreso_mensual,otro_ingreso,cual_ingreso,"
                   + "parqueadero,patio,cable,internet,factores_vivienda,"
                   + "comunicacion,comunicacion_porque,expresa,violencia,soluciones,"
                   + "corto_plazo,mediano_plazo,largo_plazo,metas,limita,"
                   + "actividades,funcional,ayuda,porque_ayuda,que_profesional "
                   + "from consulta_trabajo_social where id_consulta_trabajo_social='"+codc+"'";
         
          //   String sqlcons="select sist_musc_atro,esque_rosa_cost,caract_gen,desayuno,refrigerio1,almuerzo,refrigerio2,comida,complementario,al_favoritos,al_rechazados,comple_al,cual,peso,altura,pcefalico,interpre_peso_ed,interpre_tall_ed,interpre_peso_talla,interpre_imc,recomendaciones,observaciones,observaciones_menu,diesta_menu from consulta_nutri c where id_consulta='"+codc+"' ";                       
         //  System.out.println("cons tabs ant: "+sqlcons);
           out.print(sqlcons);
                  ResultSet resuco=null;
          try{  resuco=ba.consultas(sqlcons);}
          catch(Exception e){}
           
          
            String datos2[]=new String[73];
            
            for(int i=0;i<73;i++){
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
                         if(resuco.getString(42)!=null){datos2[41]=resuco.getString(42);}//factores riesgo
                         if(resuco.getString(43)!=null){datos2[42]=resuco.getString(43);}//tipologia
                         if(resuco.getString(44)!=null){datos2[43]=resuco.getString(44);}//salario
                         if(resuco.getString(45)!=null){datos2[44]=resuco.getString(45);}//pension
                         if(resuco.getString(46)!=null){datos2[45]=resuco.getString(46);}//arrendamiento
                         if(resuco.getString(47)!=null){datos2[46]=resuco.getString(47);}//serivios
                         if(resuco.getString(48)!=null){datos2[47]=resuco.getString(48);}//alimentacion
                         if(resuco.getString(49)!=null){datos2[48]=resuco.getString(49);}//recreacion
                         if(resuco.getString(50)!=null){datos2[49]=resuco.getString(50);}//otro
                         if(resuco.getString(51)!=null){datos2[50]=resuco.getString(51);}//egreso
                         if(resuco.getString(52)!=null){datos2[51]=resuco.getString(52);}//otro_ingreso
                         if(resuco.getString(53)!=null){datos2[52]=resuco.getString(53);}//cual_ingreso
                         if(resuco.getString(54)!=null){datos2[53]=resuco.getString(54);}//parqueadero
                         if(resuco.getString(55)!=null){datos2[54]=resuco.getString(55);}//patio
                         if(resuco.getString(56)!=null){datos2[55]=resuco.getString(56);}//cable
                         if(resuco.getString(57)!=null){datos2[56]=resuco.getString(57);}//internet
                         if(resuco.getString(58)!=null){datos2[57]=resuco.getString(58);}//factores_vivienda
                         if(resuco.getString(59)!=null){datos2[58]=resuco.getString(59);}//comunicacion
                         if(resuco.getString(60)!=null){datos2[59]=resuco.getString(60);}//comunicacion_porque
                         if(resuco.getString(61)!=null){datos2[60]=resuco.getString(61);}//expresa
                         if(resuco.getString(62)!=null){datos2[61]=resuco.getString(62);}//violencia
                         if(resuco.getString(63)!=null){datos2[62]=resuco.getString(63);}//soluciones
                         if(resuco.getString(64)!=null){datos2[63]=resuco.getString(64);}//corto_plazo
                         if(resuco.getString(65)!=null){datos2[64]=resuco.getString(65);}//mediano_plzo
                         if(resuco.getString(66)!=null){datos2[65]=resuco.getString(66);}//largo_plazo
                         if(resuco.getString(67)!=null){datos2[66]=resuco.getString(67);}//metas
                         if(resuco.getString(68)!=null){datos2[67]=resuco.getString(68);}//limita
                         if(resuco.getString(69)!=null){datos2[68]=resuco.getString(69);}//actividades
                         if(resuco.getString(70)!=null){datos2[69]=resuco.getString(70);}//funcional
                         if(resuco.getString(71)!=null){datos2[70]=resuco.getString(71);}//ayuda
                         if(resuco.getString(72)!=null){datos2[71]=resuco.getString(72);}//porque_ayuda
                         if(resuco.getString(73)!=null){datos2[72]=resuco.getString(73);}//que_profesional
                 
                     }
        }
        catch(SQLException ex){}
	catch(Exception exe){}      
                 ba.cierraResultado(resuco);    
                     
                     
            %>
                   
        <h3>Fecha </h3>
        <label><% out.print(datos2[39]); %></label>
        <br>     
        <center><h3 style="border: 1px solid;width:100%">COMPOSICION FAMILIAR </h3></center>
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
                                    String tabla=" <table border='0' style='width:100%'>"
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
        
        
        
        
        <table style="width: 100%">
            <tr>
                <td style="width: 20%"><h3>Factores de riesgo:<% out.print(datos2[0]); %> </h3></td>
            </tr>
            <tr>
                <td><label disabled="disabled"><% out.print(datos2[41]); %></label></td>
            </tr>
            <tr>
                <td style="width: 20%"><h3>Tipología familiar: </h3></td>
            </tr>
            <tr>
                <td><label disabled="disabled"><% out.print(datos2[42]); %></label></td>
            </tr>
        </table>
            
        <center><h3 style="border: 1px solid;width:100%">SITUACIÓN SOCIOECONOMICA</h3></center>   
        <table style="width: 100%" border="1">
            <tr>
                <td style="width: 20%" colspan="5"> 
                    <h3>Ingresos Economicos</h3>
                </td>
            </tr>
            <tr>
                <td><center><input type="checkbox" id="chec_vivi" name="chec_vivi" <% if(datos2[43].compareTo("1")==0){out.print("checked");} %> disabled="disabled"><label>Salario</label></center></td>
                <td><center><input type="checkbox" id="chec_vivi" name="chec_vivi" <% if(datos2[44].compareTo("1")==0){out.print("checked");} %> disabled="disabled"><label>Pensión</label></center></td>
                <td><center><input type="checkbox" id="chec_vivi" name="chec_vivi" <% if(datos2[45].compareTo("1")==0){out.print("checked");} %> disabled="disabled"><label>Arrendamiento</label></center></td>
                <td><center><input type="checkbox" id="chec_vivi" name="chec_vivi" <% if(datos2[51].compareTo("1")==0){out.print("checked");} %> disabled="disabled"><label>Otro </label><input type="text" value="<%out.print(datos2[52]);%>" disabled="disabled"></center></td>
                <td><label>Monto mensual: <% out.print(datos2[3]); %></label></td>
            </tr>
            <tr>
                <td style="width: 20%" colspan="5"> 
                    <h3>Egresos Economicos</h3>
                </td>
            </tr>
            <tr>
                <td><center><input type="checkbox" id="chec_vivi" name="chec_vivi" <% if(datos2[4].compareTo("1")==0){out.print("checked");} %> disabled="disabled"><label>Vivienda</label></center></td>
                <td><center><input type="checkbox" id="chec_educ" name="chec_educ" <% if(datos2[5].compareTo("1")==0){out.print("checked");} %> disabled="disabled"><label>Educacion</label></center></td>
                <td><center><input type="checkbox" id="chec_tran" name="chec_tran" <% if(datos2[6].compareTo("1")==0){out.print("checked");} %> disabled="disabled"><label>Transporte</label></center></td>
                <td><center><input type="checkbox" id="chec_salu" name="chec_salu" <% if(datos2[7].compareTo("1")==0){out.print("checked");} %> disabled="disabled"><label>Salud</label></center></td>
                <td><label>Egreso mensual:</label></td>
            </tr>
             <tr>
                <td><center><input type="checkbox" id="chec_vivi" name="chec_vivi" <% if(datos2[46].compareTo("1")==0){out.print("checked");} %> disabled="disabled"><label>Servicios <% out.print(datos2[46]); %></label></center></td>
                <td><center><input type="checkbox" id="chec_educ" name="chec_educ" <% if(datos2[48].compareTo("1")==0){out.print("checked");} %> disabled="disabled"><label>Recreación</label></center></td>
                <td><center><input type="checkbox" id="chec_tran" name="chec_tran" <% if(datos2[47].compareTo("1")==0){out.print("checked");} %> disabled="disabled"><label>Alimentación</label></center></td>
                <td><center><input type="checkbox" id="chec_salu" name="chec_salu" <% if(datos2[49].compareTo("1")==0){out.print("checked");} %> disabled="disabled"><label>Otros</label></center></td>
                <td><label><% out.print(datos2[50]); %></label></td>
            </tr>    
            
        </table>
        
            <center><h3 style="border: 1px solid;width:100%">VIVIENDA</h3></center>   
            
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
                <td><center><input type="checkbox" name="casa1_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("1")==0){out.print("checked"); } %> ></center></td>
                <td><center><input type="checkbox" name="casa2_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("2")==0){out.print("checked"); } %> ></center></td>
                <td><center><input type="checkbox" name="casa3_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("3")==0){out.print("checked"); } %> ></center></td>
                <td><center><input type="checkbox" name="casa4_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("4")==0){out.print("checked"); } %> ></center></td>
                
            </tr>
            <tr>
                <td><label style="padding-left:5px">Casa</label></td>
                <td><center><input type="checkbox" name="casa5_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("5")==0){out.print("checked"); } %> ></center></td>
                <td><center><input type="checkbox" name="casa6_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("6")==0){out.print("checked"); } %> ></center></td>
                <td><center><input type="checkbox" name="casa7_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("7")==0){out.print("checked"); } %> ></center></td>
                <td><center><input type="checkbox" name="casa8_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("8")==0){out.print("checked"); } %> ></center></td>
                
            </tr>
            <tr>
                <td><label style="padding-left:5px">Inquilinato</label></td>
                <td><center><input type="checkbox" name="casa9_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("9")==0){out.print("checked"); } %> ></center></td>
                <td><center><input type="checkbox" name="casa10_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("10")==0){out.print("checked"); } %> ></center></td>
                <td><center><input type="checkbox" name="casa11_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("11")==0){out.print("checked"); } %> ></center></td>
                <td><center><input type="checkbox" name="casa12_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("12")==0){out.print("checked"); } %> ></center></td>
                
            </tr>
            <tr>
                <td><label style="padding-left:5px">Apartameto </label></td>
                <td><center><input type="checkbox" name="casa13_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("13")==0){out.print("checked"); } %> ></center></td>
                <td><center><input type="checkbox" name="casa14_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("14")==0){out.print("checked"); } %> ></center></td>
                <td><center><input type="checkbox" name="casa15_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("15")==0){out.print("checked"); } %> ></center></td>
                <td><center><input type="checkbox" name="casa16_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("16")==0){out.print("checked"); } %> ></center></td>
                
            </tr>
            <tr>
                <td><label style="padding-left:5px">Cambuche </label></td>
                <td><center><input type="checkbox" name="casa17_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("17")==0){out.print("checked"); } %> ></center></td>
                <td><center><input type="checkbox" name="casa18_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("18")==0){out.print("checked"); } %> ></center></td>
                <td><center><input type="checkbox" name="casa19_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("19")==0){out.print("checked"); } %> ></center></td>
                <td><center><input type="checkbox" name="casa20_<% out.print(codc); %>" disabled="disabled" <% if(datos2[10].compareTo("20")==0){out.print("checked"); } %> ></center></td>
            </tr>
            
        </table>
        
        <br>
        <table style="width:100%">
            <tr>
                <td style="width:40%">
                    <table style="width: 100%" border="1">
                    <tr><td colspan="3"><center><h3>Materiales de construccion</h3></center></td></tr>
                    <tr>
                         <td> <label style="padding-right: 5px">Ladrillo</label><input type="checkbox" name="material1" id="material1" <% if(datos2[23].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                         <td> <label style="padding-right: 5px;padding-left:20px">Bareque</label><input type="checkbox" name="material2" id="material2" <% if(datos2[24].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                         <td> <label style="padding-right: 5px;padding-left:20px">Guadua</label><input type="checkbox" name="material3" id="material3" <% if(datos2[25].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                    </tr>
                    <tr>
                         <td> <label style="padding-right: 5px;padding-left:20px">Madera</label><input type="checkbox" name="material4" id="material4" <% if(datos2[26].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                         <td> <label style="padding-right: 5px;padding-left:20px">Otro</label><input type="checkbox" name="material5" id="material5" <% if(datos2[27].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                         <td> <label  style="padding-right: 5px;padding-left:20px">Cual?  </label><label> <% if(datos2[27].compareTo("1")==0){out.print(datos2[28]);} %>   </label></td>
                    </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 100%" border="1">
                        <tr><td colspan="4"><center><h3>Distribucion de la Vivienda</h3></center></td></tr>
                        <tr>
                        <td><label style="padding-right: 5px">Numero de Habitaciones:</label><label><% out.print(datos2[11]); %></label></td>
                        <td><label style="padding-right: 5px;padding-left:20px">Personas por Habitacion</label><label><% out.print(datos2[12]); %></label></td>
                        <td><label  style="padding-right: 5px;padding-left:20px">Sala</label><input type="checkbox" id="sala" name="sala"  <% if(datos2[13].compareTo("1")==0){out.print("checked");} %> disabled="disabled"></td>
                        <td><label  style="padding-right: 5px;padding-left:20px">Comedor</label><input type="checkbox" id="comedor" name="comedor"  <% if(datos2[14].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                        </tr>
                        <tr>
                        <td><label  style="padding-left:20px">Cocina</label><input type="checkbox" id="cocina" name="cocina"  <% if(datos2[15].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                        <td><label  style="padding-left:20px">Parqueadero</label><input type="checkbox" id="cocina" name="cocina"  <% if(datos2[53].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                        <td><label  style="padding-left:20px">Patio de Ropas</label><input type="checkbox" id="cocina" name="cocina"  <% if(datos2[54].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                        <td></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br>
        
        <table style="width:100%">
            <tr>
                <td style="width:20%">
                    <table style="width: 100%" border="1">
                        <tr><td><center><h3>Servicio sanitario</h3></center></td></tr>
                        <tr><td><label style="padding-right: 5px;padding-left:20px">Letrina:</label><input type="checkbox" name="sanitario1_<% out.print(codc); %>"   disabled="disabled"  <% if(datos2[16].compareTo("1")==0){out.print("checked");} %> ></td></tr>
                        <tr><td><label style="padding-right: 5px;padding-left:20px">Inodoro:</label><input type="checkbox" name="sanitario2_<% out.print(codc); %>"  disabled="disabled"  <% if(datos2[16].compareTo("2")==0){out.print("checked");} %> ></td></tr>
                        <tr><td><label style="padding-left:20px">No tiene:</label><input type="checkbox" name="sanitario3_<% out.print(codc); %>"  disabled="disabled"  <% if(datos2[16].compareTo("3")==0){out.print("checked");} %> ></td></tr>
                    </table>  
                </td>
                <td style="width:50%">
                    <table style="width: 100%" border="1">
                        <tr><td colspan="3"><center><h3>Servicios publicos</h3></center></td></tr>
                        <tr>
                        <td><label style="padding-right: 5px;padding-left:20px">Agua:</label><input type="checkbox" id="servi_agua" name="servi_agua"  <% if(datos2[17].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                        <td><label style="padding-right: 5px;padding-left:20px">Luz:</label><input type="checkbox" id="servi_luz" name="servi_luz"  <% if(datos2[18].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                        <td><label style="padding-right: 5px;padding-left:20px">Alcantarillado:</label><input type="checkbox"  id="servi_alcan" name="servi_alcan"  <% if(datos2[19].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                        </tr>
                        <tr>
                        <td><label style="padding-right: 5px;padding-left:20px">Telefono:</label><input type="checkbox"  id="servi_tele" name="servi_tele"  <% if(datos2[20].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                        <td><label style="padding-right: 5px;padding-left:20px">Aseo:</label><input type="checkbox"  id="servi_aseo" name="servi_aseo"  <% if(datos2[21].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                        <td><label style="padding-right: 5px;padding-left:20px">Gas:</label><input type="checkbox"  id="servi_gas" name="servi_gas"  <% if(datos2[22].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                        </tr>
                        <tr>
                        <td><label style="padding-right: 5px;padding-left:20px">Internet:</label><input type="checkbox"  id="servi_aseo" name="servi_aseo"  <% if(datos2[56].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                        <td><label style="padding-right: 5px;padding-left:20px">Cable:</label><input type="checkbox"  id="servi_gas" name="servi_gas"  <% if(datos2[55].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                        <td></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 100%" border="1">
                      <tr><td colspan="3"><h3>Piso</h3></td></tr>
                      <tr>
                           <td> <label style="padding-right: 5px;padding-left:20px">Tierra</label><input type="checkbox" name="piso1" id="piso1" <% if(datos2[29].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                           <td> <label style="padding-right: 5px;padding-left:20px">Balsoda</label><input type="checkbox" name="piso2" id="piso2" <% if(datos2[30].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                      </tr>
                      <tr>
                           <td> <label style="padding-right: 5px;padding-left:20px">Mineral</label><input type="checkbox" name="piso3" id="piso3" <% if(datos2[31].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                           <td> <label style="padding-right: 5px;padding-left:20px">Otro</label><input type="checkbox" name="piso4" id="piso4" <% if(datos2[32].compareTo("1")==0){out.print("checked");} %> disabled="disabled" ></td>
                      </tr>
                      <tr>
                            <td colspan="2"> <label style="padding-right: 5px;padding-left:20px">Cual?  </label><label> <% if(datos2[32].compareTo("1")==0){out.print(datos2[40]);} %>   </label></td>
                      </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <table style="width:100%">
            <tr>
                <td style="width:30%">
                    <table style="width: 100%" border="1">
                        <tr><td colspan="2"><center><h3>Animales Dentro de la Casa</h3></center></td> </tr>
                        <tr>
                            <td><label style="padding-right: 5px">Si</label><input type="checkbox" name="animal1_<% out.print(codc); %>" disabled="disabled" <% if(datos2[33].compareTo("1")==0){out.print("checked");} %>  ></td>
                            <td><label  style="padding-left:20px">No</label><input type="checkbox" name="animal2_<% out.print(codc); %>" disabled="disabled" <% if(datos2[33].compareTo("2")==0){out.print("checked");} %>  ></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 100%" border="1">
                      <tr><td colspan="6"><center><h3>Manejo de Basura</h3></center></td></tr>
                      <tr>
                           <td><label style="padding-right: 5px;padding-left:20px">Quemada</label><input type="checkbox" name="basura1_<% out.print(codc); %>" disabled="disabled"  <% if(datos2[34].compareTo("1")==0){out.print("checked");} %>  ></td>
                           <td><label style="padding-right: 5px;padding-left:20px">Enterrada</label><input type="checkbox" name="basura2_<% out.print(codc); %>" disabled="disabled" <% if(datos2[34].compareTo("2")==0){out.print("checked");} %>   ></td>
                           <td><label style="padding-right: 5px;padding-left:20px">Recogida</label><input type="checkbox" name="basura3_<% out.print(codc); %>" disabled="disabled" <% if(datos2[34].compareTo("3")==0){out.print("checked");} %>   ></td>
                           <td><label style="padding-right: 5px;padding-left:20px">Tirada</label><input type="checkbox" name="basura4_<% out.print(codc); %>" disabled="disabled" <% if(datos2[34].compareTo("4")==0){out.print("checked");} %>   ></td>
                           <td><label style="padding-right: 5px;padding-left:20px">Otro</label><input type="checkbox" name="basura5_<% out.print(codc); %>" disabled="disabled"  <% if(datos2[34].compareTo("5")==0){out.print("checked");} %>  ></td>
                           <td><label style="padding-right: 5px;padding-left:20px">Cual?  </label><label> <% if(datos2[34].compareTo("5")==0){out.print(datos2[35]);} %>   </label></td>
                      </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <table style="width: 100%" border="0">
          <!--<tr><td><h3>Salud</h3></td></tr>-->
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
            
        <center><h3 style="border: 1px solid;width:100%"> 5. DINAMICA FAMILIAR</h3></center>   
                   <table style="width:100%" border="0">
                        <tr>
                            <td colspan="5"><br><label>1.) La comunicación dentro de su hogar es:</label></td>
                        </tr>
                        <tr>
                            <td><label style="padding-right: 5px">Adecuada</label><input type="radio" name="comunicacion" id="comunicacion1" value="1" disabled="disabled" <% if(datos2[58].compareTo("1")==0){out.print("checked");} %>> </td>
                            <td><label style="padding-right: 5px">Inadecuada</label><input type="radio" name="comunicacion" id="comunicacion2" value="2" disabled="disabled" <% if(datos2[58].compareTo("2")==0){out.print("checked");} %>></td>
                            <td><label style="padding-right: 5px">Regular</label><input type="radio" name="comunicacion" id="comunicacion3" value="3" disabled="disabled" <% if(datos2[58].compareTo("3")==0){out.print("checked");} %>></td>
                            <td colspan="2"><label style="padding-left:20px">Mala</label><input type="radio" name="comunicacion" id="comunicacion4" value="4" disabled="disabled" <% if(datos2[58].compareTo("4")==0){out.print("checked");} %>></td>
                        </tr>
                        <tr>
                            <td><label>Porque?</label></td>
                            <td colspan="4"><textarea name="comunicacionp" id="comunicacionp" rows="2" style="width:100%"><% out.print(datos2[41]); %></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>2.) Como expresa el afecto a su espos@ y/o hijos</label></td>
                        </tr>
                        <tr>
                            <td colspan="5"><textarea name="expresa" id="expresa" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>3.) Alguna vez se ha presentado algún tipo de violencia dentro de su núcleo familiar?</label></td>
                        </tr>
                        <tr>
                            <td colspan="5"><textarea name="violencia" id="violencia" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>4.) Cuando se ha presentado algún tipo de conflicto usted(es) como lo han solucionan:</label></td>
                        </tr>
                        <tr>
                            <td><label style="padding-right: 5px">Dialogando</label><input type="radio" name="solucionan" id="solucionan1" value="1"></td>
                            <td><label style="padding-right: 5px">Evitando el problema</label><input type="radio" name="solucionan" id="solucionan2" value="2"></td>
                            <td><label style="padding-right: 5px">A golpes</label><input type="radio" name="solucionan" id="solucionan3" value="3"></td>
                            <td><label style="padding-right: 5px">A gritos</label><input type="radio" name="solucionan" id="solucionan4" value="4"></td>
                            <td><label style="padding-left:20px">Insultando</label><input type="radio" name="solucionan" id="solucionan5" value="5"></td>
                            
                        </tr>
                        
                        <br>
                        <tr>
                            <td colspan="5"><br><label>5.) Cuáles son sus metas a:</label></td>
                        </tr>
                        <tr>
                            <td><label>Corto plazo</label></td>
                            <td colspan="4"><textarea name="cortoplazo" id="cortoplazo" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        <tr>
                            <td><label>Mediano plazo</label></td>
                            <td colspan="4"><textarea name="medianoplazo" id="medianoplazo" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        <tr>
                            <td><label>Largo plazo</label></td>
                            <td colspan="4"><textarea name="largoplazo" id="largoplazo" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>6.) Que ha hecho usted(es) para lograr sus metas?</label></td>
                        </tr>
                        <tr>
                            <td colspan="5"><textarea name="metas" id="metas" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>7.) Que lo limita para seguir adelante?</label></td>
                        </tr>
                        <tr>
                            <td colspan="5"><textarea name="limita" id="limita" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>8.) Que actividades practica en su tiempo libre y cuales comparte con su familia?</label></td>
                        </tr>
                        <tr>
                            <td colspan="5"><textarea name="actividades" id="actividades" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>9.) Dinamica familiar</label></td>
                        </tr>
                        <tr>
                            <td><input type="text" id="dinamica"></td>
                            <td><label style="padding-right: 5px">Funcional</label><input type="radio" name="dinamicafamiliar" id="dinamicafamiliar1" value="1"></td>
                            <td colspan="3"><label style="padding-left:20px">Disfuncional</label><input type="radio" name="dinamicafamiliar" id="dinamicafamiliar2" value="2"></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>10.) Alguna vez a solicitado ayuda a algún profesional?</label></td>
                        </tr>
                        <tr>
                            <td><label style="padding-right: 5px">Si</label><input type="radio" name="profesionalayuda" id="profesional1" value="1"></td>
                            <td colspan="4"><label style="padding-left:20px">No</label><input type="radio" name="profesionalayuda" id="profesional2" value="2"></td>
                        </tr>
                        
                        <tr>
                            <td><label>Porque?</label></td>
                            <td colspan="4"><textarea name="porqueprofesional" id="porqueprofesional" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        
                        <tr>
                            <td colspan="5"><br><label>11.) A que profesional(es) ha solicitado ayuda?</label></td>
                        </tr>
                        <tr>
                            <td colspan="5"><textarea name="queprofesional" id="queprofesional" rows="2" style="width:100%"></textarea></td>
                        </tr>
                        
                    </table>
                
        
        
        
      
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
       
      
            </center>
        </div>
            
            </center>   
           <% ba.cerrar(); %>    
    </body>
</html>
