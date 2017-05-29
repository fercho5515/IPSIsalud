<%-- 
    Document   : nueva_recomend
    Created on : 4/09/2013, 07:09:07 PM
    Author     : Emmanuel
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="java.util.*" session="true" %>
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
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){}
         else{
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
                String id_para="";
                String recom="";
                if(request.getParameter("id_perm_para")!=null && request.getParameter("id_perm_para").compareTo("null")!=0){id_para=""+request.getParameter("id_perm_para").replace("'","").replace("\"","");}
                if(request.getParameter("recomen_dacion")!=null && request.getParameter("recomen_dacion").compareTo("null")!=0){recom=""+request.getParameter("recomen_dacion").replace("'","").replace("\"","");}
               
                String sql="INSERT INTO `ips_isalud`.`recomendacion` (`descripcion`, `id_paciente`, `id_medico_recom`, `permiso_med_recom`, `id_para_quien`, `fecha`,`cod_consulta_crea`) VALUES ('"+recom+"','"+session.getAttribute("serial_pacinete")+"','"+session.getAttribute("id")+"','"+session.getAttribute("permiso")+"','"+id_para+"', curdate(),'"+session.getAttribute("serial_consulta")+"');";
                //INSERT INTO `ips_isalud`.`remision_espe` (`id_consulat`, `anamnesis`, `ex_fisico`, `cod_diag`, `presuntivo`, `observaciones`, `id_especialidad`) VALUES ('"+session.getAttribute("serial_consulta")+"', '"+aname+"', '"+exame_fisi+"', '"+cod_diag+"', '"+presun+"', '"+observa+"','"+id_espe+"');";
                //System.out.println("ins nueva recom "+sql);
                if(ba.transaccion(sql)){out.print(" <input type='hidden' id='result_form_recom' name='result_form_recom' value='1'>");}
                else{out.print(" <input type='hidden' id='result_form_recom' name='result_form_recom' value='0'>");}
                ba.cerrar();           

               }
        %>
       
    </body>
</html>
