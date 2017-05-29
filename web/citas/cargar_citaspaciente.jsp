<%-- 
    Document   : cargar_citaspaciente
    Created on : 18-nov-2014, 16:41:14
    Author     : MiPc
--%>

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
                            int cod = new Integer(request.getParameter("cod"));
                            String dia =  request.getParameter("dia");
                            String año= dia.substring(0,4);
                            String mes= dia.substring(5,7);
//                             System.out.println("fecha="+dia+"año="+año+"mes="+mes);
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
                            total = conexiondb.countRec("ag.id_agenda", "agenda ag,personas pe,pacientes pa, tari_proced tp,procedimientos_tari pt where ag.id_paciente=pe.serial and pa.serial_persona=pe.serial and pe.id_person='"+cod+"' and ag.id_tarifario=tp.id_tarifario and ag.id_procedimiento=tp.id_proced and pt.idprocedimientos_tari=tp.id_proced and "+mes+"=MONTH (ag.fecha) and "+año+"=year(ag.fecha)"+where+"");
                            
                            
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
//                            strQuery = "select id_agenda as ida,id_procedimiento as proc,concat(hora,':',min,' ',am_pm)as horap,procedimientos_tari.descripcion as descr,personas.serial as serial,agenda.fecha as fecha from agenda,personas,tari_proced,procedimientos_tari where agenda.id_paciente=personas.serial and id_estado=1 and personas.id_person="+cod+" and (agenda.id_tarifario=tari_proced.id_tarifario) and agenda.id_procedimiento= tari_proced.id_proced and procedimientos_tari.idprocedimientos_tari = tari_proced.id_proced"+where+" ORDER BY "+sidx + " " +sord +" LIMIT "+start+" , "+limit;
                            strQuery = "select ag.id_agenda as ida, ag.id_procedimiento as proc,concat(ag.hora,':',ag.min,' ',ag.am_pm)as horap,pt.descripcion as descr, pe.serial as serial, ag.fecha as fecha"
                            + " from agenda ag,personas pe,pacientes pa, tari_proced tp,procedimientos_tari pt"
                            + " where ag.id_paciente=pe.serial and pa.serial_persona=pe.serial and pe.id_person='"+cod+"' "
                            + "and ag.id_tarifario=tp.id_tarifario and ag.id_procedimiento=tp.id_proced "
                            + "and pt.idprocedimientos_tari=tp.id_proced and "+mes+"=MONTH (ag.fecha) and "+año+"=year(ag.fecha)";
                           
                            rs = conexiondb.Consulta(strQuery);
                            System.out.println(strQuery);
                            
                         //   total = conexiondb.countRec("agenda.id_agenda", "agenda,personas,tari_proced,procedimientos_tari where agenda.id_paciente=personas.serial and id_estado=1 and personas.id_person="+cod+" and (agenda.id_tarifario=tari_proced.id_tarifario) and agenda.id_procedimiento= tari_proced.id_proced and procedimientos_tari.idprocedimientos_tari = tari_proced.id_proced"+where+"");
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

                            try{
                            while(rs.next()){
                                if(rc){
                                    json = json + ",";
                                }
                                json = json + "\n{";
                                json = json + "\"id\":\""+rs.getInt("ida")+"\",";
                                json = json + "\"cell\":["+rs.getInt("ida")+"";
                                json = json + ",\""+rs.getString("proc")+"\"";
                                json = json + ",\""+rs.getString("descr")+"\"";                                                               
                                json = json + ",\""+rs.getString("horap")+"\"";                                                               
                                json = json + ",\""+rs.getString("fecha")+"\"";                                                               
                                json = json + ",\""+rs.getString("serial")+"\"]";
                                json = json + "}";
                                rc=true;
                            }
                            }
                            catch(Exception e){}
                           
                            json = json +"]\n";

                            json = json +"}";
                            
                            out.print(json);
                            out.close();
                     conexiondb.Close();       
                            //session.setAttribute("id_medico",null);
                            //session.setAttribute("fecha_cita",null);
        %>
