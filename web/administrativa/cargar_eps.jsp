
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" language="javascript">
            
            $('#formeps').submit(function() {
                           var veps=document.getElementById("eps").value;
                           if(veps == null ||veps.length == 0 || /^\s+$/.test(veps)){
                                                      alert('Codigo de la EPS es obligatorio ');
                                                       return false; 
                           }
                           var veps1=document.getElementById("eps1").value;
                           if(veps1 == null ||veps1.length == 0 ||veps1=='existe' || /^\s+$/.test(veps1)){
                                                      alert('Codigo de Eps repetido');
                                                       return false; 
                           }
                           var vnomeps=document.getElementById("nomeps").value;
                           if(vnomeps == null ||vnomeps.length == 0 || /^\s+$/.test(vnomeps)){
                                                      alert('Nombre de la EPS es obligatorio ');
                                                       return false; 
                           }
                           
                           $.ajax({
                              type: 'POST',
                              url: $(this).attr('action'),
                              data: $(this).serialize(),
                              success: function(data) {;
                                  $('#resueps').html(data);
                                  $("#diveps").load("<label>Exito</label>"); 
                              }
                           })
                          return false;
                      }); 
                     
            function comprueba_eps2(){
                        var comp_eps=document.getElementById("eps").value;
                         $("#divcomp_eps").load("comprob_eps2.jsp?dato="+comp_eps+"");
                        } 
        </script>
    </head>
    <body>
        <%
            //  out.print("nom "+session.getAttribute("nombre")+" clave "+session.getAttribute("clave")+" id "+session.getAttribute("id")+" permiso "+session.getAttribute("permiso")+" s agenda "+session.getAttribute("serial_agenda" )+" s paciente"+session.getAttribute("serial_pacinete"));
            if (session.getAttribute("nombre") == null || session.getAttribute("clave") == null || session.getAttribute("id") == null || session.getAttribute("permiso") == null) {
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

        String dato9 = request.getParameter("dato");
        //out.print(dato9);
        dato9 = dato9.replace('*', ' ');
        HttpSession sesion = request.getSession();
        sesion.setAttribute("codeps", dato9);
        String sql = "select ideps,nit,nombre,direccion,telefono,ciudad,tipo from eps where ideps='" + dato9 + "';";
         
        ResultSet resu = null;
        try {
            resu = ba.consultas(sql);
        } catch (Exception e) {
        }
        String datos[] = new String[7];

        for (int i = 0; i < 7; i++) {
            datos[i] = "";
        }
        try {
            while (resu.next() && resu != null) {
                if (resu.getString(1) != null) {
                    datos[0] = resu.getString(1);
                }//id_subcie10
                if (resu.getString(2) != null) {
                    datos[1] = resu.getString(2);
                }//cie10
                if (resu.getString(3) != null) {
                    datos[2] = resu.getString(3);
                }//descripcion
                if (resu.getString(4) != null) {
                    datos[3] = resu.getString(4);
                }//masc fem                        if(resu.getString(5)!=null){datos[4]=resu.getString(5);}//cedula
                if (resu.getString(5) != null) {
                    datos[4] = resu.getString(5);
                }//edad min
                if (resu.getString(6) != null) {
                    datos[5] = resu.getString(6);
                }//uni edad min
                if (resu.getString(7) != null) {
                    datos[6] = resu.getString(7);
                }//edad max
                
            }
        } catch (SQLException ex) {
        } catch (Exception exe) {
        }
        ba.cierraResultado(resu);
        ba.cerrar();
        //System.out.println("dato |"+datos[5]+"|");
%>
    <div id="diveps" name="diveps"></div>
    <form id="formeps" name="formeps" method="post" action="update_eps.jsp">
        <table>
            <tr>
                <td>
                    <h2>EPS</h2>
                </td>
                <td></td>
            </tr>
            <tr>
                <td style="text-align: right"><label>Codigo EPS:</td>
                <td></label><input type="text" id="eps" name="eps" maxlength="98" size="20" onkeyup="comprueba_eps2();" value="<%out.print(datos[0]);%>">
                <div id="divcomp_eps" name="divcomp_eps">
                    <input type="text" name="eps1" id="eps1" style="display: none" value="noexiste" readonly>
                </div></td>
            </tr>
            <tr>
                <td style="text-align: right"><label>Nombre EPS:</label></td>
                <td><input type="text" id="nomeps" name="nomeps" maxlength="398" size="80" value="<%out.print(datos[2]);%>"></td>
            </tr>
            <tr>
                <td style="text-align: right"><label>Nit:</label></td>
                <td><input type="text" id="nit" name="nit" maxlength="98" size="20" value="<%out.print(datos[1]);%>"></td>
            </tr>
            <tr>
                <td style="text-align: right"><label>Direccion EPS:</label></td>
                <td><input type="text" id="direccion" name="direccion" maxlength="398" size="50" value="<%out.print(datos[3]);%>"></td>
            </tr>
            <tr>
                <td style="text-align: right"><label>Ciudad EPS:</label></td>
                <td><input type="text" id="ciudad" name="ciudad" maxlength="198" size="50" value="<%out.print(datos[5]);%>"></td>
            </tr>
            <tr>
                <td style="text-align: right"><label>Telefono EPS:</label></td>
                <td><input type="text" id="telefono" name="telefono" maxlength="398" size="15" value="<%out.print(datos[4]);%>"></td>
            </tr>
            <tr>
                <td style="text-align: right"><label>Tipo EPS:</label></td>
                <td><input type="text" id="tipo" name="tipo" maxlength="198" size="50" value="<%out.print(datos[5]);%>"></td>
            </tr>
            <tr>
                <td style="text-align: center"><input type="submit" id="aceptar" name="aceptar" value="Guardar"></td>
                <td></td>
            </tr>
        </table>
        </form>
    <div id="resueps" name="resueps"></div>
</body>
</html>
