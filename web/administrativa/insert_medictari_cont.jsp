
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body >
        <% 
         request.setCharacterEncoding("UTF-8");
        
         
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){}
         else{
             conecta_bd ba = new conecta_bd();
             ba.ConectaDb(); 
              try{  
                
                  String dato3[] = new String[1];
                    dato3[0] = "";
                  
                  String sqlcont="select count(id_medica_cont) from medica_cont where cod_med='"+request.getParameter( "id_medic" )+"' and id_lab='"+request.getParameter( "id_labo" )+"' and cod_contra='"+ session.getAttribute("id_contratacion")+"';";
               // out.print(sqlcont);
                
                ResultSet resu3 = ba.consultas(sqlcont);
                    try {
                        while (resu3.next() && resu3 != null) {
                            if (resu3.getString(1) != null) {
                                dato3[0] = resu3.getString(1);
                            }
                            //out.print("<input type='hidden' id='contra' name='contra' value='"+dato1[0]+"'");
                        }
                    } catch (SQLException e) {
                    }
                
                int dato=Integer.parseInt( dato3[0]);
                
                if(dato==0){}
                else if(dato>=1){
                    out.println("<h2 style='color:red'>Este Medicamento ya ha sido agregado con otro tarifario</h2>");
                    out.println("</body></html>");
                    return;
                }
                 
                               }
              catch(Exception e){}
              
              try{
                String sql="INSERT INTO `ips_isalud`.`medica_cont`(`cod_contra`,`cod_med`,`cod_tari`,`porcentaje`,`id_lab`) VALUES ('"+ session.getAttribute("id_contratacion") +"','"+request.getParameter( "id_medic" )+"','"+request.getParameter( "id_tari" )+"','"+request.getParameter( "porcentaje" )+"','"+request.getParameter( "id_labo" )+"');";
                //out.print(sql);
                if(ba.transaccion(sql)){out.println("<h2 style='color:green'>Insertado Exitosamente</h2>");}
                else{out.println("<h2 style='color:red'>Fallo al Crear</h2>");}
                ba.cerrar();  
                               }
              catch(Exception e){out.println("<h2 style='color:red'>Fallo</h2>");}
              ba.cerrar();  
             }
        
        %>
    </body>
</html>