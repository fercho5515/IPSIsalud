<%-- 
    Document   : guarda_consu_nutri_1
    Created on : 14/09/2013, 12:01:06 PM
    Author     : Emmanuel
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body> <% request.setCharacterEncoding("UTF-8");
        //  out.print("nom "+session.getAttribute("nombre")+" clave "+session.getAttribute("clave")+" id "+session.getAttribute("id")+" permiso "+session.getAttribute("permiso")+" s agenda "+session.getAttribute("serial_agenda" )+" s paciente"+session.getAttribute("serial_pacinete"));
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null || session.getAttribute("serial_consulta")==null ){
      
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
      String fecha_real=request.getParameter("fecha_real"); 
      String factores=request.getParameter("facriesgo");
      String cualotroingreso=request.getParameter("cualotroingreso");
      String ingresos_eco=request.getParameter("ingresos_eco");
      String egresos_eco=request.getParameter("egresos_eco");      
      String num_habit=request.getParameter("num_habit");
      String perso_x_habi=request.getParameter("perso_x_habi"); 
      String factores_vivienda=request.getParameter("factor_vivienda"); 
      String material_cual=request.getParameter("material_cual");
      String piso_cual=request.getParameter("piso_cual"); 
      String basura_cual=request.getParameter("basura_cual");
      String dinamica=request.getParameter("dinamica"); 
      String observa_y_reco=request.getParameter("observa_y_reco"); 
      String comunicacion_porque=request.getParameter("comunicacionp");
      String expresa=request.getParameter("expresa");
      String violencia=request.getParameter("violencia");
      String corto_plazo=request.getParameter("cortoplazo");
      String mediano_plazo=request.getParameter("medianoplazo");
      String largo_plazo=request.getParameter("largoplazo");
      String metas=request.getParameter("metas");
      String limita=request.getParameter("limita");
      String actividades=request.getParameter("actividades");
      String porque_ayuda=request.getParameter("porqueprofesional");
      String profesional=request.getParameter("queprofesional");
      
      
       if(fecha_real != null && fecha_real.compareTo("")!=0){fecha_real=fecha_real.replace("'","").replace("\"","");fecha_real="'"+fecha_real+"'";}else{fecha_real="null";}
       if(factores != null && factores.compareTo("")!=0){factores=factores.replace("'","").replace("\"","");factores="'"+factores+"'";}else{factores="null";}
       if(cualotroingreso != null && cualotroingreso.compareTo("")!=0){cualotroingreso=cualotroingreso.replace("'","").replace("\"","");cualotroingreso="'"+cualotroingreso+"'";}else{cualotroingreso="null";}
       if(ingresos_eco != null && ingresos_eco.compareTo("")!=0){ingresos_eco=ingresos_eco.replace("'","").replace("\"","");ingresos_eco="'"+ingresos_eco+"'";}else{ingresos_eco="null";}
       if(egresos_eco != null && egresos_eco.compareTo("")!=0){egresos_eco=egresos_eco.replace("'","").replace("\"","");egresos_eco="'"+egresos_eco+"'";}else{egresos_eco="null";}
       if(num_habit != null && num_habit.compareTo("")!=0){num_habit=num_habit.replace("'","").replace("\"","");num_habit="'"+num_habit+"'";}else{num_habit="null";}
       if(perso_x_habi != null && perso_x_habi.compareTo("")!=0){perso_x_habi=perso_x_habi.replace("'","").replace("\"","");perso_x_habi="'"+perso_x_habi+"'";}else{perso_x_habi="null";}
       if(factores_vivienda != null && factores_vivienda.compareTo("")!=0){factores_vivienda=factores_vivienda.replace("'","").replace("\"","");factores_vivienda="'"+factores_vivienda+"'";}else{factores_vivienda="null";}
       if(material_cual != null && material_cual.compareTo("")!=0){material_cual=material_cual.replace("'","").replace("\"","");material_cual="'"+material_cual+"'";}else{material_cual="null";}
       if(piso_cual != null && piso_cual.compareTo("")!=0){piso_cual=piso_cual.replace("'","").replace("\"","");piso_cual="'"+piso_cual+"'";}else{piso_cual="null";}
       if(basura_cual != null && basura_cual.compareTo("")!=0){basura_cual=basura_cual.replace("'","").replace("\"","");basura_cual="'"+basura_cual+"'";}else{basura_cual="null";}
       if(dinamica != null && dinamica.compareTo("")!=0){dinamica=dinamica.replace("'","").replace("\"","");dinamica="'"+dinamica+"'";}else{dinamica="null";}
       if(observa_y_reco != null && observa_y_reco.compareTo("")!=0){observa_y_reco=observa_y_reco.replace("'","").replace("\"","");observa_y_reco="'"+observa_y_reco+"'";}else{observa_y_reco="null";}
       if(comunicacion_porque != null && comunicacion_porque.compareTo("")!=0){comunicacion_porque=comunicacion_porque.replace("'","").replace("\"","");comunicacion_porque="'"+comunicacion_porque+"'";}else{comunicacion_porque="null";}
       if(expresa != null && expresa.compareTo("")!=0){expresa=expresa.replace("'","").replace("\"","");expresa="'"+expresa+"'";}else{expresa="null";}
       if(violencia != null && violencia.compareTo("")!=0){violencia=violencia.replace("'","").replace("\"","");violencia="'"+violencia+"'";}else{violencia="null";}
       if(corto_plazo != null && corto_plazo.compareTo("")!=0){corto_plazo=corto_plazo.replace("'","").replace("\"","");corto_plazo="'"+corto_plazo+"'";}else{corto_plazo="null";}
       if(mediano_plazo != null && mediano_plazo.compareTo("")!=0){mediano_plazo=mediano_plazo.replace("'","").replace("\"","");mediano_plazo="'"+mediano_plazo+"'";}else{mediano_plazo="null";}
       if(largo_plazo != null && largo_plazo.compareTo("")!=0){largo_plazo=largo_plazo.replace("'","").replace("\"","");largo_plazo="'"+largo_plazo+"'";}else{largo_plazo="null";}
       if(metas != null && metas.compareTo("")!=0){metas=metas.replace("'","").replace("\"","");metas="'"+metas+"'";}else{metas="null";}
       if(limita != null && limita.compareTo("")!=0){limita=limita.replace("'","").replace("\"","");limita="'"+limita+"'";}else{limita="null";}
       if(actividades != null && actividades.compareTo("")!=0){actividades=actividades.replace("'","").replace("\"","");actividades="'"+actividades+"'";}else{actividades="null";}
       if(porque_ayuda != null && porque_ayuda.compareTo("")!=0){porque_ayuda=porque_ayuda.replace("'","").replace("\"","");porque_ayuda="'"+porque_ayuda+"'";}else{porque_ayuda="null";}
       if(profesional != null && profesional.compareTo("")!=0){profesional=profesional.replace("'","").replace("\"","");profesional="'"+profesional+"'";}else{profesional="null";}
       
                    
      //radio
      String casa=request.getParameter("casa");
      String sanitario=request.getParameter("sanitario");
      String animal=request.getParameter("animal");
      String basura=request.getParameter("basura");
      String comunicacion=request.getParameter("comunicacion");
      String solucionan=request.getParameter("solucionan");
      String dinamicafamiliar=request.getParameter("dinamicafamiliar");
      String profesionalayuda=request.getParameter("profesionalayuda");
      
      
      if(casa == null || casa.compareTo("-1")==0 || casa.compareTo("")==0){casa="null";}
      else{casa="'"+casa+"'";}
      
      if(sanitario == null || sanitario.compareTo("-1")==0 || sanitario.compareTo("")==0){sanitario="null";}
      else{sanitario="'"+sanitario+"'";}
      
      if(animal == null || animal.compareTo("-1")==0 || animal.compareTo("")==0){animal="null";}
      else{animal="'"+animal+"'";}
      
      if(basura == null || basura.compareTo("-1")==0 || basura.compareTo("")==0){basura="null";}
      else{basura="'"+basura+"'";}
      
      if(comunicacion == null || comunicacion.compareTo("-1")==0 || comunicacion.compareTo("")==0){comunicacion="null";}
      else{comunicacion="'"+comunicacion+"'";}
      
      if(solucionan == null || solucionan.compareTo("-1")==0 || solucionan.compareTo("")==0){solucionan="null";}
      else{solucionan="'"+solucionan+"'";}
      
      if(dinamicafamiliar == null || dinamicafamiliar.compareTo("-1")==0 || dinamicafamiliar.compareTo("")==0){dinamicafamiliar="null";}
      else{dinamicafamiliar="'"+dinamicafamiliar+"'";}
      
      if(profesionalayuda == null || profesionalayuda.compareTo("-1")==0 || profesionalayuda.compareTo("")==0){profesionalayuda="null";}
      else{profesionalayuda="'"+profesionalayuda+"'";}
      
            
      //select
      String salud_eps=request.getParameter("salud_eps");      
      if(salud_eps == null || salud_eps.compareTo("-1")==0 || salud_eps.compareTo("")==0){salud_eps="null";}
      else{salud_eps="'"+salud_eps+"'";}
      
      ///  checkbox
      
      String salario="'0'";      
      try{ if(request.getParameter("salarioingreso")==null || request.getParameter("salarioingreso").compareTo("null")==0 || request.getParameter("salarioingreso").compareTo("")==0){salario="'0'";}  
           else{salario="'"+request.getParameter("salarioingreso")+"'";}
         }
      catch(Exception exe){salario="'0'"; }
      
      String pension="'0'";      
      try{ if(request.getParameter("pensioningreso")==null || request.getParameter("pensioningreso").compareTo("null")==0 || request.getParameter("pensioningreso").compareTo("")==0){pension="'0'";}  
           else{pension="'"+request.getParameter("pensioningreso")+"'";}
         }
      catch(Exception exe){pension="'0'"; }
      
      String arrendamiento="'0'";      
      try{ if(request.getParameter("arrendamientoingreso")==null || request.getParameter("arrendamientoingreso").compareTo("null")==0 || request.getParameter("arrendamientoingreso").compareTo("")==0){arrendamiento="'0'";}  
           else{arrendamiento="'"+request.getParameter("arrendamientoingreso")+"'";}
         }
      catch(Exception exe){arrendamiento="'0'"; }
      
      String otro_ingreso="'0'";
      try{ if(request.getParameter("otroingreso")==null || request.getParameter("otroingreso").compareTo("null")==0 || request.getParameter("otroingreso").compareTo("")==0){otro_ingreso="'0'";}  
           else{otro_ingreso="'"+request.getParameter("otroingreso")+"'";}
         }
      catch(Exception exe){otro_ingreso="'0'"; }
      
      
      String servicios="'0'";      
      try{ if(request.getParameter("chec_servivios")==null || request.getParameter("chec_servivios").compareTo("null")==0 || request.getParameter("chec_servivios").compareTo("")==0){servicios="'0'";}  
           else{servicios="'"+request.getParameter("arrendamientoingreso")+"'";}
         }
      catch(Exception exe){servicios="'0'"; }
      
      String alimentacion="'0'";      
      try{ if(request.getParameter("chec_alimentacion")==null || request.getParameter("chec_alimentacion").compareTo("null")==0 || request.getParameter("chec_alimentacion").compareTo("")==0){alimentacion="'0'";}  
           else{alimentacion="'"+request.getParameter("chec_alimentacion")+"'";}
         }
      catch(Exception exe){alimentacion="'0'"; }
      
      String recreacion="'0'";      
      try{ if(request.getParameter("chec_recreacion")==null || request.getParameter("chec_recreacion").compareTo("null")==0 || request.getParameter("chec_recreacion").compareTo("")==0){recreacion="'0'";}  
           else{recreacion="'"+request.getParameter("chec_recreacion")+"'";}
         }
      catch(Exception exe){recreacion="'0'"; }
      
      String otro_copy="'0'";      
      try{ if(request.getParameter("chec_otro")==null || request.getParameter("chec_otro").compareTo("null")==0 || request.getParameter("chec_otro").compareTo("")==0){otro_copy="'0'";}  
           else{otro_copy="'"+request.getParameter("chec_otro")+"'";}
         }
      catch(Exception exe){otro_copy="'0'"; }
      
      
      
      String vivienda="'0'";      
      try{ if(request.getParameter("chec_vivi")==null || request.getParameter("chec_vivi").compareTo("null")==0 || request.getParameter("chec_vivi").compareTo("")==0){vivienda="'0'";}  
           else{vivienda="'"+request.getParameter("chec_vivi")+"'";}
         }
      catch(Exception exe){vivienda="'0'"; }
      
      String educacion="'0'";
      try{ if(request.getParameter("chec_educ")==null || request.getParameter("chec_educ").compareTo("null")==0 || request.getParameter("chec_educ").compareTo("")==0){educacion="'0'";}  
           else{educacion="'"+request.getParameter("chec_educ")+"'";}
         }
      catch(Exception exe){educacion="'0'"; }
      
      String transporte="'0'";
      try{ if(request.getParameter("chec_tran")==null || request.getParameter("chec_tran").compareTo("null")==0 || request.getParameter("chec_tran").compareTo("")==0){transporte="'0'";}  
           else{transporte="'"+request.getParameter("chec_tran")+"'";}
         }
      catch(Exception exe){transporte="'0'"; }
      
      String salud="'0'";
      try{ if(request.getParameter("chec_salu")==null || request.getParameter("chec_salu").compareTo("null")==0 || request.getParameter("chec_salu").compareTo("")==0){salud="'0'";}  
           else{salud="'"+request.getParameter("chec_salu")+"'";}
         }
      catch(Exception exe){salud="'0'"; }
      ////////////////////////////////////////////
      ////////////////////////////////////////////
      ////////////////////////////////////////////
      
      String sala="'0'";
      try{ if(request.getParameter("sala")==null || request.getParameter("sala").compareTo("null")==0 || request.getParameter("sala").compareTo("")==0){sala="'0'";}  
           else{sala="'"+request.getParameter("sala")+"'";}
         }
      catch(Exception exe){sala="'0'"; }
      
      String comedor="'0'";
      try{ if(request.getParameter("comedor")==null || request.getParameter("comedor").compareTo("null")==0 || request.getParameter("comedor").compareTo("")==0){comedor="'0'";}  
           else{comedor="'"+request.getParameter("comedor")+"'";}
         }
      catch(Exception exe){comedor="'0'"; }
      
      String cocina="'0'";
      try{ if(request.getParameter("cocina")==null || request.getParameter("cocina").compareTo("null")==0 || request.getParameter("cocina").compareTo("")==0){cocina="'0'";}  
           else{cocina="'"+request.getParameter("cocina")+"'";}
         }
      catch(Exception exe){cocina="'0'"; }
      
      String parqueadero="'0'";
      try{ if(request.getParameter("parqueadero")==null || request.getParameter("parqueadero").compareTo("null")==0 || request.getParameter("parqueadero").compareTo("")==0){parqueadero="'0'";}  
           else{parqueadero="'"+request.getParameter("parqueadero")+"'";}
         }
      catch(Exception exe){parqueadero="'0'"; }
      
      String patior="'0'";
      try{ if(request.getParameter("patior")==null || request.getParameter("patior").compareTo("null")==0 || request.getParameter("patior").compareTo("")==0){patior="'0'";}  
           else{patior="'"+request.getParameter("patior")+"'";}
         }
      catch(Exception exe){patior="'0'"; }
      ////////////////////////////////////////////
      ////////////////////////////////////////////
      ////////////////////////////////////////////   
      
      String agua="'0'";
      try{ if(request.getParameter("servi_agua")==null || request.getParameter("servi_agua").compareTo("null")==0 || request.getParameter("servi_agua").compareTo("")==0){agua="'0'";}  
           else{agua="'"+request.getParameter("servi_agua")+"'";}
         }
      catch(Exception exe){agua="'0'"; }
      
      String luz="'0'";
      try{ if(request.getParameter("servi_luz")==null || request.getParameter("servi_luz").compareTo("null")==0 || request.getParameter("servi_luz").compareTo("")==0){luz="'0'";}  
           else{luz="'"+request.getParameter("servi_luz")+"'";}
         }
      catch(Exception exe){luz="'0'"; }
      
      String alcantarillado="'0'";
      try{ if(request.getParameter("servi_alcan")==null || request.getParameter("servi_alcan").compareTo("null")==0 || request.getParameter("servi_alcan").compareTo("")==0){alcantarillado="'0'";}  
           else{alcantarillado="'"+request.getParameter("servi_alcan")+"'";}
         }
      catch(Exception exe){alcantarillado="'0'"; }
      
      String telefono="'0'";
      try{ if(request.getParameter("servi_tele")==null || request.getParameter("servi_tele").compareTo("null")==0 || request.getParameter("servi_tele").compareTo("")==0){telefono="'0'";}  
           else{telefono="'"+request.getParameter("servi_tele")+"'";}
         }
      catch(Exception exe){telefono="'0'"; }
      
      String aseo="'0'";
      try{ if(request.getParameter("servi_aseo")==null || request.getParameter("servi_aseo").compareTo("null")==0 || request.getParameter("servi_aseo").compareTo("")==0){aseo="'0'";}  
           else{aseo="'"+request.getParameter("servi_aseo")+"'";}
         }
      catch(Exception exe){aseo="'0'"; }
     // System.out.println("aseo: "+aseo+" request aseo:"+request.getParameter("servi_aseo"));
      
      String gas="'0'";
      try{ if(request.getParameter("servi_gas")==null || request.getParameter("servi_gas").compareTo("null")==0 || request.getParameter("servi_gas").compareTo("")==0){gas="'0'";}  
           else{gas="'"+request.getParameter("servi_gas")+"'";}
         }
      catch(Exception exe){gas="'0'"; }
      
      String internet="'0'";
      try{ if(request.getParameter("servi_internet")==null || request.getParameter("servi_internet").compareTo("null")==0 || request.getParameter("servi_internet").compareTo("")==0){internet="'0'";}  
           else{internet="'"+request.getParameter("servi_internet")+"'";}
         }
      catch(Exception exe){internet="'0'"; }
      
      String cable="'0'";
      try{ if(request.getParameter("servi_cable")==null || request.getParameter("servi_cable").compareTo("null")==0 || request.getParameter("servi_cable").compareTo("")==0){cable="'0'";}  
           else{cable="'"+request.getParameter("servi_cable")+"'";}
         }
      catch(Exception exe){cable="'0'"; }
      
      /////////////////////////////////////////////
      /////////////////////////////////////////////
      /////////////////////////////////////////////
      String ladrillo="'0'";
      try{ if(request.getParameter("material1")==null || request.getParameter("material1").compareTo("null")==0 || request.getParameter("material1").compareTo("")==0){ladrillo="'0'";}  
           else{ladrillo="'"+request.getParameter("material1")+"'";}
         }
      catch(Exception exe){ladrillo="'0'"; }
      
      String bareque="'0'";
      try{ if(request.getParameter("material2")==null || request.getParameter("material2").compareTo("null")==0 || request.getParameter("material2").compareTo("")==0){bareque="'0'";}  
           else{bareque="'"+request.getParameter("material2")+"'";}
         }
      catch(Exception exe){bareque="'0'"; }
      
      String guadua="'0'";
      try{ if(request.getParameter("material3")==null || request.getParameter("material3").compareTo("null")==0 || request.getParameter("material3").compareTo("")==0){guadua="'0'";}  
           else{guadua="'"+request.getParameter("material3")+"'";}
         }
      catch(Exception exe){guadua="'0'"; }
      
      String madera="'0'";
      try{ if(request.getParameter("material4")==null || request.getParameter("material4").compareTo("null")==0 || request.getParameter("material4").compareTo("")==0){madera="'0'";}  
           else{madera="'"+request.getParameter("material4")+"'";}
         }
      catch(Exception exe){madera="'0'"; }
      
      String otro="'0'";
      try{ if(request.getParameter("material5")==null || request.getParameter("material5").compareTo("null")==0 || request.getParameter("material5").compareTo("")==0){otro="'0'";}  
           else{otro="'"+request.getParameter("material5")+"'";}
         }
      catch(Exception exe){otro="'0'"; }
      
      //////////////////////////////////////////////////
      //////////////////////////////////////////////////
      //////////////////////////////////////////////////
      
      String tierra="'0'";
      try{ if(request.getParameter("piso1")==null || request.getParameter("piso1").compareTo("null")==0 || request.getParameter("piso1").compareTo("")==0){tierra="'0'";}  
           else{tierra="'"+request.getParameter("piso1")+"'";}
         }
      catch(Exception exe){tierra="'0'"; }
      
      String baldosa="'0'";
      try{ if(request.getParameter("piso2")==null || request.getParameter("piso2").compareTo("null")==0 || request.getParameter("piso2").compareTo("")==0){baldosa="'0'";}  
           else{baldosa="'"+request.getParameter("piso2")+"'";}
         }
      catch(Exception exe){baldosa="'0'"; }
      
      String mineral="'0'";
      try{ if(request.getParameter("piso3")==null || request.getParameter("piso3").compareTo("null")==0 || request.getParameter("piso3").compareTo("")==0){mineral="'0'";}  
           else{mineral="'"+request.getParameter("piso3")+"'";}
         }
      catch(Exception exe){mineral="'0'"; }
      
      String otra="'0'";
      try{ if(request.getParameter("piso4")==null || request.getParameter("piso4").compareTo("null")==0 || request.getParameter("piso4").compareTo("")==0){otra="'0'";}  
           else{otra="'"+request.getParameter("piso4")+"'";}
         }
      catch(Exception exe){otra="'0'"; }
      
      
      //////////////////////////////////////////
      //////////////////////////////////////////
      //////////////////////////////////////////
      
      String ecp=""+request.getParameter("estado_civilo_trabs");
      String ori=""+request.getParameter("orientacion_trabs");
       
      String sql="UPDATE `ips_isalud`.`consulta_trabajo_social` SET `fecha`=now(), `id_profecional`='"+session.getAttribute("id")+"', `id_historia`='"+session.getAttribute("serial_pacinete")+"', `guardado`=1, `tipo`='"+session.getAttribute("permiso")+"', `ingreso_eco`="+ingresos_eco+",`egreso_mensual`="+egresos_eco+", `salario`="+salario+",`pension`="+pension+",`arrendamiento`="+arrendamiento+",`otro_ingreso`="+otro_ingreso+",`cual_ingreso`="+cualotroingreso+",`servicios`="+servicios+",`alimentacion`="+alimentacion+",`recreacion`="+recreacion+",`otro_copy1`="+otro_copy+",`vivienda`="+vivienda+", `educacion`="+educacion+", `transporte`="+transporte+", `salud`="+salud+", `otros`=otro, `cual`='cual', `vivienda_t`="+casa+", `n_habitaciones`="+num_habit+", `per_por_habitacion`="+perso_x_habi+", `sala`="+sala+", `comedor`="+comedor+", `cocina`="+cocina+", `parqueadero`="+parqueadero+",`patio`="+patior+",`factores_vivienda`="+factores_vivienda+",`sanitario`="+sanitario+", `agua`="+agua+", `luz`="+luz+", `alcantarillado`="+alcantarillado+", `telefono`="+telefono+", `aseo`="+aseo+", `gas`="+gas+",`cable`="+cable+",`internet`="+internet+", `ladrillo`="+ladrillo+", `bareque`="+bareque+", `guadua`="+guadua+", `madera`="+madera+", `otro`="+otro+", `des_otro`="+material_cual+", `tierra`="+tierra+", `baldosa`="+baldosa+", `mineral`="+mineral+", `otro_piso`="+otra+", `des_otro_piso`="+piso_cual+", `animal`="+animal+", `basura`="+basura+",`comunicacion`="+comunicacion+",`soluciones`="+solucionan+",`funcional`="+dinamicafamiliar+",`ayuda`="+profesionalayuda+", `describasu`="+basura_cual+", `entidad`="+salud_eps+", `dinamica_interna`="+dinamica+", `obser_recoo`="+observa_y_reco+", `factores_riesgo`="+factores+",`comunicacion_porque`="+comunicacion_porque+",`expresa`="+expresa+",`violencia`="+violencia+",`corto_plazo`="+corto_plazo+",`mediano_plazo`="+mediano_plazo+", `largo_plazo`="+largo_plazo+",`metas`="+metas+",`limita`="+limita+",`actividades`="+actividades+",`porque_ayuda`="+porque_ayuda+",`que_profesional`="+profesional+",`archivo_fisico`='arch_fisico', `fecha_real`="+fecha_real+" WHERE `id_consulta_trabajo_social`='"+session.getAttribute("serial_consulta")+"';";    
    //  System.out.println("sql guada consu trab "+sql);
      if(ba.transaccion(sql)){out.print("<input type='hidden' id='guarda_cons_nutri' name='guarda_cons_nutri' value='1'>");}
           else{out.print("<input type='hidden' id='guarda_cons_nutri' name='guarda_cons_nutri' value='0'>");}

      
      String sql2="UPDATE `ips_isalud`.`pacientes` SET `cod_estado_civil`='"+ecp+"', `id_orientacion`='"+ori+"' WHERE `serial_persona`='"+session.getAttribute("serial_pacinete")+"';";
      
      if(ba.transaccion(sql2)){out.print("<input type='hidden' id='guarda_cons_nutri2' name='guarda_cons_nutri2' value='1'>");}
                          else{out.print("<input type='hidden' id='guarda_cons_nutri2' name='guarda_cons_nutri2' value='0'>");}

      
       ba.transaccion("UPDATE `ips_isalud`.`agenda` SET `id_estado`=3 WHERE `id_agenda`='"+session.getAttribute("serial_agenda")+"';");      
    // UPDATE `ips_isalud`.`consulta_trabajo_social` SET `fecha`='now', `id_profecional`=id_prof, `id_historia`=id_historia, `guardado`=1, `tipo`='tipo', `ingreso_eco`='ingreso_eco', `vivienda`=vivienda, `educacion`=educacion, `transporte`=transporte, `salud`=salud, `otros`=otro, `cual`='cual', `vivienda_t`=vivienda_d, `n_habitaciones`=n_habitaciones, `per_por_habitacion`=per_por_habitacion, `sala`=sala, `comedor`=comedor, `cocina`=cocina, `sanitario`=sanitario, `agua`=agua, `luz`=luz, `alcantarillado`=alcantarillado, `telefono`=telefono, `aseo`=aseo, `gas`=gas, `ladrillo`=ladrillo, `bareque`=bareque, `guadua`=guadua, `madera`=madera, `otro`=otro, `des_otro`='cual', `tierra`=tierra, `baldosa`=baldosa, `mineral`=mineral, `otro_piso`=otro, `des_otro_piso`='cual', `animal`=animal, `basura`=basura, `describasu`='cual basu', `entidad`='eps', `dinamica_interna`='dinamica', `obser_recoo`='obser reco', `archivo_fisico`='arch_fisico', `fecha_real`='fecha real' WHERE `id_consulta_trabajo_social`='1';
       ba.cerrar();
     %>
      
    </body>
</html>
