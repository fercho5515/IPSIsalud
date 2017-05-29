<%-- 
    Document   : borra_remision
    Created on : 14/05/2013, 01:29:19 AM
    Author     : EMMANUEL
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><br><br><br><br>
    <center> 
        <input type="image" size="25" id="fo" src="../imagenes/fotos/cargando.gif" alt="cargando"  onerror="this.src='../imagenes/fotos/cargando.gif'" style="padding-top: 100px">
    </center>
        <%
       
         request.setCharacterEncoding("UTF-8"); 
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null || session.getAttribute("serial_consulta")==null ){}
         else{
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
               
                ba.transaccion("SET SQL_SAFE_UPDATES=0;");
                ba.transaccion("delete from alertas where cod_consult_crea='"+session.getAttribute("serial_consulta")+"' and id_permiso='"+session.getAttribute("permiso")+"';");
                ba.transaccion("delete from recomendacion where cod_consulta_crea='"+session.getAttribute("serial_consulta")+"' and permiso_med_recom='"+session.getAttribute("permiso")+"';");
                ba.transaccion("UPDATE `ips_isalud`.`recomendacion` SET `leida`=0, `id_quien_leyo`=null, `fecha_lee`=null, `cod_consulta_lee`=null WHERE `cod_consulta_lee`='"+session.getAttribute("serial_consulta")+"' and id_para_quien='"+session.getAttribute("permiso")+"';");
                ba.transaccion("UPDATE `ips_isalud`.`alertas` SET `id_empleado_lee`=null, `fecha_lee`=null, `cod_consult_lee`=null, `leido`=0 WHERE `cod_consult_lee`='"+session.getAttribute("serial_consulta")+"' and (id_permiso='1' or id_permiso='2' or id_permiso='3');");
                
                //
                ba.transaccion("DELETE FROM `ips_isalud`.`remision_espe` WHERE `id_consulat`='"+session.getAttribute("serial_consulta")+"';");
                               
                ba.transaccion("UPDATE `ips_isalud`.`imgs_sol` SET `leido`=0 WHERE `serial` in (select id_sol_ima from resu_img where id_consulta='"+session.getAttribute("serial_consulta")+"');");
                ba.transaccion("DELETE FROM `ips_isalud`.`resu_img` WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';");
                
                
                ba.transaccion("UPDATE `ips_isalud`.`labs_sol` SET `leido`=0 WHERE `serial` in (select id_sol_lab from resu_laboratorios where id_consulta='"+session.getAttribute("serial_consulta")+"');");
                ba.transaccion("DELETE FROM `ips_isalud`.`resu_laboratorios` WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';");
                
                ba.transaccion("DELETE FROM `ips_isalud`.`antecedentes_familiares` WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"' and `id_permiso`='"+session.getAttribute("permiso")+"';");
                           
                ba.transaccion("DELETE FROM `ips_isalud`.`antecedentes_personales` WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"' and `id_permiso`='"+session.getAttribute("permiso")+"';");
               
                ba.transaccion("SET SQL_SAFE_UPDATES=0;");
                ba.transaccion("DELETE FROM `ips_isalud`.`ex_cefalocaudal` WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';");
                ////////////////            
                ba.transaccion("DELETE FROM `ips_isalud`.`ante_obstreticos` WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';");
                //tambien falta cefalo caudal
              //  System.out.println("DELETE FROM `ips_isalud`.`ante_obstreticos` WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';");
                
                ba.transaccion("DELETE FROM `ips_isalud`.`impre_diagno` WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';");
                
                ba.transaccion("DELETE FROM `ips_isalud`.`imgs_sol` WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';");
            
                ba.transaccion("DELETE FROM `ips_isalud`.`labs_sol` WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';");
                
                ba.transaccion("DELETE FROM `ips_isalud`.`soli_no_post` WHERE `cod_consulta`='"+session.getAttribute("serial_consulta")+"';");
           
                ba.transaccion("DELETE FROM `ips_isalud`.`controles_gestacion` WHERE `cod_consulta`='"+session.getAttribute("serial_consulta")+"';");
                
                
                
                ba.transaccion("delete from formula_medica where id_consulta='"+session.getAttribute("serial_consulta")+"';");
                ba.transaccion("UPDATE `ips_isalud`.`soli_no_post` SET `re_solicitada`='0', `id_consu_resol`=null WHERE `id_consu_resol`='"+session.getAttribute("serial_consulta")+"';");
                
                
                ba.transaccion("SET SQL_SAFE_UPDATES=1;");
                //falta borrar formulas
                String co="select id_rh,id_ori_sex,vih,id_embarazo,id_estado_civil from datos_ori_consult where id_consult='"+session.getAttribute("serial_consulta")+"'";
                String id_rh="";String id_ori_sex="";String vih="";String id_embarazo="";String id_estado_civil="";
                 ResultSet resuu2=ba.consultas(co);
                        try{
                            while (resuu2.next()&&resuu2!=null) {   
                               id_rh=resuu2.getString(1);    
                               id_ori_sex=resuu2.getString(2);
                               vih=resuu2.getString(3);
                               id_embarazo=resuu2.getString(4);
                               id_estado_civil=resuu2.getString(5);                                                                                                                                               
                            }
                        }
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cierraResultado(resuu2);
                ba.transaccion("UPDATE `ips_isalud`.`consulta_medica` SET `anamnesis`=' ', `enf_actual`=' ', `revision_por_sistemas`=' ', `tension_alta`=null , `tension_baja`=null , `f_cardiaca`=null , `f_respiratoria`=null , `temperatura`=null, `peso`=null, `talla`=null, `conducta_recomen`=' ', `paraclinicos`=' ', `subjetivo`=' ', `plan`=' ' WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';");
                ba.transaccion("UPDATE `ips_isalud`.`personas` SET `id_rh`='"+id_rh+"' WHERE `serial`='"+session.getAttribute("serial_pacinete")+"';");
                ba.transaccion("UPDATE `ips_isalud`.`pacientes` SET `cod_estado_civil`='"+id_estado_civil+"', `embarazo_activo`='"+id_embarazo+"', `id_orientacion`='"+id_ori_sex+"', `vih`='"+vih+"' WHERE `serial_persona`='"+session.getAttribute("serial_pacinete")+"';");               
               
                if(id_embarazo.compareTo("0")==0){
                  String cons="select serial from materno_perinatal where idembarazo = (select serial from embarazo where cod_consulta_i = '"+session.getAttribute("serial_consulta")+"')";
                  String id_maternoperi="";
                  ResultSet resuu2c=ba.consultas(cons);
                        try{
                            while (resuu2c.next()&&resuu2c!=null) {   
                               id_maternoperi=resuu2c.getString(1); 
                                    ba.cierraResultado(resuu2c);
                                    ba.transaccion("DELETE FROM `ips_isalud`.`controles_gestacion` WHERE `id_gestacion_actual`=(select serial from gestacion_actual where materno_perinatal='"+id_maternoperi+"');");               
                                    ba.transaccion("DELETE FROM `ips_isalud`.`gestacion_actual` WHERE `materno_perinatal`='"+id_maternoperi+"';");               
                                    ba.transaccion("DELETE FROM `ips_isalud`.`puerperio` WHERE `id_materno_perinatal`='"+id_maternoperi+"';"); 
                                    ba.transaccion("DELETE FROM `ips_isalud`.`recien_nacido` WHERE `materno_perinatal`='"+id_maternoperi+"';"); 
                                    ba.transaccion("DELETE FROM `ips_isalud`.`enfermedades` WHERE `materno_perinatal`='"+id_maternoperi+"';"); 
                                    ba.transaccion("DELETE FROM `ips_isalud`.`parto_aborto` WHERE `id_materno_perinatal`='"+id_maternoperi+"';"); 
                                    ba.transaccion("DELETE FROM `ips_isalud`.`gestacion_actual` WHERE `materno_perinatal`='"+id_maternoperi+"';"); 
                                    ba.transaccion("DELETE FROM `ips_isalud`.`obstetrico` WHERE `materno_perinatal`='"+id_maternoperi+"';"); 
                                    ba.transaccion("DELETE FROM `ips_isalud`.`antecedentes_perinatal` WHERE `serial_meterno_perinatal`='"+id_maternoperi+"';"); 
                                    ba.transaccion("DELETE FROM `ips_isalud`.`egreso_rn` WHERE `id_materno_perinatal`='"+id_maternoperi+"';");
                                    ba.transaccion("DELETE FROM `ips_isalud`.`egreso_materno` WHERE `id_materno_perinatal`='"+id_maternoperi+"';");
                                    ba.transaccion("DELETE FROM `ips_isalud`.`materno_perinatal` WHERE `serial`='"+id_maternoperi+"';"); 
                                    ba.transaccion("DELETE FROM `ips_isalud`.`gestacion_actual` WHERE `materno_perinatal`='"+id_maternoperi+"';");                   
                                    ba.transaccion("UPDATE `ips_isalud`.`historia_clinica` SET `cod_embarazo`=null WHERE `serial_peciente`='"+session.getAttribute("serial_pacinete")+"';");    
                                    ba.transaccion("DELETE FROM `ips_isalud`.`embarazo` WHERE `cod_consulta_i`='"+session.getAttribute("serial_consulta")+"'");    
                              }
                        }
                        catch(SQLException e){}
                        catch(Exception ex){}
                     }
                else{
                    String conss="select serial from embarazo where cod_consulta_f='"+session.getAttribute("serial_consulta")+"')";
                    String id_emba="";
                    ResultSet resuu2cs=ba.consultas(conss);
                           try{
                               while (resuu2cs.next()&&resuu2cs!=null) {   
                                  id_emba=resuu2cs.getString(1); 
                                  ba.transaccion("UPDATE `ips_isalud`.`embarazo` SET `fecha_fin`='null', `cod_consulta_f`=null WHERE `serial`='"+id_emba+"';");                                                                                                                                                                                  
                                  ba.transaccion("UPDATE `ips_isalud`.`historia_clinica` SET `cod_embarazo`="+id_emba+" WHERE `serial_peciente`='"+session.getAttribute("serial_pacinete")+"';");
                               }
                           }
                    catch(SQLException e){}
                    catch(Exception ex){}                        
                    ba.cierraResultado(resuu2cs);
                                        }
                ba.cerrar();           

               }
        %>
       <script language="JavaScript" type="text/javascript">

var pagina="../agenda_consulta.jsp"
function redireccionar() 
{
location.href=pagina
} 
setTimeout ("redireccionar()", 1000);

</script>
             
    </body>
</html>

