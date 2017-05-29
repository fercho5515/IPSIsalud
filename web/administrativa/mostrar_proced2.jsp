

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" language="javascript">
            $('#form_porcentaje').submit(function() {
       
                var por= document.getElementById("porcentaje").value;               
                if( por == null || por.length == 0 || /^\s+$/.test(por) ) {
                    alert('Digite el porcentaje');
                    return false;  
                } 
                  
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                              
                    success: function(data) {
                        $('#div_porcentaje').html(data);    
                        setTimeout ('recargaprocedcont()',500);
                        $.modal.close(); 
                    }                             
                })  
                return false;
            }); 
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

        String dato1 = request.getParameter("dato");
        String dato2 = request.getParameter("dato2");

        //datop=datop.replace('*',' ');
        //out.print(dato1);
        //out.print(dato2);

        //HttpSession sesion=request.getSession();
        //sesion.setAttribute("cup_update",datop);
        //out.println("Sesion==>"+sesion.getAttribute("cup_update"));

        String sql = " select cu.cup_verdadero,pt.codigo_maipos,pt.descripcion as d1,t.nombre as n1,tp.precio,tp.id_proced,tp.id_tarifario from procedimientos_tari pt, cups cu,tarifarios t,tari_proced tp  where pt.cod_cups=cu.id_cups and tp.id_proced=pt.idprocedimientos_tari  and t.id_tarifarios=tp.id_tarifario  and tp.id_tarifario='" + dato1 + "' and tp.id_proced='" + dato2 + "';";
        //out.print(sql);
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
                }
                if (resu.getString(6) != null) {
                    datos[5] = resu.getString(6);
                }
                if (resu.getString(7) != null) {
                    datos[6] = resu.getString(7);
                }
            }
        } catch (SQLException ex) {
        } catch (Exception exe) {
        }
        ba.cierraResultado(resu);
        ba.cerrar();
    %>
    <dvi id="div_porcentaje"></dvi>       
    <form id="form_porcentaje" name="form_porcentaje" method="post" action="insert_proctari_porc.jsp">
        <table style="height:100%;width:80%;padding-top:5px" align="center">
            <input type="hidden" id="id_proced" name="id_proced" value="<%out.print(datos[0]);%>"><br>
            <tr><td>
                    <label>CUP: </label>
                </td><td>
                    <input type="text" value="<%out.print(datos[0]);%>" readonly size="10"><br>
                </td></tr>
            <tr><td>
                    <label>MAPIPO: </label>
                </td><td>
                    <input type="text" value="<%out.print(datos[1]);%>" readonly size="10"><br>
                </td></tr>
            <tr><td>
                    <label>NOMBRE: </label>
                </td><td>
                    <input type="text" value="<%out.print(datos[2]);%>" readonly size="100"><br>
                </td></tr>
            <tr><td>
                    <label>TARIRIO </label>
                </td><td>
                    <input type="text" id="tarifario" name="tarifario" value="<%out.print(datos[3]);%>" readonly>
                </td></tr>
            <tr><td>
                    <label>PRECIO: </label>
                </td><td>
                    <input type="text" id="precio" name="precio" readonly value="<%out.print(datos[4]);%>">
                </td></tr>
            <tr><td>
                    <label>PORCENTAJE: </label>
                </td><td>
                    <input type="text" id="porcentaje" name="porcentaje">
                    <input type="hidden" id="id_procedcont" name="id_procedcont" value="<%out.print(datos[5]);%>">
                    <input type="hidden" id="id_taricont" name="id_taricont" value="<%out.print(datos[6]);%>">
                </td></tr>
            <tr><td colspan="2"><input type="submit" id="aceptar" name="aceptar" value="Agregar Procedimiento" onclick="add_proced();"></td></tr>
        </table>
    </form>
</body>
</html>
