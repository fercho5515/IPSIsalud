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
         
         String sql="select m.serial,m.cum,m.cod_atc,m.producto,m.concentracion,um.descripcion as d1,ff.descripcion as d2,m.presentacion from medicamentos m,unidad_medida um,forma_farmaceutica ff where um.id_unidad_medida=m.unidad_medida and ff.id_forma_farmaceutica=m.forma_farmaceutica and m.serial='"+datop+"';";
         //out.print(sql); 
         ResultSet resu=null;
         try{  resu=ba.consultas(sql);}
         catch(Exception e){}
            String datos[]=new String[8];
            
            for(int i=0;i<8;i++){
                datos[i]="";
            }
         try{
	    while (resu.next()&&resu!=null) {   
                         if(resu.getString(1)!=null){datos[0]=resu.getString(1);}//id_subcie10
                         if(resu.getString(2)!=null){datos[1]=resu.getString(2);}//cie10
                         if(resu.getString(3)!=null){datos[2]=resu.getString(3);}//descripcion
                         if(resu.getString(4)!=null){datos[3]=resu.getString(4);}//masc fem                        if(resu.getString(5)!=null){datos[4]=resu.getString(5);}//cedula
                         if(resu.getString(5)!=null){datos[4]=resu.getString(5);}
                         if(resu.getString(6)!=null){datos[5]=resu.getString(6);}
                         if(resu.getString(7)!=null){datos[6]=resu.getString(7);}
                         if(resu.getString(8)!=null){datos[7]=resu.getString(8);}
                     }
        }
        catch(SQLException ex){}
	catch(Exception exe){}
        ba.cierraResultado(resu);
        ba.cerrar();
        %>
        
<table style="height:100%;width:80%;padding-top:5px" align="center">
    <input type="hidden" id="id_medic" name="id_medic" value="<%out.print(datos[0]);%>"><br>
        <tr><td>
            <label>CUM: </label>
        </td><td>
            <input type="text" value="<%out.print(datos[1]);%>" readonly size="10"><br>
        </td></tr>
        <tr><td>
            <label>ATC </label>
        </td><td>
            <input type="text" value="<%out.print(datos[2]);%>" readonly size="10"><br>
        </td></tr>
        <tr><td>
            <label>PRODUCTO: </label>
        </td><td>
            <input type="text" value="<%out.print(datos[3]);%>" readonly size="100"><br>
        </td></tr>
        <tr><td>
            <label>CONCENTRACION: </label>
        </td><td>
            <input type="text" value="<%out.print(datos[4]);%>" readonly size="100"><br>
        </td></tr>
        <tr><td>
            <label>UNIDAD DE MEDIDA: </label>
        </td><td>
            <input type="text" value="<%out.print(datos[5]);%>" readonly size="100"><br>
        </td></tr>
        <tr><td>
            <label>FORMA FARMACEUTICA: </label>
        </td><td>
            <input type="text" value="<%out.print(datos[6]);%>" readonly size="100"><br>
        </td></tr>
        <tr><td>
            <label>PRESENTACION: </label>
        </td><td>
            <input type="text" value="<%out.print(datos[7]);%>" readonly size="100"><br>
        </td></tr>
        <tr><td>
            <label>LABORATORIO FARMACEUTICO </label>
        </td><td>
            <select name="laboratorio" id="laboratorio" style="width:85%">
                                                        <option value="0">--Escoja Laboratorio--</option>
                                                        <%
                                                            String sqlabo = "select * from lab_farmaceutico;";
                                                            ResultSet resulabo = ba.consultas(sqlabo);
                                                            try {
                                                                while (resulabo.next() && resulabo != null) {

                                                                    out.print("<option value='" + resulabo.getString(1) + "'>" + resulabo.getString(2) + "</option>");

                                                                }
                                                            } catch (SQLException e) {
                                                            } catch (Exception ex) {
                                                            }
                                                        %> 
                                                    </select>
        </td></tr>
        <tr><td>
            <label>PRECIO: </label>
        </td><td>
            <input type="text" id="precio" name="precio" size="100"><br>
        </td></tr>
        <tr><td colspan="2"><input type="submit" id="aceptar" name="aceptar" value="Agregar Medicamento"></td></tr>
</table>

</body>
</html>
