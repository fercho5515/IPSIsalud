<%-- 
    Document   : crear_signo_fisico
    Created on : 24-feb-2013, 23:37:38
    Author     : Fercho
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
                
                int id = Integer.parseInt(request.getParameter("cambiasigno"));
                String co="";
                if(request.getParameter("obs")!=null && request.getParameter("obs").compareTo("null")!=0){co=""+request.getParameter("obs").replace("'","").replace("\"","");}
              
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
                String sql="INSERT INTO `ips_isalud`.`histo_subsig` (`id_consulta`, `id_sub_sig`, `coment`) VALUES ('"+session.getAttribute("serial_consulta")+"','"+id+"', '"+co+"');";
             //   System.out.print("dfggfgfg "+sql);
                ba.transaccion(sql);
                ba.cerrar();           

               }
        %>
    </body>
</html>
