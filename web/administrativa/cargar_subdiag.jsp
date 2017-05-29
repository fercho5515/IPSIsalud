
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
            var comprobar="";

            function cambia_c10(){
                var cambiarc10=document.getElementById("cie10").value;
                cambiarc10=cambiarc10.replace(/ /gi,'*');  
                $("#divc10").load("cambia_c10.jsp?dato="+cambiarc10+"");
            }

            function comprueba_sdiag2(){
                var compsd=document.getElementById("subcie10").value;
                compsd=compsd.replace(/ /gi,'*');
                $("#divcomp_sd").load("comprob_sd2.jsp?dato="+compsd+"");
            }
            $('#formsubcie10').submit(function() {
                var vcie10=document.getElementById("cie10").value;
                if(vcie10 == null ||vcie10.length == 0 || /^\s+$/.test(vcie10)){
                    alert('Codigo Cie10 es obligatorio ');
                    return false; 
                }
                //var vc10=document.getElementById("c10").value;
                /*
                                   if(vc10 == null ||vc10.length == 0 ||vc10=='Cie10 no Valido' || /^\s+$/.test(vsubcie10)){
                                                              alert('Codigo Cie10 no valido ');
                                                               return false; 
                                   }*/
                var vsubcie10=document.getElementById("subcie10").value;
                if(vsubcie10 == null ||vsubcie10.length == 0 || /^\s+$/.test(vsubcie10)){
                    alert('Codigo Subcie10 es obligatorio ');
                    return false; 
                }
                var vsub_d=document.getElementById("sub_d2").value;
                //alert(vsub_d);
                if(vsub_d == null ||vsub_d=='existe' || /^\s+$/.test(vsub_d)){
                    alert('Codigo Subcie10 repetido');
                    return false; 
                }
                var x=vcie10.length;
                var lista = vsubcie10.substring(0, x);
                if(lista != vcie10 || /^\s+$/.test(vsubcie10)){
                    alert('Codigo Subcie10 no compatible');
                    return false; 
                }
                var vdiagnostico=document.getElementById("diagnostico").value;
                if(vdiagnostico == null ||vdiagnostico.length == 0 || /^\s+$/.test(vdiagnostico)){
                    alert('Diagnostico es obligatorio ');
                    return false; 
                }
                           
                var vedadmin=document.getElementById("edadmin").value;
                var vedadmin2=$("input[name='edadmin2']:checked").val();
                if(vedadmin.length != 0 || /^\s+$/.test(vedadmin)){
                    var comp = parseInt(vedadmin);
                    if (isNaN(comp)) {
                        alert('Edad minima no valida');
                        return false;
                    }
                    else if(comp!=vedadmin || comp.toString()!=vedadmin.toString()){
                        alert('Edad minima no valida');
                        return false;
                    }
                    if(vedadmin2==0){
                        alert('Debes escoger una unidad para Edad Minima');
                        return false;
                    }
                }
                else if(vedadmin.length == 0){
                    if(vedadmin2==1||vedadmin2==2||vedadmin2==3){
                        alert('Debes escribir una Edad Minima');
                        return false;
                    }
                } 
                var vedadmax=document.getElementById("edadmax").value;
                var vedadmax2=$("input[name='edadmax2']:checked").val();
                if(vedadmax.length != 0 || /^\s+$/.test(vedadmax)){
                    var comp2 = parseInt(vedadmax);
                    if (isNaN(comp2)) {
                        alert('Edad maxima no valida');
                        return false;
                    }
                    else if(comp2!=vedadmax || comp2.toString()!=vedadmax.toString()){
                        alert('Edad maxima no valida');
                        return false;
                    }
                    if(vedadmax2==0){
                        alert('Debes escoger una unidad para Edad Maxima');
                        return false;
                    }
                }
                else if(vedadmax.length == 0){
                    if(vedadmax2==1||vedadmax2==2||vedadmax2==3){
                        alert('Debes escribir una Edad Maxima');
                        return false;
                    }
                } 
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                    success: function(data) {;
                        $('#resucie10').html(data);
                        $("#divconfcie10").load("<label>Exito</label>"); 
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

        String dato9 = request.getParameter("dato");
        //out.print(dato9);
        dato9 = dato9.replace('*', ' ');
        HttpSession sesion = request.getSession();
        sesion.setAttribute("codigo_sibcie10", dato9);
    %>
    <script type="text/javascript" language="javascript">
        comprobar="<%out.print("" + sesion.getAttribute("codigo_sibcie10"));%>";
        //alert(comprobar);
    </script>
    <%
        //out.println("Sesion==>"+sesion.getAttribute("codigo_sibcie10"));
        String sql = "select s.id_subcie10,s.cie10,s.descripcion,s.masc_fem,s.edad_minima,s.uni_edad_minima,s.edad_maxima,s.uni_edad_maxima,c.descripcion as descie10 from sub_cie10 s,cie10 c where c.idcie10=s.cie10 and id_subcie10='" + dato9 + "';";
        //out.print(sql); 
        ResultSet resu = null;
        try {
            resu = ba.consultas(sql);
        } catch (Exception e) {
        }
        String datos[] = new String[9];

        for (int i = 0; i < 9; i++) {
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
                if (resu.getString(8) != null) {
                    datos[7] = resu.getString(8);
                }//uni edad max
                if (resu.getString(9) != null) {
                    datos[8] = resu.getString(9);
                }//desc cie10
            }
        } catch (SQLException ex) {
        } catch (Exception exe) {
        }
        ba.cierraResultado(resu);
        //System.out.println("dato |"+datos[5]+"|");
%>
    <div id="divconfcie10" name="divconfcie10"></div>
    <form id="formsubcie10" name="formsubcie10" method="post" action="update_subcie10.jsp" accept-charset="UTF-8">
        <table>
            <tr>
                <td>
                    <fieldset><legend>CIE10</legend> 

                        <table>
                            <tr>
                                <td>
                                    <label>Codigo: </label><input type="text" name="cie10" size="10" id="cie10" maxlength="30" onkeyup="cambia_c10();" value="<%out.print(datos[1]);%>" readonly>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="divc10" name="divc10">
                                        <label>Nombre: </label><input type="text" name="c10" size="100" id="c10" maxlength="388" value="<%= datos[8] %>" readonly>
                                    </div> 
                                    <br>
                                </td>
                            </tr>
                        </table>

                    </fieldset>
                </td>
            </tr>

            <tr>
                <td>
                    <label>Codigo SUB-CIE10: </label>
                </td>
            </tr>

            <tr>
                <td>
                    <input type="text" name="subcie10" size="10" id="subcie10" maxlength="30" onkeyup="comprueba_sdiag2();" value="<%out.print(datos[0]);%>">
                    <div id="divcomp_sd"><input type="text" id="sub_d2" name="sub_d2" style="display: none"></div>
                </td>
            </tr>

            <tr>
                <td>
                    <label>Diagnostico: </label>
                </td>
            </tr>

            <tr>
                <td>
                    <input type="text" name="diagnostico" size="80" id="diagnostico" maxlength="150" value="<%out.print(datos[2]);%>">
                    <br>
                </td>
            </tr>

            <tr>
                <td>
                    <label>Sexo:</label>
                    <%
                        int dato;
                        try {
                            dato = Integer.parseInt(datos[3]);
                        } catch (Exception exe) {
                        }

                        if ((datos[3]) == null || datos[3].compareTo("") == 0) {
                    %>
                    <label>Masculino</label><input type="radio" id="sexo" name="sexo" value="1">
                    <label>Femenino</label><input type="radio" id="sexo" name="sexo" value="2">
                    <label>Ambos</label><input type="radio" name="sexo" id="sexo" value="3">
                    <%}
                        if (Integer.parseInt(datos[3]) == 3 || Integer.parseInt(datos[3]) == 0) {
                    %>
                    <label>Masculino</label><input type="radio" id="sexo" name="sexo" value="1">
                    <label>Femenino</label><input type="radio" id="sexo" name="sexo" value="2">
                    <label>Ambos</label><input type="radio" name="sexo" id="sexo" value="3" checked>
                    <%}
                        if (Integer.parseInt(datos[3]) == 2) {
                    %>
                    <label>Masculino</label><input type="radio" id="sexo" name="sexo" value="1">
                    <label>Femenino</label><input type="radio" id="sexo" name="sexo" value="2" checked>
                    <label>Ambos</label><input type="radio" name="sexo" id="sexo" value="3">
                    <%}
                        if (Integer.parseInt(datos[3]) == 1) {
                    %>
                    <label>Masculino</label><input type="radio" id="sexo" name="sexo" value="1" checked>
                    <label>Femenino</label><input type="radio" id="sexo" name="sexo" value="2">
                    <label>Ambos</label><input type="radio" name="sexo" id="sexo" value="3">
                    <%}
                    %>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Edad Minima</label>
                    <input type="text" size="6" maxlength="6" id="edadmin" name="edadmin" value="<%out.print(datos[4]);%>">
                    <label>en:</label>
                    <%
                        int dato2;
                        try {
                            dato2 = Integer.parseInt(datos[5]);
                        } catch (Exception exe) {
                        }
                    //out.print(datos[5]);
                        if (datos[5] == null || datos[5].compareTo("") == 0 || Integer.parseInt(datos[5]) == 0) {%>
                    <input type="radio" id="edadmin2" name="edadmin2" value="0" style="display: none" checked>
                    <input type="radio" id="edadmin2" name="edadmin2" value="1"><label>semanas</label>
                    <input type="radio" id="edadmin2" name="edadmin2" value="2"><label>meses</label>
                    <input type="radio" id="edadmin2" name="edadmin2" value="3"><label>años</label>
                    <%} else if (Integer.parseInt(datos[5]) == 3) {%>
                    <input type="radio" id="edadmin2" name="edadmin2" value="0" style="display: none">
                    <input type="radio" id="edadmin2" name="edadmin2" value="1"><label>semanas</label>
                    <input type="radio" id="edadmin2" name="edadmin2" value="2"><label>meses</label>
                    <input type="radio" id="edadmin2" name="edadmin2" value="3" checked><label>años</label>
                    <%} else if (Integer.parseInt(datos[5]) == 2) {%>
                    <input type="radio" id="edadmin2" name="edadmin2" value="0" style="display: none">
                    <input type="radio" id="edadmin2" name="edadmin2" value="1"><label>semanas</label>
                    <input type="radio" id="edadmin2" name="edadmin2" value="2" checked><label>meses</label>
                    <input type="radio" id="edadmin2" name="edadmin2" value="3"><label>años</label>
                    <%} else if (Integer.parseInt(datos[5]) == 1) {%>
                    <input type="radio" id="edadmin2" name="edadmin2" value="0" style="display: none">
                    <input type="radio" id="edadmin2" name="edadmin2" value="1" checked><label>semanas</label>
                    <input type="radio" id="edadmin2" name="edadmin2" value="2"><label>meses</label>
                    <input type="radio" id="edadmin2" name="edadmin2" value="3"><label>años</label>
                    <%}
                    %>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Edad Maxima</label>
                    <input type="text" name="edadmax" size="6" id="edadmax" maxlength="6" value="<%out.print(datos[6]);%>">
                    <label>en: </label>
                    <%
                        int dato3;
                        try {
                            dato3 = Integer.parseInt(datos[7]);
                        } catch (Exception exe) {
                        }

                        if (datos[7] == null || datos[7].compareTo("") == 0 || Integer.parseInt(datos[7]) == 0) {
                    %>
                    <input type="radio" id="edadmax2" name="edadmax2" value="0" style="display: none" checked>
                    <input type="radio" id="edadmax2" name="edadmax2" value="1"><label>semanas</label>
                    <input type="radio" id="edadmax2" name="edadmax2" value="2"><label>meses</label>
                    <input type="radio" id="edadmax2" name="edadmax2" value="3"><label>años</label>
                    <%} else if (Integer.parseInt(datos[7]) == 3) {
                    %>
                    <input type="radio" id="edadmax2" name="edadmax2" value="0" style="display: none">
                    <input type="radio" id="edadmax2" name="edadmax2" value="1"><label>semanas</label>
                    <input type="radio" id="edadmax2" name="edadmax2" value="2"><label>meses</label>
                    <input type="radio" id="edadmax2" name="edadmax2" value="3" checked><label>años</label>
                    <%} else if (Integer.parseInt(datos[7]) == 2) {
                    %>
                    <input type="radio" id="edadmax2" name="edadmax2" value="0" style="display: none">
                    <input type="radio" id="edadmax2" name="edadmax2" value="1"><label>semanas</label>
                    <input type="radio" id="edadmax2" name="edadmax2" value="2" checked><label>meses</label>
                    <input type="radio" id="edadmax2" name="edadmax2" value="3"><label>años</label>
                    <%} else if (Integer.parseInt(datos[7]) == 1) {
                    %>
                    <input type="radio" id="edadmax2" name="edadmax2" value="0" style="display: none">
                    <input type="radio" id="edadmax2" name="edadmax2" value="1" checked><label>semanas</label>
                    <input type="radio" id="edadmax2" name="edadmax2" value="2"><label>meses</label>
                    <input type="radio" id="edadmax2" name="edadmax2" value="3"><label>años</label>
                    <%}%>
                </td>
            <tr>
                <td style="text-align:left;width:70%">
                    <input type="submit" value="Guardar" name="aceptar" size="25" id="aceptar" maxlength="30"><br>
                </td>
            </tr>
        </table>
    </form>
    <div id="resucie10" name="resucie10"></div>
</body>
</html>
<% ba.cerrar(); %>