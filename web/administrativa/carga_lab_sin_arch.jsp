<%-- 
    Document   : carga_lab_sin_arch
    Created on : 16/08/2013, 07:53:01 PM
    Author     : Emmanuel
--%>
<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<%@page import="java.sql.*" %>
<%@page import="pac.conexion" %>


  <%               request.setCharacterEncoding("UTF-8");
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
                                                
                                                if(campo.compareTo("p1")==0){campo="concat(p1.p_nom,' ',p1.s_nom,' ',p1.p_ape,' ',p1.s_ape)";}
                                           else if(campo.compareTo("p2")==0){campo="concat(p2.p_nom,' ',p2.s_nom,' ',p2.p_ape,' ',p2.s_ape)";} 
                                           else if(campo.compareTo("id1")==0){campo="p1.id_person";} 
                                           else if(campo.compareTo("desr")==0){campo="cu.descripcion";} 
                                           else if(campo.compareTo("fecha")==0){campo="date(i.fecha_soli)";} 
                                              
                                                  /// miro la opcion que pucieron para crear la restriccion
                                                       if(ope.compareTo("eq")==0){ where=where+" "+campo+" = '"+dato+"'";} // igual
                                                  else if(ope.compareTo("ne")==0){ where=where+" "+campo+" != '"+dato+"'"; }  // '<>' diferente                                                
                                                  else if(ope.compareTo("lt")==0){ where=where+" "+campo+" < '"+dato+"'"; }   // menor que
                                                  else if(ope.compareTo("le")==0){ where=where+" "+campo+" <= '"+dato+"'"; }  // menor igula
                                                  else if(ope.compareTo("gt")==0){ where=where+" "+campo+" > '"+dato+"'"; }   // mayor que
                                                  else if(ope.compareTo("ge")==0){ where=where+" "+campo+" >= '"+dato+"'"; }  // mayor igual
                                                  else if(ope.compareTo("bw")==0){dato =dato.replace(" ","%");   where=where+" "+campo+" like '"+dato+"%'"; }  // comienza con
                                                  else if(ope.compareTo("bn")==0){dato =dato.replace(" ","%");   where=where+" "+campo+" not like '"+dato+"%'";} //  no comienza por
                                                  else if(ope.compareTo("in")==0){dato =dato.replace(" ","%");   where=where+" "+campo+" like '%"+dato+"%'";} //se encuentra en
                                                  else if(ope.compareTo("ni")==0){dato =dato.replace(" ","%");   where=where+" "+campo+" not like '%"+dato+"%'";} //no esta en 
                                                  else if(ope.compareTo("ew")==0){dato =dato.replace(" ","%");   where=where+" "+campo+" like '%"+dato+"'";}   // termina con
                                                  else if(ope.compareTo("en")==0){dato =dato.replace(" ","%");   where=where+" "+campo+" not like '%"+dato+"'";} //no termina con
                                                  else if(ope.compareTo("cn")==0){dato =dato.replace(" ","%");   where=where+" "+campo+" like '%"+dato+"%'";} // contiene
                                                  else if(ope.compareTo("nc")==0){dato =dato.replace(" ","%");   where=where+" "+campo+" not like '%"+dato+"%'";} //no contiene

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

                             total = conexiondb.countRec("i.serial", "labs_sol i,consulta_medica c,personas p1,personas p2,cups cu where i.id_consulta=c.id_consulta and c.serial_historia=p1.serial and c.id_medico=p2.serial and i.id_lab=cu.id_cups "+where+"");
                            
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

                            strQuery = "select i.serial,date(i.fecha_soli) as fecha,concat(p1.p_nom,' ',p1.s_nom,' ',p1.p_ape,' ',p1.s_ape) as paciente, p1.id_person as cedpaciente,concat(p2.p_nom,' ',p2.s_nom,' ',p2.p_ape,' ',p2.s_ape) as empleado, p2.id_person as cedemple,cu.descripcion,i.archi_lab from labs_sol i,consulta_medica c,personas p1,personas p2,cups cu where i.id_consulta=c.id_consulta and c.serial_historia=p1.serial and c.id_medico=p2.serial and i.id_lab=cu.id_cups "+where+" ORDER BY "+sidx + " " +sord +" LIMIT "+start+" , "+limit;
    //   System.out.println(strQuery);
                            
                            rs = conexiondb.Consulta(strQuery);

                          //  total = conexiondb.countRec("i.serial", "labs_sol i,consulta_medica c,personas p1,personas p2,cups cu where i.id_consulta=c.id_consulta and c.serial_historia=p1.serial and c.id_medico=p2.serial and i.id_lab=cu.id_cups "+where+"");
                            
                             
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
                                json = json + "\"id\":\""+rs.getInt("serial")+"\",";
                                json = json + "\"cell\":["+rs.getInt("serial")+"";
                                json = json + ",\""+rs.getString("fecha")+"\"";
                                json = json + ",\""+rs.getString("paciente")+"\"";
                                json = json + ",\""+rs.getString("cedpaciente")+"\"";
                                json = json + ",\""+rs.getString("empleado")+"\"";
                                json = json + ",\""+rs.getString("descripcion")+"\"";
                                json = json + ",\""+rs.getString("archi_lab")+"\"]";
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

        %>