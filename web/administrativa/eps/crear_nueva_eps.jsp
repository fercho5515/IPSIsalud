<%-- 
    Document   : crear_nueva_eps
    Created on : 28-ago-2013, 13:51:18
    Author     : servidor
--%>

<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                  
       <% request.setCharacterEncoding("UTF-8");
      
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
        
                out.print("<br><center><h1>Por favor ingrese adecuadamente</h1></center>");
                out.print("<br><center><a href='../index.jsp'>volver</a></center>");
                out.println("</body></html>");
                return;
            }   
           int per=Integer.parseInt(""+session.getAttribute("permiso")+"");
           if(per < 7){
                out.print("<br><center><h1>No posee permiso para realizar esta acción</h1></center>");
                out.println("</body></html>");
                return;          
          }    
           
           String cod=""+request.getParameter("codigo_eps");
           String nom=""+request.getParameter("nombre_eps");
           String nit=""+request.getParameter("nit_eps");
           String dir=""+request.getParameter("direcc_eps");
           String ciu=""+request.getParameter("ciudad_eps");
           String tel=""+request.getParameter("telefo_eps");
           String tip=""+request.getParameter("tipo_eps");
           
           if(cod == null && cod.compareTo("null")==0 ){cod="";}
           if(nom == null && nom.compareTo("null")==0 ){nom="";}
           if(nit == null && nit.compareTo("null")==0 ){nit="";}
           if(dir == null && dir.compareTo("null")==0 ){dir="";}
           if(ciu == null && ciu.compareTo("null")==0 ){ciu="";}
           if(tel == null && tel.compareTo("null")==0 ){tel="";}
           if(tip == null && tip.compareTo("null")==0 ){tip="";}
           
           conecta_bd ba = new conecta_bd();
          ba.ConectaDb();
         // System.out.println("`, `nit`, `nombre`, `direccion`, `telefono`, `ciudad`) VALUES ('"+cod+"', '"+nit+"', '"+nom+"', '"+dir+"', '"+tel+"', '"+ciu+"');");
          if(ba.transaccion("INSERT INTO `ips_isalud`.`eps` (`ideps`, `nit`, `nombre`, `direccion`, `telefono`, `ciudad`) VALUES ('"+cod+"', '"+nit+"', '"+nom+"', '"+dir+"', '"+tel+"', '"+ciu+"');")){
            out.print("<center><input type='hidden' id='res_cre_eps' name='res_cre_eps' value='1'></center>");
          }
          else{out.print("<center><input type='hidden' id='res_cre_eps' name='res_cre_eps' value='0'></center>");
          }                        
          ba.cerrar();                   
         %>  
      <!--   
         <h2 style='color: green'>EPS creada con éxito</h2>
         <h2 style='color: red'>Falla al crear EPS </h2>
      -->
    </body>
</html>
