<%-- 
    Document   : actua_soli_no_post
    Created on : 10/07/2013, 06:46:55 PM
    Author     : EMMANUEL
--%>


<%@page import="pac.conecta_bd"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
       
         request.setCharacterEncoding("UTF-8"); 
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){}
         else{
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb();
                    String diag_solo_no_pos="null";
                    String resu_enf_actual="null";
                    String dos_frec_dur_trat_1="null";
                    String dos_frec_dur_trat_2="null";
                    String nom_generic_1="null";
                    String nom_generic_2="null";
                    String present_y_concent_1="null";
                    String present_y_concent_2="null";
                    String n_omgeneric_1="null";
                    String n_posologia_1="null";
                    String n_presentac_1="null";
                    String n_dosis_dia_1="null";
                    String nn_cantidad_1="null";
                    String n_tiemp_mes_1="null";
                    String n_re_invima_1="null";
                    String n_omgeneric_2="null";
                    String n_posologia_2="null";
                    String n_presentac_2="null";
                    String n_dosis_dia_2="null";
                    String nn_cantidad_2="null";
                    String n_tiemp_mes_2="null";
                    String n_re_invima_2="null";
                    String n_omgeneric_3="null";
                    String n_posologia_3="null";
                    String n_presentac_3="null";
                    String n_dosis_dia_3="null";
                    String nn_cantidad_3="null";
                    String n_tiemp_mes_3="null";
                    String n_re_invima_3="null";
                    String t1_soli_no_pos="null";
                    String t2_soli_no_pos="null";
                    String t3_soli_no_pos="null";
                    String t4_soli_no_pos="null";
                    String t5_soli_no_pos="null";
                    String t6_soli_no_pos="null";
                    String efecto_deseado="null";
                    String efectos_secundarios="null";
                    String tiempo_respuesta="null";


                                                                                                 
              
                
                if(request.getParameter("diag_solo_no_pos")!=null && request.getParameter("diag_solo_no_pos").compareTo("null")!=0){diag_solo_no_pos="'"+request.getParameter("diag_solo_no_pos").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("resu_enf_actual")!=null && request.getParameter("resu_enf_actual").compareTo("null")!=0){resu_enf_actual="'"+request.getParameter("resu_enf_actual").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("dos_frec_dur_trat_1")!=null && request.getParameter("dos_frec_dur_trat_1").compareTo("null")!=0){dos_frec_dur_trat_1="'"+request.getParameter("dos_frec_dur_trat_1").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("dos_frec_dur_trat_2")!=null && request.getParameter("dos_frec_dur_trat_2").compareTo("null")!=0){dos_frec_dur_trat_2="'"+request.getParameter("dos_frec_dur_trat_2").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("nom_generic_1")!=null && request.getParameter("nom_generic_1").compareTo("null")!=0){nom_generic_1="'"+request.getParameter("nom_generic_1").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("nom_generic_2")!=null && request.getParameter("nom_generic_2").compareTo("null")!=0){nom_generic_2="'"+request.getParameter("nom_generic_2").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("present_y_concent_1")!=null && request.getParameter("present_y_concent_1").compareTo("null")!=0){present_y_concent_1="'"+request.getParameter("present_y_concent_1").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("present_y_concent_2")!=null && request.getParameter("present_y_concent_2").compareTo("null")!=0){present_y_concent_2="'"+request.getParameter("present_y_concent_2").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_omgeneric_1")!=null && request.getParameter("n_omgeneric_1").compareTo("null")!=0){n_omgeneric_1="'"+request.getParameter("n_omgeneric_1").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_posologia_1")!=null && request.getParameter("n_posologia_1").compareTo("null")!=0){n_posologia_1="'"+request.getParameter("n_posologia_1").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_presentac_1")!=null && request.getParameter("n_presentac_1").compareTo("null")!=0){n_presentac_1="'"+request.getParameter("n_presentac_1").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_dosis_dia_1")!=null && request.getParameter("n_dosis_dia_1").compareTo("null")!=0){n_dosis_dia_1="'"+request.getParameter("n_dosis_dia_1").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("nn_cantidad_1")!=null && request.getParameter("nn_cantidad_1").compareTo("null")!=0){nn_cantidad_1="'"+request.getParameter("nn_cantidad_1").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_tiemp_mes_1")!=null && request.getParameter("n_tiemp_mes_1").compareTo("null")!=0){n_tiemp_mes_1="'"+request.getParameter("n_tiemp_mes_1").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_re_invima_1")!=null && request.getParameter("n_re_invima_1").compareTo("null")!=0){n_re_invima_1="'"+request.getParameter("n_re_invima_1").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_omgeneric_2")!=null && request.getParameter("n_omgeneric_2").compareTo("null")!=0){n_omgeneric_2="'"+request.getParameter("n_omgeneric_2").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_posologia_2")!=null && request.getParameter("n_posologia_2").compareTo("null")!=0){n_posologia_2="'"+request.getParameter("n_posologia_2").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_presentac_2")!=null && request.getParameter("n_presentac_2").compareTo("null")!=0){n_presentac_2="'"+request.getParameter("n_presentac_2").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_dosis_dia_2")!=null && request.getParameter("n_dosis_dia_2").compareTo("null")!=0){n_dosis_dia_2="'"+request.getParameter("n_dosis_dia_2").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("nn_cantidad_2")!=null && request.getParameter("nn_cantidad_2").compareTo("null")!=0){nn_cantidad_2="'"+request.getParameter("nn_cantidad_2").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_tiemp_mes_2")!=null && request.getParameter("n_tiemp_mes_2").compareTo("null")!=0){n_tiemp_mes_2="'"+request.getParameter("n_tiemp_mes_2").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_re_invima_2")!=null && request.getParameter("n_re_invima_2").compareTo("null")!=0){n_re_invima_2="'"+request.getParameter("n_re_invima_2").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_omgeneric_3")!=null && request.getParameter("n_omgeneric_3").compareTo("null")!=0){n_omgeneric_3="'"+request.getParameter("n_omgeneric_3").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_posologia_3")!=null && request.getParameter("n_posologia_3").compareTo("null")!=0){n_posologia_3="'"+request.getParameter("n_posologia_3").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_presentac_3")!=null && request.getParameter("n_presentac_3").compareTo("null")!=0){n_presentac_3="'"+request.getParameter("n_presentac_3").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_dosis_dia_3")!=null && request.getParameter("n_dosis_dia_3").compareTo("null")!=0){n_dosis_dia_3="'"+request.getParameter("n_dosis_dia_3").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("nn_cantidad_3")!=null && request.getParameter("nn_cantidad_3").compareTo("null")!=0){nn_cantidad_3="'"+request.getParameter("nn_cantidad_3").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_tiemp_mes_3")!=null && request.getParameter("n_tiemp_mes_3").compareTo("null")!=0){n_tiemp_mes_3="'"+request.getParameter("n_tiemp_mes_3").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("n_re_invima_3")!=null && request.getParameter("n_re_invima_3").compareTo("null")!=0){n_re_invima_3="'"+request.getParameter("n_re_invima_3").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("1_soli_no_pos")!=null && request.getParameter("1_soli_no_pos").compareTo("null")!=0){t1_soli_no_pos="'"+request.getParameter("1_soli_no_pos").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("2_soli_no_pos")!=null && request.getParameter("2_soli_no_pos").compareTo("null")!=0){t2_soli_no_pos="'"+request.getParameter("2_soli_no_pos").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("3_soli_no_pos")!=null && request.getParameter("3_soli_no_pos").compareTo("null")!=0){t3_soli_no_pos="'"+request.getParameter("3_soli_no_pos").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("4_soli_no_pos")!=null && request.getParameter("4_soli_no_pos").compareTo("null")!=0){t4_soli_no_pos="'"+request.getParameter("4_soli_no_pos").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("5_soli_no_pos")!=null && request.getParameter("5_soli_no_pos").compareTo("null")!=0){t5_soli_no_pos="'"+request.getParameter("5_soli_no_pos").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("6_soli_no_pos")!=null && request.getParameter("6_soli_no_pos").compareTo("null")!=0){t6_soli_no_pos="'"+request.getParameter("6_soli_no_pos").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("efecto_deseado")!=null && request.getParameter("efecto_deseado").compareTo("null")!=0){efecto_deseado="'"+request.getParameter("efecto_deseado").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("efectos_secundarios")!=null && request.getParameter("efectos_secundarios").compareTo("null")!=0){efectos_secundarios="'"+request.getParameter("efectos_secundarios").replace("'","").replace("\"","")+"'";}
                if(request.getParameter("tiempo_respuesta")!=null && request.getParameter("tiempo_respuesta").compareTo("null")!=0){tiempo_respuesta="'"+request.getParameter("tiempo_respuesta").replace("'","").replace("\"","")+"'";}
              
                    
                String sql="UPDATE `ips_isalud`.`soli_no_post` SET `diagnostico`="+diag_solo_no_pos+", `resu_enf_act`="+resu_enf_actual+", `nom_generico_uno`="+nom_generic_1+", `presen_concen_uno`="+present_y_concent_1+", `dosis_fecuencia_uno`="+dos_frec_dur_trat_1+", `nom_generico_dos`="+nom_generic_2+", `presen_concen_dos`="+present_y_concent_2+", `dosis_fecuencia_dos`="+dos_frec_dur_trat_2+", `uno`="+t1_soli_no_pos+", `dos`="+t2_soli_no_pos+", `tres`="+t3_soli_no_pos+", `cuatro`="+t4_soli_no_pos+", `cinco`="+t5_soli_no_pos+", `seis`="+t6_soli_no_pos+", `efecto_trata`="+efecto_deseado+", `efecto_secu`="+efectos_secundarios+", `tiempo_resp_espe`="+tiempo_respuesta+", `especialidad`=null, `nom_generc_uno`="+n_omgeneric_1+", `posologia_uno`="+n_posologia_1+", `presentacion_uno`="+n_presentac_1+", `dosis_uno`="+n_dosis_dia_1+", `cantidad_uno`="+nn_cantidad_1+", `tiempo_uno`="+n_tiemp_mes_1+", `reg_invima_uno`="+n_re_invima_1+", `nom_generc_dos`="+n_omgeneric_2+", `posologia_dos`="+n_posologia_2+", `presentacion_dos`="+n_presentac_2+", `dosis_dos`="+n_dosis_dia_2+", `cantidad_dos`="+nn_cantidad_2+", `tiempo_dos`="+n_tiemp_mes_2+", `reg_invima_dos`="+n_re_invima_2+", `nom_generc_tres`="+n_omgeneric_3+", `posologia_tres`="+n_posologia_3+", `presentacion_tres`="+n_presentac_3+", `dosis_tres`="+n_dosis_dia_3+", `cantidad_tres`="+nn_cantidad_3+", `tiempo_tres`="+n_tiemp_mes_3+", `reg_invima_tres`="+n_re_invima_3+" WHERE `cod_consulta`='"+session.getAttribute("serial_consulta")+"';";
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
// + "INSERT INTO `ips_isalud`.`remision_espe` (`id_consulat`, `anamnesis`, `ex_fisico`, `cod_diag`, `presuntivo`, `observaciones`, `id_especialidad`) VALUES ('"+session.getAttribute("serial_consulta")+"', '"+aname+"', '"+exame_fisi+"', '"+cod_diag+"', '"+presun+"', '"+observa+"','"+id_espe+"');";
            
                if(ba.transaccion(sql)){out.print(" <input type='hidden' id='result_form2_nopos' name='result_form2_nopos' value='1'>");}
                else{out.print(" <input type='hidden' id='result_form2_nopos' name='result_form2_nopos' value='0'>");}
                ba.cerrar();           

               }
        %>
       
    </body>
</html>
