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

    conecta_bd ba = new conecta_bd();
    ba.ConectaDb();

    //-----------Obtener id paciente en a variable serial_paciente
    String sql_paciente = "select serial from personas where id_person='" + id_paciente + "';";
    //out.print(sql_paciente);
    String paciente[] = new String[1];
    paciente[0] = "";
    int serial_paciente = 0;
    ResultSet resu_paciente = ba.consultas(sql_paciente);
    try {
        while (resu_paciente.next() && resu_paciente != null) {
            if (resu_paciente.getString(1) != null) {
                paciente[0] = resu_paciente.getString(1);
                serial_paciente = Integer.parseInt(paciente[0]);
                obj.put("id_serial", serial_paciente);
            }else{obj.put("id_serial", "0");}
        }
    } catch (SQLException e) {
    } catch (Exception ex) {
    }
    //-----------Fin obtener id paciente

    //-----------Obtener permiso en variable serial_per
    String sql_permiso = "SELECT id_permi FROM permisos where cup1='" + cupv + "' or cup2='" + cupv + "';";
    //System.out.print(sql_permiso);
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

    //-----------Obtener id_procedimientos en variables proced1 y proced2
    String sql_procedimientos = "select idprocedimientos_tari from procedimientos_tari, cups, permisos where procedimientos_tari.cod_cups=cups.id_cups and (cups.cup_verdadero=permisos.cup1 or cups.cup_verdadero=permisos.cup2) and (cup1='" + cupv + "' or cup2='" + cupv + "');";
    //out.print(sql_procedimientos);
    String procedimientos[] = new String[2];
    procedimientos[0] = "";
    procedimientos[1] = "";
    int proced1 = 0;
    int proced2 = 0;
    ResultSet resu_procedimientos = ba.consultas(sql_procedimientos);

    try {
        resu_procedimientos = ba.consultas(sql_procedimientos);
    } catch (Exception e) {
    }
    try {
        int control = 0;
        while (resu_procedimientos.next() && resu_procedimientos != null) {
            if (control == 0) {
                procedimientos[0] = resu_procedimientos.getString(1);
                proced1 = Integer.parseInt(procedimientos[0]);
                control++;
            } else {
                procedimientos[1] = resu_procedimientos.getString(1);
                proced2 = Integer.parseInt(procedimientos[1]);
                //out.print("..."+proced2+"--"+proced1);
            }
        } 
    } catch (SQLException e) {
    } catch (Exception ex) {
    }
    //-----------Fin Obtener permiso
    
    int dia_s = 0;
    int tiene_paquete = 0;
    int bandera_proc_paq=0;
    int cita_asiganada=0;
    int cita_cont = 0;
    int veces_paquete = 0;
    
    
    //************************  VALIDACIONES PARA DAR LA CITA *******************
    id_paquete=0;
    if (serial_paciente != 0) {
        if (id_paquete == 0) {//si viene por contrato
             if(tiene_paquete==0){//***********si no tiene paquete
                //***********Verifico si ya tiene una cita asiganada,cumplida o en espera
                String sql_agenda = "select id_agenda from agenda where id_paciente='"+serial_paciente+"' and id_contrato='"+id_contrato+"' and (id_estado=1 or id_estado=3 or id_estado=2) and id_permiso= '"+serial_per+"'and month(fecha)='" + mes + "' and year(fecha)='" + anio + "';";
                System.out.print("agenda:"+sql_agenda);
                String id_agenda[] = new String[1];
                id_agenda[0] = "";
                ResultSet resu_id_agenda = ba.consultas(sql_agenda);
                try {
                    while (resu_id_agenda.next() && resu_id_agenda != null) {
                        if (resu_id_agenda.getString(1) != null) {
                            id_agenda[0] = resu_id_agenda.getString(1);
                            cita_asiganada = Integer.parseInt(id_agenda[0]);
                        }
                    }
                } catch (SQLException e) {
                } catch (Exception ex) {
                }
                if(cita_asiganada!=0){
                    obj.put("res", "1");
                    obj.put("msj", "Ya tiene una cita asignada en esta area"); 
                }else if(cita_asiganada==0){
                    obj.put("res", "2");
                    obj.put("msj", "Aun no hay cita asiganada para esta area");
                }
            }
        } else if (id_paquete != 0) {//si viene por paquete
            //**********************Verifico si tiene cita*************
            obj.put("res", "3");
            obj.put("msj", "No se ha verificado"); 
            
        }
    } else {
    }

    //String data = "{\"id_serial\" : " + serial_paciente + ",\"num\" :" + dia_s + "}";
    out.print(obj);

    ba.cerrar();
    out.close();
%>
