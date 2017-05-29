<%-- 
    Document   : guarda_consu_psico_1
    Created on : 14/09/2013, 12:01:06 PM
    Author     : Emmanuel
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body> <% request.setCharacterEncoding("UTF-8");
        //  out.print("nom "+session.getAttribute("nombre")+" clave "+session.getAttribute("clave")+" id "+session.getAttribute("id")+" permiso "+session.getAttribute("permiso")+" s agenda "+session.getAttribute("serial_agenda" )+" s paciente"+session.getAttribute("serial_pacinete"));
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null || session.getAttribute("serial_consulta")==null ){
      
      %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="/index.jsp">volver</a></center>
      <% 
              out.println("</body></html>");
              return;
            } 
      conecta_bd ba = new conecta_bd();
      ba.ConectaDb();
            
      String evo=""+request.getParameter("evolucion_problem");
      String ans=""+request.getParameter("analisis_descri");
      
      String ecp=""+request.getParameter("estado_civilo_psico");
      String ori=""+request.getParameter("orientacion_psico");
              
       if(evo != null && evo.compareTo("")!=0){evo=evo.replace("'","").replace("\"","");}
       if(ans != null && ans.compareTo("")!=0){ans=ans.replace("'","").replace("\"","");}
       if(ecp != null && ecp.compareTo("")!=0){ecp=ecp.replace("'","").replace("\"","");}
       if(ori != null && ori.compareTo("")!=0){ori=ori.replace("'","").replace("\"","");}
      
      String sql="UPDATE `ips_isalud`.`consulta_psico` SET `evo_problema`='"+evo+"',  `analisis_descri`='"+ans+"' ,`fecha`=now(),`id_profecional`='"+session.getAttribute("id")+"',`facturado`='0', `id_tipo`=3, `guardado`=3 WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';"; 
      
      
      
      
      if(ba.transaccion(sql)){out.print("<input type='hidden' id='guarda_cons_ppsico' name='guarda_cons_ppsico' value='1'>");}
           else{out.print("<input type='hidden' id='guarda_cons_ppsico' name='guarda_cons_ppsico' value='0'>");}

      
      String sql2="UPDATE `ips_isalud`.`pacientes` SET `cod_estado_civil`='"+ecp+"', `id_orientacion`='"+ori+"' WHERE `serial_persona`='"+session.getAttribute("serial_pacinete")+"';";
      
      if(ba.transaccion(sql2)){out.print("<input type='hidden' id='guarda_cons_ppsico2' name='guarda_cons_ppsico2' value='1'>");}
           else{out.print("<input type='hidden' id='guarda_cons_ppsico2' name='guarda_cons_ppsico2' value='0'>");}

       ba.transaccion("UPDATE `ips_isalud`.`agenda` SET `id_estado`=3 WHERE `id_agenda`='"+session.getAttribute("serial_agenda")+"';");      
     
       ba.cerrar();
     %>
      
    </body>
</html>
