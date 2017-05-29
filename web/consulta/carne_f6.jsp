<%-- 
    Document   : carne_f6
    Created on : 10/06/2013, 12:39:42 PM
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
                <% request.setCharacterEncoding("UTF-8");
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
       request.setCharacterEncoding("UTF-8");
            //text             
           String perimcefalic="null";
              if(request.getParameter("perimcefalic")!=null && request.getParameter("perimcefalic").compareTo("null")!=0 && request.getParameter("perimcefalic").trim().compareTo("")!=0){
                     perimcefalic="'"+request.getParameter("perimcefalic").replace("'","").replace("\"","")+"'";
                }    
                  
           String egconfiablesem="null";
              if(request.getParameter("egconfiablesem")!=null && request.getParameter("egconfiablesem").compareTo("null")!=0 && request.getParameter("egconfiablesem").trim().compareTo("")!=0){
                     egconfiablesem="'"+request.getParameter("egconfiablesem").replace("'","").replace("\"","")+"'";
                }
                  
           String egconfiabledias="null";
              if(request.getParameter("egconfiabledias")!=null && request.getParameter("egconfiabledias").compareTo("null")!=0 && request.getParameter("egconfiabledias").trim().compareTo("")!=0){
                    egconfiabledias="'"+request.getParameter("egconfiabledias").replace("'","").replace("\"","")+"'";
                }
                  
           String apgar1er="null";
              if(request.getParameter("apgar1er")!=null && request.getParameter("apgar1er").compareTo("null")!=0 && request.getParameter("apgar1er").trim().compareTo("")!=0){
                     apgar1er="'"+request.getParameter("apgar1er").replace("'","").replace("\"","")+"'";
                }
                  
           String apgar5to="null";
              if(request.getParameter("apgar5to")!=null && request.getParameter("apgar5to").compareTo("null")!=0 && request.getParameter("apgar5to").trim().compareTo("")!=0){
                     apgar5to="'"+request.getParameter("apgar5to").replace("'","").replace("\"","")+"'";
                }
                  
           String partoatendidopor="null";
              if(request.getParameter("partoatendidopor")!=null && request.getParameter("partoatendidopor").compareTo("null")!=0 && request.getParameter("partoatendidopor").trim().compareTo("")!=0){
                     partoatendidopor="'"+request.getParameter("partoatendidopor").replace("'","").replace("\"","")+"'";
                }
                  
           String pesoalnacer="null";
              if(request.getParameter("pesoalnacer")!=null && request.getParameter("pesoalnacer").compareTo("null")!=0 && request.getParameter("pesoalnacer").trim().compareTo("")!=0){
                     pesoalnacer="'"+request.getParameter("pesoalnacer").replace("'","").replace("\"","")+"'";
                }
                  
           String neonatoatendidopor="null";
              if(request.getParameter("neonatoatendidopor")!=null && request.getParameter("neonatoatendidopor").compareTo("null")!=0 && request.getParameter("neonatoatendidopor").trim().compareTo("")!=0){
                     neonatoatendidopor="'"+request.getParameter("neonatoatendidopor").replace("'","").replace("\"","")+"'";
                }
                  
           String reciennacidotalla="null";
              if(request.getParameter("reciennacidotalla")!=null && request.getParameter("reciennacidotalla").compareTo("null")!=0 && request.getParameter("reciennacidotalla").trim().compareTo("")!=0){
                     reciennacidotalla="'"+request.getParameter("reciennacidotalla").replace("'","").replace("\"","")+"'";
                }
                  
           String defectoscongenitoscod="null";
              if(request.getParameter("defectoscongenitoscod")!=null && request.getParameter("defectoscongenitoscod").compareTo("null")!=0 && request.getParameter("defectoscongenitoscod").trim().compareTo("")!=0){
                     defectoscongenitoscod="'"+request.getParameter("defectoscongenitoscod").replace("'","").replace("\"","")+"'";
                }
                  
           String codenfermedadrecienacido="null";
              if(request.getParameter("codenfermedadrecienacido")!=null && request.getParameter("codenfermedadrecienacido").compareTo("null")!=0 && request.getParameter("codenfermedadrecienacido").trim().compareTo("")!=0){
                     codenfermedadrecienacido="'"+request.getParameter("codenfermedadrecienacido").replace("'","").replace("\"","")+"'";
                }
                  
           String txtenfermedadrecienacido="null";
              if(request.getParameter("txtenfermedadrecienacido")!=null && request.getParameter("txtenfermedadrecienacido").compareTo("null")!=0 && request.getParameter("txtenfermedadrecienacido").trim().compareTo("")!=0){
                     txtenfermedadrecienacido="'"+request.getParameter("txtenfermedadrecienacido").replace("'","").replace("\"","")+"'";
                }
                  
           String codenfermedadrecienacido2="null";
              if(request.getParameter("codenfermedadrecienacido2")!=null && request.getParameter("codenfermedadrecienacido2").compareTo("null")!=0 && request.getParameter("codenfermedadrecienacido2").trim().compareTo("")!=0){
                    codenfermedadrecienacido2="'"+request.getParameter("codenfermedadrecienacido2").replace("'","").replace("\"","")+"'";
                }
                  
           String txtenfermedadrecienacido2="null";
              if(request.getParameter("txtenfermedadrecienacido2")!=null && request.getParameter("txtenfermedadrecienacido2").compareTo("null")!=0 && request.getParameter("txtenfermedadrecienacido2").trim().compareTo("")!=0){
                     txtenfermedadrecienacido2="'"+request.getParameter("txtenfermedadrecienacido2").replace("'","").replace("\"","")+"'";
                }
                  
           String codenfermedadrecienacido3="null";
              if(request.getParameter("codenfermedadrecienacido3")!=null && request.getParameter("codenfermedadrecienacido3").compareTo("null")!=0 && request.getParameter("codenfermedadrecienacido3").trim().compareTo("")!=0){
                     codenfermedadrecienacido3="'"+request.getParameter("codenfermedadrecienacido3").replace("'","").replace("\"","")+"'";
                }
                  
           String txtenfermedadrecienacido3="null";
              if(request.getParameter("txtenfermedadrecienacido3")!=null && request.getParameter("txtenfermedadrecienacido3").compareTo("null")!=0 && request.getParameter("txtenfermedadrecienacido3").trim().compareTo("")!=0){
                     txtenfermedadrecienacido3="'"+request.getParameter("txtenfermedadrecienacido3").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperiotc1="null";
              if(request.getParameter("puerperiotc1")!=null && request.getParameter("puerperiotc1").compareTo("null")!=0 && request.getParameter("puerperiotc1").trim().compareTo("")!=0){
                     puerperiotc1="'"+request.getParameter("puerperiotc1").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperiopulso1="null";
              if(request.getParameter("puerperiopulso1")!=null && request.getParameter("puerperiopulso1").compareTo("null")!=0 && request.getParameter("puerperiopulso1").trim().compareTo("")!=0){
                     puerperiopulso1="'"+request.getParameter("puerperiopulso1").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperiopa1="null";
              if(request.getParameter("puerperiopa1")!=null && request.getParameter("puerperiopa1").compareTo("null")!=0 && request.getParameter("puerperiopa1").trim().compareTo("")!=0){
                     puerperiopa1="'"+request.getParameter("puerperiopa1").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperiopa11="null";
              if(request.getParameter("puerperiopa11")!=null && request.getParameter("puerperiopa11").compareTo("null")!=0 && request.getParameter("puerperiopa11").trim().compareTo("")!=0){
                     puerperiopa11="'"+request.getParameter("puerperiopa11").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperioinvoluter1="null";
              if(request.getParameter("puerperioinvoluter1")!=null && request.getParameter("puerperioinvoluter1").compareTo("null")!=0 && request.getParameter("puerperioinvoluter1").trim().compareTo("")!=0){
                     puerperioinvoluter1="'"+request.getParameter("puerperioinvoluter1").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperioloquios1="null";
              if(request.getParameter("puerperioloquios1")!=null && request.getParameter("puerperioloquios1").compareTo("null")!=0 && request.getParameter("puerperioloquios1").trim().compareTo("")!=0){
                     puerperioloquios1="'"+request.getParameter("puerperioloquios1").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperiotc2="null";
              if(request.getParameter("puerperiotc2")!=null && request.getParameter("puerperiotc2").compareTo("null")!=0 && request.getParameter("puerperiotc2").trim().compareTo("")!=0){
                     puerperiotc2="'"+request.getParameter("puerperiotc2").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperiopulso2="null";
              if(request.getParameter("puerperiopulso2")!=null && request.getParameter("puerperiopulso2").compareTo("null")!=0 && request.getParameter("puerperiopulso2").trim().compareTo("")!=0){
                     puerperiopulso2="'"+request.getParameter("puerperiopulso2").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperiopa2="null";
              if(request.getParameter("puerperiopa2")!=null && request.getParameter("puerperiopa2").compareTo("null")!=0 && request.getParameter("puerperiopa2").trim().compareTo("")!=0){
                     puerperiopa2="'"+request.getParameter("puerperiopa2").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperiopa22="null";
              if(request.getParameter("puerperiopa22")!=null && request.getParameter("puerperiopa22").compareTo("null")!=0 && request.getParameter("puerperiopa22").trim().compareTo("")!=0){
                     puerperiopa22="'"+request.getParameter("puerperiopa22").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperioinvoluter2="null";
              if(request.getParameter("puerperioinvoluter2")!=null && request.getParameter("puerperioinvoluter2").compareTo("null")!=0 && request.getParameter("puerperioinvoluter2").trim().compareTo("")!=0){
                    puerperioinvoluter2="'"+request.getParameter("puerperioinvoluter2").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperioloquios2="null";
              if(request.getParameter("puerperioloquios2")!=null && request.getParameter("puerperioloquios2").compareTo("null")!=0 && request.getParameter("puerperioloquios2").trim().compareTo("")!=0){
                     puerperioloquios2="'"+request.getParameter("puerperioloquios2").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperiotc3="null";
              if(request.getParameter("puerperiotc3")!=null && request.getParameter("puerperiotc3").compareTo("null")!=0 && request.getParameter("puerperiotc3").trim().compareTo("")!=0){
                     puerperiotc3="'"+request.getParameter("puerperiotc3").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperiopulso3="null";
              if(request.getParameter("puerperiopulso3")!=null && request.getParameter("puerperiopulso3").compareTo("null")!=0 && request.getParameter("puerperiopulso3").trim().compareTo("")!=0){
                    puerperiopulso3="'"+request.getParameter("puerperiopulso3").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperiopa3="null";
              if(request.getParameter("puerperiopa3")!=null && request.getParameter("puerperiopa3").compareTo("null")!=0 && request.getParameter("puerperiopa3").trim().compareTo("")!=0){
                     puerperiopa3="'"+request.getParameter("puerperiopa3").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperiopa33="null";
              if(request.getParameter("puerperiopa33")!=null && request.getParameter("puerperiopa33").compareTo("null")!=0 && request.getParameter("puerperiopa33").trim().compareTo("")!=0){
                    puerperiopa33="'"+request.getParameter("puerperiopa33").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperioinvoluter3="null";
              if(request.getParameter("puerperioinvoluter3")!=null && request.getParameter("puerperioinvoluter3").compareTo("null")!=0 && request.getParameter("puerperioinvoluter3").trim().compareTo("")!=0){
                     puerperioinvoluter3="'"+request.getParameter("puerperioinvoluter3").replace("'","").replace("\"","")+"'";
                }
                  
           String puerperioloquios3="null";
              if(request.getParameter("puerperioloquios3")!=null && request.getParameter("puerperioloquios3").compareTo("null")!=0 && request.getParameter("puerperioloquios3").trim().compareTo("")!=0){
                     puerperioloquios3="'"+request.getParameter("puerperioloquios3").replace("'","").replace("\"","")+"'";
                }
                  
           String reciennacidonota="null";
              if(request.getParameter("reciennacidonota")!=null && request.getParameter("reciennacidonota").compareTo("null")!=0 && request.getParameter("reciennacidonota").trim().compareTo("")!=0){
                   reciennacidonota="'"+request.getParameter("reciennacidonota").replace("'","").replace("\"","")+"'";
                }
                  
           String fechaegresopostparto="null";
              if(request.getParameter("fechaegresopostparto")!=null && request.getParameter("fechaegresopostparto").compareTo("null")!=0 && request.getParameter("fechaegresopostparto").trim().compareTo("")!=0){
                     fechaegresopostparto="'"+request.getParameter("fechaegresopostparto").replace("'","").replace("\"","")+"'";
                }
                  
           String egresopostparto="null";
              if(request.getParameter("egresopostparto")!=null && request.getParameter("egresopostparto").compareTo("null")!=0 && request.getParameter("egresopostparto").trim().compareTo("")!=0){
                     egresopostparto="'"+request.getParameter("egresopostparto").replace("'","").replace("\"","")+"'";
                }
                  
           String egresomaternoresponsable="null";
              if(request.getParameter("egresomaternoresponsable")!=null && request.getParameter("egresomaternoresponsable").compareTo("null")!=0 && request.getParameter("egresomaternoresponsable").trim().compareTo("")!=0){
                     egresomaternoresponsable="'"+request.getParameter("egresomaternoresponsable").replace("'","").replace("\"","")+"'";
                }
                  
           String fechaegresoneonato="null";
              if(request.getParameter("fechaegresoneonato")!=null && request.getParameter("fechaegresoneonato").compareTo("null")!=0 && request.getParameter("fechaegresoneonato").trim().compareTo("")!=0){
                     fechaegresoneonato="'"+request.getParameter("fechaegresoneonato").replace("'","").replace("\"","")+"'";
                }    
                  
           String rnedaddias="null";
              if(request.getParameter("rnedaddias")!=null && request.getParameter("rnedaddias").compareTo("null")!=0 && request.getParameter("rnedaddias").trim().compareTo("")!=0){
                     rnedaddias="'"+request.getParameter("rnedaddias").replace("'","").replace("\"","")+"'";
                }
                  
           String nrpesoegreso="null";
              if(request.getParameter("nrpesoegreso")!=null && request.getParameter("nrpesoegreso").compareTo("null")!=0 && request.getParameter("nrpesoegreso").trim().compareTo("")!=0){
                     nrpesoegreso="'"+request.getParameter("nrpesoegreso").replace("'","").replace("\"","")+"'";
                }
                  
           String rnnuip="null";
              if(request.getParameter("rnnuip")!=null && request.getParameter("rnnuip").compareTo("null")!=0 && request.getParameter("rnnuip").trim().compareTo("")!=0){
                    rnnuip="'"+request.getParameter("rnnuip").replace("'","").replace("\"","")+"'";
                }
                  
           String rnnombre="null";
              if(request.getParameter("rnnombre")!=null && request.getParameter("rnnombre").compareTo("null")!=0 && request.getParameter("rnnombre").trim().compareTo("")!=0){
                     rnnombre="'"+request.getParameter("rnnombre").replace("'","").replace("\"","")+"'";
                }
                  
           String rnresponsable="null";
              if(request.getParameter("rnresponsable")!=null && request.getParameter("rnresponsable").compareTo("null")!=0 && request.getParameter("rnresponsable").trim().compareTo("")!=0){
                     rnresponsable="'"+request.getParameter("rnresponsable").replace("'","").replace("\"","")+"'";
                }
                         
            //select 
            String hora_puerperio1="'0'";
            try{int hora_puerperio11=Integer.parseInt(""+request.getParameter("hora_puerperio1").replace("'","").replace("\"","")+"");
                    hora_puerperio1="'"+request.getParameter("hora_puerperio1").replace("'","").replace("\"","")+"'";
               }
            catch(Exception exe){hora_puerperio1="'0'";}   
            
            String min_puerperio1="'0'";
            try{int min_puerperio1o=Integer.parseInt(""+request.getParameter("min_puerperio1").replace("'","").replace("\"","")+"");
                    min_puerperio1="'"+request.getParameter("min_puerperio1").replace("'","").replace("\"","")+"'";
               }
            catch(Exception exe){min_puerperio1="'0'";}    
            
            String ampm_puerperio1="'0'";
            try{int ampm_puerperio1o=Integer.parseInt(""+request.getParameter("ampm_puerperio1").replace("'","").replace("\"","")+"");
                    ampm_puerperio1="'"+request.getParameter("ampm_puerperio1").replace("'","").replace("\"","")+"'";
               }
            catch(Exception exe){ampm_puerperio1="'0'";}     
            
            String hora_puerperio2="'0'";
            try{int hora_puerperio2o=Integer.parseInt(""+request.getParameter("hora_puerperio2").replace("'","").replace("\"","")+"");
                    hora_puerperio2="'"+request.getParameter("hora_puerperio2").replace("'","").replace("\"","")+"'";
               }
            catch(Exception exe){hora_puerperio2="'0'";}     
            
            String min_puerperio2="'0'";
            try{int min_puerperio2o=Integer.parseInt(""+request.getParameter("min_puerperio2").replace("'","").replace("\"","")+"");
                    min_puerperio2="'"+request.getParameter("min_puerperio2").replace("'","").replace("\"","")+"'";
               }
            catch(Exception exe){min_puerperio2="'0'";}     
            
            String ampm_puerperio2="'0'";
            try{int ampm_puerperio2o=Integer.parseInt(""+request.getParameter("ampm_puerperio2").replace("'","").replace("\"","")+"");
                    ampm_puerperio2="'"+request.getParameter("ampm_puerperio2").replace("'","").replace("\"","")+"'";
               }
            catch(Exception exe){ampm_puerperio2="'0'";}     
            
            String hora_puerperio3="'0'";
            try{int hora_puerperio3o=Integer.parseInt(""+request.getParameter("hora_puerperio3").replace("'","").replace("\"","")+"");
                    hora_puerperio3="'"+request.getParameter("hora_puerperio3").replace("'","").replace("\"","")+"'";
               }
            catch(Exception exe){hora_puerperio3="'0'";}     
            
            String min_puerperio3="'0'";
            try{int min_puerperio3o=Integer.parseInt(""+request.getParameter("min_puerperio3").replace("'","").replace("\"","")+"");
                    min_puerperio3="'"+request.getParameter("min_puerperio3").replace("'","").replace("\"","")+"'";
               }
            catch(Exception exe){min_puerperio3="'0'";}     
            
            String ampm_puerperio3="'0'";
            try{int ampm_puerperio3o=Integer.parseInt(""+request.getParameter("ampm_puerperio3").replace("'","").replace("\"","")+"");
                    ampm_puerperio3="'"+request.getParameter("ampm_puerperio3").replace("'","").replace("\"","")+"'";
               }
            catch(Exception exe){ampm_puerperio3="'0'";}    
            
            //check
             String reciennacidomenos2500="'0'";
                if(request.getParameter("reciennacidomenos2500")!=null && request.getParameter("reciennacidomenos2500").compareTo("on")==0 && request.getParameter("reciennacidomenos2500").trim().compareTo("")!=0){
                   reciennacidomenos2500="'1'";
                }
                   
             String edaddiascompletos="'0'";
                if(request.getParameter("edaddiascompletos")!=null && request.getParameter("edaddiascompletos").compareTo("on")==0 && request.getParameter("edaddiascompletos").trim().compareTo("")!=0){
                   edaddiascompletos="'1'";
                }
             
             String reanininguna="'0'";
                if(request.getParameter("reanininguna")!=null && request.getParameter("reanininguna").compareTo("on")==0 && request.getParameter("reanininguna").trim().compareTo("")!=0){
                   reanininguna="'1'";
                }
             String enf_reciennacido="'0'";
                if(request.getParameter("enf_reciennacido")!=null && request.getParameter("enf_reciennacido").compareTo("on")==0 && request.getParameter("enf_reciennacido").trim().compareTo("")!=0){
                   enf_reciennacido="'1'";
                }
           //radio 

          String pesoegedec="'8'";
          try{int pesoegedeco=Integer.parseInt(""+request.getParameter("pesoegedec").replace("'","").replace("\"","")+"");
                  pesoegedec="'"+request.getParameter("pesoegedec").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){pesoegedec="'8'";}
       
          String egconfiablefumecoest="'8'";
          try{int egconfiablefumecoesto=Integer.parseInt(""+request.getParameter("egconfiablefumecoest").replace("'","").replace("\"","")+"");
                  egconfiablefumecoest="'"+request.getParameter("egconfiablefumecoest").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){egconfiablefumecoest="'8'";}
       
          String reaniflujolibre="'8'";
          try{int reaniflujolibreo=Integer.parseInt(""+request.getParameter("reaniflujolibre").replace("'","").replace("\"","")+"");
                  reaniflujolibre="'"+request.getParameter("reaniflujolibre").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){reaniflujolibre="'8'";}
       
          String reaniventilacionp="'8'";
          try{int reaniventilacionpo=Integer.parseInt(""+request.getParameter("reaniventilacionp").replace("'","").replace("\"","")+"");
                  reaniventilacionp="'"+request.getParameter("reaniventilacionp").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){reaniventilacionp="'8'";}
       
          String reaniintubacionot="'8'";
          try{int reaniintubacionoto=Integer.parseInt(""+request.getParameter("reaniintubacionot").replace("'","").replace("\"","")+"");
                  reaniintubacionot="'"+request.getParameter("reaniintubacionot").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){reaniintubacionot="'8'";}
       
          String reanimasajecardi="'8'";
          try{int reanimasajecardio=Integer.parseInt(""+request.getParameter("reanimasajecardi").replace("'","").replace("\"","")+"");
                  reanimasajecardi="'"+request.getParameter("reanimasajecardi").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){reanimasajecardi="'8'";}
       
          String reaniadrenalina="'8'";
          try{int reaniadrenalinao=Integer.parseInt(""+request.getParameter("reaniadrenalina").replace("'","").replace("\"","")+"");
                  reaniadrenalina="'"+request.getParameter("reaniadrenalina").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){reaniadrenalina="'8'";}
       
          String falleceenparto="'8'";
          try{int falleceenpartoo=Integer.parseInt(""+request.getParameter("falleceenparto").replace("'","").replace("\"","")+"");
                  falleceenparto="'"+request.getParameter("falleceenparto").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){falleceenparto="'8'";}
       
          String reciennacidosexo="'8'";
          try{int reciennacidosexoo=Integer.parseInt(""+request.getParameter("reciennacidosexo").replace("'","").replace("\"","")+"");
                  reciennacidosexo="'"+request.getParameter("reciennacidosexo").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){reciennacidosexo="'8'";}
       
          String partoatendido="'8'";
          try{int partoatendidoo=Integer.parseInt(""+request.getParameter("partoatendido").replace("'","").replace("\"","")+"");
                  partoatendido="'"+request.getParameter("partoatendido").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){partoatendido="'8'";}
       
          String reciennacidoreferido="'8'";
          try{int reciennacidoreferidoo=Integer.parseInt(""+request.getParameter("reciennacidoreferido").replace("'","").replace("\"","")+"");
                  reciennacidoreferido="'"+request.getParameter("reciennacidoreferido").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){reciennacidoreferido="'8'";}
       
          String neonatoatendido="'8'";
          try{int neonatoatendidoo=Integer.parseInt(""+request.getParameter("neonatoatendido").replace("'","").replace("\"","")+"");
                  neonatoatendido="'"+request.getParameter("neonatoatendido").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){neonatoatendido="'8'";}
       
          String defectoscongenitos="'8'";
          try{int defectoscongenitoso=Integer.parseInt(""+request.getParameter("defectoscongenitos").replace("'","").replace("\"","")+"");
                  defectoscongenitos="'"+request.getParameter("defectoscongenitos").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){defectoscongenitos="'8'";}
       
          String tamineonatalvdrl="'8'";
          try{int tamineonatalvdrlo=Integer.parseInt(""+request.getParameter("tamineonatalvdrl").replace("'","").replace("\"","")+"");
                  tamineonatalvdrl="'"+request.getParameter("tamineonatalvdrl").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){tamineonatalvdrl="'8'";}
       
          String tamineonatalbocaarriba="'8'";
          try{int tamineonatalbocaarribao=Integer.parseInt(""+request.getParameter("tamineonatalbocaarriba").replace("'","").replace("\"","")+"");
                  tamineonatalbocaarriba="'"+request.getParameter("tamineonatalbocaarriba").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){tamineonatalbocaarriba="'8'";}
       
          String tamineonataltsh="'8'";
          try{int tamineonataltsho=Integer.parseInt(""+request.getParameter("tamineonataltsh").replace("'","").replace("\"","")+"");
                  tamineonataltsh="'"+request.getParameter("tamineonataltsh").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){tamineonataltsh="'8'";}
       
          String tamineonatalmeconio="'8'";
          try{int tamineonatalmeconioo=Integer.parseInt(""+request.getParameter("tamineonatalmeconio").replace("'","").replace("\"","")+"");
                 tamineonatalmeconio="'"+request.getParameter("tamineonatalmeconio").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){tamineonatalmeconio="'8'";}
       
          String tamineonatalhbpatia="'8'";
          try{int tamineonatalhbpatiao=Integer.parseInt(""+request.getParameter("tamineonatalhbpatia").replace("'","").replace("\"","")+"");
                  tamineonatalhbpatia="'"+request.getParameter("tamineonatalhbpatia").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){tamineonatalhbpatia="'8'";}
       
          String tamineonatalhiper="'8'";
          try{int tamineonatalhipero=Integer.parseInt(""+request.getParameter("tamineonatalhiper").replace("'","").replace("\"","")+"");
                  tamineonatalhiper="'"+request.getParameter("tamineonatalhiper").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){tamineonatalhiper="'8'";}
       
          String tamineonatalaudicion="'8'";
          try{int tamineonatalaudiciono=Integer.parseInt(""+request.getParameter("tamineonatalaudicion").replace("'","").replace("\"","")+"");
                  tamineonatalaudicion="'"+request.getParameter("tamineonatalaudicion").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){tamineonatalaudicion="'8'";}
       
          String rnvitaminak="'8'";
          try{int rnvitaminako=Integer.parseInt(""+request.getParameter("rnvitaminak").replace("'","").replace("\"","")+"");
                  rnvitaminak="'"+request.getParameter("rnvitaminak").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){rnvitaminak="'8'";}
       
          String gruposanguineorn="'8'";
          try{int gruposanguineorno=Integer.parseInt(""+request.getParameter("gruposanguineorn").replace("'","").replace("\"","")+"");
                  gruposanguineorn="'"+request.getParameter("gruposanguineorn").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){gruposanguineorn="'8'";}
       
          String rhrn="'8'";
          try{int rhrno=Integer.parseInt(""+request.getParameter("rhrn").replace("'","").replace("\"","")+"");
                  rhrn="'"+request.getParameter("rhrn").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){rhrn="'8'";}
       
          String reciennacidosensible="'8'";
          try{int reciennacidosensibleo=Integer.parseInt(""+request.getParameter("reciennacidosensible").replace("'","").replace("\"","")+"");
                  reciennacidosensible="'"+request.getParameter("reciennacidosensible").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){reciennacidosensible="'8'";}
       
          String profilaxisoftalmica="'8'";
          try{int profilaxisoftalmicao=Integer.parseInt(""+request.getParameter("profilaxisoftalmica").replace("'","").replace("\"","")+"");
                  profilaxisoftalmica="'"+request.getParameter("profilaxisoftalmica").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){profilaxisoftalmica="'8'";}
       
          String egresomaternoestado="'8'";
          try{int egresomaternoestadoo=Integer.parseInt(""+request.getParameter("egresomaternoestado").replace("'","").replace("\"","")+"");
                  egresomaternoestado="'"+request.getParameter("egresomaternoestado").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){egresomaternoestado="'8'";}
       
          String egresoanticoncepcion="'8'";
          try{int egresoanticoncepciono=Integer.parseInt(""+request.getParameter("egresoanticoncepcion").replace("'","").replace("\"","")+"");
                  egresoanticoncepcion="'"+request.getParameter("egresoanticoncepcion").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){egresoanticoncepcion="'8'";}
       
          String egresomaternoantirubeola="'8'";
          try{int egresomaternoantirubeolao=Integer.parseInt(""+request.getParameter("egresomaternoantirubeola").replace("'","").replace("\"","")+"");
                  egresomaternoantirubeola="'"+request.getParameter("egresomaternoantirubeola").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){egresomaternoantirubeola="'8'";}
       
          String egresomaternoreferida="'8'";
          try{int egresomaternoreferidao=Integer.parseInt(""+request.getParameter("egresomaternoreferida").replace("'","").replace("\"","")+"");
                  egresomaternoreferida="'"+request.getParameter("egresomaternoreferida").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){egresomaternoreferida="'8'";}
          
          String egresomaternohemorragia="'8'";
          try{int egresomaternohemorragiao=Integer.parseInt(""+request.getParameter("egresomaternohemorragia").replace("'","").replace("\"","")+"");
                  egresomaternohemorragia="'"+request.getParameter("egresomaternohemorragia").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){egresomaternohemorragia="'8'";}
          
          String egresomaternoinfeccion="'8'";
          try{int egresomaternoinfecciono=Integer.parseInt(""+request.getParameter("egresomaternoinfeccion").replace("'","").replace("\"","")+"");
                  egresomaternoinfeccion="'"+request.getParameter("egresomaternoinfeccion").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){egresomaternoinfeccion="'8'";}
       
          String egresornestado="'8'";
          try{int egresornestadoo=Integer.parseInt(""+request.getParameter("egresornestado").replace("'","").replace("\"","")+"");
                  egresornestado="'"+request.getParameter("egresornestado").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){egresornestado="'8'";}
       
          String egresornlactancia="'8'";
          try{int egresornlactanciao=Integer.parseInt(""+request.getParameter("egresornlactancia").replace("'","").replace("\"","")+"");
                  egresornlactancia="'"+request.getParameter("egresornlactancia").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){egresornlactancia="'8'";}
       
          String egresornpolio="'8'";
          try{int egresornpolioo=Integer.parseInt(""+request.getParameter("egresornpolio").replace("'","").replace("\"","")+"");
                  egresornpolio="'"+request.getParameter("egresornpolio").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){egresornpolio="'8'";}
       
          String egresornbcg="'8'";
          try{int egresornbcgo=Integer.parseInt(""+request.getParameter("egresornbcg").replace("'","").replace("\"","")+"");
                  egresornbcg="'"+request.getParameter("egresornbcg").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){egresornbcg="'8'";}
       
          String egresornhepatb="'8'";
          try{int egresornhepatbo=Integer.parseInt(""+request.getParameter("egresornhepatb").replace("'","").replace("\"","")+"");
                  egresornhepatb="'"+request.getParameter("egresornhepatb").replace("'","").replace("\"","")+"'";
             }
          catch(Exception exe){egresornhepatb="'8'";}
       
                   
      

        String codemb="";
        String c="select serial from materno_perinatal where idembarazo=(select max(serial) from embarazo where cod_paciente='"+session.getAttribute("serial_pacinete")+"' )";
           ResultSet resuc=null;
          try{  resuc=ba.consultas(c);
              while (resuc.next()&&resuc!=null) {  
                                 codemb="'"+resuc.getString(1)+"'";
                                              }
             }                       
          catch(SQLException ex){}
          catch(Exception exe){}
          ba.cierraResultado(resuc); 
        
        
        String con="INSERT INTO `ips_isalud`.`recien_nacido` (`materno_perinatal`, `sexo`, `peso_al_nacer`, `menor_domilqui`, `pre_cefalico`, `talla`, `eg_confi_sem`, `eg_confi_dias`, `eg_confi_fum_eco_esti`, `peso_eg`, `apgar_primer_min`, `apgar_cinco_min`, `flujo_libre`, `ventilacion`, `intubacion`, `masaje_cardiaco`, `adrenalina`, `ninguna`, `fallece_en_sala_parto`, `referido`, `atendio_parto`, `nom_atendio_parto`, `atendio_neonato`, `nom_atendio_neonato`, `defectos_congenitos`, `cod_defectos_cong`, `enfermedades_ninguna`, `cod_enf_uno`, `nom_enf_uno`, `cod_enf_dos`, `nom_enf_dos`, `cod_enf_tres`, `mon_enf_tres`, `vdrl`, `tsh`, `hbpatia`, `audicion`, `hiper_bilir`, `meconio_primer_dia`, `boca_arriba`, `vitamina_k`, `grupo_sang`, `factor_rh`, `sensibil`, `profilaxis_oftalmica`, `notas`) VALUES ("+codemb+","+reciennacidosexo+","+pesoalnacer+","+reciennacidomenos2500+","+perimcefalic+","+reciennacidotalla+","+egconfiablesem+","+egconfiabledias+","+egconfiablefumecoest+","+pesoegedec+", "+apgar1er+","+apgar5to+", "+reaniflujolibre+","+reaniventilacionp+","+reaniintubacionot+","+reanimasajecardi+","+reaniadrenalina+","+reanininguna+","+falleceenparto+", "+reciennacidoreferido+", "+partoatendido+","+partoatendidopor+","+neonatoatendido+","+neonatoatendidopor+","+defectoscongenitos+","+defectoscongenitoscod+", "+enf_reciennacido+","+codenfermedadrecienacido+","+txtenfermedadrecienacido+","+codenfermedadrecienacido2+","+txtenfermedadrecienacido2+","+codenfermedadrecienacido3+","+txtenfermedadrecienacido3+","+tamineonatalvdrl+","+tamineonataltsh+","+tamineonatalhbpatia+","+tamineonatalaudicion+","+tamineonatalhiper+","+tamineonatalmeconio+","+tamineonatalbocaarriba+","+rnvitaminak+","+gruposanguineorn+","+rhrn+","+reciennacidosensible+", "+profilaxisoftalmica+","+reciennacidonota+");";
        String dos="UPDATE `ips_isalud`.`recien_nacido` SET `sexo`="+reciennacidosexo+", `peso_al_nacer`="+pesoalnacer+", `menor_domilqui`="+reciennacidomenos2500+", `pre_cefalico`="+perimcefalic+", `talla`="+reciennacidotalla+", `eg_confi_sem`="+egconfiablesem+", `eg_confi_dias`="+egconfiabledias+", `eg_confi_fum_eco_esti`="+egconfiablefumecoest+", `peso_eg`="+pesoegedec+", `apgar_primer_min`="+apgar1er+", `apgar_cinco_min`="+apgar5to+", `flujo_libre`="+reaniflujolibre+", `ventilacion`="+reaniventilacionp+", `intubacion`="+reaniintubacionot+", `masaje_cardiaco`="+reanimasajecardi+", `adrenalina`="+reaniadrenalina+", `ninguna`="+reanininguna+", `fallece_en_sala_parto`="+falleceenparto+", `referido`="+reciennacidoreferido+", `atendio_parto`="+partoatendido+", `nom_atendio_parto`="+partoatendidopor+", `atendio_neonato`="+neonatoatendido+", `nom_atendio_neonato`="+neonatoatendidopor+", `defectos_congenitos`="+defectoscongenitos+", `cod_defectos_cong`="+defectoscongenitoscod+", `enfermedades_ninguna`="+enf_reciennacido+", `cod_enf_uno`="+codenfermedadrecienacido+", `nom_enf_uno`="+txtenfermedadrecienacido+", `cod_enf_dos`="+codenfermedadrecienacido2+", `nom_enf_dos`="+txtenfermedadrecienacido2+", `cod_enf_tres`="+codenfermedadrecienacido3+", `mon_enf_tres`="+txtenfermedadrecienacido3+", `vdrl`="+tamineonatalvdrl+", `tsh`="+tamineonataltsh+", `hbpatia`="+tamineonatalhbpatia+", `audicion`="+tamineonatalaudicion+", `hiper_bilir`="+tamineonatalhiper+", `meconio_primer_dia`="+tamineonatalmeconio+", `boca_arriba`="+tamineonatalbocaarriba+", `vitamina_k`="+rnvitaminak+", `grupo_sang`="+gruposanguineorn+", `factor_rh`="+rhrn+", `sensibil`="+reciennacidosensible+", `profilaxis_oftalmica`="+profilaxisoftalmica+", `notas`="+reciennacidonota+" WHERE `materno_perinatal`="+codemb+";";
     // System.out.println("inset a recien nacido \n"+con+"\n"+dos+"\n");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        if( ba.transaccion(con)==false){
                             ba.transaccion(dos);
                                  }       
 
        String con2="INSERT INTO `ips_isalud`.`puerperio` (`id_materno_perinatal`, `hora_uno`, `min_uno`, `am_pm_uno`, `tc_uno`, `pulso_uno`, `pa_uno_uno`, `pa_dos_uno`, `invol_uter_uno`, `loquios_uno`, `hora_dos`, `min_dos`, `am_pm_dos`, `tc_dos`, `pulso_dos`, `pa_uno_dos`, `pa_dos_dos`, `invol_uter_dos`, `loquios_dos`, `hora_tres`, `min_tres`, `am_pm_tres`, `tc_tres`, `pulso_tres`, `pa_uno_tres`, `pa_dos_tres`, `invol_uter_tres`, `loquios_tres`) VALUES ("+codemb+","+hora_puerperio1+","+min_puerperio1+","+ampm_puerperio1+","+puerperiotc1+","+puerperiopulso1+","+puerperiopa1+","+puerperiopa11+","+puerperioinvoluter1+","+puerperioloquios1+","+hora_puerperio2+","+min_puerperio2+","+ampm_puerperio2+","+puerperiotc2+", "+puerperiopulso2+","+puerperiopa2+","+puerperiopa22+","+puerperioinvoluter2+","+puerperioloquios2+","+hora_puerperio3+","+min_puerperio3+","+ampm_puerperio3+","+puerperiotc3+","+puerperiopulso3+","+puerperiopa3+","+puerperiopa33+","+puerperioinvoluter3+","+puerperioloquios3+");";
        String dos2="UPDATE `ips_isalud`.`puerperio` SET `hora_uno`="+hora_puerperio1+", `min_uno`="+min_puerperio1+", `am_pm_uno`="+ampm_puerperio1+", `tc_uno`="+puerperiotc1+", `pulso_uno`="+puerperiopulso1+", `pa_uno_uno`="+puerperiopa1+", `pa_dos_uno`="+puerperiopa11+", `invol_uter_uno`="+puerperioinvoluter1+", `loquios_uno`="+puerperioloquios1+", `hora_dos`="+hora_puerperio2+", `min_dos`="+min_puerperio2+", `am_pm_dos`="+ampm_puerperio2+", `tc_dos`="+puerperiotc2+", `pulso_dos`="+puerperiopulso2+", `pa_uno_dos`="+puerperiopa2+", `pa_dos_dos`="+puerperiopa22+", `invol_uter_dos`="+puerperioinvoluter2+", `loquios_dos`="+puerperioloquios2+", `hora_tres`="+hora_puerperio3+", `min_tres`="+min_puerperio3+", `am_pm_tres`="+ampm_puerperio3+", `tc_tres`="+puerperiotc3+", `pulso_tres`="+puerperiopulso3+", `pa_uno_tres`="+puerperiopa3+", `pa_dos_tres`="+puerperiopa33+", `invol_uter_tres`="+puerperioinvoluter3+", `loquios_tres`="+puerperioloquios3+" WHERE `id_materno_perinatal`="+codemb+";";
                                                                                                                          
       if( ba.transaccion(con2)==false){
                              ba.transaccion(dos2); 
                                  } 
      // System.out.println("inset a rpuerperio \n"+con2+"\n"+dos2+"\n");          
         
        ///////////////////////////777
        
        String con3="INSERT INTO `ips_isalud`.`egreso_materno` (`id_materno_perinatal`, `fecha`, `horas_egreso_postpar`, `estado_egreso`, `anticoncepcion`, `antirubeola_post_parto`, `referida_post_parto`, `hemorragia_post_parto`, `infeccion_puerperal`, `responsable`) VALUES ("+codemb+","+fechaegresopostparto+","+egresopostparto+","+egresomaternoestado+","+egresoanticoncepcion+","+egresomaternoantirubeola+","+egresomaternoreferida+","+egresomaternohemorragia+","+egresomaternoinfeccion+","+egresomaternoresponsable+");";
        String dos3="UPDATE `ips_isalud`.`egreso_materno` SET `fecha`="+fechaegresopostparto+", `horas_egreso_postpar`="+egresopostparto+", `estado_egreso`="+egresomaternoestado+", `anticoncepcion`="+egresoanticoncepcion+", `antirubeola_post_parto`="+egresomaternoantirubeola+", `referida_post_parto`="+egresomaternoreferida+", `hemorragia_post_parto`="+egresomaternohemorragia+", `infeccion_puerperal`="+egresomaternoinfeccion+", `responsable`="+egresomaternoresponsable+" WHERE `id_materno_perinatal`="+codemb+";";
           
     try{                                                                                                                                                               
        if( ba.transaccion(con3)==false){
                             ba.transaccion(dos3);
                                  }       }catch(Exception e){}
     // System.out.println("inset a egreso_materno \n"+con3+"\n"+dos3+"\n");  
        
        String con4="INSERT INTO `ips_isalud`.`egreso_rn` (`id_materno_perinatal`, `fecha`, `estado_egreso`, `edad_dias`, `menos_de_dia`, `lactancia`, `vacuna_polio`, `vacuna_bcg`, `vacuna_hepat_b`, `pero_al_egreso`, `nuip`, `nombre_recien_nacido`, `responsable`) VALUES ("+codemb+","+fechaegresoneonato+","+egresornestado+","+rnedaddias+","+edaddiascompletos+","+egresornlactancia+","+egresornpolio+","+egresornbcg+","+egresornhepatb+","+nrpesoegreso+","+rnnuip+","+rnnombre+","+rnresponsable+");";
        String dos4="UPDATE `ips_isalud`.`egreso_rn` SET `fecha`="+fechaegresoneonato+", `estado_egreso`="+egresornestado+", `edad_dias`="+rnedaddias+", `menos_de_dia`="+edaddiascompletos+", `lactancia`="+egresornlactancia+", `vacuna_polio`="+egresornpolio+", `vacuna_bcg`="+egresornbcg+", `vacuna_hepat_b`="+egresornhepatb+", `pero_al_egreso`="+nrpesoegreso+", `nuip`="+rnnuip+", `nombre_recien_nacido`="+rnnombre+", `responsable`="+rnresponsable+" WHERE `id_materno_perinatal`="+codemb+";";
                                                                                                                                             
         try{                
       if( ba.transaccion(con4)==false){
                              ba.transaccion(dos4); 
                                  }
             }catch(Exception ef){}
      //  System.out.println("f6 "+dos4);
    //   System.out.println("inset a egreso_rn \n"+con4+"\n"+dos4+"\n");                                         
       
       ba.cerrar();
             
       //EDIT `ips_isalud`.`recien_nacido`;
       //EDIT `ips_isalud`.`puerperio`;
       //EDIT `ips_isalud`.`egreso_materno`;
       //EDIT `ips_isalud`.`egreso_rn`;
      %>
    </body>
</html>


