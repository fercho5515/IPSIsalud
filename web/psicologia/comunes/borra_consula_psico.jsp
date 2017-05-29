<%-- 
    Document   : borra_consula_psico
    Created on : 14/09/2013, 12:00:42 PM
    Author     : Emmanuel
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><br><br><br><br>
    <center> 
        <input type="image" size="25" id="fo" src="../../imagenes/fotos/cargando.gif" alt="cargando"  onerror="this.src='../imagenes/fotos/cargando.gif'" style="padding-top: 100px">
    </center>
        <%
       
         request.setCharacterEncoding("UTF-8"); 
         String tipo=""+request.getParameter("tipo");
         
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null || session.getAttribute("serial_consulta")==null ){}
         else{
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
               
                ba.transaccion("SET SQL_SAFE_UPDATES=0;");
                
                //alertas y remoendaciines
                ba.transaccion("delete from alertas where cod_consult_crea='"+session.getAttribute("serial_consulta")+"' and id_permiso='"+session.getAttribute("permiso")+"';");
                ba.transaccion("delete from recomendacion where cod_consulta_crea='"+session.getAttribute("serial_consulta")+"' and permiso_med_recom='"+session.getAttribute("permiso")+"';");
                ba.transaccion("UPDATE `ips_isalud`.`recomendacion` SET `leida`=0, `id_quien_leyo`=null, `fecha_lee`=null, `cod_consulta_lee`=null WHERE `cod_consulta_lee`='"+session.getAttribute("serial_consulta")+"' and id_para_quien='"+session.getAttribute("permiso")+"';");
                ba.transaccion("UPDATE `ips_isalud`.`alertas` SET `id_empleado_lee`=null, `fecha_lee`=null, `cod_consult_lee`=null, `leido`=0 WHERE `cod_consult_lee`='"+session.getAttribute("serial_consulta")+"' and id_permiso='"+session.getAttribute("permiso")+"';");
                ba.transaccion("DELETE FROM `ips_isalud`.`antecedentes_familiares` WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"' and `id_permiso`='"+session.getAttribute("permiso")+"';");
                ba.transaccion("DELETE FROM `ips_isalud`.`antecedentes_personales` WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"' and `id_permiso`='"+session.getAttribute("permiso")+"';");
                ba.transaccion("DELETE FROM `ips_isalud`.`impre_diagno_psico` WHERE `id_consulta_psico`='"+session.getAttribute("serial_consulta")+"';");
                ba.transaccion("SET SQL_SAFE_UPDATES=1;");
                
                
                if(tipo.compareTo("1")==0){
            //    ba.transaccion("DELETE FROM `ips_isalud`.`consulta_psico` WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';");
                                           }
                ba.cerrar();           
   
                }
                
               
        %>
       <script language="JavaScript" type="text/javascript">


function redireccionar() 
{
<%
if(tipo.compareTo("1")==0){out.print("location.href='../../agenda_psicologia.jsp';");}
                 else{out.print("location.href='../../agenda_psicologia.jsp';");}
%>    


} 
setTimeout ("redireccionar()", 1000);

</script>
             
    </body>
</html>


