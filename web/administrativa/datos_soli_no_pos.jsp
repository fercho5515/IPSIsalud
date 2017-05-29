<%-- 
    Document   : datos_soli_no_pos
    Created on : 12/08/2013, 05:36:50 PM
    Author     : Emmanuel
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
        <link rel="shortcut icon" href="../imagenes/fotos/favicon.ico">
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
                 #tdpp{
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
    
    </head>
    <body style="padding: 50px">
         <% 
                    request.setCharacterEncoding("UTF-8");
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null ){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }

   conecta_bd ba = new conecta_bd();
              ba.ConectaDb(); 
   
   String daatics[]=new String[39];
   for(int i=0;i<39;i++){daatics[i]="";}                          
              
   String sql0="select diagnostico,resu_enf_act,nom_generico_uno,presen_concen_uno,dosis_fecuencia_uno,nom_generico_dos,presen_concen_dos,dosis_fecuencia_dos,uno,dos,tres,cuatro,cinco,seis,efecto_trata,efecto_secu,tiempo_resp_espe,especialidad,nom_generc_uno,posologia_uno,presentacion_uno,dosis_uno,cantidad_uno,tiempo_uno,reg_invima_uno,nom_generc_dos,posologia_dos,presentacion_dos,dosis_dos,cantidad_dos,tiempo_dos,reg_invima_dos,nom_generc_tres,posologia_tres,presentacion_tres,dosis_tres,cantidad_tres,tiempo_tres,reg_invima_tres from soli_no_post where id_soli_no_post='"+request.getParameter("id_soli_no_pos")+"'";
      ResultSet result0=null;
           
          try{  
           result0=ba.consultas(sql0);            
           while (result0.next()&&result0!=null) { 
               if(result0.getString(1)!=null  && result0.getString(1).compareTo("null")!=0 ){daatics[0] =result0.getString(1);}
               if(result0.getString(2)!=null  && result0.getString(2).compareTo("null")!=0 ){daatics[1] =result0.getString(2);}
               if(result0.getString(3)!=null  && result0.getString(3).compareTo("null")!=0 ){daatics[2] =result0.getString(3);}
               if(result0.getString(4)!=null  && result0.getString(4).compareTo("null")!=0 ){daatics[3] =result0.getString(4);}
               if(result0.getString(5)!=null  && result0.getString(5).compareTo("null")!=0 ){daatics[4] =result0.getString(5);}
               if(result0.getString(6)!=null  && result0.getString(6).compareTo("null")!=0 ){daatics[5] =result0.getString(6);}
               if(result0.getString(7)!=null  && result0.getString(7).compareTo("null")!=0 ){daatics[6] =result0.getString(7);}
               if(result0.getString(8)!=null  && result0.getString(8).compareTo("null")!=0 ){daatics[7] =result0.getString(8);}
               if(result0.getString(9)!=null  && result0.getString(9).compareTo("null")!=0 ){daatics[8] =result0.getString(9);}
               if(result0.getString(10)!=null && result0.getString(10).compareTo("null")!=0){daatics[9] =result0.getString(10);}
               if(result0.getString(11)!=null && result0.getString(11).compareTo("null")!=0){daatics[10]=result0.getString(11);}
               if(result0.getString(12)!=null && result0.getString(12).compareTo("null")!=0){daatics[11]=result0.getString(12);}
               if(result0.getString(13)!=null && result0.getString(13).compareTo("null")!=0){daatics[12]=result0.getString(13);}
               if(result0.getString(14)!=null && result0.getString(14).compareTo("null")!=0){daatics[13]=result0.getString(14);}
               if(result0.getString(15)!=null && result0.getString(15).compareTo("null")!=0){daatics[14]=result0.getString(15);}
               if(result0.getString(16)!=null && result0.getString(16).compareTo("null")!=0){daatics[15]=result0.getString(16);}
               if(result0.getString(17)!=null && result0.getString(17).compareTo("null")!=0){daatics[16]=result0.getString(17);}
               if(result0.getString(18)!=null && result0.getString(18).compareTo("null")!=0){daatics[17]=result0.getString(18);}
               if(result0.getString(19)!=null && result0.getString(19).compareTo("null")!=0){daatics[18]=result0.getString(19);}
               if(result0.getString(20)!=null && result0.getString(20).compareTo("null")!=0){daatics[19]=result0.getString(20);}
               if(result0.getString(21)!=null && result0.getString(21).compareTo("null")!=0){daatics[20]=result0.getString(21);}
               if(result0.getString(22)!=null && result0.getString(22).compareTo("null")!=0){daatics[21]=result0.getString(22);}
               if(result0.getString(23)!=null && result0.getString(23).compareTo("null")!=0){daatics[22]=result0.getString(23);}
               if(result0.getString(24)!=null && result0.getString(24).compareTo("null")!=0){daatics[23]=result0.getString(24);}
               if(result0.getString(25)!=null && result0.getString(25).compareTo("null")!=0){daatics[24]=result0.getString(25);}
               if(result0.getString(26)!=null && result0.getString(26).compareTo("null")!=0){daatics[25]=result0.getString(26);}
               if(result0.getString(27)!=null && result0.getString(27).compareTo("null")!=0){daatics[26]=result0.getString(27);}
               if(result0.getString(28)!=null && result0.getString(28).compareTo("null")!=0){daatics[27]=result0.getString(28);}
               if(result0.getString(29)!=null && result0.getString(29).compareTo("null")!=0){daatics[28]=result0.getString(29);}
               if(result0.getString(30)!=null && result0.getString(30).compareTo("null")!=0){daatics[29]=result0.getString(30);}
               if(result0.getString(31)!=null && result0.getString(31).compareTo("null")!=0){daatics[30]=result0.getString(31);}
               if(result0.getString(32)!=null && result0.getString(32).compareTo("null")!=0){daatics[31]=result0.getString(32);}
               if(result0.getString(33)!=null && result0.getString(33).compareTo("null")!=0){daatics[32]=result0.getString(33);}
               if(result0.getString(34)!=null && result0.getString(34).compareTo("null")!=0){daatics[33]=result0.getString(34);}
               if(result0.getString(35)!=null && result0.getString(35).compareTo("null")!=0){daatics[34]=result0.getString(35);}
               if(result0.getString(36)!=null && result0.getString(36).compareTo("null")!=0){daatics[35]=result0.getString(36);}
               if(result0.getString(37)!=null && result0.getString(37).compareTo("null")!=0){daatics[36]=result0.getString(37);}
               if(result0.getString(38)!=null && result0.getString(38).compareTo("null")!=0){daatics[37]=result0.getString(38);}
               if(result0.getString(39)!=null && result0.getString(39).compareTo("null")!=0){daatics[38]=result0.getString(39);}
                                               }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        ba.cierraResultado(result0); 
%>        
       
        <center>
<br/>
<label name="titulisoli" id="titulisoli">FORMULARIO DE SOLICITUD DE MEDICAMENTOS NO POS-S</label><br/><br/>
<table id="tablap" name="tablap" border="1" style="width:100%">
 <tr><td id="tdp" name="tdp" style="border-radius: 10px 10px 0px 0px;"><label>&nbsp;&nbsp;&nbsp;Diagnostico</label><br/>
 <center><label>
     <%    String  sql1="SELECT descripcion from sub_cie10 where id_subcie10='"+daatics[0]+"'";
                           //out.print(""+sql1 );

           ResultSet result1=null;
           
          try{  
           result1=ba.consultas(sql1);            
           while (result1.next()&&result1!=null) { 
                out.print(""+daatics[0]+" - "+result1.getString(1));
                                               }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        ba.cierraResultado(result1); 
         %>   
         </label></center>
     </td></tr>
 <tr><td id="tdp" name="tdp" style="border-radius: 0px 0px 10px 10px;"><label>&nbsp;&nbsp;&nbsp;<b>Resumen enfermedad actual</b></label><br/>
 <center>   <p  style='text-align:justify;width:98%'><% out.print(daatics[1]); %></p></center> 
 </td></tr>
</table>
<br/>

<table id="tablap" name="tablap" border="1" style="width:100%">
<tr><td colspan="4" id="tdp" name="tdp" style="border-radius: 10px 10px 0px 0px;"><center><label>Medicamentos POS-S utilizados previamente para el manejo de esta patología sin obtener respuesta clínica o paraclinica satisfactoria en el término previsto de sus indicadores.</label></center></td></tr>
<tr><td valign="top" id="tdp" name="tdp" style="width:25%"><label>&nbsp;&nbsp;&nbsp;Medicamento del POS-S utilizado</label></td>
    <td valign="top" id="tdp" name="tdp" rowspan="3" style="width:25%;text-align:center"><label>Dosis, freciencia y </label><br/> <label>Duracion del tratamiento</label>
      <p  style='text-align:justify;width:95%'> <% out.print(daatics[4]); %></p>
    </td>
    <td valign="top" id="tdp" name="tdp" style="width:25%"><label>&nbsp;&nbsp;&nbsp;Medicamento del POS-S utilizada</label></td>
    <td valign="top" id="tdp" name="tdp" rowspan="3" style="width:25%;text-align:center;border-radius: 0px 0px 10px 0px;"><label>Dosis, freciencia y </label><br/><label>Duracion del tratamiento</label>
       <p  style='text-align:justify;width:95%'>  <% out.print(daatics[7]); %></p>
    </td></tr>
<tr><td id="tdp" name="tdp">&nbsp;&nbsp;&nbsp;Nombre Generico<br/> <center><input type="text" name="nom_generic_1" id="nom_generic_1" maxlength="299" style="width:95%" value="<% out.print(daatics[2]); %>" readonly /></center></td>
    <td id="tdp" name="tdp">&nbsp;&nbsp;&nbsp;Nombre Generico<br/> <center><input type="text" name="nom_generic_2" id="nom_generic_2" maxlength="299" style="width:95%" value="<% out.print(daatics[5]); %>" readonly /></center></td></tr>
<tr><td id="tdp" name="tdp" style="border-radius: 0px 0px 0px 10px;">&nbsp;&nbsp;&nbsp;Presentación y concentración<br/> <center><input type="text" name="present_y_concent_1"  maxlength="299" id="present_y_concent_1" style="width:95%"  value="<% out.print(daatics[3]); %>" readonly /></center></td>
    <td id="tdp" name="tdp">&nbsp;&nbsp;&nbsp;Presentación y concentración<br/> <center><input type="text" name="present_y_concent_2"  maxlength="299"id="present_y_concent_2" style="width:95%" value="<% out.print(daatics[6]); %>"  readonly /></center></td></tr>

</table>
<br/>
<table id="tablap" name="tablap" style="width:100%" border="1">
   <tr><td colspan="8" id="tdp" name="tdp" style="border-radius: 10px 10px 0px 0px;"><center><label>MEDICAMENTOS NO POS-S</label></center></td></tr>
   <tr>
       <td id="tdp" name="tdp" style="width:3%"><center><label>No</label></center></td>
       <td id="tdp" name="tdp" style="width:22%"><center><label>Nombre Genérico</label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label>Posología</label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label>Presentación</label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label>Dosis / Día</label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label>Cantidad</label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label>Tiempo/Meses</label><br/><label>NO > 3 m</label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label>No. Registro</label><br/><label>INVIA(Opcional)</label></center></td>
   </tr>
   <tr id="tdi" name="tdi" >
       <td id="tdp" name="tdp" style="width:3%"><center >1</center></td>
     <td id="tdp" name="tdp" style="width:22%"><center><label><input type="text" id="tdppn1" name="tdppn1" maxlength="199" style="width:98%"  value="<% out.print(daatics[18]); %>"  readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" id="tdpp" name="tdpp" maxlength="199" style="width:98%"  value="<% out.print(daatics[19]); %>"  readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" id="tdpp" name="tdpp" maxlength="199" style="width:98%"  value="<% out.print(daatics[20]); %>"  readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" id="tdpp" name="tdpp" maxlength="199" style="width:98%"  value="<% out.print(daatics[21]); %>"  readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" id="tdpp" name="tdpp"  maxlength="199" style="width:98%"  value="<% out.print(daatics[22]); %>"  readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><select id="tdpp" name="tdpp" style="width:98%"  disabled="disabled" >
                                                            <option value="0" ></option>
                                                            <option value="1" <% if(daatics[23].compareTo("1")==0){out.print("SELECTED");}  %> >1</option>
                                                            <option value="2" <% if(daatics[23].compareTo("2")==0){out.print("SELECTED");}  %> >2</option>
                                                            <option value="3" <% if(daatics[23].compareTo("3")==0){out.print("SELECTED");}  %> >3</option>
                                            </select></label></center></td>
                                            <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" id="tdpp" name="tdpp" maxlength="199" style="width:95%;border-radius: 0px 0px 0px 0px;" value="<% out.print(daatics[24]); %>" readonly /></label></center></td>
   </tr>
   <tr id="tdi1" name="tdi1" >
       <td id="tdp" name="tdp" style="width:3%"><center>2</center></td>
       <td id="tdp" name="tdp" style="width:22%"><center><label><input type="text" id="tdppn2" name="tdppn2" maxlength="199" style="width:98%" value="<% out.print(daatics[25]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" id="tdpp" name="tdpp" maxlength="199" style="width:98%" value="<% out.print(daatics[26]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text"  id="tdpp" name="tdpp" maxlength="199" style="width:98%" value="<% out.print(daatics[27]); %>" readonly  /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" id="tdpp" name="tdpp" maxlength="199" style="width:98%" value="<% out.print(daatics[28]); %>" readonly  /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" id="tdpp" name="tdpp" maxlength="199" style="width:98%" value="<% out.print(daatics[29]); %>" readonly  /></label></center></td>
     <td id="tdp" name="tdp" style="width:12%"><center><label><select  id="tdpp" name="tdpp"  style="width:98%" disabled="disabled">
                                                            <option value="0"></option>
                                                            <option value="1" <% if(daatics[30].compareTo("1")==0){out.print("SELECTED");}  %> >1</option>
                                                            <option value="2" <% if(daatics[30].compareTo("2")==0){out.print("SELECTED");}  %> >2</option>
                                                            <option value="3" <% if(daatics[30].compareTo("3")==0){out.print("SELECTED");}  %> >3</option>
                                            </select></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" id="tdpp" name="tdpp" maxlength="199" style="width:95%;border-radius: 0px 0px 0px 0px;" value="<% out.print(daatics[31]); %>" readonly /></label></center></td>
   </tr>
   <tr  id="tdi2" name="tdi2" >
       <td id="tdp" name="tdp" style="width:3%;border-radius: 0px 0px 0px 10px;"><center>3</center></td>
       <td id="tdp" name="tdp" style="width:22%"><center><label><input type="text" id="tdppn3" name="tdppn3" maxlength="199" style="width:98%" value="<% out.print(daatics[32]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" id="tdpp" name="tdpp" maxlength="199" style="width:98%" value="<% out.print(daatics[33]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" id="tdpp" name="tdpp" maxlength="199" style="width:98%" value="<% out.print(daatics[34]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:12%"><center><label><input type="text" id="tdpp" name="tdpp" maxlength="199" style="width:98%" value="<% out.print(daatics[35]); %>" readonly /></label></center></td>
       <td id="tdp" name="tdp" style="width:13%"><center><label><input type="text" id="tdpp" name="tdpp" maxlength="199" style="width:98%" value="<% out.print(daatics[36]); %>" readonly /></label></center></td>
     <td id="tdp" name="tdp" style="width:12%"><center><label><select  id="tdpp" name="tdpp"  style="width:98%" disabled="disabled" >
                                                            <option value="0"></option>
                                                            <option value="1" <% if(daatics[37].compareTo("1")==0){out.print("SELECTED");}  %>>1</option>
                                                            <option value="2" <% if(daatics[37].compareTo("2")==0){out.print("SELECTED");}  %>>2</option>
                                                            <option value="3" <% if(daatics[37].compareTo("3")==0){out.print("SELECTED");}  %>>3</option>
                                            </select></label></center></td>
       <td id="tdp" name="tdp" style="width:13%;border-radius: 0px 0px 10px 0px;"><center><label><input type="text" id="tdpp" name="tdpp" maxlength="199" style="width:95%;border-radius: 0px 0px 10px 0px;" value="<% out.print(daatics[38]); %>" readonly /></label></center></td>
   </tr>

</table>
<br/>
<table id="tablap" name="tablap" style="width:100%" border="1" >
 <tr>
     <td id="tdp" name="tdp" style="border-radius: 10px 10px 0px 0px;" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>1. Se agotaron todas las posibilidades terapeuticas del manual de medicamentos del POS-S sin obtener respuesta clinica satisfactoria?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="1_soli_no_pos0" name="1_soli_no_pos" <% if(daatics[8].compareTo("0")==0){out.print("checked");}  %> disabled="disabled"></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="1_soli_no_pos1" name="1_soli_no_pos" <% if(daatics[8].compareTo("1")==0){out.print("checked");}  %> disabled="disabled"></td>
                                             </tr>
         </table>
     </td >
</tr>
 <tr>
     <td id="tdp" name="tdp" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>2. Se evidencia intolerancia o efectos secundarios con el uso de medicamentos POS-S?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="2_soli_no_pos0" name="2_soli_no_pos" <% if(daatics[9].compareTo("0")==0){out.print("checked");}  %> disabled="disabled"></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="2_soli_no_pos1" name="2_soli_no_pos" <% if(daatics[9].compareTo("1")==0){out.print("checked");}  %> disabled="disabled"></td>
                                             </tr>
         </table>
     </td>
</tr>
 <tr>
     <td id="tdp" name="tdp" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>3. Existe riesgo inminente o para la vida y salud del paciente si no se suministra?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="3_soli_no_pos0" name="3_soli_no_pos" <% if(daatics[10].compareTo("0")==0){out.print("checked");}  %> disabled="disabled"></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="3_soli_no_pos1" name="3_soli_no_pos" <% if(daatics[10].compareTo("1")==0){out.print("checked");}  %> disabled="disabled"></td>
                                             </tr>
         </table>
     </td>
</tr>

 <tr>
     <td id="tdp" name="tdp" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>4. El medicamento se encuentra debidamente autorizado para su comercializacion y expendio en el pais?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="4_soli_no_pos0" name="4_soli_no_pos" <% if(daatics[11].compareTo("0")==0){out.print("checked");}  %> disabled="disabled"></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="4_soli_no_pos1" name="4_soli_no_pos" <% if(daatics[11].compareTo("1")==0){out.print("checked");}  %> disabled="disabled"></td>
                                             </tr>
         </table>
     </td>
</tr>

 <tr>
     <td id="tdp" name="tdp" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>5. Se identifica suficiente evidencia cientifica que apoye la decisión de utilizar en medicamento solicitado?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="5_soli_no_pos0" name="5_soli_no_pos" <% if(daatics[12].compareTo("0")==0){out.print("checked");}  %> disabled="disabled"></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="5_soli_no_pos1" name="5_soli_no_pos" <% if(daatics[12].compareTo("1")==0){out.print("checked");}  %> disabled="disabled"></td>
                                             </tr>
         </table>
     </td>
</tr>

 <tr>
     <td id="tdp" name="tdp" style="border-radius: 0px 0px 10px 10px;" >
         <table style="width:100%" border="0">
                                             <tr> 
                                                  <td style="width:90%"><label>6. Se trata de continuidad de medicamentos ya arobados por el CTC a pacientes crónicos?</label></td>
                                                  <td style="width:5%"><label>Si</label> <input type="radio" value="0" id="6_soli_no_pos0" name="6_soli_no_pos" <% if(daatics[13].compareTo("0")==0){out.print("checked");}  %> disabled="disabled"></td>
                                                  <td style="width:5%"><label>No</label> <input type="radio" value="1" id="6_soli_no_pos1" name="6_soli_no_pos" <% if(daatics[13].compareTo("1")==0){out.print("checked");}  %> disabled="disabled"></td>
                                             </tr>
         </table>
     </td>
</tr>

</table>

<br/>
<table id="tablap" name="tablap" style="width:100%" border="1">
   <tr><td colspan="8" id="tdp" name="tdp"  style="border-radius: 10px 10px 0px 0px;" ><center><label>INDICACIONES CLARAS DEL TRATAMIENTO CON MEDICAMENTOS NO POS-S</label></center></td></tr>
   <tr>
        <td id="tdp" name="tdp" ><label>&nbsp;&nbsp;&nbsp;Efecto deseado del tratamiento</label><br/>
   <center> <p  style='text-align:justify;width:98%'>  <% out.print(daatics[14]); %></p></center> 
        </td>
   </tr>
   <tr>
        <td id="tdp" name="tdp" ><label>&nbsp;&nbsp;&nbsp;Efectos secundarios y posibles riesgos al tratamiento</label><br/>
        <center> <p  style='text-align:justify;width:98%'> <% out.print(daatics[15]); %></p></center> 
        </td>
   </tr>
   <tr>
        <td id="tdp" name="tdp"  style="border-radius: 0px 0px 10px 10px;" ><label>&nbsp;&nbsp;&nbsp;Tiempo de respuesta esperado</label><br/>
        <center> <p  style='text-align:justify;width:98%'> <% out.print(daatics[16]); %></p></center> 
        </td>
   </tr>

</table>
      </center>
   
    
   </body>
</html>

<% ba.cerrar(); %>