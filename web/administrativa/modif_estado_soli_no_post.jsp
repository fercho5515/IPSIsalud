<%-- 
    Document   : modif_estado_soli_no_post
    Created on : 14/08/2013, 03:03:39 PM
    Author     : Emmanuel
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          
    </head>
    <body>
           <% 
                    request.setCharacterEncoding("UTF-8");
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null ){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }

   conecta_bd ba = new conecta_bd();
   ba.ConectaDb(); 
   
   
 
String id=request.getParameter("id_soli_np"); 
String d=request.getParameter("dato");//medicamento uno, dos o tres
String n=request.getParameter("nuevoe");// 1 rechaza, 2 aprueva



// si apro 
//INSERT INTO `ips_isalud`.`autorizacion_no_pos` (`id_soli_no_post`, `medi1`, `num`, `idpaciente_apro`, `id_empleado1`, `fecha_inicio`, `fecha_fin`, `ruta_archivo`) VALUES (id_soli_no_post, med1, num, id_paciente, id_empleado, 'fecha_i', 'fecha_f', 'ruta');
 if(n.compareTo("1")==0){
//si rechaza
                String sqlur="UPDATE `ips_isalud`.`soli_no_post` SET `id_med"+d+"`=null, `estado_m"+d+"`="+n+" WHERE `id_soli_no_post`='"+id+"';";
                if(ba.transaccion(sqlur)){
                                         out.print("<input type='hidden' name='resu_soli_d' id='resu_soli_d' value='1'>"); 
                                         }
                else{   out.print("<input type='hidden' name='resu_soli_d' id='resu_soli_d' value='0'>"); }

}
else if(n.compareTo("2")==0){
}
  ba.cerrar();
%>        
    </body>
</html>
