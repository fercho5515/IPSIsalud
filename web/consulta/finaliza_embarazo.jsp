<%-- 
    Document   : finaliza_embarazo
    Created on : 3/09/2013, 11:52:55 AM
    Author     : servidor
--%>


<%@page import="sun.management.resources.agent"%>
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
          %>
         <center> 
        <input type="image" size="25" id="fo" src="../imagenes/fotos/cargando.gif" alt="cargando"  onerror="this.src='../imagenes/fotos/cargando.gif'" style="padding-top: 100px">
    </center> 
        <%      
                conecta_bd ba = new conecta_bd();
                String cod_emb=request.getParameter("con_em");
                String nuevo_e=request.getParameter("estad");
                String agenda=request.getParameter("age");
                
                ba.ConectaDb(); 
               String sql0="UPDATE `ips_isalud`.`historia_clinica` SET `cod_embarazo`='null' WHERE `serial_peciente`='"+session.getAttribute("serial_pacinete")+"';";
               String sql1="UPDATE `ips_isalud`.`pacientes` SET `embarazo_activo`='0' WHERE `serial_persona`='"+session.getAttribute("serial_pacinete")+"';";
               String sql2="UPDATE `ips_isalud`.`embarazo` SET `fecha_fin`=curdate(), `comentarios`='', `cod_consulta_f`='"+session.getAttribute("serial_consulta")+"', `razon_finaliza`='"+nuevo_e+"'  WHERE `serial`='"+cod_emb+"';";
                //   System.out.println("sql0: "+sql0);
                //   System.out.println("sql1: "+sql1);
                //   System.out.println("sql2: "+sql2);                                         
                ba.transaccion(sql0);      
                ba.transaccion(sql1);                
                ba.transaccion(sql2);
                
                ba.cerrar();           
                
             // System.out.print("borra resu img: "+sql+" \n sql2 "+sql2);
              
        %>
              <script language="JavaScript" type="text/javascript">

var pagina="contenedor.jsp"
function redireccionar_cc() 
{
document.f1_red.submit();
} 
setTimeout ("redireccionar_cc()", 1000);

</script>
<form id="f1_red" name="f1_red" method="post" action="contenedor.jsp">
    <input type="hidden" name="s_agenda" id="s_agenda" value="<% out.print(""+agenda+""); %>">
    <input type="hidden" name="s_paciente" id="s_paciente" value="<% out.print(""+session.getAttribute("serial_pacinete")+""); %>">
    <input type="hidden" name="id_consultaaa" id="id_consultaaa" value="<% out.print(""+session.getAttribute("serial_consulta")+""); %>">
    <input type="hidden" name="autorizacion" id="autorizacion" value="<% out.print(""+session.getAttribute("cod_autoriza")+""); %>">
   
    
</form>    
    </body>
</html>
<%  } %>