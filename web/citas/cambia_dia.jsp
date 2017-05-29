
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
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
    <body>
        <select name="2cambia_dia"  id="2cambia_dia" style="width: 150px" >
         <%
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb();    
                            Calendar cald = new GregorianCalendar();
                            String dia=Integer.toString(cald.get(Calendar.DATE));
                            String mes=Integer.toString(cald.get(Calendar.MONTH)+1);
                            String año=Integer.toString(cald.get(Calendar.YEAR));
          String dato=request.getParameter("dato");
         //dato=dato.replace('*',' ');
                        out.print("este es el dato--"+dato);
                        String sql="select DISTINCT dia from dias_atencion where id_contrato='"+dato+"' and dia >='"+año+"-"+mes+"-"+dia+"';";    
                        out.print(sql);
                        ResultSet resu=ba.consultas(sql);
                        try{
                            while (resu.next()&&resu!=null) {   
                                       out.print("<option value='"+resu.getString(1)+"'>"+resu.getString(1)+"</option>");
                            }
                        }
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cerrar();
                        %>
         </select>
    </body>
</html>
