<%-- 
    Document   : nueva_remision
    Created on : 13/05/2013, 07:30:05 PM
    Author     : EMMANUEL
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
                String aname="";
                String exame_fisi="";
                String cod_diag="";
                String presun="";
                String observa="";
                String id_espe="";
                if(request.getParameter("anam_remi")!=null && request.getParameter("anam_remi").compareTo("null")!=0){aname=""+request.getParameter("anam_remi").replace("'","").replace("\"","");}
                if(request.getParameter("exam_remi")!=null && request.getParameter("exam_remi").compareTo("null")!=0){exame_fisi=""+request.getParameter("exam_remi").replace("'","").replace("\"","");}
                if(request.getParameter("select_diag")!=null && request.getParameter("select_diag").compareTo("null")!=0){cod_diag=""+request.getParameter("select_diag").replace("'","").replace("\"","");}
                if(request.getParameter("presuntivo")!=null && request.getParameter("presuntivo").compareTo("null")!=0){presun=""+request.getParameter("presuntivo").replace("'","").replace("\"","");}
                if(request.getParameter("obsevaciones_remi")!=null && request.getParameter("obsevaciones_remi").compareTo("null")!=0){observa=""+request.getParameter("obsevaciones_remi").replace("'","").replace("\"","");}
                if(request.getParameter("especi_remi")!=null && request.getParameter("especi_remi").compareTo("null")!=0){id_espe=""+request.getParameter("especi_remi").replace("'","").replace("\"","");}
                
                String sql="INSERT INTO `ips_isalud`.`remision_espe` (`id_consulat`, `anamnesis`, `ex_fisico`, `cod_diag`, `presuntivo`, `observaciones`, `id_especialidad`) VALUES ('"+session.getAttribute("serial_consulta")+"', '"+aname+"', '"+exame_fisi+"', '"+cod_diag+"', '"+presun+"', '"+observa+"','"+id_espe+"');";
            
                if(ba.transaccion(sql)){out.print(" <input type='hidden' id='result_form' name='result_form' value='1'>");}
                else{out.print(" <input type='hidden' id='result_form' name='result_form' value='0'>");}
                ba.cerrar();           

               }
        %>
       
    </body>
</html>
