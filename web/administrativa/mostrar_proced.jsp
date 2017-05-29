<%-- 
    Document   : cargar_medic
    Created on : 27-may-2013, 17:51:32
    Author     : Fercho
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <script type="text/javascript" language="javascript">
 
       </script>
           </head>
    <body>

        <%
        //  out.print("nom "+session.getAttribute("nombre")+" clave "+session.getAttribute("clave")+" id "+session.getAttribute("id")+" permiso "+session.getAttribute("permiso")+" s agenda "+session.getAttribute("serial_agenda" )+" s paciente"+session.getAttribute("serial_pacinete"));
if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null ){
%>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
            <% 
              out.println("</body></html>");
              return;
            }
         request.setCharacterEncoding("UTF-8");         
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb(); 
         
         String datop=request.getParameter("dato");
         datop=datop.replace('*',' ');
         //out.print(datop);
         
         //HttpSession sesion=request.getSession();
         //sesion.setAttribute("cup_update",datop);
         //out.println("Sesion==>"+sesion.getAttribute("cup_update"));
         
         String sql="select pt.idprocedimientos_tari,c.cup_verdadero,pt.codigo_maipos,pt.descripcion as d1 from cups c, procedimientos_tari pt where pt.cod_cups=c.id_cups and pt.idprocedimientos_tari='"+datop+"';";
         //out.print(sql); 
         ResultSet resu=null;
         try{  resu=ba.consultas(sql);}
         catch(Exception e){}
            String datos[]=new String[4];
            
            for(int i=0;i<4;i++){
                datos[i]="";
            }
         try{
	    while (resu.next()&&resu!=null) {   
                         if(resu.getString(1)!=null){datos[0]=resu.getString(1);}//id_subcie10
                         if(resu.getString(2)!=null){datos[1]=resu.getString(2);}//cie10
                         if(resu.getString(3)!=null){datos[2]=resu.getString(3);}//descripcion
                         if(resu.getString(4)!=null){datos[3]=resu.getString(4);}//masc fem                        if(resu.getString(5)!=null){datos[4]=resu.getString(5);}//cedula
                         
                     }
        }
        catch(SQLException ex){}
	catch(Exception exe){}
        ba.cierraResultado(resu);
        ba.cerrar();
        %>
<table style="height:100%;width:80%;padding-top:5px" align="center">
    <input type="hidden" id="id_proced" name="id_proced" value="<%out.print(datos[0]);%>"><br>
        <tr><td>
            <label>CUP: </label>
        </td><td>
            <input type="text" value="<%out.print(datos[1]);%>" readonly size="10"><br>
        </td></tr>
        <tr><td>
            <label>MAPIPO: </label>
        </td><td>
            <input type="text" value="<%out.print(datos[2]);%>" readonly size="10"><br>
        </td></tr>
        <tr><td>
            <label>NOMBRE: </label>
        </td><td>
            <input type="text" value="<%out.print(datos[3]);%>" readonly size="100"><br>
        </td></tr>
        <tr><td>
            <label>PRECIO: </label>
        </td><td>
            <input type="text" id="precio" name="precio">
        </td></tr>
        <tr><td colspan="2"><input type="submit" id="aceptar" name="aceptar" value="Agregar Procedimiento"></td></tr>
</table>

</body>
</html>
