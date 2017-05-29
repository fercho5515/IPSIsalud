
<%@page import="org.json.simple.JSONObject"%>
<%@page import="pac.diasMes"%>
<%@page import="java.text.ParseException"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>

<%
    response.setContentType("text/x-json");
    response.setCharacterEncoding("utf-8");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    request.setCharacterEncoding("UTF-8");
    JSONObject obj = new JSONObject();

    int id_paciente = Integer.parseInt(request.getParameter("id_paciente"));
    int id_contrato = Integer.parseInt(request.getParameter("id_contrato"));
    int id_paquete = Integer.parseInt(request.getParameter("id_paquete"));
    int id_procedimiento = Integer.parseInt(request.getParameter("id_procedimiento"));
    int cupv = Integer.parseInt(request.getParameter("cupv"));

    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
    Date fechaCita = null;
    String fecha = request.getParameter("fecha_cita");

    try {
      fechaCita = formato.parse(fecha);
    } catch (ParseException ex) {
    }
    Calendar fechaR = Calendar.getInstance();
    fechaR.setTime(fechaCita);

    int mes, anio, dia = 0;
    
    mes = fechaR.get(Calendar.MONTH) + 1;
    anio = fechaR.get(Calendar.YEAR);
    dia = fechaR.get(Calendar.DATE);

    //HttpSession sesion = request.getSession();
    conecta_bd ba = new conecta_bd();
    ba.ConectaDb();

    //-----------Obtener id paciente
    String sql_paciente = "select serial from personas where id_person='" + id_paciente + "';";
    String paciente[] = new String[1];
    paciente[0] = "";
    int serial_pac = 0;
    ResultSet resu_paciente = ba.consultas(sql_paciente);
    try {
        while (resu_paciente.next() && resu_paciente != null) {
            if (resu_paciente.getString(1) != null) {
                paciente[0] = resu_paciente.getString(1);
                serial_pac = Integer.parseInt(paciente[0]);
            }
        }
    } catch (SQLException e) {
    } catch (Exception ex) {
    }/*
    //-----------Fin obtener id paciente
    
    //-----------Obtener permiso
    String sql_permiso = "SELECT id_permi FROM permisos where cup1='" + cupv + "' or cup2='" + cupv + "';";
    System.out.print(sql_permiso);
    String permiso[] = new String[1];
    permiso[0] = "";
    int serial_per = 0;
    ResultSet resu_permiso = ba.consultas(sql_permiso);
    try {
        while (resu_permiso.next() && resu_permiso != null) {
            if (resu_permiso.getString(1) != null) {
                permiso[0] = resu_permiso.getString(1);
                serial_per = Integer.parseInt(permiso[0]);
            }
        }
    } catch (SQLException e) {
    } catch (Exception ex) {
    }
    //-----------Fin Obtener permiso
    
    //-----------Obtener id_procedimientos
    String sql_procedimientos = "select idprocedimientos_tari from procedimientos_tari, cups, permisos where procedimientos_tari.cod_cups=cups.id_cups and (cups.cup_verdadero=permisos.cup1 or cups.cup_verdadero=permisos.cup2) and (cup1='"+cupv+"' or cup2='"+cupv+"');";
    System.out.print(sql_procedimientos);
    String procedimientos[] = new String[2];
    procedimientos[0] = "";
    procedimientos[1] = "";
    
    ResultSet resu_procedimientos = ba.consultas(sql_procedimientos);
    
    try {
        resu_procedimientos = ba.consultas(sql_procedimientos);
    } catch (Exception e) {
    }
    try {
        int control=0;
        while (resu_procedimientos.next() && resu_procedimientos != null) {
            if (control==0) {
                procedimientos[0] = resu_procedimientos.getString(1);
                control ++;
            }
            else {
                procedimientos[1] = resu_procedimientos.getString(1);
            }
        }
    } catch (SQLException e) {
    } catch (Exception ex) {
    }
    //-----------Fin Obtener permiso   

       
    int dia_s=0;
    int cita_paq=0;
    int cita_cont=0;
    int veces_paquete=0;
        if (serial_pac != 0) {
            if (id_paquete == 0) {//si viene por contrato
                //********************verifico si tiene paquete*******************************
                String sql_paquete = "select afiliados_pac_int.id_pac_int from pacientes, afiliados_pac_int where serial_persona='"+serial_pac+"' and afiliados_pac_int.serial_paciente=pacientes.serial_persona and id_contrato='"+id_contrato+"' and activo2=1;";
                System.out.print(sql_paquete);
                String id_paquete_cont[] = new String[1];
                id_paquete_cont[0] = "";
                ResultSet resu_id_paquete_cont = ba.consultas(sql_paquete);
                try {
                    while (resu_id_paquete_cont.next() && resu_id_paquete_cont != null) {
                        if (resu_id_paquete_cont.getString(1) != null) {
                            id_paquete_cont[0] = resu_id_paquete_cont.getString(1);
                            cita_cont = Integer.parseInt(id_paquete_cont[0]);
                        }
                    }
                } catch (SQLException e) {
                } catch (Exception ex) {
                }
                if(cita_cont!=0){//********Si tiene paquete verifico si ese procedimiento esta en el paquete
                    String sql_paquete_proced = "select afiliados_pac_int.id_pac_int from pacientes, afiliados_pac_int where serial_persona='"+serial_pac+"' and afiliados_pac_int.serial_paciente=pacientes.serial_persona and id_contrato='"+id_contrato+"' and activo2=1;";
                    System.out.print(sql_paquete_proced);
                    String id_paquete_activ[] = new String[1];
                    id_paquete_activ[0] = "";
                    ResultSet resu_id_paquete_activ = ba.consultas(sql_paquete_proced);
                    try {
                        while (resu_id_paquete_activ.next() && resu_id_paquete_activ != null) {
                            if (resu_id_paquete_activ.getString(1) != null) {
                                id_paquete_activ[0] = resu_id_paquete_activ.getString(1);
                                //cita_cont = Integer.parseInt(id_paquete_activ[0]);
                            }
                        }
                    } catch (SQLException e) {
                    } catch (Exception ex) {
                    }
                }
                //*****************************************************
                String sql_dia_servicio = "select count(*) from agenda where month(fecha)='" + mes + "' and year(fecha)='" + anio + "' and (id_procedimiento='" + procedimientos[0] + "' or id_procedimiento='" + procedimientos[1] + "') and id_paciente='" + serial_pac + "' and id_contrato='" + id_contrato + "' and id_estado=1;";
                System.out.print(sql_dia_servicio);
                String dia_servicio[] = new String[1];
                dia_servicio[0] = "";
                ResultSet resu_dia_servicio = ba.consultas(sql_dia_servicio);
                try {
                    while (resu_dia_servicio.next() && resu_dia_servicio != null) {
                        if (resu_dia_servicio.getString(1) != null) {
                            dia_servicio[0] = resu_dia_servicio.getString(1);
                            dia_s = Integer.parseInt(dia_servicio[0]);
                        }
                    }
                } catch (SQLException e) {
                } catch (Exception ex) {
                }
            }else if(id_paquete!=0){//si viene por paquete
                String sql_veces="SELECT tiempo_mesese FROM procedimientos_paquete where (cod_actividad='" + procedimientos[0] + "' or cod_actividad='" + procedimientos[1] + "') and cod_paq_int='"+id_paquete+"';";
                System.out.print(sql_veces);
                String veces[] = new String[1];
                veces[0] = "";
                ResultSet resu_veces = ba.consultas(sql_veces);
                try {
                    while (resu_veces.next() && resu_veces != null) {
                        if (resu_veces.getString(1) != null) {
                            veces[0] = resu_veces.getString(1);
                            veces_paquete = Integer.parseInt(veces[0]);
                            System.out.print("veces:"+veces_paquete);
                        }
                    }
                } catch (SQLException e) {
                } catch (Exception ex) {
                }
            }
        } else {
        }

    String data = "{\"id_serial\" : " + serial_pac + ",\"num\" :" + dia_s + "}";
    
    out.print(data);
*/
   obj.put("res", "6");
   obj.put("msj", "Continuar por contrato"); 
    
    out.print(obj);
    ba.cerrar();
    out.close();
%>
