
<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<%@page import="java.sql.*" %>
<%@page import="pac.conexion" %>
  <%
                            int start=0;
                            int total=0;
                            int total_pages =0;

                            int intpage = new Integer(request.getParameter("page"));
                            int limit = new Integer(request.getParameter("rows"));
                            int contra = new Integer(request.getParameter("contra"));
                            int ide = new Integer(request.getParameter("ide"));
                            System.out.println("contra==>"+contra);
                            System.out.println("ide==>"+ide);
                            
                            String sidx = request.getParameter("sidx");
                            String sord = request.getParameter("sord");
                            
                            String strQuery="";
                            String json ="";

                             // analiza busqueda
                            int bandera=0;
                            String where=" and (";
                            
                            JSONParser parser = new JSONParser();
                            
                            String busca=""+request.getParameter("_search");
                            if(busca.compareTo("true")==0){
                                        String json0=""+request.getParameter("filters");
                            
                                        try {
                                             Object obj = parser.parse(json0);
                                             
                                             JSONObject jsonObject = (JSONObject) obj;

                                             String and_or = (String) jsonObject.get("groupOp");
                                             // loop array
                                             JSONArray msg = (JSONArray) jsonObject.get("rules");
                                             
                                             for(int i=0;i<Integer.parseInt(""+msg.size());i++){   ///ago un ciclo para todad las restricciones

                                                if(bandera==0){bandera=1;}
                                                else{where=where+" "+and_or;}
                                                 
                                                Object obj2 = parser.parse(""+msg.get(i)+"");
                                                JSONObject jsonObject2 = (JSONObject) obj2;

                                                String campo = (String) jsonObject2.get("field");
                                                String ope = (String) jsonObject2.get("op");
                                                String dato = (String) jsonObject2.get("data");
                                                
                                                  /// miro la opcion que pucieron para crear la restriccion
                                                       if(ope.compareTo("eq")==0){ where=where+" "+campo+" = '"+dato+"'";} // igual
                                                  else if(ope.compareTo("ne")==0){ where=where+" "+campo+" != '"+dato+"'"; }  // '<>' diferente                                                
                                                  else if(ope.compareTo("lt")==0){ where=where+" "+campo+" < '"+dato+"'"; }   // menor que
                                                  else if(ope.compareTo("le")==0){ where=where+" "+campo+" <= '"+dato+"'"; }  // menor igula
                                                  else if(ope.compareTo("gt")==0){ where=where+" "+campo+" > '"+dato+"'"; }   // mayor que
                                                  else if(ope.compareTo("ge")==0){ where=where+" "+campo+" >= '"+dato+"'"; }  // mayor igual
                                                  else if(ope.compareTo("bw")==0){ where=where+" "+campo+" like '"+dato+"%'"; }  // comienza con
                                                  else if(ope.compareTo("bn")==0){ where=where+" "+campo+" not like '"+dato+"%'";} //  no comienza por
                                                  else if(ope.compareTo("in")==0){ where=where+" "+campo+" like '%"+dato+"%'";} //se encuentra en
                                                  else if(ope.compareTo("ni")==0){ where=where+" "+campo+" not like '%"+dato+"%'";} //no esta en 
                                                  else if(ope.compareTo("ew")==0){ where=where+" "+campo+" like '%"+dato+"'";}   // termina con
                                                  else if(ope.compareTo("en")==0){ where=where+" "+campo+" not like '%"+dato+"'";} //no termina con
                                                  else if(ope.compareTo("cn")==0){ where=where+" "+campo+" like '%"+dato+"%'";} // contiene
                                                  else if(ope.compareTo("nc")==0){ where=where+" "+campo+" not like '%"+dato+"%'";} //no contiene

                                                 }where=where+" )";
                                              }
                                          catch (ParseException e) {
                                             e.printStackTrace();
                                         }
                             }else{where="";}
                         //  System.out.println(where);
                            // finaliza busqueda
                            boolean rc;

                            ResultSet rs = null;

                            if(sidx ==""){
                                sidx ="1";
                            }
                            /*-----------------------------------Conexión a la base de datos MySql-------------------------------------------*/
                            conexion  conexiondb = new conexion();
                            conexiondb.Conectar();
                            /*-----------------------------------------------------------------------------------------------------------*/
                            total = conexiondb.countRec("tem.serialp", "(SELECT afiliados_pac_int.serial_paciente as serialp,procedimientos_tari.descripcion as descr,procedimientos_paquete.cod_actividad as proce,0 as tari,afiliados_cont.id_cont as cont, afiliados_pac_int.id_pac_int as paq FROM afiliados_cont,afiliados_pac_int,personas,pacientes,paquete_int ,procedimientos_paquete,procedimientos_tari where personas.id_person=1088798141 and afiliados_pac_int.id_pac_int="+contra+" and afiliados_cont.serial_paciente =afiliados_pac_int.serial_paciente and afiliados_cont.id_cont=afiliados_pac_int.id_contrato and pacientes.serial_persona=afiliados_cont.serial_paciente and personas.serial=pacientes.serial_persona and activo2=1 and afiliados_pac_int.id_pac_int=paquete_int.id_paquete_int and procedimientos_paquete.cod_paq_int=paquete_int.id_paquete_int and ips_isalud.procedimientos_tari.idprocedimientos_tari=procedimientos_paquete.cod_actividad) as tem"+where+"");
                            
                            
                           // total = conexiondb.countRec("ag.id_agenda", "agenda ag,personas pe where ag.id_paciente=pe.serial and pe.id_person=1088798141"+where+"");
                            
                            if( total>0 ) {
                                double d = Math.ceil( (double)(total) / (double)(limit) );
                                total_pages = (int)(d);
                            } else {
                                total_pages = 0;
                            }

                            if (intpage > total_pages) {
                                intpage=total_pages;
                            }
                            
                            start = limit * intpage - limit; 

                            if(start < 0 ){
                                start = 0;
                            }
                          //  strQuery = "SELECT serial_paciente as serialp,procedimientos_tari.descripcion as descr,procedimientos_cont.cod_activ as proce,procedimientos_cont.cod_tarifario as tari,procedimientos_cont.id_contrato as cont FROM afiliados_cont,contratacion,procedimientos_cont,tari_proced,procedimientos_tari,pacientes,personas where afiliados_cont.id_cont=contratacion.id_contratacion and procedimientos_cont.id_contrato=contratacion.id_contratacion and procedimientos_cont.cod_activ=tari_proced.id_proced and procedimientos_cont.cod_tarifario=id_tarifario and procedimientos_tari.idprocedimientos_tari=tari_proced.id_proced and pacientes.serial_persona=afiliados_cont.serial_paciente and personas.serial=pacientes.serial_persona and personas.id_person="+ide+" and afiliados_cont.id_cont="+contra+" and afiliados_cont.activo=1"+where+" ORDER BY "+sidx + " " +sord +" LIMIT "+start+" , "+limit;
                            strQuery = "SELECT afiliados_pac_int.serial_paciente as serialp ,procedimientos_tari.descripcion as descr,procedimientos_paquete.cod_actividad as proce,procedimientos_paquete.cod_tarifario as tari,afiliados_cont.id_cont as cont, afiliados_pac_int.id_pac_int as paq, 'Paquete' as bande,cups.cup_verdadero as cup FROM afiliados_cont,afiliados_pac_int,personas,pacientes,paquete_int ,procedimientos_paquete,procedimientos_tari,cups where personas.id_person="+ide+" and afiliados_pac_int.id_pac_int="+contra+" and afiliados_cont.serial_paciente =afiliados_pac_int.serial_paciente and afiliados_cont.id_cont=afiliados_pac_int.id_contrato and pacientes.serial_persona=afiliados_cont.serial_paciente and personas.serial=pacientes.serial_persona and activo2=1 and afiliados_pac_int.id_pac_int=paquete_int.id_paquete_int and procedimientos_paquete.cod_paq_int=paquete_int.id_paquete_int and ips_isalud.procedimientos_tari.idprocedimientos_tari=procedimientos_paquete.cod_actividad and cups.id_cups=procedimientos_tari.cod_cups"+where+" ORDER BY "+sidx + " " +sord +" LIMIT "+start+" , "+limit;
                            
                            System.out.println(strQuery);
                            rs = conexiondb.Consulta(strQuery);
                            
                            
                           // total = conexiondb.countRec("tem.serialp", "(SELECT serial_paciente as serialp,procedimientos_tari.descripcion as descr,procedimientos_cont.cod_activ as proce,procedimientos_cont.cod_tarifario as tari,procedimientos_cont.id_contrato as cont, 0 as paq FROM afiliados_cont,contratacion,procedimientos_cont,tari_proced,procedimientos_tari,pacientes,personas where afiliados_cont.id_cont=contratacion.id_contratacion and procedimientos_cont.id_contrato=contratacion.id_contratacion and procedimientos_cont.cod_activ=tari_proced.id_proced and procedimientos_cont.cod_tarifario=id_tarifario and procedimientos_tari.idprocedimientos_tari=tari_proced.id_proced and pacientes.serial_persona=afiliados_cont.serial_paciente and personas.serial=pacientes.serial_persona and personas.id_person=1088798141 and afiliados_cont.id_cont="+contra+" and afiliados_cont.activo=1 UNION SELECT afiliados_pac_int.serial_paciente as serialp,procedimientos_tari.descripcion as descr,procedimientos_paquete.cod_actividad as proce,0 as tari,afiliados_cont.id_cont as cont, afiliados_pac_int.id_pac_int as paq FROM afiliados_cont,afiliados_pac_int,personas,pacientes,paquete_int ,procedimientos_paquete,procedimientos_tari where personas.id_person=1088798141 and afiliados_pac_int.id_contrato="+contra+" and afiliados_cont.serial_paciente =afiliados_pac_int.serial_paciente and afiliados_cont.id_cont=afiliados_pac_int.id_contrato and pacientes.serial_persona=afiliados_cont.serial_paciente and personas.serial=pacientes.serial_persona and activo2=1 and afiliados_pac_int.id_pac_int=paquete_int.id_paquete_int and procedimientos_paquete.cod_paq_int=paquete_int.id_paquete_int and ips_isalud.procedimientos_tari.idprocedimientos_tari=procedimientos_paquete.cod_actividad) as tem"+where+"");
                           // System.out.println(total);
                            
                            response.setContentType("text/x-json");
                            response.setCharacterEncoding("utf-8");
                            response.setHeader("Pragma", "no-cache");
                            response.setHeader("Cache-Control", "no-cache, must-revalidate");
                            response.setHeader("Pragma", "no-cache");

                            json ="";
                            json = json + "{\n";
                            json = json + " \"page\":\""+intpage+"\",\n";
                            json = json + "\"total\":"+total_pages+",\n";
                            json = json + "\"records\":"+total+",\n";
                            json = json + "\"rows\": [";
                            rc =false;
                            int conta=0;
                            try{
                            while(rs.next()){
                                if(rc){
                                    json = json + ",";
                                }
                                
                                json = json + "\n{";
                                json = json + "\"id\":\""+conta+"\",";
                                json = json + "\"cell\":["+conta+"";
                                json = json + ",\""+rs.getString("descr")+"\"";
                                json = json + ",\""+rs.getString("proce")+"\"";                                                               
                                json = json + ",\""+rs.getString("tari")+"\"";
                                json = json + ",\""+rs.getString("cont")+"\"";                                                                                              
                                json = json + ",\""+rs.getString("paq")+"\"";                                                                                              
                                json = json + ",\""+rs.getString("cup")+"\"";                                                                                              
                                json = json + ",\""+rs.getString("bande")+"\"]";
                                json = json + "}";
                                rc=true;
                                conta=conta+1;
                            }
                            }
                            catch(Exception e){}
                           
                            json = json +"]\n";

                            json = json +"}";
                            conexiondb.Close();
                            out.print(json);
                            out.close();
                            conexiondb.Close();
                            //session.setAttribute("id_medico",null);
                            //session.setAttribute("fecha_cita",null);
        %>

