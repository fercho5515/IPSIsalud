<%-- 
    Document   : buscacomprador
    Created on : 9/03/2015, 05:49:56 PM
    Author     : VAIO
--%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.lang.String"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%
      response.setContentType("text/x-json");
      response.setCharacterEncoding("utf-8");
      response.setHeader("Pragma", "no-cache");
      response.setHeader("Cache-Control", "no-cache, must-revalidate");
      response.setHeader("Pragma", "no-cache");
      JSONObject obj=new JSONObject();      
      request.setCharacterEncoding("UTF-8");
      String serial="0";
      String nombre="";
      String tipo="";
      String cedula="";
      
      if (session.getAttribute("nombre") == null || session.getAttribute("clave") == null || session.getAttribute("id") == null || session.getAttribute("permiso") == null) {
      
                        obj.put("serial",serial);
                        obj.put("nombre",nombre);
                        obj.put("tipo",tipo);
                        obj.put("cedula",cedula);
                        obj.put("msj","Sesión Expirada.");
      
      } else {
                try {
                    conecta_bd ba = new conecta_bd();
                    ba.ConectaDb();
                    
                    String sql = "SELECT p.serial,p.p_nom,p.s_nom,p.p_ape,p.s_ape,t.descripcion,p.id_person FROM personas p,tipo_id t where p.tipo_id=t.idtipo_id and t.idtipo_id='"+request.getParameter("tipoid")+"' and p.id_person='"+request.getParameter("nid")+"';";
                    
                    //out.print(sql2);
                    ResultSet resu2 = ba.consultas(sql);
                    int control=0;
                    try {
                        while (resu2.next() && resu2 != null) {
                            control++;
                            if (resu2.getString(1) != null) {  serial = resu2.getString(1); }
                            if (resu2.getString(2) != null) {  nombre = nombre+" "+resu2.getString(2); }
                            if (resu2.getString(3) != null && resu2.getString(3).length()>0) {  nombre = nombre+" "+resu2.getString(3); }
                            if (resu2.getString(4) != null) {  nombre = nombre+" "+resu2.getString(4); }
                            if (resu2.getString(5) != null && resu2.getString(5).length()>0) {  nombre = nombre+" "+resu2.getString(5); }
                            if (resu2.getString(6) != null) {  tipo = resu2.getString(6); }
                            if (resu2.getString(7) != null) {  cedula = resu2.getString(7); }
                         }
                         if(control==0){obj.put("msj","Persona no esncotrada");}
                         else{obj.put("msj","Ok");}
                         
                    } 
                    catch (SQLException e) { obj.put("msj","error al buscar");}
                    catch (Exception ex) { obj.put("msj","error al buscar"); }
                    
                    ba.cerrar();
                    }  
                    catch (Exception e) {obj.put("msj","error al buscar"); }
                 
                    obj.put("serial",serial);
                    obj.put("nombre",nombre);
                    obj.put("tipo",tipo);
                    obj.put("cedula",cedula);
                   
            }
   
        out.print(obj);
        out.close(); 
            
                   
        %>

