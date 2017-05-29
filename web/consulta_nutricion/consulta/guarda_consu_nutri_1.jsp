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
            
      //radio
      String aste=request.getParameter("atrofia");
      String rosa=request.getParameter("rosario");
      String prog=request.getParameter("programacomple");
      
      if(aste == null || aste.compareTo("-1")==0 || aste.compareTo("")==0){aste="null";}
      else{aste="'"+aste+"'";}
      
      if(rosa == null || rosa.compareTo("-1")==0 || rosa.compareTo("")==0){rosa="null";}
      else{rosa="'"+rosa+"'";}
      
      if(prog == null || prog.compareTo("-1")==0 || prog.compareTo("")==0){prog="null";}
      else{prog="'"+prog+"'";}
      
       /////////// texto       
      String carc=request.getParameter("caracgenerales");
      String desa=request.getParameter("desayuno"); 
      String ref1=request.getParameter("refrigerio1");
      String almu=request.getParameter("almuerzo"); 
      String ref2=request.getParameter("refrigerio2");
      String comi=request.getParameter("comida"); 
      String comp=request.getParameter("complemento");
      String alfa=request.getParameter("alimnetosfav"); 
      String alre=request.getParameter("alimentosrech");     
      String peso=request.getParameter("pesonutri"); 
      String lon=request.getParameter("tallanutri"); 
      String pcef=request.getParameter("pcefalico");
      String dia1=request.getParameter("diagnosticoconsu_nutri"); 
      String dia2=request.getParameter("diagnosticoconsu_nutri_r1");
      String dia3=request.getParameter("diagnosticoconsu_nutri_r2"); 
      String dia4=request.getParameter("diagnosticoconsu_nutri_r3");
      String reco=request.getParameter("recomendacionesnutri"); 
      String obse=request.getParameter("observacionesnutri");
   
      String cmenu=request.getParameter("comentario_menu2"); 
      String dmenu=request.getParameter("dieta_menu2");        
      //select
      String pgnu=request.getParameter("programasnutri");      
      if(pgnu == null || pgnu.compareTo("-1")==0 || pgnu.compareTo("")==0){pgnu="null";}
      else{pgnu="'"+pgnu+"'";}
     /*
      if(prog == -1 && bandprog==1){
           alert("Seleccione en cual programa de complementación alimentaria participa?"); return false;
      } 
      
      */
       if(carc != null && carc.compareTo("")!=0){carc=carc.replace("'","").replace("\"","");carc="'"+carc+"'";}else{carc="null";}
       if(desa != null && desa.compareTo("")!=0){desa=desa.replace("'","").replace("\"","");desa="'"+desa+"'";}else{desa="null";}
       if(ref1 != null && ref1.compareTo("")!=0){ref1=ref1.replace("'","").replace("\"","");ref1="'"+ref1+"'";}else{ref1="null";}
       if(almu != null && almu.compareTo("")!=0){almu=almu.replace("'","").replace("\"","");almu="'"+almu+"'";}else{almu="null";}
       if(ref2 != null && ref2.compareTo("")!=0){ref2=ref2.replace("'","").replace("\"","");ref2="'"+ref2+"'";}else{ref2="null";}
       if(comi != null && comi.compareTo("")!=0){comi=comi.replace("'","").replace("\"","");comi="'"+comi+"'";}else{comi="null";}
       if(comp != null && comp.compareTo("")!=0){comp=comp.replace("'","").replace("\"","");comp="'"+comp+"'";}else{comp="null";}
       if(alfa != null && alfa.compareTo("")!=0){alfa=alfa.replace("'","").replace("\"","");alfa="'"+alfa+"'";}else{alfa="null";}
       if(alre != null && alre.compareTo("")!=0){alre=alre.replace("'","").replace("\"","");alre="'"+alre+"'";}else{alre="null";}
       if(peso != null && peso.compareTo("")!=0){peso=peso.replace("'","").replace("\"","");peso="'"+peso+"'";}else{peso="null";}
       if(lon != null && lon.compareTo("")!=0){lon=lon.replace("'","").replace("\"","");lon="'"+lon+"'";}else{lon="null";}
       if(pcef != null && pcef.compareTo("")!=0){pcef=pcef.replace("'","").replace("\"","");pcef="'"+pcef+"'";}else{pcef="null";}
       if(dia1 != null && dia1.compareTo("")!=0){dia1=dia1.replace("'","").replace("\"","");dia1="'"+dia1+"'";}else{dia1="null";}
       if(dia2 != null && dia2.compareTo("")!=0){dia2=dia2.replace("'","").replace("\"","");dia2="'"+dia2+"'";}else{dia2="null";}
       if(dia3 != null && dia3.compareTo("")!=0){dia3=dia3.replace("'","").replace("\"","");dia3="'"+dia3+"'";}else{dia3="null";}
       if(dia4 != null && dia4.compareTo("")!=0){dia4=dia4.replace("'","").replace("\"","");dia4="'"+dia4+"'";}else{dia4="null";}
       if(reco != null && reco.compareTo("")!=0){reco=reco.replace("'","").replace("\"","");reco="'"+reco+"'";}else{reco="null";}
       if(obse != null && obse.compareTo("")!=0){obse=obse.replace("'","").replace("\"","");obse="'"+obse+"'";}else{obse="null";}
        
       if(cmenu != null && cmenu.compareTo("")!=0){cmenu=cmenu.replace("'","").replace("\"","");cmenu="'"+cmenu+"'";}else{cmenu="null";}
       if(dmenu != null && dmenu.compareTo("")!=0){dmenu=dmenu.replace("'","").replace("\"","");dmenu="'"+dmenu+"'";}else{dmenu="null";}
      
      String ecp=""+request.getParameter("estado_civilo_nutri");
      String ori=""+request.getParameter("orientacion_nutri");
       
      String sql="UPDATE `ips_isalud`.`consulta_nutri` SET `fecha`=now(), `profecional`='"+session.getAttribute("id")+"', `sist_musc_atro`="+aste+", `esque_rosa_cost`="+rosa+", `caract_gen`="+carc+", `desayuno`="+desa+", `refrigerio1`="+ref1+", `almuerzo`="+almu+", `refrigerio2`="+ref2+", `comida`="+comi+", `complementario`="+comp+", `al_favoritos`="+alfa+", `al_rechazados`="+alre+", `comple_al`="+prog+", `cual`="+pgnu+", `peso`="+peso+", `altura`="+lon+", `pcefalico`="+pcef+", `interpre_peso_ed`="+dia1+", `interpre_tall_ed`="+dia2+", `interpre_peso_talla`="+dia3+", `interpre_imc`="+dia4+", `recomendaciones`="+reco+", `observaciones`="+obse+",  `observaciones_menu`="+cmenu+", `diesta_menu`="+dmenu+",`facturado`=0, `id_permiso`="+session.getAttribute("permiso")+",`guardado`=1  WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';";    
      
      if(ba.transaccion(sql)){out.print("<input type='hidden' id='guarda_cons_nutri' name='guarda_cons_nutri' value='1'>");}
           else{out.print("<input type='hidden' id='guarda_cons_nutri' name='guarda_cons_nutri' value='0'>");}

      
      String sql2="UPDATE `ips_isalud`.`pacientes` SET `cod_estado_civil`='"+ecp+"', `id_orientacion`='"+ori+"' WHERE `serial_persona`='"+session.getAttribute("serial_pacinete")+"';";
      
      if(ba.transaccion(sql2)){out.print("<input type='hidden' id='guarda_cons_nutri2' name='guarda_cons_nutri2' value='1'>");}
                          else{out.print("<input type='hidden' id='guarda_cons_nutri2' name='guarda_cons_nutri2' value='0'>");}

      
       ba.transaccion("UPDATE `ips_isalud`.`agenda` SET `id_estado`=3 WHERE `id_agenda`='"+session.getAttribute("serial_agenda")+"';");      
     
       ba.cerrar();
     %>
      
    </body>
</html>
