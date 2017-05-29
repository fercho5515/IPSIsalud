<%-- 
    Document   : resolicita_soli_no_pos
    Created on : 15/11/2013, 10:50:14 AM
    Author     : servidor
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

                    String id_soli_ant="null";
                                               
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
              
                if(request.getParameter("soli_no_pos_origi")!=null && request.getParameter("soli_no_pos_origi").compareTo("null")!=0){id_soli_ant="'"+request.getParameter("soli_no_pos_origi").replace("'","").replace("\"","")+"'";}
                    
                    
                    
                String sql0="INSERT INTO `ips_isalud`.`soli_no_post` (`cod_consulta`, `diagnostico`, `resu_enf_act`, `nom_generico_uno`, `presen_concen_uno`, `dosis_fecuencia_uno`, `nom_generico_dos`, `presen_concen_dos`, `dosis_fecuencia_dos`, `uno`, `dos`, `tres`, `cuatro`, `cinco`, `seis`, `efecto_trata`, `efecto_secu`, `tiempo_resp_espe`, `especialidad`, `nom_generc_uno`, `posologia_uno`, `presentacion_uno`, `dosis_uno`, `cantidad_uno`, `tiempo_uno`, `reg_invima_uno`, `nom_generc_dos`, `posologia_dos`, `presentacion_dos`, `dosis_dos`, `cantidad_dos`, `tiempo_dos`, `reg_invima_dos`, `nom_generc_tres`, `posologia_tres`, `presentacion_tres`, `dosis_tres`, `cantidad_tres`, `tiempo_tres`, `reg_invima_tres`,`re_solicitada`,`id_ant`) VALUES ('"+session.getAttribute("serial_consulta")+"',"+diag_solo_no_pos+","+resu_enf_actual+","+nom_generic_1+","+present_y_concent_1+","+dos_frec_dur_trat_1+","+nom_generic_2+","+present_y_concent_2+","+dos_frec_dur_trat_2+","+t1_soli_no_pos+","+t2_soli_no_pos+","+t3_soli_no_pos+","+t4_soli_no_pos+","+t5_soli_no_pos+","+t6_soli_no_pos+","+efecto_deseado+","+efectos_secundarios+","+tiempo_respuesta+",null,"+n_omgeneric_1+","+n_posologia_1+","+n_presentac_1+","+n_dosis_dia_1+","+nn_cantidad_1+","+n_tiemp_mes_1+","+n_re_invima_1+", "+n_omgeneric_2+","+n_posologia_2+","+n_presentac_2+","+n_dosis_dia_2+","+nn_cantidad_2+","+n_tiemp_mes_2+","+n_re_invima_2+", "+n_omgeneric_3+","+n_posologia_3+","+n_presentac_3+","+n_dosis_dia_3+","+nn_cantidad_3+","+n_tiemp_mes_3+","+n_re_invima_3+",'1',"+id_soli_ant+");";
                if(ba.transaccion(sql0)){out.print(" <input type='hidden' id='result_form_nopos3' name='result_form_nopos3' value='1'>");}
                else{out.print(" <input type='hidden' id='result_form_nopos3' name='result_form_nopos3' value='0'>");}
                System.out.println(sql0);   
               //////////////////////////////////////
               //////////////////////////////////////
                                   
                String sql="UPDATE `ips_isalud`.`soli_no_post` SET `re_solicitada`='1',`id_consu_resol`='"+session.getAttribute("serial_consulta")+"' WHERE `id_soli_no_post`="+id_soli_ant+";";
              //   System.out.println(sql);               
                if(ba.transaccion(sql)){}
                ba.cerrar();           

               }
        %>
       
    </body>
</html>
