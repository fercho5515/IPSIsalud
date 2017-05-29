<%-- 
    Document   : recarga_farma_m
    Created on : 19/03/2013, 09:52:20 AM
    Author     : EMMANUEL
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="pac.conecta_bd"%>
<%@page import="pac.diasMes"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
	 <link rel="shortcut icon" href="/ISALUD/imagenes/fotos/favicon.ico">
        <%       
          int dato=0;
          try{dato=Integer.parseInt(request.getParameter("lt"));}catch(Exception ex){}
          if(dato==1){out.print("<style type='text/css'> td {font-size: 9px} label{font-size: 11px} </style>");
          }
        %>
        
    </head>
    <body>
          <% 
      
            request.setCharacterEncoding("UTF-8");
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
            
                   int mes=Integer.parseInt(request.getParameter("mes_tem_f"));
                   String mes2="";
                        if(mes==0){mes2="Enero";}
                   else if(mes==1){mes2="Febrero";}
                   else if(mes==2){mes2="Marzo";}
                   else if(mes==3){mes2="Abril";}
                   else if(mes==4){mes2="Mayo";}
                   else if(mes==5){mes2="Junio";}
                   else if(mes==6){mes2="Julio";}
                   else if(mes==7){mes2="Agosto";}
                   else if(mes==8){mes2="Septiembre";}
                   else if(mes==9){mes2="Octubre";}
                   else if(mes==10){mes2="Noviembre";}
                   else{mes2="Diciembre";}
                   
                   int ano=Integer.parseInt(request.getParameter("ano_tem_f"));
                 
                   diasMes d=new diasMes();
                       int b=d.diasDelMes(ano,mes);
            // out.println("dias del mes "+b);     
                       mes++;
           int temp[][][]=new int[18][b][2];   
           int hume[][][]=new int[11][b][2];
           int cadf[][][]=new int[11][b][2]; 
            
           for(int j=0;j<18;j++){
                      for(int k=0;k<b;k++){
                                   if(j<11){temp[j][k][0]=0;hume[j][k][0]=0;cadf[j][k][0]=0;
                                            temp[j][k][1]=0;hume[j][k][1]=0;cadf[j][k][1]=0;}
                                       else{temp[j][k][0]=0;temp[j][k][1]=0;}                                     
                                          }          
                                }
           
           String sql="select temperatura,humedad,cadena_frio,day(fecha_hora),hour(fecha_hora) from temp_hum_cadfri_farmacia where fecha_hora>='"+ano+"-"+mes+"-01 00:00:00' and fecha_hora<='"+ano+"-"+mes+"-"+b+" 23:59:59' ;";
           
          // out.print("<br>"+sql);
                 conecta_bd ba = new conecta_bd();
               ba.ConectaDb(); 
               int dia=0;
               int hora=0;
               ResultSet resu0=null;
                             try{  resu0=ba.consultas(sql);
                                   while (resu0.next()&&resu0!=null) { 
                                                       int tempe=Integer.parseInt(""+resu0.getString(1)+"");
                                                       int humed=Integer.parseInt(""+resu0.getString(2)+"");
                                                       int cad_frio=Integer.parseInt(""+resu0.getString(3)+"");
                                                       dia=Integer.parseInt(""+resu0.getString(4)+"");
                                                       dia--;  //por que la matriz va desde 0                                          
                                                       hora=Integer.parseInt(""+resu0.getString(5)+""); 
                                                     //  System.out.println("temperatura:"+tempe+" humdad:"+humed+" cadena_frio:"+cad_frio+" dia:"+(dia+1)+" hora:"+hora);
                                                       if(hora<12){
                                                               // System.out.println("hume mañana "+(humed-61)+" "+dia);
                                                               
                                                                // teperatura-% dia mañana-tarde
                                                                temp[(tempe-13)][dia][0]=1;
                                                                hume[(humed-61)][dia][0]=1;
                                                                cadf[cad_frio][dia][0]=1;
                                                                }//dia
                                                       else{ 
                                                               // System.out.println("hume tarde "+(humed-61)+" "+dia);
                                                                temp[(tempe-13)][dia][1]=1;
                                                                hume[(humed-61)][dia][1]=1;
                                                                cadf[cad_frio][dia][1]=1;                                                               
                                                            }                             
                                                                      }//fecha inicio
                               }                       
                             catch(SQLException ex){}
                             catch(Exception exe){}
                             ba.cierraResultado(resu0);  
                             ba.cerrar();
                             out.print("<br>");
                              
           if(dato!=1){out.print("<br>");}
                 
                           
           %>
           
           <center>
               <label>FORMATO CONTROL TEMPERATURA, HUMEDAD RELATIVA Y DADENA DE FRIO</label><br><% if(dato!=1){out.print("<br>");} %>
               <label>MES:</label><label style="padding-left:5px"><% out.print(mes2); %></label><label style="padding-left:25px">AÑO: </label><label style="padding-left:5px"><% out.print(ano); %></label>
               <label style="padding-left:25px">AREA: Farmacia  </label>
               <br><% if(dato!=1){out.print("<br>");} %>          
               
               <table border="1" style="background-color:white">
               <tr>
                   <td rowspan="2" colspan='2' style="width:20px">DIA</td>
                   <%
                      for(int g=1;g<=b;g++){
                           out.print("<td colspan='2' style='width:6px;height:3px;'><center>"+g+"</center></td>");
                                          }
                     %>
               </tr>
                <tr>
                     <%
                      for(int g=1;g<=b;g++){
                           out.print("<td style='width:3px;height:3px'><center>M</center></td>");
                           out.print("<td style='width:3px;height:3px'><center>T</center></td>");
                                          }
                     %>
               </tr>
                <% 
                     for(int h=17;h>=0;h--){ out.print("<tr>");
                      if(h==17){out.print("<td rowspan='18' style='width:10px;height:7px'><center>T<br>E<br>M<br>P<br>E<br>R<br>A<br>T<br>U<br>R<br>A<br><br>°C</center></td>");}
                      out.print("<td style='width:3px;height:3px;font-size:7px;'><center>"+(h+13)+"</center></td>");
                    //  if((h+13)==30||(h+13)==25||(h+13)==20||(h+13)==15){ out.print("<td style='width:3px;height:3px;font-size:7px;'><center>"+(h+13)+"</center></td>");}
                    //  else{ out.print("<td style='width:3px;height:7px'><center></center></td>");}
                              for(int t=0;t<b;t++){ 
                                   String c1="";
                                   String c2="";
                                   if(temp[h][t][0]==1){c1=";background-color:blue";}     
                                   if(temp[h][t][1]==1){c2=";background-color:red";}                                                                                                
                                   out.print("<td style='width:3px;height:3px"+c1+"'></td>");
                                   out.print("<td style='width:3px;height:3px"+c2+"'></center></td>");                                                              
                                                  }
                               out.print("</tr>");
                                                }
                   out.print("<tr><td colspan='"+(2+(b*2))+"' style='background-color:rgb(125,125,125)'></td></tr>");
                     for(int h=10;h>=0;h--){ out.print("<tr>");
                      if(h==10){out.print("<td rowspan='11' style='width:10px;height:7px'><center>H<br>U<br>M<br>E<br>D<br>A<br>D<br><br>%</center></td>");}
                      out.print("<td style='width:3px;height:3px;font-size:7px;'><center>"+(h+61)+"</center></td>");
                    //  if((h+13)==30||(h+13)==25||(h+13)==20||(h+13)==15){ out.print("<td style='width:3px;height:3px;font-size:7px;'><center>"+(h+13)+"</center></td>");}
                    //  else{ out.print("<td style='width:3px;height:7px'><center></center></td>");}
                              for(int t=0;t<b;t++){ 
                                   String c1="";
                                   String c2="";
                                // System.out.println("hume "+h+" "+t+" "+b);
                                   if(hume[h][t][0]==1){c1=";background-color:blue";}     
                                   if(hume[h][t][1]==1){c2=";background-color:red";}                                                                                                
                                   out.print("<td style='width:3px;height:3px"+c1+"'></td>");
                                   out.print("<td style='width:3px;height:3px"+c2+"'></td>");                                                              
                                                  }
                               out.print("</tr>");
                                                }
                    out.print("<tr><td colspan='"+(2+(b*2))+"' style='background-color:rgb(125,125,125)'></td></tr>");
                     for(int h=10;h>=0;h--){ out.print("<tr>");
                      if(h==10){out.print("<td rowspan='11' style='width:10px;height:7px'><center>C<br>A<br>D<br><br>F<br>R<br>I<br>O<br><br>°C</center></td>");}
                      out.print("<td style='width:3px;height:3px;font-size:7px;'><center>"+h+"</center></td>");
                    //  if((h+13)==30||(h+13)==25||(h+13)==20||(h+13)==15){ out.print("<td style='width:3px;height:3px;font-size:7px;'><center>"+(h+13)+"</center></td>");}
                    //  else{ out.print("<td style='width:3px;height:7px'><center></center></td>");}
                              for(int t=0;t<b;t++){ 
                                   String c1="";
                                   String c2="";
                                // System.out.println("hume "+h+" "+t+" "+b);
                                   if(cadf[h][t][0]==1){c1=";background-color:blue";}     
                                   if(cadf[h][t][1]==1){c2=";background-color:red";}                                                                                                
                                   out.print("<td style='width:3px;height:3px"+c1+"'></td>");
                                   out.print("<td style='width:3px;height:3px"+c2+"'></td>");                                                              
                                                  }
                               out.print("</tr>");
                                                }
               %>
               
           </table>  
          </center>
    </body>
</html>
