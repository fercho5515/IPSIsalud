<%@page import="org.json.simple.JSONObject"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <% 
            response.setContentType("text/x-json");
            response.setCharacterEncoding("utf-8");
            request.setCharacterEncoding("UTF-8");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            JSONObject obj=new JSONObject();  
        
           if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null ){
             obj.put("res","0");obj.put("msj","Sesion Expiro");
           }
         else{
               
              String opera=""+request.getParameter("oper");
                // System.out.println("hjg  =>"+opera);
                 if(opera.compareTo("add")==0){ 
                    try{  
                        conecta_bd ba = new conecta_bd();
                        ba.ConectaDb(); 
                        String sql="INSERT INTO `ips_isalud`.`signos_desnu`(`descripcion`) VALUES ('"+request.getParameter( "descripcion" )+"');";
                      // out.print(sql);
                        if(ba.transaccion(sql)){obj.put("res","1");obj.put("msj","Insertado exitosamente"); /* response.setStatus(200, "Insertado exitosamente"); */}
                        else{obj.put("res","2"); obj.put("msj","Error dato duplicado");/* response.setStatus(404, "error dato dplicado");*/}
                        ba.cerrar();
                        }
                    catch(Exception e){/*response.setStatus(400, "error");*/obj.put("res","0");}       
                 }  
            else if(opera.compareTo("edit")==0){                           
                        String sql="UPDATE `ips_isalud`.`signos_desnu` SET `descripcion`='"+request.getParameter("descripcion")+"' WHERE `id_signos`='"+request.getParameter("id")+"';";
                        //System.out.print(sql);
                        conecta_bd ba = new conecta_bd();
                        ba.ConectaDb();
                        if(ba.transaccion(sql)){obj.put("res","1");obj.put("msj","Editado exitosamente");/* response.setStatus(200, "Editado exitosamente");*/}
                        else{obj.put("res","2");obj.put("msj","Error al editar");/* response.setStatus(404, "error");*/}
                        ba.cerrar();
                                     }
             else if(opera.compareTo("del")==0){
             
                        String sql="DELETE FROM `ips_isalud`.`signos_desnu` WHERE `id_signos`='"+request.getParameter("id")+"';"; 
                   //out.println(sql); 
                        conecta_bd ba = new conecta_bd();
                        ba.ConectaDb();
                        if(ba.transaccion(sql)){ obj.put("res","1");obj.put("msj","Borrado Exitosamente");/*response.setStatus(200, "Borrado exitosamente");*/}
                        else{obj.put("res","2");obj.put("msj","Error al borrar, datos relacionados");/* response.setStatus(404, "error");*/}
                        ba.cerrar();                     

                                }
                 
        out.print(obj);
        out.close(); 
              } 
        %>