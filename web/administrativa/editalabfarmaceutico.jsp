<%-- 
    Document   : editalabfarmaceutico
    Created on : 11/03/2013, 06:13:02 PM
    Author     : EMMANUEL
--%>
<%@page import="java.io.PrintWriter"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


        <% request.setCharacterEncoding("UTF-8");
           if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null ){}
         else{
               
            response.setContentType("text/x-json");
            response.setCharacterEncoding("utf-8");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache, must-revalidate");
            response.setHeader("Pragma", "no-cache");
               
            String opera=(String)request.getParameter("oper");
                // System.out.println("hjg  =>"+opera);
             if(opera.compareTo("edit")==0){                           
                        String sql="UPDATE `ips_isalud`.`lab_farmaceutico` SET `nombre`='"+request.getParameter("nombre")+"', `direccion`='"+request.getParameter("direccion")+"', `telefono`='"+request.getParameter("telefono")+"', `nit`='"+request.getParameter("nit")+"' WHERE `idlab_farmaceutico`='"+request.getParameter("id")+"';";
                        conecta_bd ba = new conecta_bd();
                        ba.ConectaDb();
                        if(ba.transaccion(sql)){ out.print("<label style='color:green'><center>Actualización realizada satisfactoriamente</center></label>");
                                                 out.close();}
                        else{ out.print("<label style='color:red'><center>Falla al realizar actualización</center></label>");
                                                 out.close();}
                        ba.cerrar();
                                     }
             else if(opera.compareTo("del")==0){
             
                        String sql="delete from lab_farmaceutico where idlab_farmaceutico='"+request.getParameter("id")+"';"; 
                        
                        conecta_bd ba = new conecta_bd();
                        ba.ConectaDb();
                        if(ba.transaccion(sql)){ out.print("<label style='color:green'><center>Borrado realizado satisfactoriamente</center></label>");
                                                 out.close();}
                        else{ out.print("<label style='color:red'><center>Falla al realizar borrado</center></label>");
                                                 out.close();}
                        ba.cerrar();                     

                                }
              } 
           /*
           response.setContentType("text/xml");
                response.setCharacterEncoding("UTF-8");

                response.sendError(399, "no funco");  
                 response.setContentType("text/xml");
 String somedata = "whatever";
 out.print("\n<root>");
 out.print("\n   <othertag>" + somedata + "</othertag>");
 out.print("\n</root>");
                */
                
              //  response.setStatus(404, "Error while inserting"); 
                
                
              
             
                           
                          out.print("<label style='color:red'>esta es la respuesta</label>");
                          out.close();
        %>
