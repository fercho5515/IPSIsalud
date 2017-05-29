<%-- 
    Document   : recarga_farma
    Created on : 13/03/2013, 06:57:12 PM
    Author     : EMMANUEL
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%       request.setCharacterEncoding("UTF-8");
             Date fecha=new Date(); 
             SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); 
             String fechiticc=""+sdf.format(fecha);
             if(request.getParameter("fecha_t")!=null){fechiticc=request.getParameter("fecha_t");}
             //System.out.println("La fecha de hoy es:" + sdf.format(fecha)); 
             
               String sql="select count(id_temp) from temp_hum_cadfri_farmacia where fecha_hora like '"+fechiticc+"%'";
            //   System.out.println("sera que funca: "+sql);
               conecta_bd ba = new conecta_bd();
               ba.ConectaDb(); 
               int canti=0;
               ResultSet resu0=null;
                             try{  resu0=ba.consultas(sql);
                                   while (resu0.next()&&resu0!=null) { 
                                                        canti=Integer.parseInt(""+resu0.getString(1)+"");
                                              }//fecha inicio
                               }                       
                             catch(SQLException ex){}
                             catch(Exception exe){}
                             ba.cierraResultado(resu0);  
            
              String datos[][]= new String[canti][5];   
              
              sql="select hour(fecha_hora),minute(fecha_hora),second(fecha_hora),temperatura,humedad,cadena_frio from temp_hum_cadfri_farmacia where fecha_hora like '"+fechiticc+"%'";
 
              int numerito=0;
              ResultSet resu2=null;
              try{  resu2=ba.consultas(sql);
                            while (resu2.next()&&resu2!=null) { 
                                                        String hor=""+resu2.getString(1)+"";
                                                        String min=""+resu2.getString(2)+"";
                                                        String sec=""+resu2.getString(3)+"";
                                                        datos[numerito][0]=""+hor+"";
                                                        int hortemp=Integer.parseInt(hor);
                                                             if(hortemp==12){datos[numerito][1]=""+hor+":"+min+":"+sec+" pm";}
                                                        else if(hortemp<12) {datos[numerito][1]=""+hor+":"+min+":"+sec+" am";}
                                                              else{datos[numerito][1]=""+(hortemp-12)+":"+min+":"+sec+" pm";}
                                                      //datos[numerito][1]=""+hor+":"+min+":"+sec;
                                                        datos[numerito][2]=""+resu2.getString(4)+"";
                                                        datos[numerito][3]=""+resu2.getString(5)+"";
                                                        datos[numerito][4]=""+resu2.getString(6)+"";
                                                        numerito++;
                                              }//fecha inicio
                  }                       
             catch(SQLException ex){}
             catch(Exception exe){}
             ba.cierraResultado(resu2);  
                                                                    
    %>
    
    <body>
          <% 
      
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }%>
            <table border="1" style="border-radius:15px">
           <tr>
               <td style="text-align:center;padding-left:20px;padding-right:10px;border-radius:15px 0px 0px 0px">
                   <label>Hora:</label>  
               </td>
               <td style="text-align:center;padding-left:10px;padding-right:10px">
                   <label>Temperatura</label>  
               </td>
               <td style="text-align:center;padding-left:10px;padding-right:10px">
                   <label>Humedad Relativa</label>  
               </td>
               <td style="text-align:center;padding-left:10px;padding-right:20px;border-radius:0px 15px 0px 0px">
                   <label>Cadena de Frio</label>  
               </td>
           </tr>    
           <% 
              for(int i=5;i<=19;i++){
               String color="yellow";
               String r1="";
               String r2="";
               int dato=i;
                    if(dato==12){color="blue";} 
               else if(dato>12) {color="blue"; dato=dato-12;}      
                    if(i==19) {r1=";border-radius:0px 0px 0px 15px";r2=";border-radius:0px 0px 15px 0px";}                                                        
               String temp="";String hum="";String cadf="";
                
               int band=0;
               for(int j=0;j<canti;j++){
                                       if(i==Integer.parseInt(datos[j][0])){
                                                   String colorlab="";
                                                   if(i>=12){colorlab=" style='color:white'";}
                                                    if(band==0){temp=" <label "+colorlab+">"+datos[j][2]+" °C "+datos[j][1]+"</label>";
                                                                hum="  <label "+colorlab+">"+datos[j][3]+" °C "+datos[j][1]+"</label>";
                                                                cadf=" <label "+colorlab+">"+datos[j][4]+" °C "+datos[j][1]+"</label>";
                                                                 band=1;}
                                                    else{temp=temp+"<br> <label "+colorlab+">"+datos[j][2]+" °C "+datos[j][1]+"</label>";
                                                         hum=hum+" <br> <label "+colorlab+">"+datos[j][3]+" °C "+datos[j][1]+"</label>";
                                                         cadf=cadf+"<br> <label "+colorlab+">"+datos[j][4]+" °C "+datos[j][1]+"</label>";
                                                       }                                                                          
                                                                           }
                                       }                
               
               
               out.print("    <tr>");
               out.print("        <td style='text-align:center"+r1+"'>");
               out.print("            <center><label>"+dato+" - "+(dato+1)+"</label></center>");
               out.print("        </td>");
               out.print("        <td style='text-align:center;background-color:"+color+"' >");
               out.print("            <center>"+temp+"</center>");
               out.print("        </td>");
               out.print("        <td style='text-align:center;background-color:"+color+"' >");
               out.print("            <center>"+hum+"</center>");
               out.print("        </td>");
               out.print("        <td style='text-align:center;background-color:"+color+""+r2+"' >");
               out.print("            <center>"+cadf+"</center>");
               out.print("        </td>");
               out.print("    </tr>");
           
              }
           ba.cerrar();
           %>
       </table>
    </body>
</html>
