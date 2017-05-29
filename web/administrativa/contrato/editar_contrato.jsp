<%-- 
    Document   : editar_contrato
    Author     : servidor
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="pac.conecta_bd"%>
<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


       <% 
      
           request.setCharacterEncoding("UTF-8");
           
           response.setContentType("text/x-json");
           response.setCharacterEncoding("utf-8");
           response.setHeader("Pragma", "no-cache");
           response.setHeader("Cache-Control", "no-cache, must-revalidate");
           response.setHeader("Pragma", "no-cache");

           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
                            
                        
                            String json= "{ 'msj':'fail' }";
                            out.print(json);
                            out.close();
              return;
            }
        

                                  
        conecta_bd ba=new conecta_bd();
        ba.ConectaDb();    
                
        String idcontra = request.getParameter("idcontra"); 
        String ncontrato = request.getParameter("ncontrato");   
        String fi = request.getParameter("fi");   
        String ff = request.getParameter("ff");   
        String objeto = request.getParameter("objeto");   
        String resumencontrato = request.getParameter("resumencontrato");   
        String factura = request.getParameter("factura");   
        String modalidad = request.getParameter("modalidad");   
        String numafiliados = request.getParameter("numafiliados");   
        String porcentajeupc = request.getParameter("porcentajeupc");   
        String regimen = request.getParameter("regimen");   
        String contratovalorcano = request.getParameter("contratovalorcano");   
        String contratovalorcmes = request.getParameter("contratovalorcmes");   
        String alaraunocontraen = request.getParameter("alaraunocontraen");   
        String contratovalorfano = request.getParameter("contratovalorfano");   
        String contratovalorfmes = request.getParameter("contratovalorfmes");   
        String alaradoscontraen = request.getParameter("alaradoscontraen");    
        String ideps = request.getParameter("ideps");   
        String nom_cont = request.getParameter("nom_cont");   
        
                        
    String sql="UPDATE `ips_isalud`.`contratacion` SET "
                        + "`nombre`='"+nom_cont+"',"
                        + "`cod_eps`='"+ideps+"',"
                        + "`f_inicio`='"+fi+"',"
                        + "`f_fin`='"+ff+"',"
                        + "`n_contrato`='"+ncontrato+"',"
                        + "`objeto_cont`='"+objeto+"',"
                        + "`resumen_contrato`='"+resumencontrato+"',"
                        + "`modalidad`='"+modalidad+"',"
                        + "`regimen`='"+regimen+"',"
                        + "`v_cap_ano`='"+contratovalorcano+"',"
                        + "`v_cap_mes`='"+contratovalorcmes+"',"
                        + "`alarma_en`='"+alaraunocontraen+"',"
                        + "`v_fac_ano`='"+contratovalorfano+"',"
                        + "`v_fac_mes`='"+contratovalorfmes+"',"
                        + "`alarma`='"+alaradoscontraen+"',"
                        + "`factura`='"+factura+"',"
                        + "`num_afiliados`='"+numafiliados+"',"
                        + "`por_upc`='"+porcentajeupc+"'"
            + " WHERE "
                        + "`id_contratacion`='"+idcontra+"';";
          //  System.out.println(sql);
            
  if(ba.transaccion(sql)==false){    
                            String json= "{ \"msj\":\"Falla al guardar\" }";
                            out.print(json);
                            out.close();
                                 }
   else{   
                            String json= "{ \"msj\":\"Guardado satisfactoriamente\" }";
                            out.print(json);
                            out.close();
 }
     
   ba.cerrar();
%>