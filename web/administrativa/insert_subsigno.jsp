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
                String datos[]=new String[1];
                String sql2="select count(decripcion) from sub_signos where decripcion='"+request.getParameter("subsigno")+"' and id_signos='"+request.getParameter("signo")+"';";
                ResultSet resu2=ba.consultas(sql2);
                        try{
                             while (resu2.next()||resu2!=null) { 
                                         datos[0]=resu2.getString(1);
                                       }
                        }
                        catch(SQLException e){}
                        catch(Exception ex){}
                        int x = Integer.parseInt(datos[0]);
                     // out.print(x);
                if(x<1){
                    sql="INSERT INTO `ips_isalud`.`sub_signos`(`id_signos`,`decripcion`) VALUES ('"+request.getParameter( "signo" )+"','"+request.getParameter( "subsigno" )+"');";
                  //  out.print(sql); 
                    if(ba.transaccion(sql)){obj.put("res","1");}
                    else{obj.put("res","2");}
                }
                else{obj.put("res","2");}
                        
               
                ba.cerrar();  
                }
                catch(Exception e){obj.put("res","0");}
             }
        out.print(obj);
        out.close(); 
        %>