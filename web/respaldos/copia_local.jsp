<%-- 
    Document   : copia_local
    Created on : 26-ago-2013, 9:44:17
    Author     : servidor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" >
            function genera_copia_local(){
                document.getElementById("resu_copia_local").innerHTML="<br><img src='../imagenes/fotos/cargando.gif' alt='cargando'  style='height:200px'>";
                 $("#resu_copia_local").load("../respaldos/comprime_1.jsp");
            }
        </script>
    </head>
    
    <body>
        
       <% request.setCharacterEncoding("UTF-8");
      
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
        
                out.print("<br><center><h1>Por favor ingrese adecuadamente</h1></center>");
                out.print("<br><center><a href='../index.jsp'>volver</a></center>");
                out.println("</body></html>");
                return;
            }   
           String per=""+session.getAttribute("permiso");
           if(per.compareTo("10")!=0){
                out.print("<br><center><h1>Solo la gerencia posee permiso para realizar esta acción</h1></center>");
                out.println("</body></html>");
                return;          
          }         
   %>
 <center>
     <br><h2>Copia Local</h2>
     <br><input type="button" value="Generar copia" id="aceptar" name="aceptar" onclick="genera_copia_local()">    
     <br><div id="resu_copia_local" name="resu_copia_local"></div>
     
 
 </center>
    </body>
</html>
