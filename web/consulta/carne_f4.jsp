<%-- 
    Document   : carne_f4
    Created on : 28/05/2013, 05:59:12 PM
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
        

        
        
        String FUM="null";
        if(request.getParameter("FUM")!=null && request.getParameter("FUM").compareTo("null")!=0 && request.getParameter("FUM").trim().compareTo("")!=0){
            FUM="'"+request.getParameter("FUM").replace("'","").replace("\"","")+"'";
        }  
       
       String cigapordia="null";
        if(request.getParameter("cigapordia")!=null && request.getParameter("cigapordia").compareTo("null")!=0 && request.getParameter("cigapordia").trim().compareTo("")!=0){
            cigapordia="'"+request.getParameter("cigapordia").replace("'","").replace("\"","")+"'";
        }  
   
       
       String pridosisanttitetanica="null";
        if(request.getParameter("pridosisanttitetanica")!=null && request.getParameter("pridosisanttitetanica").compareTo("null")!=0 && request.getParameter("pridosisanttitetanica").trim().compareTo("")!=0){
            pridosisanttitetanica="'"+request.getParameter("pridosisanttitetanica").replace("'","").replace("\"","")+"'";
        }  
       
       String segdosisanttitetanica="null";
        if(request.getParameter("segdosisanttitetanica")!=null && request.getParameter("segdosisanttitetanica").compareTo("null")!=0 && request.getParameter("segdosisanttitetanica").trim().compareTo("")!=0){
              segdosisanttitetanica="'"+request.getParameter("segdosisanttitetanica").replace("'","").replace("\"","")+"'";
        }  
       
       String pesoant="null";
        if(request.getParameter("pesoant")!=null && request.getParameter("pesoant").compareTo("null")!=0 && request.getParameter("pesoant").trim().compareTo("")!=0){
            pesoant="'"+request.getParameter("pesoant").replace("'","").replace("\"","")+"'";
        }  
       
       String tallacm="null";
        if(request.getParameter("tallacm")!=null && request.getParameter("tallacm").compareTo("null")!=0 && request.getParameter("tallacm").trim().compareTo("")!=0){
              tallacm="'"+request.getParameter("tallacm").replace("'","").replace("\"","")+"'";
        } 
        
       String FPP="null";
        if(request.getParameter("FPP")!=null && request.getParameter("FPP").compareTo("null")!=0 && request.getParameter("FPP").trim().compareTo("")!=0){
              FPP="'"+request.getParameter("FPP").replace("'","").replace("\"","")+"'";
        } 
       
        String egconfiablefum="'8'";
        try{int egconfiablefumo=Integer.parseInt(""+request.getParameter("egconfiablefum")+"");
                egconfiablefum="'"+request.getParameter("egconfiablefum").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){egconfiablefum="'8'";}
       
        String egconfiableeco="'8'";
        try{int egconfiableecoo=Integer.parseInt(""+request.getParameter("egconfiableeco")+"");
                egconfiableeco="'"+request.getParameter("egconfiableeco").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){egconfiableeco="'8'";}
       
        String cigafuma="'8'";
        try{int cigafumao=Integer.parseInt(""+request.getParameter("cigafuma")+"");
                cigafuma="'"+request.getParameter("cigafuma").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){cigafuma="'8'";}
       
        String alcoholdro="'8'";
        try{int alcoholdroo=Integer.parseInt(""+request.getParameter("alcoholdro")+"");
                alcoholdro="'"+request.getParameter("alcoholdro").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){alcoholdro="'8'";}
       
        String drogasalc="'8'";
        try{int drogasalco=Integer.parseInt(""+request.getParameter("drogasalc")+"");
                drogasalc="'"+request.getParameter("drogasalc").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){drogasalc="'8'";}
       
        String antitetanica="'8'";
        try{int antitetanicao=Integer.parseInt(""+request.getParameter("antitetanica")+"");
                antitetanica="'"+request.getParameter("antitetanica").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){antitetanica="'8'";}
       
        String antirubeolauno="'8'";
        try{int antirubeolaunoo=Integer.parseInt(""+request.getParameter("antirubeolauno")+"");
                antirubeolauno="'"+request.getParameter("antirubeolauno").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){antirubeolauno="'8'";}
       
        String exnormalodont="'8'";
        try{int exnormalodonto=Integer.parseInt(""+request.getParameter("exnormalodont")+"");
                exnormalodont="'"+request.getParameter("exnormalodont").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){exnormalodont="'8'";}
       
        String exnormalmamas="'8'";
        try{int exnormalmamaso=Integer.parseInt(""+request.getParameter("exnormalmamas")+"");
                exnormalmamas="'"+request.getParameter("exnormalmamas").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){exnormalmamas="'8'";}
       
        String exnormalcervix="'8'";
        try{int exnormalcervixo=Integer.parseInt(""+request.getParameter("exnormalcervix")+"");
                exnormalcervix="'"+request.getParameter("exnormalcervix").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){exnormalcervix="'8'";}
        ///////////
              
     
          String hbmenor="null";
        if(request.getParameter("hbmenor")!=null && request.getParameter("hbmenor").compareTo("null")!=0 && request.getParameter("hbmenor").trim().compareTo("")!=0){
            hbmenor="'"+request.getParameter("hbmenor").replace("'","").replace("\"","")+"'";
        }  
       
       String hbmayor="null";
        if(request.getParameter("hbmayor")!=null && request.getParameter("hbmayor").compareTo("null")!=0 && request.getParameter("hbmayor").trim().compareTo("")!=0){
            hbmayor="'"+request.getParameter("hbmayor").replace("'","").replace("\"","")+"'";
        }  
        
          String nem125="'0'";
        if(request.getParameter("nem125")!=null && request.getParameter("nem125").compareTo("on")==0 && request.getParameter("nem125").trim().compareTo("")!=0){
           nem125="'1'";
        }
          
          String nem125dos="'0'";
        if(request.getParameter("nem125dos")!=null && request.getParameter("nem125dos").compareTo("on")==0 && request.getParameter("nem125dos").trim().compareTo("")!=0){
           nem125dos="'1'";
        }

        String gruposanguineo="'0'";
        try{int gruposanguineoo=Integer.parseInt(""+request.getParameter("gruposanguineo")+"");
                gruposanguineo="'"+request.getParameter("gruposanguineo").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){gruposanguineo="'0'";}
        
        String rh="'0'";
        try{int rho=Integer.parseInt(""+request.getParameter("rh")+"");
                rh="'"+request.getParameter("rh").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){rh="'0'";}

         String sensible="'8'";
        try{int sensibleo=Integer.parseInt(""+request.getParameter("sensible")+"");
                sensible="'"+request.getParameter("sensible").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){sensible="'8'";}

         String citologia="'8'";
        try{int citologiao=Integer.parseInt(""+request.getParameter("citologia")+"");
                citologia="'"+request.getParameter("citologia").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){citologia="'8'";}

         String consejvih="'8'";
        try{int consejviho=Integer.parseInt(""+request.getParameter("consejvih")+"");
                consejvih="'"+request.getParameter("consejvih").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){consejvih="'8'";}

         String solicivih="'8'";
        try{int soliciviho=Integer.parseInt(""+request.getParameter("solicivih")+"");
                solicivih="'"+request.getParameter("solicivih").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){solicivih="'8'";}

         String vdrlrprmenor="'8'";
        try{int vdrlrprmenoro=Integer.parseInt(""+request.getParameter("vdrlrprmenor")+"");
                vdrlrprmenor="'"+request.getParameter("vdrlrprmenor").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){vdrlrprmenor="'8'";}

         String vdrlrprmayor="'8'";
        try{int vdrlrprmayoro=Integer.parseInt(""+request.getParameter("vdrlrprmayor")+"");
                vdrlrprmayor="'"+request.getParameter("vdrlrprmayor").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){vdrlrprmayor="'8'";}

         String sifilis="'8'";
        try{int sifiliso=Integer.parseInt(""+request.getParameter("sifilis")+"");
                sifilis="'"+request.getParameter("sifilis").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){sifilis="'8'";}

         String agshb="'8'";
        try{int agshbo=Integer.parseInt(""+request.getParameter("agshb")+"");
                agshb="'"+request.getParameter("agshb").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){agshb="'8'";}

         String iggtoxoplasma="'8'";
        try{int iggtoxoplasmao=Integer.parseInt(""+request.getParameter("iggtoxoplasma")+"");
                iggtoxoplasma="'"+request.getParameter("iggtoxoplasma").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){iggtoxoplasma="'8'";}

         String testosullivan="'8'";
        try{int testosullivano=Integer.parseInt(""+request.getParameter("testosullivan")+"");
                testosullivan="'"+request.getParameter("testosullivan").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){testosullivan="'8'";}

         String iggrubeola="'8'";
        try{int iggrubeolao=Integer.parseInt(""+request.getParameter("iggrubeola")+"");
                iggrubeola="'"+request.getParameter("iggrubeola").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){iggrubeola="'8'";}

         String vercefaexte="'8'";
        try{int vercefaexteo=Integer.parseInt(""+request.getParameter("vercefaexte")+"");
                vercefaexte="'"+request.getParameter("vercefaexte").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){vercefaexte="'8'";}

         String colposcopia="'8'";
        try{int colposcopiao=Integer.parseInt(""+request.getParameter("colposcopia")+"");
                colposcopia="'"+request.getParameter("colposcopia").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){colposcopia="'8'";}
                                               
        
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
        
        
        String con="INSERT INTO `ips_isalud`.`gestacion_actual` ( `materno_perinatal`, `peso_ant`, `tallacm`, `fum`, `fpp`, `eco_fum`, `eco_20`, `fuma`, `cigarros_dia`, `alcohol`, `drogas`, `antite_vigente`, `dosis_uno`, `dosis_dos`, `antirubeola`, `exnor_odont`, `exnor_mamas`, `exnor_cervix`, `sensibil`, `grupo_sang`, `rh_gs`,`citologia`, `colposcopia`, `vih_consej`, `vih_solicitado`, `vdrl_menos20`, `vdrl_mas20`, `sifilis`, `hb_menos20`, `menos_doce_cinco`, `hb_mas20`, `menos_doce`, `agshb`, `igg_toxo`, `test_suliban`, `igg_rubeola`, `version_cefalica`) VALUES ("+codemb+","+pesoant+","+tallacm+","+FUM+","+FPP+","+egconfiablefum+","+egconfiableeco+","+cigafuma+","+cigapordia+","+alcoholdro+","+drogasalc+","+antitetanica+","+pridosisanttitetanica+","+segdosisanttitetanica+","+antirubeolauno+","+exnormalodont+","+exnormalmamas+","+exnormalcervix+","+sensible+","+gruposanguineo+","+rh+","+citologia+","+colposcopia+","+consejvih+","+solicivih+","+vdrlrprmenor+","+vdrlrprmayor+","+sifilis+","+hbmenor+","+nem125+","+hbmayor+","+nem125dos+","+agshb+","+iggtoxoplasma+","+testosullivan+","+iggrubeola+","+vercefaexte+");";
            //+ "INSERT INTO `ips_isalud`.`obstetrico` (`materno_perinatal`, `gestas_previas`, `abortos`, `tres_a_conse`, `vaginales`, `nacidos_vivos`, `viven`, `ult_previo`, `partos`, `cesareas`, `nacidos_muestos`, `muertos_1sem`, `mu_despues_1sem`, `fin_embarazo_ant`, `mes_uno_mas_cinco`, `deseado`, `fracaso_planifica`) VALUES ("+codemb+","+gestprev+","+abortos+","+tesconse+","+dvaginales+","+nacidosvi+","+viven+","+ultimoprevio+","+apartos+","+acesareas+","+anacidosm+","+m1sem+","+md1sem+","+fembarazoant+","+menorunanno+","+embplaneado+","+fracasometodoant+");";
    if( ba.transaccion(con)==false){
    
            String dos="UPDATE `ips_isalud`.`gestacion_actual` SET `peso_ant`="+pesoant+", `tallacm`="+tallacm+", `fum`="+FUM+", `fpp`="+FPP+", `eco_fum`="+egconfiablefum+", `eco_20`="+egconfiableeco+", `fuma`="+cigafuma+", `cigarros_dia`="+cigapordia+", `alcohol`="+alcoholdro+", `drogas`="+drogasalc+", `antite_vigente`="+antitetanica+", `dosis_uno`="+pridosisanttitetanica+", `dosis_dos`="+segdosisanttitetanica+", `antirubeola`="+antirubeolauno+", `exnor_odont`="+exnormalodont+", `exnor_mamas`="+exnormalmamas+", `exnor_cervix`="+exnormalcervix+", `sensibil`="+sensible+", `grupo_sang`="+gruposanguineo+", `rh_gs`="+rh+", `citologia`="+citologia+", `colposcopia`="+colposcopia+", `vih_consej`="+consejvih+", `vih_solicitado`="+solicivih+", `vdrl_menos20`="+vdrlrprmenor+", `vdrl_mas20`="+vdrlrprmayor+", `sifilis`="+sifilis+", `hb_menos20`="+hbmenor+", `menos_doce_cinco`="+nem125+", `hb_mas20`="+hbmayor+", `menos_doce`="+nem125dos+", `agshb`="+agshb+", `igg_toxo`="+iggtoxoplasma+", `test_suliban`="+testosullivan+", `igg_rubeola`="+iggrubeola+", `version_cefalica`="+vercefaexte+" WHERE `materno_perinatal`="+codemb+";";
             
            //  System.out.println("datoins=>"+dos);              
                ba.transaccion(dos);
                                      }       
       //  System.out.println("carne f4 uno=>"+con);               
       ba.cerrar();
       
      %>
    </body>
</html>

