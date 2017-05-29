
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
            //String val = "ok";
            
            String resp="{\"resp\":\"Esta es la respuesta\"}";
            out.print(resp);
            
            HttpSession sesion = request.getSession();
            conecta_bd ba = new conecta_bd();
            ba.ConectaDb();
             
            //Date dNow = new Date();
            //SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
            //String fecha = ft.format(dNow);
            
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaInicial=null;
            String fecha= request.getParameter("fecha");
            
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
            
            int id_paciente = Integer.parseInt(request.getParameter("id_pac"));
            System.out.print(id_paciente);
            int id_tarifario = Integer.parseInt(request.getParameter("id_tarifario"));
            System.out.print(id_tarifario);
            int proced = Integer.parseInt(request.getParameter("proced"));
            System.out.print(proced);
            int cont = Integer.parseInt(request.getParameter("cont"));
            System.out.print(cont);
            int paque = Integer.parseInt(request.getParameter("paque"));
            System.out.print("paquete: "+paque);
            // mes = fechaInicial.get(Calendar.YEAR);
            String cupv = request.getParameter("cupv");
            
            //-----------Obtener id paciente
            String sql_paciente = "select serial from personas where id_person='" + id_paciente + "';";
                out.print(sql_paciente);
                String paciente[] = new String[1];
                paciente[0] = "";
                int serial_pac = 0;
                ResultSet resu_paciente = ba.consultas(sql_paciente);
                try {
                    while (resu_paciente.next() && resu_paciente != null) {
                        if (resu_paciente.getString(1) != null) {
                            paciente[0] = resu_paciente.getString(1);
                            serial_pac = Integer.parseInt(paciente[0]);
                            out.print(".."+serial_pac);
                        }
                    }
                } catch (SQLException e) {
                } catch (Exception ex) {
                }

            //-----------Fin obtener id paciente
            
            //-----------Obtener id_permiso
            String sql_permiso = "SELECT id_permi FROM permisos where cup1='"+cupv+"' or cup2='"+cupv+"';";
                out.print(sql_permiso);
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
                out.print(sql_dia_servicio);
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
            String sql = "INSERT INTO `ips_isalud`.`agenda`(id_quien_programo,id_paciente,id_medico,hora,min,am_pm,fecha,id_permiso,id_contrato,id_estado,id_tarifario,id_procedimiento) VALUES ('" + sesion.getAttribute("id") + "','"+ serial_pac +"','" +sesion.getAttribute("id")+ "','" + request.getParameter("horacita") + "','" + request.getParameter("minutocita") + "','" + request.getParameter("ampmcitas") + "','"+fecha+"','"+serial_per+"','" + request.getParameter("cont") + "','1','"+request.getParameter("id_tarifario")+"','"+request.getParameter("proced")+"');";
                    out.print(sql);
                    if (ba.transaccion(sql)) {
                        out.println("<h2>Insertado Exitosamente</h2>");
                    } else {
                        out.println("<h2>No se ha podido insertar la cita, puede que el paciente ya tenga una cita asignada, o que el Profesional tenga cita en este horario<h2>");
                        //System.out.println(request.getParameter("cod"));
                    }
                    ba.cerrar();

            out.close();
        %>
