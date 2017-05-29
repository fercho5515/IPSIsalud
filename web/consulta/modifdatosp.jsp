<%-- 
    Document   : modifdatosp
    Created on : 8/05/2013, 06:30:06 PM
    Author     : EMMANUEL
--%>
<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <%
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){
          
          %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
        conecta_bd ba = new conecta_bd();
        ba.ConectaDb(); 
       
        
        String estadocivil=request.getParameter("estado_civil").replace("'","").replace("\"",""); 
        String orientasex=request.getParameter("orientacion_sex").replace("'","").replace("\"",""); 
        String vih=request.getParameter("vih").replace("'","").replace("\"","");
        String rh=request.getParameter("rh").replace("'","").replace("\"","");
        String etnia=request.getParameter("etnia").replace("'","").replace("\"","");
        String grupop=request.getParameter("grupop").replace("'","").replace("\"","");
        String emb="1";
        if(request.getParameter("embarazo_act")!=null && request.getParameter("embarazo_act").compareTo("null")!=0 ){emb=request.getParameter("embarazo_act");}
        String upd1="UPDATE `ips_isalud`.`pacientes` SET  `id_grupo`='"+grupop+"',`id_etnia`='"+etnia+"',`cod_estado_civil`='"+estadocivil+"', `id_orientacion`='"+orientasex+"', `vih`='"+vih+"',`embarazo_activo`='"+emb+"' WHERE `serial_persona`='"+session.getAttribute("serial_pacinete")+"';";
        String upd2="UPDATE `ips_isalud`.`personas` SET `id_rh`='"+rh+"' WHERE `serial`='"+session.getAttribute("serial_pacinete")+"';";
        
      //  System.out.println(upd1+"\n"+upd2);
           
        ba.transaccion(upd1);       
        ba.transaccion(upd2);     
                  
       ba.cerrar();
       
      %>
    </body>
</html>

