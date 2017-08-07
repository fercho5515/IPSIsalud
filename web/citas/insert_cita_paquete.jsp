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
            //String val = "ok";
            
            String resp="{\"resp\":\"Esta es la respuesta\"}";
//            out.print(resp);
            
            HttpSession sesion = request.getSession();
            conecta_bd ba = new conecta_bd();
            ba.ConectaDb();
             
            //Date dNow = new Date();
            //SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
            //String fecha = ft.format(dNow);
            
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaInicial=null;
            String fecha= request.getParameter("fecha_paquete");
            
            try {fechaInicial= formato.parse(fecha);} 
            catch(ParseException ex){} 
            Calendar fechaR = Calendar.getInstance();
	     //Se asigna la fecha recibida a la fechar.
             fechaR.setTime(fechaInicial);     
            
            int mes,anio,dia = 0;
            mes = fechaR.get(Calendar.MONTH);
            anio = fechaR.get(Calendar.YEAR);
            dia= fechaR.get(Calendar.DATE);
            System.out.print("mes: "+mes+"año: "+anio+"dia: "+dia+":-");
            
            int id_paciente = Integer.parseInt(request.getParameter("id_pac_paquete"));
            System.out.print(id_paciente);
            int id_tarifario = Integer.parseInt(request.getParameter("id_tarifario_paquete"));
            System.out.print(id_tarifario);
            int proced = Integer.parseInt(request.getParameter("proced_paquete"));
            System.out.print(proced);
            int cont = Integer.parseInt(request.getParameter("cont_paquete"));
            System.out.print(cont);
            int paque = Integer.parseInt(request.getParameter("paque_paquete"));
            System.out.print("paquete: "+paque);
            // mes = fechaInicial.get(Calendar.YEAR);
            String cupv = request.getParameter("cupv_paquete");
            int idmedic=Integer.parseInt(request.getParameter("idmedic_paquete"));
            
            //-----------Obtener id paciente
            String sql_paciente = "select serial from personas where id_person='" + id_paciente + "';";
//                out.print(sql_paciente);
                String paciente[] = new String[1];
                paciente[0] = "";
                int serial_pac = 0;
                ResultSet resu_paciente = ba.consultas(sql_paciente);
                try {
                    while (resu_paciente.next() && resu_paciente != null) {
                        if (resu_paciente.getString(1) != null) {
                            paciente[0] = resu_paciente.getString(1);
                            serial_pac = Integer.parseInt(paciente[0]);
//                            out.print(".."+serial_pac);
                        }
                    }
                } catch (SQLException e) {
                } catch (Exception ex) {
                }

            //-----------Fin obtener id paciente
            
            //-----------Obtener id_permiso
            String sql_permiso = "SELECT id_permi FROM permisos where cup1='"+cupv+"' or cup2='"+cupv+"';";
//                out.print(sql_permiso);
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
            
            //-----------Fin obtener id_permiso
            
            
            
            if(paque==0){
                
            }            
            
            //-----------Verificar dia y servicio
            int dia_s = 0;
            if(serial_pac!=0){
                String sql_dia_servicio = "select count(*) from agenda where month(fecha)='"+mes+"' and year(fecha)='"+anio+"' and id_procedimiento='"+proced+"' and id_paciente='"+serial_pac+"';";
//                out.print(sql_dia_servicio);
                String dia_servicio[] = new String[1];
                dia_servicio[0] = "";
                ResultSet resu_dia_servicio = ba.consultas(sql_dia_servicio);
                        try {
                            while (resu_dia_servicio.next() && resu_dia_servicio != null) {
                                if (resu_dia_servicio.getString(1) != null) {
                                    dia_servicio[0] = resu_dia_servicio.getString(1);
                                    dia_s=Integer.parseInt(dia_servicio[0]);
                                }
                            }
                        } catch (SQLException e) {
                        } catch (Exception ex) {
                        }
            }
            //-----------Fin obtener id paciente
            if(dia_s==0){
            }
            int medico_ag=0;
            String sql_ag_medico="SELECT count(*) FROM agenda where fecha='"+fecha+"' and hora='"+request.getParameter("horacita")+"' and min='"+request.getParameter("minutocita")+"' and am_pm='" + request.getParameter("ampmcitas") + "' and id_medico='"+idmedic+"'";
            String medico_agenda[] = new String[1];
                medico_agenda[0] = "";
                ResultSet resu_medico = ba.consultas(sql_ag_medico);
                        try {
                            while (resu_medico.next() && resu_medico != null) {
                                if (resu_medico.getString(1) != null) {
                                    medico_agenda[0] = resu_medico.getString(1);
                                    medico_ag=Integer.parseInt(medico_agenda[0]);
                                }
                            }
                        } catch (SQLException e) {
                        } catch (Exception ex) {
                        }
            if(medico_ag!=0){
                obj.put("res", "3");
                obj.put("msj", "Medico tiene cita agendada"); 
            } else{
                    
            int paciente_ag=0;
            String sql_ag_paciente="SELECT count(*) FROM agenda where fecha='"+fecha+"' and hora='"+request.getParameter("horacita")+"' and min='"+request.getParameter("minutocita")+"' and am_pm='" + request.getParameter("ampmcitas") + "' and id_paciente='"+serial_pac+"'";
            String paciente_agenda[] = new String[1];
                paciente_agenda[0] = "";
                ResultSet resu_paciente_ag = ba.consultas(sql_ag_paciente);
                        try {
                            while (resu_paciente_ag.next() && resu_paciente_ag != null) {
                                if (resu_paciente_ag.getString(1) != null) {
                                    paciente_agenda[0] = resu_paciente_ag.getString(1);
                                    paciente_ag=Integer.parseInt(paciente_agenda[0]);
                                }
                            }
                        } catch (SQLException e) {
                        } catch (Exception ex) {
                        }
            if(paciente_ag!=0){
                obj.put("res", "4");
                obj.put("msj", "Paciente tiene cita agendada"); 
            }else {
            String sql = "INSERT INTO `ips_isalud`.`agenda`(id_quien_programo,id_paciente,id_medico,hora,min,am_pm,fecha,id_permiso,id_contrato,id_estado,id_tarifario,id_procedimiento,id_paquete) VALUES ('" + sesion.getAttribute("id") + "','"+ serial_pac +"','" +idmedic+ "','" + request.getParameter("horacita") + "','" + request.getParameter("minutocita") + "','" + request.getParameter("ampmcitas") + "','"+fecha+"','"+serial_per+"','" + request.getParameter("cont_paquete") + "','1','"+request.getParameter("id_tarifario_paquete")+"','"+request.getParameter("proced_paquete")+"','"+request.getParameter("paque_paquete")+"');";
                    System.out.print(sql);
                    if (ba.transaccion(sql)) {
                        obj.put("res", "1");
                        obj.put("msj", "Cita agendada exitosamente"); 
                    } else {
                        obj.put("res", "2");
                        obj.put("msj", "No se ha podido insertar la cita");
//                        out.println("<h2>No se ha podido insertar la cita, puede que el paciente ya tenga una cita asignada, o que el Profesional tenga cita en este horario<h2>");
                        //System.out.println(request.getParameter("cod"));
                    }
                }
            }
            out.print(obj);
            ba.cerrar();
            out.close();
        %>
