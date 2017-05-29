<%-- 
    Document   : carne_f5
    Created on : 30/05/2013, 08:04:54 PM
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
        
              //text
        
              String hospiembdia="null";
              if(request.getParameter("hospiembdia")!=null && request.getParameter("hospiembdia").compareTo("null")!=0 && request.getParameter("hospiembdia").trim().compareTo("")!=0){
                     hospiembdia="'"+request.getParameter("hospiembdia").replace("'","").replace("\"","")+"'";
                }
              
              String contantsemaini="null";
              if(request.getParameter("contantsemaini")!=null && request.getParameter("contantsemaini").compareTo("null")!=0 && request.getParameter("contantsemaini").trim().compareTo("")!=0){
                    contantsemaini="'"+request.getParameter("contantsemaini").replace("'","").replace("\"","")+"'";
                }
              
              String frummemb="null";
              if(request.getParameter("frummemb")!=null && request.getParameter("frummemb").compareTo("null")!=0 && request.getParameter("frummemb").trim().compareTo("")!=0){
                    frummemb="'"+request.getParameter("frummemb").replace("'","").replace("\"","")+"'";
                }
              
              String rmasrum="null";
              if(request.getParameter("rmasrum")!=null && request.getParameter("rmasrum").compareTo("null")!=0 && request.getParameter("rmasrum").trim().compareTo("")!=0){
                    rmasrum="'"+request.getParameter("rmasrum").replace("'","").replace("\"","")+"'";
                }
              
              String hentrerup="null";
              if(request.getParameter("hentrerup")!=null && request.getParameter("hentrerup").compareTo("null")!=0 && request.getParameter("hentrerup").trim().compareTo("")!=0){
                    hentrerup="'"+request.getParameter("hentrerup").replace("'","").replace("\"","")+"'";
                }
              
              String edadgestapasem="null";
              if(request.getParameter("edadgestapasem")!=null && request.getParameter("edadgestapasem").compareTo("null")!=0 && request.getParameter("edadgestapasem").trim().compareTo("")!=0){
                    edadgestapasem="'"+request.getParameter("edadgestapasem").replace("'","").replace("\"","")+"'";
                }
              
              String edadgestapadias="null";
              if(request.getParameter("edadgestapadias")!=null && request.getParameter("edadgestapadias").compareTo("null")!=0 && request.getParameter("edadgestapadias").trim().compareTo("")!=0){
                    edadgestapadias="'"+request.getParameter("edadgestapadias").replace("'","").replace("\"","")+"'";
                }
               
              String pabortofingreso="null";
              if(request.getParameter("pabortofingreso")!=null && request.getParameter("pabortofingreso").compareTo("null")!=0 && request.getParameter("pabortofingreso").trim().compareTo("")!=0){
                    pabortofingreso="'"+request.getParameter("pabortofingreso").replace("'","").replace("\"","")+"'";
                }
              
              String consultaprenata="null";
              if(request.getParameter("consultaprenata")!=null && request.getParameter("consultaprenata").compareTo("null")!=0 && request.getParameter("consultaprenata").trim().compareTo("")!=0){
                    consultaprenata="'"+request.getParameter("consultaprenata").replace("'","").replace("\"","")+"'";
                }
             
              
              String nacevm="null";
              if(request.getParameter("nacevm")!=null && request.getParameter("nacevm").compareTo("null")!=0 && request.getParameter("nacevm").trim().compareTo("")!=0){
                    nacevm="'"+request.getParameter("nacevm").replace("'","").replace("\"","")+"'";
                }
              
              String paabomulti="null";
              if(request.getParameter("paabomulti")!=null && request.getParameter("paabomulti").compareTo("null")!=0 && request.getParameter("paabomulti").trim().compareTo("")!=0){
                    paabomulti="'"+request.getParameter("paabomulti").replace("'","").replace("\"","")+"'";
                }
              
              String paabomulti2="null";
              if(request.getParameter("paabomulti2")!=null && request.getParameter("paabomulti2").compareTo("null")!=0 && request.getParameter("paabomulti2").trim().compareTo("")!=0){
                    paabomulti2="'"+request.getParameter("paabomulti2").replace("'","").replace("\"","")+"'";
                }
              
              String introduccionparto="null";
              if(request.getParameter("introduccionparto")!=null && request.getParameter("introduccionparto").compareTo("null")!=0 && request.getParameter("introduccionparto").trim().compareTo("")!=0){
                    introduccionparto="'"+request.getParameter("introduccionparto").replace("'","").replace("\"","")+"'";
                }
              
              String operatorioparto="null";
              if(request.getParameter("operatorioparto")!=null && request.getParameter("operatorioparto").compareTo("null")!=0 && request.getParameter("operatorioparto").trim().compareTo("")!=0){
                    operatorioparto="'"+request.getParameter("operatorioparto").replace("'","").replace("\"","")+"'";
                }
              
              String indpriindpar="null";
              if(request.getParameter("indpriindpar")!=null && request.getParameter("indpriindpar").compareTo("null")!=0 && request.getParameter("indpriindpar").trim().compareTo("")!=0){
                    indpriindpar="'"+request.getParameter("indpriindpar").replace("'","").replace("\"","")+"'";
                }
              
              String txtdesgarros="null";
              if(request.getParameter("txtdesgarros")!=null && request.getParameter("txtdesgarros").compareTo("null")!=0 && request.getParameter("txtdesgarros").trim().compareTo("")!=0){
                    txtdesgarros="'"+request.getParameter("txtdesgarros").replace("'","").replace("\"","")+"'";
                }
              
              String descri0="null";
              if(request.getParameter("descri0")!=null && request.getParameter("descri0").compareTo("null")!=0 && request.getParameter("descri0").trim().compareTo("")!=0){
                    descri0="'"+request.getParameter("descri0").replace("'","").replace("\"","")+"'";
                }
              
              String codigo1="null";
              if(request.getParameter("codigo1")!=null && request.getParameter("codigo1").compareTo("null")!=0 && request.getParameter("codigo1").trim().compareTo("")!=0){
                    codigo1="'"+request.getParameter("codigo1").replace("'","").replace("\"","")+"'";
                }
              
              String codigo2="null";
              if(request.getParameter("codigo2")!=null && request.getParameter("codigo2").compareTo("null")!=0 && request.getParameter("codigo2").trim().compareTo("")!=0){
                     codigo2="'"+request.getParameter("codigo2").replace("'","").replace("\"","")+"'";
                }
              
              String codigo3="null";
              if(request.getParameter("codigo3")!=null && request.getParameter("codigo3").compareTo("null")!=0 && request.getParameter("codigo3").trim().compareTo("")!=0){
                    codigo3="'"+request.getParameter("codigo3").replace("'","").replace("\"","")+"'";
                }
              
              String descri="null";
              if(request.getParameter("descri")!=null && request.getParameter("descri").compareTo("null")!=0 && request.getParameter("descri").trim().compareTo("")!=0){
                    descri="'"+request.getParameter("descri").replace("'","").replace("\"","")+"'";
                }
             
            //select
 
            String hora_rupt="'0'";
            try{int hora_rupto=Integer.parseInt(""+request.getParameter("hora_rupt").replace("'","").replace("\"","")+"");
                    hora_rupt="'"+request.getParameter("hora_rupt").replace("'","").replace("\"","")+"'";
               }
            catch(Exception exe){hora_rupt="'0'";}   
            
            String min_rupt="'0'";
            try{int min_rupto=Integer.parseInt(""+request.getParameter("min_rupt").replace("'","").replace("\"","")+"");
                    min_rupt="'"+request.getParameter("min_rupt").replace("'","").replace("\"","")+"'";
               }
            catch(Exception exe){min_rupt="'0'";}  
            
            String ampm_rupt="'0'";
            try{int ampm_rupto=Integer.parseInt(""+request.getParameter("ampm_rupt").replace("'","").replace("\"","")+"");
                    ampm_rupt="'"+request.getParameter("ampm_rupt").replace("'","").replace("\"","")+"'";
               }
            catch(Exception exe){ampm_rupt="'0'";}  
            
            String hora_nacimiento="'0'";
            try{int hora_nacimientoo=Integer.parseInt(""+request.getParameter("hora_nacimiento").replace("'","").replace("\"","")+"");
                    hora_nacimiento="'"+request.getParameter("hora_nacimiento").replace("'","").replace("\"","")+"'";
               }
            catch(Exception exe){hora_nacimiento="'0'";}  
            
            String min_nacimiento="'0'";
            try{int min_nacimientoo=Integer.parseInt(""+request.getParameter("min_nacimiento").replace("'","").replace("\"","")+"");
                    min_nacimiento="'"+request.getParameter("min_nacimiento").replace("'","").replace("\"","")+"'";
               }
            catch(Exception exe){min_nacimiento="'0'";}  
            
            String ampm_nacimiento="'0'";
            try{int ampm_nacimientoo=Integer.parseInt(""+request.getParameter("ampm_nacimiento").replace("'","").replace("\"","")+"");
                    ampm_nacimiento="'"+request.getParameter("ampm_nacimiento").replace("'","").replace("\"","")+"'";
               }
            catch(Exception exe){ampm_nacimiento="'0'";} 
          
           
         //check
            
              String rmasem37="'0'";
                if(request.getParameter("rmasem37")!=null && request.getParameter("rmasem37").compareTo("on")==0 && request.getParameter("rmasem37").trim().compareTo("")!=0){
                   rmasem37="'1'";
                }
              
              String rmahs12="'0'";
                if(request.getParameter("rmahs12")!=null && request.getParameter("rmahs12").compareTo("on")==0 && request.getParameter("rmahs12").trim().compareTo("")!=0){
                   rmahs12="'1'";
                }
              
              String rmatemp38="'0'";
                if(request.getParameter("rmatemp38")!=null && request.getParameter("rmatemp38").compareTo("on")==0 && request.getParameter("rmatemp38").trim().compareTo("")!=0){
                     rmatemp38="'1'";
                }
              
              String desgarrosck="'0'";
                if(request.getParameter("desgarrosck")!=null && request.getParameter("desgarrosck").compareTo("on")==0 && request.getParameter("desgarrosck").trim().compareTo("")!=0){
                   desgarrosck="'1'";
                }
              
              String nem125="'0'";
                if(request.getParameter("nem125")!=null && request.getParameter("nem125").compareTo("on")==0 && request.getParameter("nem125").trim().compareTo("")!=0){
                   nem125="'1'";
                }
              
              String enf_ninguna="'0'";
                if(request.getParameter("enf_ninguna")!=null && request.getParameter("enf_ninguna").compareTo("on")==0 && request.getParameter("enf_ninguna").trim().compareTo("")!=0){
                   enf_ninguna="'1'";
                }
              
              String enfer_diabetes0c="'0'";
                if(request.getParameter("enfer_diabetes0c")!=null && request.getParameter("enfer_diabetes0c").compareTo("on")==0 && request.getParameter("enfer_diabetes0c").trim().compareTo("")!=0){
                   enfer_diabetes0c="'1'";
                }
         
 
         //radio 
 
         String parabo="'8'";
        try{int paraboo=Integer.parseInt(""+request.getParameter("parabo").replace("'","").replace("\"","")+"");
                parabo="'"+request.getParameter("parabo").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){parabo="'8'";}
       
         String cantenatales="'8'";
        try{int cantenataleso=Integer.parseInt(""+request.getParameter("cantenatales").replace("'","").replace("\"","")+"");
                cantenatales="'"+request.getParameter("cantenatales").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){cantenatales="'8'";}
       
         String iniciotdep="'8'";
        try{int iniciotdepo=Integer.parseInt(""+request.getParameter("iniciotdep").replace("'","").replace("\"","")+"");
                iniciotdep="'"+request.getParameter("iniciotdep").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){iniciotdep="'8'";}
       
         String rmaintegras="'8'";
        try{int rmaintegraso=Integer.parseInt(""+request.getParameter("rmaintegras").replace("'","").replace("\"","")+"");
                rmaintegras="'"+request.getParameter("rmaintegras").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){rmaintegras="'8'";}
       
         String edadgestfumeco="'8'";
        try{int edadgestfumecoo=Integer.parseInt(""+request.getParameter("edadgestfumeco").replace("'","").replace("\"","")+"");
                edadgestfumeco="'"+request.getParameter("edadgestfumeco").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){edadgestfumeco="'8'";}
       
         String presentacioncefa="'8'";
        try{int presentacioncefao=Integer.parseInt(""+request.getParameter("presentacioncefa").replace("'","").replace("\"","")+"");
                presentacioncefa="'"+request.getParameter("presentacioncefa").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){presentacioncefa="'8'";}
       
         String acompanante="'8'";
        try{int acompananteo=Integer.parseInt(""+request.getParameter("acompanante").replace("'","").replace("\"","")+"");
                acompanante="'"+request.getParameter("acompanante").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){acompanante="'8'";}
       
         String carnetsino="'8'";
        try{int carnetsinoo=Integer.parseInt(""+request.getParameter("carnetsino").replace("'","").replace("\"","")+"");
                carnetsino="'"+request.getParameter("carnetsino").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){carnetsino="'8'";}
       
         String nacemuerto="'8'";
        try{int nacemuertoo=Integer.parseInt(""+request.getParameter("nacemuerto").replace("'","").replace("\"","")+"");
                nacemuerto="'"+request.getParameter("nacemuerto").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){nacemuerto="'8'";}
       
         String terminapar="'8'";
        try{int terminaparo=Integer.parseInt(""+request.getParameter("terminapar").replace("'","").replace("\"","")+"");
                terminapar="'"+request.getParameter("terminapar").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){terminapar="'8'";}
       
         String posicionparto="'8'";
        try{int posicionpartoo=Integer.parseInt(""+request.getParameter("posicionparto").replace("'","").replace("\"","")+"");
                posicionparto="'"+request.getParameter("posicionparto").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){posicionparto="'8'";}
       
         String episiotomia="'8'";
        try{int episiotomiao=Integer.parseInt(""+request.getParameter("episiotomia").replace("'","").replace("\"","")+"");
                episiotomia="'"+request.getParameter("episiotomia").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){episiotomia="'8'";}
       
         String ocitocitos="'8'";
        try{int ocitocitoso=Integer.parseInt(""+request.getParameter("ocitocitos").replace("'","").replace("\"","")+"");
                ocitocitos="'"+request.getParameter("ocitocitos").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){ocitocitos="'8'";}
       
         String placentacompleta="'8'";
        try{int placentacompletao=Integer.parseInt(""+request.getParameter("placentacompleta").replace("'","").replace("\"","")+"");
                placentacompleta="'"+request.getParameter("placentacompleta").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){placentacompleta="'8'";}
       
         String placentaretenida="'8'";
        try{int placentaretenidao=Integer.parseInt(""+request.getParameter("placentaretenida").replace("'","").replace("\"","")+"");
                placentaretenida="'"+request.getParameter("placentaretenida").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){placentaretenida="'8'";}
         
         String ligaduracordon="'8'";
        try{int ligaduracordono=Integer.parseInt(""+request.getParameter("ligaduracordon").replace("'","").replace("\"","")+"");
                ligaduracordon="'"+request.getParameter("ligaduracordon").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){ligaduracordon="'8'";}
       
         String medicacionr_ocitocitos="'8'";
        try{int medicacionr_ocitocitoso=Integer.parseInt(""+request.getParameter("medicacionr_ocitocitos").replace("'","").replace("\"","")+"");
                medicacionr_ocitocitos="'"+request.getParameter("medicacionr_ocitocitos").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){medicacionr_ocitocitos="'8'";}
       
         String medicacionr_antibiot="'8'";
        try{int medicacionr_antibioto=Integer.parseInt(""+request.getParameter("medicacionr_antibiot").replace("'","").replace("\"","")+"");
                medicacionr_antibiot="'"+request.getParameter("medicacionr_antibiot").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){medicacionr_antibiot="'8'";}
       
         String medicacionr_epidural="'8'";
        try{int medicacionr_epiduralo=Integer.parseInt(""+request.getParameter("medicacionr_epidural").replace("'","").replace("\"","")+"");
                medicacionr_epidural="'"+request.getParameter("medicacionr_epidural").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){medicacionr_epidural="'8'";}
       
         String medicacionr_anestregion="'8'";
        try{int medicacionr_anestregiono=Integer.parseInt(""+request.getParameter("medicacionr_anestregion").replace("'","").replace("\"","")+"");
                medicacionr_anestregion="'"+request.getParameter("medicacionr_anestregion").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){medicacionr_anestregion="'8'";}
       
         String medicacionr_anestgeneral="'8'";
        try{int medicacionr_anestgeneralo=Integer.parseInt(""+request.getParameter("medicacionr_anestgeneral").replace("'","").replace("\"","")+"");
                medicacionr_anestgeneral="'"+request.getParameter("medicacionr_anestgeneral").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){medicacionr_anestgeneral="'8'";}
       
         String medicacionr_transfusion="'8'";
        try{int medicacionr_transfusiono=Integer.parseInt(""+request.getParameter("medicacionr_transfusion").replace("'","").replace("\"","")+"");
                medicacionr_transfusion="'"+request.getParameter("medicacionr_transfusion").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){medicacionr_transfusion="'8'";}
       
         String medicacionr_otros="'8'";
        try{int medicacionr_otroso=Integer.parseInt(""+request.getParameter("medicacionr_otros").replace("'","").replace("\"","")+"");
                medicacionr_otros="'"+request.getParameter("medicacionr_otros").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){medicacionr_otros="'8'";}
       
         String partograma="'8'";
        try{int partogramao=Integer.parseInt(""+request.getParameter("partograma").replace("'","").replace("\"","")+"");
                partograma="'"+request.getParameter("partograma").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){partograma="'8'";}
       
         String enfer_htacronica="'8'";
        try{int enfer_htacronicao=Integer.parseInt(""+request.getParameter("enfer_htacronica").replace("'","").replace("\"","")+"");
                enfer_htacronica="'"+request.getParameter("enfer_htacronica").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){enfer_htacronica="'8'";}
       
         String enfer_infecurinaria="'8'";
        try{int enfer_infecurinariao=Integer.parseInt(""+request.getParameter("enfer_infecurinaria").replace("'","").replace("\"","")+"");
                enfer_infecurinaria="'"+request.getParameter("enfer_infecurinaria").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){enfer_infecurinaria="'8'";}
       
         String enfer_htagestacional="'8'";
        try{int enfer_htagestacionalo=Integer.parseInt(""+request.getParameter("enfer_htagestacional").replace("'","").replace("\"","")+"");
                enfer_htagestacional="'"+request.getParameter("enfer_htagestacional").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){enfer_htagestacional="'8'";}
       
         String enfer_amepartopreter="'8'";
        try{int enfer_amepartopretero=Integer.parseInt(""+request.getParameter("enfer_amepartopreter").replace("'","").replace("\"","")+"");
                enfer_amepartopreter="'"+request.getParameter("enfer_amepartopreter").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){enfer_amepartopreter="'8'";}
       
         String enfer_preeclampsia="'8'";
        try{int enfer_preeclampsiao=Integer.parseInt(""+request.getParameter("enfer_preeclampsia").replace("'","").replace("\"","")+"");
                enfer_preeclampsia="'"+request.getParameter("enfer_preeclampsia").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){enfer_preeclampsia="'8'";}
       
         String enfer_rciu="'8'";
        try{int enfer_rciuo=Integer.parseInt(""+request.getParameter("enfer_rciu").replace("'","").replace("\"","")+"");
                enfer_rciu="'"+request.getParameter("enfer_rciu").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){enfer_rciu="'8'";}
       
         String enfer_eclampsia="'8'";
        try{int enfer_eclampsiao=Integer.parseInt(""+request.getParameter("enfer_eclampsia").replace("'","").replace("\"","")+"");
                enfer_eclampsia="'"+request.getParameter("enfer_eclampsia").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){enfer_eclampsia="'8'";}
       
         String enfer_rupturaprem="'8'";
        try{int enfer_rupturapremo=Integer.parseInt(""+request.getParameter("enfer_rupturaprem").replace("'","").replace("\"","")+"");
                enfer_rupturaprem="'"+request.getParameter("enfer_rupturaprem").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){enfer_rupturaprem="'8'";}
       
         String enfer_cardiopatia="'8'";
        try{int enfer_cardiopatiao=Integer.parseInt(""+request.getParameter("enfer_cardiopatia").replace("'","").replace("\"","")+"");
                enfer_cardiopatia="'"+request.getParameter("enfer_cardiopatia").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){enfer_cardiopatia="'8'";}
       
         String enfer_corioamnionitis="'8'";
        try{int enfer_corioamnionitiso=Integer.parseInt(""+request.getParameter("enfer_corioamnionitis").replace("'","").replace("\"","")+"");
                enfer_corioamnionitis="'"+request.getParameter("enfer_corioamnionitis").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){enfer_corioamnionitis="'8'";}
       
         String enfer_anemia="'8'";
        try{int enfer_anemiao=Integer.parseInt(""+request.getParameter("enfer_anemia").replace("'","").replace("\"","")+"");
                enfer_anemia="'"+request.getParameter("enfer_anemia").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){enfer_anemia="'8'";}
       
         String enfer_otrasgraves="'8'";
        try{int enfer_otrasgraveso=Integer.parseInt(""+request.getParameter("enfer_otrasgraves").replace("'","").replace("\"","")+"");
                enfer_otrasgraves="'"+request.getParameter("enfer_otrasgraves").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){enfer_otrasgraves="'8'";}
       
         String enfer_diabetes="'8'";
        try{int enfer_diabeteso=Integer.parseInt(""+request.getParameter("enfer_diabetes").replace("'","").replace("\"","")+"");
                enfer_diabetes="'"+request.getParameter("enfer_diabetes").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){enfer_diabetes="'8'";}
       
         String hemorragias_1_trim="'8'";
        try{int hemorragias_1_trimo=Integer.parseInt(""+request.getParameter("hemorragias_1_trim").replace("'","").replace("\"","")+"");
                hemorragias_1_trim="'"+request.getParameter("hemorragias_1_trim").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){hemorragias_1_trim="'8'";}
       
         String hemorragias_2_trim="'8'";
        try{int hemorragias_2_trimo=Integer.parseInt(""+request.getParameter("hemorragias_2_trim").replace("'","").replace("\"","")+"");
                hemorragias_2_trim="'"+request.getParameter("hemorragias_2_trim").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){hemorragias_2_trim="'8'";}
       
         String hemorragias_3_trim="'8'";
        try{int hemorragias_3_trimo=Integer.parseInt(""+request.getParameter("hemorragias_3_trim").replace("'","").replace("\"","")+"");
                hemorragias_3_trim="'"+request.getParameter("hemorragias_3_trim").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){hemorragias_3_trim="'8'";}
       
         String hemorragias_postparto="'8'";
        try{int hemorragias_postpartoo=Integer.parseInt(""+request.getParameter("hemorragias_postparto").replace("'","").replace("\"","")+"");
                hemorragias_postparto="'"+request.getParameter("hemorragias_postparto").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){hemorragias_postparto="'8'";}
       
         String hemorragias_infectpuerpe="'8'";
        try{int hemorragias_infectpuerpeo=Integer.parseInt(""+request.getParameter("hemorragias_infectpuerpe").replace("'","").replace("\"","")+"");
                hemorragias_infectpuerpe="'"+request.getParameter("hemorragias_infectpuerpe").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){hemorragias_infectpuerpe="'8'";}
       
         String hemorragias_bacteriuria="'8'";
        try{int hemorragias_bacteriuriao=Integer.parseInt(""+request.getParameter("hemorragias_bacteriuria").replace("'","").replace("\"","")+"");
                hemorragias_bacteriuria="'"+request.getParameter("hemorragias_bacteriuria").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){hemorragias_bacteriuria="'8'";}
                   
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
        
        
        String con="INSERT INTO `ips_isalud`.`parto_aborto` (`id_materno_perinatal`,`parabo`, `fecha_ingreso`, `carne`, `con_prenatales_tot`, `hospit_en_embara_dias`, `corticoides_antenatales`, `semana_inicio`, `inicio_tdp_espont`, `rup_meb_antp_inte_rot`, `rup_meb_antp_fecha`, `rup_meb_antp_hora`, `rup_meb_antp_min`, `rup_meb_antp_ampm`, `rup_meb_antp_me37sem`,`rmatemp38`, `rup_meb_antp_mayig12h`, `rup_meb_antp_semanarup`, `horas_entre_ruptypart`, `edad_gest_al_parto`, `edad_gest_al_parto_dias`, `edad_gest_al_parto_porecofum`, `presentacion_cefalica`, `acompañante_tdep`, `nacimiento_vivo`, `hora_naci`, `min_naci`, `am_pm`, `fecha_naci`, `multiple_orden_uno`, `multiple_orden_dos`, `terminacion`, `indicacion_prin_p_o`, `cod_introduccion`, `cod_operativo`, `posicion_parto`, `episiotomia`, `desgarros_no`, `desgarros_grados`, `ocitocitos_en_alumbramiento`, `placenta_completa`, `placenta_retenida`, `ligadura_cordon`, `ocitocitos_tdp`, `antibiot`, `analgesia_epidural`, `anest_region`, `anest_gnral`, `transfusion`, `otros`, `especific_otros`, `hizo_partograma`) VALUES ("+codemb+","+parabo+","+pabortofingreso+","+carnetsino+","+consultaprenata+","+hospiembdia+","+cantenatales+","+contantsemaini+","+iniciotdep+","+rmaintegras+","+frummemb+","+hora_rupt+","+min_rupt+","+ampm_rupt+","+rmasem37+","+rmatemp38+","+rmahs12+","+rmasrum+","+hentrerup+","+edadgestapasem+","+edadgestapadias+","+edadgestfumeco+","+presentacioncefa+","+acompanante+","+nacemuerto+","+hora_nacimiento+","+min_nacimiento+","+ampm_nacimiento+","+nacevm+","+paabomulti+","+paabomulti2+","+terminapar+","+indpriindpar+","+introduccionparto+","+operatorioparto+","+posicionparto+","+episiotomia+","+desgarrosck+","+txtdesgarros+","+ocitocitos+","+placentacompleta+","+placentaretenida+","+ligaduracordon+","+medicacionr_ocitocitos+","+medicacionr_antibiot+","+medicacionr_epidural+","+medicacionr_anestregion+","+medicacionr_anestgeneral+","+medicacionr_transfusion+","+medicacionr_otros+","+descri0+","+partograma+");";
        String dos="UPDATE `ips_isalud`.`parto_aborto` SET `parabo`="+parabo+",`fecha_ingreso`="+pabortofingreso+", `carne`="+carnetsino+", `con_prenatales_tot`="+consultaprenata+", `hospit_en_embara_dias`="+hospiembdia+", `corticoides_antenatales`="+cantenatales+", `semana_inicio`="+contantsemaini+", `inicio_tdp_espont`="+iniciotdep+", `rup_meb_antp_inte_rot`="+rmaintegras+", `rup_meb_antp_fecha`="+frummemb+", `rup_meb_antp_hora`="+hora_rupt+", `rup_meb_antp_min`="+min_rupt+", `rup_meb_antp_ampm`="+ampm_rupt+", `rup_meb_antp_me37sem`="+rmasem37+", `rmatemp38`="+rmatemp38+", `rup_meb_antp_mayig12h`="+rmahs12+", `rup_meb_antp_semanarup`="+rmasrum+", `horas_entre_ruptypart`="+hentrerup+", `edad_gest_al_parto`="+edadgestapasem+", `edad_gest_al_parto_dias`="+edadgestapadias+", `edad_gest_al_parto_porecofum`="+edadgestfumeco+", `presentacion_cefalica`="+presentacioncefa+", `acompañante_tdep`="+acompanante+", `nacimiento_vivo`="+nacemuerto+", `hora_naci`="+hora_nacimiento+", `min_naci`="+min_nacimiento+", `am_pm`="+ampm_nacimiento+", `fecha_naci`="+nacevm+", `multiple_orden_uno`="+paabomulti+", `multiple_orden_dos`="+paabomulti2+", `terminacion`="+terminapar+", `indicacion_prin_p_o`="+indpriindpar+", `cod_introduccion`="+introduccionparto+", `cod_operativo`="+operatorioparto+", `posicion_parto`="+posicionparto+", `episiotomia`="+episiotomia+",`desgarros_no`="+desgarrosck+",`desgarros_grados`="+txtdesgarros+",`ocitocitos_en_alumbramiento`="+ocitocitos+",`placenta_completa`="+placentacompleta+",`placenta_retenida`="+placentaretenida+",`ligadura_cordon`="+ligaduracordon+",`ocitocitos_tdp`="+medicacionr_ocitocitos+",`antibiot`="+medicacionr_antibiot+",`analgesia_epidural`="+medicacionr_epidural+",`anest_region`="+medicacionr_anestregion+",`anest_gnral`="+medicacionr_anestgeneral+",`transfusion`="+medicacionr_transfusion+",`otros`="+medicacionr_otros+",`especific_otros`="+descri0+",`hizo_partograma`="+partograma+" WHERE `id_materno_perinatal`="+codemb+";";
             
        if( ba.transaccion(con)==false){
             ba.transaccion(dos);
                                  }       
 
        String con2="INSERT INTO `ips_isalud`.`enfermedades` (`materno_perinatal`, `nota`, `ninguna`, `hta_cronica`, `hta_gestacional`, `preeclampsia`, `eclampsia`, `cardiopatia_nefropatia`, `anemia`, `diabetes`, `diabetes2`, `infec_urinaria`, `amen_parto_preterm`, `rciu`, `ruptura_prem_memb`, `corio_anmi`, `otras_graves`,`hemorragia_1er_trim`, `cod_hemorragia_1er_trim`, `hemorragia_2er_trim`, `cod_hemorragia_2er_trim`, `hemorragia_3er_trim`, `cod_hemorragia_3er_trim`, `infec_puerperal`, `bacteriuria`, `postparto`) VALUES ("+codemb+","+descri+","+enf_ninguna+","+enfer_htacronica+","+enfer_htagestacional+","+enfer_preeclampsia+","+enfer_eclampsia+","+enfer_cardiopatia+","+enfer_anemia+","+enfer_diabetes0c+","+enfer_diabetes+","+enfer_infecurinaria+","+enfer_amepartopreter+","+enfer_rciu+","+enfer_rupturaprem+","+enfer_corioamnionitis+","+enfer_otrasgraves+","+hemorragias_1_trim+","+codigo1+","+hemorragias_2_trim+","+codigo2+","+hemorragias_3_trim+","+codigo3+","+hemorragias_infectpuerpe+","+hemorragias_bacteriuria+","+hemorragias_postparto+");";
        String dos2="UPDATE `ips_isalud`.`enfermedades` SET `nota`="+descri+", `ninguna`="+enf_ninguna+", `hta_cronica`="+enfer_htacronica+", `hta_gestacional`="+enfer_htagestacional+", `preeclampsia`="+enfer_preeclampsia+", `eclampsia`="+enfer_eclampsia+", `cardiopatia_nefropatia`="+enfer_cardiopatia+", `anemia`="+enfer_anemia+", `diabetes`="+enfer_diabetes0c+", `diabetes2`="+enfer_diabetes+", `infec_urinaria`="+enfer_infecurinaria+", `amen_parto_preterm`="+enfer_amepartopreter+", `rciu`="+enfer_rciu+", `ruptura_prem_memb`="+enfer_rupturaprem+", `corio_anmi`="+enfer_corioamnionitis+", `otras_graves`="+enfer_otrasgraves+", `hemorragia_1er_trim`="+hemorragias_1_trim+", `cod_hemorragia_1er_trim`="+codigo1+", `hemorragia_2er_trim`="+hemorragias_2_trim+", `cod_hemorragia_2er_trim`="+codigo2+", `hemorragia_3er_trim`="+hemorragias_3_trim+", `cod_hemorragia_3er_trim`="+codigo3+", `infec_puerperal`="+hemorragias_infectpuerpe+", `bacteriuria`="+hemorragias_bacteriuria+", `postparto`="+hemorragias_postparto+" WHERE `materno_perinatal`="+codemb+";";
                              
       if( ba.transaccion(con2)==false){
                              ba.transaccion(dos2); 
                                  }                           
       ba.cerrar();
     //  System.out.print("carne_f5 \n con"+con+"\n con2"+con2);
     //  System.out.print("carne_f5 dos2 "+dos2+" \n");
     //  System.out.print("carne_f5 dos "+dos+" \n");
             
      %>
    </body>
</html>

