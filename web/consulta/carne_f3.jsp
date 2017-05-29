<%-- 
    Document   : carne_f3
    Created on : 28/05/2013, 12:51:42 PM
    Author     : EMMANUEL
--%>


<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                <%
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){
          
          %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
        conecta_bd ba = new conecta_bd();
        ba.ConectaDb(); 
        
        String ultimoprevio="'8'";
        try{int ultimoprevioo=Integer.parseInt(""+request.getParameter("ultimoprevio").replace("'","").replace("\"","")+"");
                ultimoprevio="'"+request.getParameter("ultimoprevio").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){ultimoprevio="'8'";}
        ///////////
        String embplaneado="'8'";
        try{int embplaneadoa=Integer.parseInt(""+request.getParameter("embplaneado").replace("'","").replace("\"","")+"");
                embplaneado="'"+request.getParameter("embplaneado").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){embplaneado="'8'";}
        
       // System.out.println("fracasometodoant |"+request.getParameter("fracasometodoant")+"|");
        String fracasometodoant="'8'";
        try{int fracasometodoanta=Integer.parseInt(""+request.getParameter("fracasometodoant").replace("'","").replace("\"","")+"");
                fracasometodoant="'"+request.getParameter("fracasometodoant").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){fracasometodoant="'8'";}
                
      //  System.out.println("menorunanño |"+request.getParameter("menorunanño")+"|");
        String menorunanno="'0'";
        if(request.getParameter("menorunanno")!=null && request.getParameter("menorunanno").compareTo("on")==0 && request.getParameter("menorunanno").trim().compareTo("")!=0){
           menorunanno="'1'";
        }
        
        String tesconse="'0'";        
        if(request.getParameter("tesconse")!=null && request.getParameter("tesconse").compareTo("on")==0 && request.getParameter("tesconse").trim().compareTo("")!=0){
           tesconse="'1'";
        }
       
        //System.out.println("\n gestprev "+request.getParameter("gestprev"));
        String gestprev="null";
        if(request.getParameter("gestprev")!=null && request.getParameter("gestprev").compareTo("null")!=0 && request.getParameter("gestprev").trim().compareTo("")!=0){
            gestprev="'"+request.getParameter("gestprev").replace("'","").replace("\"","")+"'";
        }  
       
        String abortos="null";
        if(request.getParameter("abortos")!=null && request.getParameter("abortos").compareTo("null")!=0 && request.getParameter("abortos").trim().compareTo("")!=0){
            abortos="'"+request.getParameter("abortos").replace("'","").replace("\"","")+"'";
        } 
       
        String dvaginales="null";
        if(request.getParameter("dvaginales")!=null && request.getParameter("dvaginales").compareTo("null")!=0 && request.getParameter("dvaginales").trim().compareTo("")!=0){
            dvaginales="'"+request.getParameter("dvaginales").replace("'","").replace("\"","")+"'";
        } 
       
        String nacidosvi="null";
        if(request.getParameter("nacidosvi")!=null && request.getParameter("nacidosvi").compareTo("null")!=0 && request.getParameter("nacidosvi").trim().compareTo("")!=0){
            nacidosvi="'"+request.getParameter("nacidosvi").replace("'","").replace("\"","")+"'";
        } 
       
        String viven="null";
        if(request.getParameter("viven")!=null && request.getParameter("viven").compareTo("null")!=0 && request.getParameter("viven").trim().compareTo("")!=0){
            viven="'"+request.getParameter("viven").replace("'","").replace("\"","")+"'";
        } 
       
        String m1sem="null";
        if(request.getParameter("m1sem")!=null && request.getParameter("m1sem").compareTo("null")!=0 && request.getParameter("m1sem").trim().compareTo("")!=0){
            m1sem="'"+request.getParameter("m1sem").replace("'","").replace("\"","")+"'";
        } 
       
        String md1sem="null";
        if(request.getParameter("md1sem")!=null && request.getParameter("md1sem").compareTo("null")!=0 && request.getParameter("md1sem").trim().compareTo("")!=0){
            md1sem="'"+request.getParameter("md1sem").replace("'","").replace("\"","")+"'";
        } 
       
        String apartos="null";
        if(request.getParameter("apartos")!=null && request.getParameter("apartos").compareTo("null")!=0 && request.getParameter("apartos").trim().compareTo("")!=0){
            apartos="'"+request.getParameter("apartos").replace("'","").replace("\"","")+"'";
        } 
       
        String acesareas="null";
        if(request.getParameter("acesareas")!=null && request.getParameter("acesareas").compareTo("null")!=0 && request.getParameter("acesareas").trim().compareTo("")!=0){
            acesareas="'"+request.getParameter("acesareas").replace("'","").replace("\"","")+"'";
        } 
       
        String anacidosm="null";
        if(request.getParameter("anacidosm")!=null && request.getParameter("anacidosm").compareTo("null")!=0 && request.getParameter("anacidosm").trim().compareTo("")!=0){
            anacidosm="'"+request.getParameter("anacidosm").replace("'","").replace("\"","")+"'";
        } 
       
        String fembarazoant="null";
        if(request.getParameter("fembarazoant")!=null && request.getParameter("fembarazoant").compareTo("null")!=0 && request.getParameter("fembarazoant").trim().compareTo("")!=0){
            fembarazoant="'"+request.getParameter("fembarazoant").replace("'","").replace("\"","")+"'";
        }      
                
        
        String codemb="";
        String c="select serial from materno_perinatal where idembarazo=(select max(serial) from embarazo where cod_paciente='"+session.getAttribute("serial_pacinete")+"' )";
              // + "select max(serial) from embarazo where cod_paciente='"+session.getAttribute("serial_pacinete")+"' ;";                   
          ResultSet resuc=null;
          try{  resuc=ba.consultas(c);
              while (resuc.next()&&resuc!=null) {  
                                 codemb="'"+resuc.getString(1)+"'";
                                              }
             }                       
          catch(SQLException ex){}
          catch(Exception exe){}
          ba.cierraResultado(resuc); 
        
        
        String con="INSERT INTO `ips_isalud`.`obstetrico` (`materno_perinatal`, `gestas_previas`, `abortos`, `tres_a_conse`, `vaginales`, `nacidos_vivos`, `viven`, `ult_previo`, `partos`, `cesareas`, `nacidos_muestos`, `muertos_1sem`, `mu_despues_1sem`, `fin_embarazo_ant`, `mes_uno_mas_cinco`, `deseado`, `fracaso_planifica`) VALUES ("+codemb+","+gestprev+","+abortos+","+tesconse+","+dvaginales+","+nacidosvi+","+viven+","+ultimoprevio+","+apartos+","+acesareas+","+anacidosm+","+m1sem+","+md1sem+","+fembarazoant+","+menorunanno+","+embplaneado+","+fracasometodoant+");";
    if( ba.transaccion(con)==false){
             String dos="UPDATE `ips_isalud`.`obstetrico` SET `gestas_previas`="+gestprev+", `abortos`="+abortos+", `tres_a_conse`="+tesconse+", `vaginales`="+dvaginales+", `nacidos_vivos`="+nacidosvi+",`viven`="+viven+",`ult_previo`="+ultimoprevio+",`partos`="+apartos+",`cesareas`="+acesareas+",`nacidos_muestos`="+anacidosm+",`muertos_1sem`="+m1sem+",`mu_despues_1sem`="+md1sem+",`fin_embarazo_ant`="+fembarazoant+",`mes_uno_mas_cinco`="+menorunanno+",`deseado`="+embplaneado+",`fracaso_planifica`="+fracasometodoant+" WHERE `materno_perinatal`="+codemb+";";
            // System.out.println("datoins=>"+dos);              
                ba.transaccion(dos);
                                      }       
            //   System.out.println("carne f3 uno=>"+con);               
       ba.cerrar();
       
      %>
    </body>
</html>
