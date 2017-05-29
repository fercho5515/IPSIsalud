<%-- 
    Document   : carga_medicamentos
    Created on : 24/07/2013, 04:52:29 PM
    Author     : EMMANUEL
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
                                                
                                                
                                                if(campo.compareTo("d0")==0){campo="m.via_adimin";}
                                                else if(campo.compareTo("d1")==0){campo="forma_farmaceutica";}
                                                else if(campo.compareTo("d2")==0){campo="concat(m.cantidad,' ',m.unidad_medida)";}
                                                
                                                  /// miro la opcion que pucieron para crear la restriccion
                                                       if(ope.compareTo("eq")==0){ where=where+" "+campo+" = '"+dato+"'";} // igual
                                                  else if(ope.compareTo("ne")==0){ where=where+" "+campo+" != '"+dato+"'"; }  // '<>' diferente                                                
                                                  else if(ope.compareTo("lt")==0){ where=where+" "+campo+" < '"+dato+"'"; }   // menor que
                                                  else if(ope.compareTo("le")==0){ where=where+" "+campo+" <= '"+dato+"'"; }  // menor igula
                                                  else if(ope.compareTo("gt")==0){ where=where+" "+campo+" > '"+dato+"'"; }   // mayor que
                                                  else if(ope.compareTo("ge")==0){ where=where+" "+campo+" >= '"+dato+"'"; }  // mayor igual
                                                  else if(ope.compareTo("bw")==0){ where=where+" "+campo+" like '%"+dato+"%'"; }  // comienza con
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
                            
                            String sqcontrato="";
                            String sqcontrato2="";
                            try{int idcon = Integer.parseInt(""+session.getAttribute("id_contrato"));
                                if(idcon>0){
                                   sqcontrato =" and mc.cod_contra='"+idcon+"' ";
                                   sqcontrato2=" and id_contrato='"+idcon+"' ";
                                }
                               }
                            catch(Exception exce){}
                            
                            strQuery = "select  m.serial from medicamentos m where (plan_beneficios=1 or m.serial in (SELECT medi1 FROM ips_isalud.autorizacion_no_pos where idpaciente_apro="+session.getAttribute("serial_pacinete")+" and fecha_inicio<=curdate() and fecha_fin>=curdate()) or m.serial in (SELECT cod_med FROM ips_isalud.medica_cont mc,ips_isalud.contratacion c,ips_isalud.afiliados_cont afc where  mc.cod_contra=c.id_contratacion and c.id_contratacion=afc.id_cont and afc.activo=1 and c.f_inicio<=curdate() and c.f_fin>=curdate() and afc.serial_paciente="+session.getAttribute("serial_pacinete")+" "+sqcontrato+" ) or m.serial in (SELECT cod_med FROM paquete_int pi,afiliados_pac_int ap,med_paq_int mp,contratacion cn where pi.id_paquete_int=ap.id_pac_int and pi.id_paquete_int=mp.cod_paq_int and cn.id_contratacion=pi.id_contratacion and cn.f_inicio<=curdate() and cn.f_fin>=curdate() "+sqcontrato2+" and serial_paciente='"+session.getAttribute("serial_pacinete")+"') ) "+where+"  group by m.producto,m.atc,m.cum,m.cum,via_adimin,forma_farmaceutica,concat(m.cantidad,' ',m.unidad_medida)  ";
        //System.out.println("total antes ");
                             total = conexiondb.countRec("*","("+strQuery+") as tabla");
                        // System.out.println("total => "+total);
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

                            strQuery = "select  m.serial,m.producto,m.atc as cod_atc,m.cum as cod_dos,m.cum as cod_tres,m.via_adimin as via_ad, forma_farmaceutica as forma_f,concat(m.cantidad,' ',m.unidad_medida) as unioon  from medicamentos m where (plan_beneficios=1 or m.serial in (SELECT medi1 FROM ips_isalud.autorizacion_no_pos where idpaciente_apro="+session.getAttribute("serial_pacinete")+" and fecha_inicio<=curdate() and fecha_fin>=curdate()) or m.serial in (SELECT cod_med FROM ips_isalud.medica_cont mc,ips_isalud.contratacion c,ips_isalud.afiliados_cont afc where  mc.cod_contra=c.id_contratacion and c.id_contratacion=afc.id_cont and afc.activo=1 and c.f_inicio<=curdate() and c.f_fin>=curdate() and afc.serial_paciente="+session.getAttribute("serial_pacinete")+" "+sqcontrato+" ) or m.serial in (SELECT cod_med FROM paquete_int pi,afiliados_pac_int ap,med_paq_int mp,contratacion cn where pi.id_paquete_int=ap.id_pac_int and pi.id_paquete_int=mp.cod_paq_int and cn.id_contratacion=pi.id_contratacion and cn.f_inicio<=curdate() and cn.f_fin>=curdate() "+sqcontrato2+" and serial_paciente='"+session.getAttribute("serial_pacinete")+"') ) "+where+"  group by m.producto,cod_atc,cod_dos,cod_tres,via_ad,forma_f,unioon  ORDER BY "+sidx + " " +sord +" LIMIT "+start+" , "+limit;
      // System.out.println("datico |"+session.getAttribute("serial_pacinete")+"|");
               // System.out.println(strQuery);           
                            rs = conexiondb.Consulta(strQuery);

                            
                           // total = conexiondb.countRec("DISTINCT m.serial", " medicamentos m,forma_farmaceutica f,via_admin v,unidad_medida u where m.forma_farmaceutica=f.id_forma_farmaceutica and m.via_administracion=v.id_via_admin and m.unidad_medida=u.id_unidad_medida and (plan_beneficios=1 or m.serial in (SELECT medi1 FROM ips_isalud.autorizacion_no_pos where idpaciente_apro="+session.getAttribute("serial_pacinete")+" and fecha_inicio<=curdate() and fecha_fin>=curdate()) or m.serial in (SELECT cod_med FROM ips_isalud.medica_cont mc,ips_isalud.contratacion c,ips_isalud.afiliados_cont afc where  mc.cod_contra=c.id_contratacion and c.id_contratacion=afc.id_cont and afc.activo=1 and c.f_inicio<=curdate() and c.f_fin>=curdate() and afc.serial_paciente="+session.getAttribute("serial_pacinete")+" "+sqcontrato+" ) or m.serial in (SELECT cod_med FROM paquete_int pi,afiliados_pac_int ap,med_paq_int mp,contratacion cn where pi.id_paquete_int=ap.id_pac_int and pi.id_paquete_int=mp.cod_paq_int and cn.id_contratacion=pi.id_contratacion and cn.f_inicio<=curdate() and cn.f_fin>=curdate() "+sqcontrato2+" and serial_paciente='"+session.getAttribute("serial_pacinete")+"') ) "+where+"");
                             
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
                          
                            int num=1;
                            try{  //System.out.println("total => 1 ");
                                while(rs.next()){//System.out.println("total => 2 ");

                                    if(rc){
                                        json = json + ",";
                                    }
                                    String coddos="";
                                    if(rs.getString("cod_dos")!=null && rs.getString("cod_dos").compareTo("null")!=0){coddos=rs.getString("cod_dos");}
                                    String codtres="";
                                    if(rs.getString("cod_tres")!=null && rs.getString("cod_tres").compareTo("null")!=0){codtres=rs.getString("cod_tres");}
                                    String uni=rs.getString("unioon");
                                    uni=uni.replaceFirst(".000","");

                                    json = json + "\n{";
                                    json = json + "\"id\":\""+rs.getInt("serial")+"\",";
                                    json = json + "\"cell\":["+rs.getInt("serial")+""; 
                                    json = json + ",\""+rs.getString("cod_atc")+"\"";  
                                    json = json + ",\""+coddos+"\"";  
                                    json = json + ",\""+codtres+"\"";
                                    json = json + ",\""+rs.getString("producto")+"\"";  
                                    json = json + ",\""+rs.getString("via_ad")+"\"";  
                                    json = json + ",\""+rs.getString("forma_f")+"\"";  
                                    json = json + ",\""+uni+"\"]";
                                    json = json + "}";

                                    rc=true;
                                    num++;
                                }
                            
                            }
                            catch(Exception e){}
                           
                            
                            
                            json = json +"]\n";

                            json = json +"}";

                            out.print(json);
                            out.close();

conexiondb.Close();
        %>