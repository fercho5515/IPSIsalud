<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
        <% 
      request.setCharacterEncoding("UTF-8");    
            
      response.setContentType("text/x-json");
      response.setCharacterEncoding("utf-8");
      response.setHeader("Pragma", "no-cache");
      response.setHeader("Cache-Control", "no-cache, must-revalidate");
      response.setHeader("Pragma", "no-cache");
      JSONObject obj=new JSONObject();  
      
       
           String sql="";   
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){}
         else{
              try{  
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb();
                sql="UPDATE `ips_isalud`.`sub_signos` SET `id_signos`="+request.getParameter( "idssuf" )+", `decripcion`='"+request.getParameter( "id_detalle" )+"' WHERE `id_sub_signos`='"+request.getParameter( "subsiged" )+"';";
                if(ba.transaccion(sql)){obj.put("res","1");}
                else{obj.put("res","2");}
                ba.cerrar();  
                }
                catch(Exception e){obj.put("res","0");}
             }
        out.print(obj);
        out.close(); 
        %>