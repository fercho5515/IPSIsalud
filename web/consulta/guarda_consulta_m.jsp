<%-- 
    Document   : guarda_consulta_m
    Created on : 22/08/2013, 06:53:19 PM
    Author     : Emmanuel
--%>
<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     <% request.setCharacterEncoding("UTF-8");
        //  out.print("nom "+session.getAttribute("nombre")+" clave "+session.getAttribute("clave")+" id "+session.getAttribute("id")+" permiso "+session.getAttribute("permiso")+" s agenda "+session.getAttribute("serial_agenda" )+" s paciente"+session.getAttribute("serial_pacinete"));
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null || session.getAttribute("serial_consulta")==null ){
      
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
      <% 
              out.println("</body></html>");
              return;
            } 
      String c1="select count(*) from impre_diagno where id_consulta='"+session.getAttribute("serial_consulta")+"'";
      String c2="select anamnesis,enf_actual,revision_por_sistemas,tension_alta,tension_baja,f_cardiaca,f_respiratoria,temperatura,peso,talla,conducta_recomen,paraclinicos,subjetivo,plan from consulta_medica where id_consulta='"+session.getAttribute("serial_consulta")+"'";
     // System.out.println("guarda_consulta_m: "+c2);
      int permiso=Integer.parseInt(""+session.getAttribute("permiso")+"");
      
      conecta_bd ba = new conecta_bd();
      ba.ConectaDb();
      int cant_d=0;   
      ResultSet resu=null;
      try{  resu=ba.consultas(c1);
                  while (resu.next()&&resu!=null) {  
                    cant_d=Integer.parseInt(resu.getString(1));
                       }
               }                       
      catch(SQLException ex){}
      catch(Exception exe){}
      ba.cierraResultado(resu);
            
      String anamnesis="";
      String enf_actual="";
      String revision_por_sistemas="";
      String tension_alta="";
      String tension_baja="";
      String f_cardiaca="";
      String f_respiratoria="";
      String temperatura="";
      String peso="";
      String talla="";
      String conducta_recomen="";
      String paraclinicos="";
      String subjetivo="";
      String plan="";
      
      ResultSet resu2=null;
      try{  resu2=ba.consultas(c2);//System.out.print("ent");  
                  while (resu2.next()&&resu2!=null) { // System.out.print("entro");                        
                      if(resu2.getString(1)!=null){ anamnesis=resu2.getString(1);
                                                    anamnesis=anamnesis.trim();}
                                                   
                      if(resu2.getString(2)!=null){ enf_actual=resu2.getString(2);
                                                    enf_actual=enf_actual.trim();}
                                                    
                      if(resu2.getString(3)!=null){ revision_por_sistemas=resu2.getString(3);
                                                    revision_por_sistemas=revision_por_sistemas.trim();}
                                                    
                      if(resu2.getString(4)!=null){ tension_alta=resu2.getString(4);
                                                    tension_alta=tension_alta.trim();}
                                                    
                      if(resu2.getString(5)!=null){ tension_baja=resu2.getString(5);
                                                    tension_baja=tension_baja.trim();}
                                                    
                      if(resu2.getString(6)!=null){ f_cardiaca=resu2.getString(6);
                                                    f_cardiaca=f_cardiaca.trim();}
                                                    
                      if(resu2.getString(7)!=null){ f_respiratoria=resu2.getString(7);
                                                    f_respiratoria=f_respiratoria.trim();}
                                                    
                      if(resu2.getString(8)!=null){ temperatura=resu2.getString(8);
                                                    temperatura=temperatura.trim();}
                                                    
                      if(resu2.getString(9)!=null){ peso=resu2.getString(9);
                                                    peso=peso.trim();}
                                                    
                      if(resu2.getString(10)!=null){talla=resu2.getString(10);
                                                    talla=talla.trim();}
                                                    
                      if(resu2.getString(11)!=null){conducta_recomen=resu2.getString(11);
                                                    conducta_recomen=conducta_recomen.trim();}
                                                    
                      if(resu2.getString(12)!=null){paraclinicos=resu2.getString(12);
                                                    paraclinicos=paraclinicos.trim();}
                                                    
                      if(resu2.getString(13)!=null){subjetivo=resu2.getString(13);
                                                    subjetivo=subjetivo.trim();}
                                                    
                      if(resu2.getString(14)!=null){plan=resu2.getString(14);
                                                    plan=plan.trim();}
                                                    }
         }                       
      catch(SQLException ex){}
      catch(Exception exe){}
      ba.cierraResultado(resu2);
      String mensaje="<br>";
      int acepta=0;
      if(cant_d==0){mensaje=mensaje+"<label>Se debe ingresar al menos un diagnostico</label><br>";acepta=1;}
      if(anamnesis==null || anamnesis.compareTo("null")==0 || anamnesis.compareTo("")==0 ){mensaje=mensaje+"<label>Motivo de consulta es obligatorio </label><br>";acepta=1;}
      if(enf_actual==null || enf_actual.compareTo("null")==0 || enf_actual.compareTo("")==0 ){mensaje=mensaje+"<label>Enfermedad actual es obligatoria </label><br>";acepta=1;}      
      if(revision_por_sistemas==null || revision_por_sistemas.compareTo("null")==0 || revision_por_sistemas.compareTo("")==0 ){mensaje=mensaje+"<label>Revisión por sistemas es obligatoria</label><br>";acepta=1;}
      if(tension_alta==null || tension_alta.compareTo("null")==0 || tension_alta.compareTo("")==0 || tension_baja==null || tension_baja.compareTo("null")==0 || tension_baja.compareTo("")==0 ){mensaje=mensaje+"<label>Tensión Arterial es obligatoria</label><br>";acepta=1;}      
      if(f_cardiaca==null || f_cardiaca.compareTo("null")==0 || f_cardiaca.compareTo("")==0 ){mensaje=mensaje+"<label>Frecuencia cardiaca es obligatoria</label><br>";acepta=1;}      
      if(f_respiratoria==null || f_respiratoria.compareTo("null")==0 || f_respiratoria.compareTo("")==0 ){mensaje=mensaje+"<label>Frecuencia respiratoria es obligatoria</label><br>";acepta=1;}      
      if(temperatura==null || temperatura.compareTo("null")==0 || temperatura.compareTo("")==0 ){mensaje=mensaje+"<label>Temperatura es obligatoria</label><br>";acepta=1;}      
      if(peso==null || peso.compareTo("null")==0 || peso.compareTo("")==0 ){mensaje=mensaje+"<label>Peso es obligatorio</label><br>";acepta=1;}      
      if(talla==null || talla.compareTo("null")==0 || talla.compareTo("")==0 ){mensaje=mensaje+"<label>Talla es obligatoria</label><br>";acepta=1;}      
      if((conducta_recomen==null || conducta_recomen.compareTo("null")==0 || conducta_recomen.compareTo("")==0)&&(permiso==1 || permiso==2) ){mensaje=mensaje+"<label>Aspecto general es obligatorio</label><br>";acepta=1;}      
      if((paraclinicos==null || paraclinicos.compareTo("null")==0 || paraclinicos.compareTo("")==0)&& permiso==3 ){mensaje=mensaje+"<label>Paraclinicos es obligatorio</label><br>";acepta=1;}      
      if((subjetivo==null || subjetivo.compareTo("null")==0 || subjetivo.compareTo("")==0)&& permiso==3 ){mensaje=mensaje+"<label>Subjetivo es obligatorio</label><br>";acepta=1;}
      if((plan==null || plan.compareTo("null")==0 || plan.compareTo("")==0)&& permiso==3 ){mensaje=mensaje+"<label>Plan es obligatorio</label><br>";acepta=1;}
      
      if(acepta==0){
       ba.transaccion("UPDATE `ips_isalud`.`consulta_medica` SET `id_estado_consulta`=3 WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';");
       ba.transaccion("UPDATE `ips_isalud`.`agenda` SET `id_estado`=3 WHERE `id_agenda`='"+session.getAttribute("serial_agenda")+"';");      
      }  
    // System.out.println("UPDATE `ips_isalud`.`agenda` SET `id_estado`=3 WHERE `id_agenda`='"+session.getAttribute("serial_agenda")+"';");
      ba.cerrar(); 
   //   out.print("<div style='padding-left:20px'>"+mensaje+"</div>");
   //   out.print("<input type='hidden' id='acpta_guard_c' name='acpta_guard_c' value='"+acepta+"'>");

   //   out.print("<br><center><input type='button' id='aceptar' name='aceptar' value='aceptar' onclick='cierDialoGCon()'></center>");
       
      response.setContentType("text/x-json");
      response.setCharacterEncoding("utf-8");
      response.setHeader("Pragma", "no-cache");
      response.setHeader("Cache-Control", "no-cache, must-revalidate");
      response.setHeader("Pragma", "no-cache");

      String json = "{\n";
             json = json + " \"estado\":\""+acepta+"\",\n";
             json = json + " \"mensaje\":\""+mensaje+"\"}";
       
      out.print(json);
       
       
       
      %>
      
