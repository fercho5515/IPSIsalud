<%-- 
    Document   : guarda_consu_psico_1
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
            
      String mot=""+request.getParameter("motivo_con_psico");
      String desusupadienfer=""+request.getParameter("desusupadienfer");
      String historia_familiar=""+request.getParameter("historia_familiar");
      String aspectos_psico_enf=""+request.getParameter("aspectos_psico_enf");
      String porte_actidud=""+request.getParameter("porte_actidud");
      String conciencia=""+request.getParameter("conciencia");
      String humor_afectividad=""+request.getParameter("humor_afectividad");
      String caracteristicas_lenguaje=""+request.getParameter("caracteristicas_lenguaje");
      String senso_percepcion=""+request.getParameter("senso_percepcion");
      String pensamiento=""+request.getParameter("pensamiento");
      String alteracion_ritmos=""+request.getParameter("alteracion_ritmos");
      String juicio=""+request.getParameter("juicio");
      String memoria=""+request.getParameter("memoria");
      String atencion=""+request.getParameter("atencion");
      String psicomotricidad=""+request.getParameter("psicomotricidad");
      String postulacion_trat=""+request.getParameter("postulacion_trat");
      String observacionesc=""+request.getParameter("observacionesc");
      String pronostico=""+request.getParameter("pronostico");
      String actitud_psicologia=""+request.getParameter("actitud_psicologia");

      String ecp=""+request.getParameter("estado_civilo_psico");
      String ori=""+request.getParameter("orientacion_psico");
      String actitudtext=""+request.getParameter("actitudtext");
      /*
      String evo=""+request.getParameter("evolucion_problem");
      String hif=""+request.getParameter("historia_familiar");
      String hip=""+request.getParameter("historia_personal");
      String ppr=""+request.getParameter("personalidad_premorvida");
      String exm=""+request.getParameter("examen_mental");
      String pro=""+request.getParameter("pronostico2");
      String prt=""+request.getParameter("postulacion_trat2");
      
      String ecp=""+request.getParameter("estado_civilo_psico");
      String ori=""+request.getParameter("orientacion_psico");*/
              
       if(mot != null && mot.compareTo("")!=0){mot=mot.replace("'","").replace("\"","");}
       if(desusupadienfer != null && desusupadienfer.compareTo("")!=0){desusupadienfer=desusupadienfer.replace("'","").replace("\"","");}
       if(historia_familiar != null && historia_familiar.compareTo("")!=0){historia_familiar=historia_familiar.replace("'","").replace("\"","");}
       if(aspectos_psico_enf != null && aspectos_psico_enf.compareTo("")!=0){aspectos_psico_enf=aspectos_psico_enf.replace("'","").replace("\"","");}
       if(porte_actidud != null && porte_actidud.compareTo("")!=0){porte_actidud=porte_actidud.replace("'","").replace("\"","");}
       if(conciencia != null && conciencia.compareTo("")!=0){conciencia=conciencia.replace("'","").replace("\"","");}
       if(humor_afectividad != null && humor_afectividad.compareTo("")!=0){humor_afectividad=humor_afectividad.replace("'","").replace("\"","");}
       if(caracteristicas_lenguaje != null && caracteristicas_lenguaje.compareTo("")!=0){caracteristicas_lenguaje=caracteristicas_lenguaje.replace("'","").replace("\"","");}
       if(senso_percepcion != null && senso_percepcion.compareTo("")!=0){senso_percepcion=senso_percepcion.replace("'","").replace("\"","");}
       if(pensamiento != null && pensamiento.compareTo("")!=0){pensamiento=pensamiento.replace("'","").replace("\"","");}
       if(alteracion_ritmos != null && alteracion_ritmos.compareTo("")!=0){alteracion_ritmos=alteracion_ritmos.replace("'","").replace("\"","");}
       if(juicio != null && juicio.compareTo("")!=0){juicio=juicio.replace("'","").replace("\"","");}
       if(memoria != null && memoria.compareTo("")!=0){memoria=memoria.replace("'","").replace("\"","");}
       if(atencion != null && atencion.compareTo("")!=0){atencion=atencion.replace("'","").replace("\"","");}
       if(psicomotricidad != null && psicomotricidad.compareTo("")!=0){psicomotricidad=psicomotricidad.replace("'","").replace("\"","");}
       if(postulacion_trat != null && postulacion_trat.compareTo("")!=0){postulacion_trat=postulacion_trat.replace("'","").replace("\"","");}
       if(observacionesc != null && observacionesc.compareTo("")!=0){observacionesc=observacionesc.replace("'","").replace("\"","");}
       if(pronostico != null && pronostico.compareTo("")!=0){pronostico=pronostico.replace("'","").replace("\"","");}
       if(actitud_psicologia != null && actitud_psicologia.compareTo("")!=0){actitud_psicologia=actitud_psicologia.replace("'","").replace("\"","");}
       if(actitudtext != null && actitudtext.compareTo("")!=0){actitudtext=actitudtext.replace("'","").replace("\"","");}


       if(ecp != null && ecp.compareTo("")!=0){ecp=ecp.replace("'","").replace("\"","");}
       if(ori != null && ori.compareTo("")!=0){ori=ori.replace("'","").replace("\"","");}
  /*
       if(evo != null && evo.compareTo("")!=0){evo=evo.replace("'","").replace("\"","");}
       if(hif != null && hif.compareTo("")!=0){hif=hif.replace("'","").replace("\"","");}
       if(hip != null && hip.compareTo("")!=0){hip=hip.replace("'","").replace("\"","");}
       if(ppr != null && ppr.compareTo("")!=0){ppr=ppr.replace("'","").replace("\"","");}
       if(exm != null && exm.compareTo("")!=0){exm=exm.replace("'","").replace("\"","");}
       if(pro != null && pro.compareTo("")!=0){pro=pro.replace("'","").replace("\"","");}
       if(prt != null && prt.compareTo("")!=0){prt=prt.replace("'","").replace("\"","");}
       if(ecp != null && ecp.compareTo("")!=0){ecp=ecp.replace("'","").replace("\"","");}
       if(ori != null && ori.compareTo("")!=0){ori=ori.replace("'","").replace("\"","");}*/
      
              
      //String sql="UPDATE `ips_isalud`.`consulta_psico` SET `mot_consulta`='"+mot+"', `evo_problema`='"+evo+"', `histi_fam_soci`='"+hif+"', `historia_personal`='"+hip+"', `perso_premorvida`='"+ppr+"', `examen_mental`='"+exm+"', `pronostico`='"+pro+"', `postu_trata`='"+prt+"', `fecha`=now(),`id_profecional`='"+session.getAttribute("id")+"',`facturado`='0', `id_tipo`=2, `guardado`=3 WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';"; 
      String sql="UPDATE `consulta_psico` SET `actitudtext`='"+actitudtext+"',`actitud_psicologia`='"+actitud_psicologia+"',`pronostico`='"+pronostico+"',`mot_consulta`='"+mot+"', `desusupadienfer`='"+desusupadienfer+"', `historia_familiar`='"+historia_familiar+"', `aspectos_psico_enf`='"+aspectos_psico_enf+"', `porte_actidud`='"+porte_actidud+"', `conciencia`='"+conciencia+"', `humor_afectividad`='"+humor_afectividad+"', `caracteristicas_lenguaje`='"+caracteristicas_lenguaje+"', `senso_percepcion`='"+senso_percepcion+"', `pensamiento`='"+pensamiento+"', `alteracion_ritmos`='"+alteracion_ritmos+"', `juicio`='"+juicio+"', `memoria`='"+memoria+"', `atencion`='"+atencion+"', `psicomotricidad`='"+psicomotricidad+"', `postulacion_trat`='"+postulacion_trat+"', `observacionesc`='"+observacionesc+"', `fecha`=now(),`id_profecional`='"+session.getAttribute("id")+"',`facturado`='0', `id_tipo`=2, `guardado`=3 WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';"; 
      System.out.println("sql ==> "+sql);   
      
      
      
      if(ba.transaccion(sql)){out.print("<input type='hidden' id='guarda_cons_ppsico' name='guarda_cons_ppsico' value='1'>");}
           else{out.print("<input type='hidden' id='guarda_cons_ppsico' name='guarda_cons_ppsico' value='0'>");}

      
      String sql2="UPDATE `pacientes` SET `cod_estado_civil`='"+ecp+"', `id_orientacion`='"+ori+"' WHERE `serial_persona`='"+session.getAttribute("serial_pacinete")+"';";
      
      if(ba.transaccion(sql2)){out.print("<input type='hidden' id='guarda_cons_ppsico2' name='guarda_cons_ppsico2' value='1'>");}
           else{out.print("<input type='hidden' id='guarda_cons_ppsico2' name='guarda_cons_ppsico2' value='0'>");}

      
       ba.transaccion("UPDATE `agenda` SET `id_estado`=3 WHERE `id_agenda`='"+session.getAttribute("serial_agenda")+"';");      
     
       ba.cerrar();
     %>
      
    </body>
</html>
