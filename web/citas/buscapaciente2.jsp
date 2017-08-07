<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pac.edad"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            .letra input{
                font-family: Arial;
                font-size: 10px;
            }
        </style>
    </head>
    <body>
        <%
            if (session.getAttribute("nombre") == null || session.getAttribute("clave") == null || session.getAttribute("id") == null || session.getAttribute("permiso") == null) {
            } else {
                //System.out.print(request.getParameter("id_citas"));
                String id = request.getParameter("id_citas");
//                System.out.print("este es el id=====>"+id);
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb();
                String sql = "select p_nom,s_nom,p_ape,s_ape,id_person,fecha_naci,es.descripcion,nivel_sisben,pe.genero,rh.descripcion,";
                sql = sql + "mu.descripcion, de.descripcion,barrio,pe.direccion,pe.email,pe.telefono,ne.descripcion,eps.nombre,nu_carnet,";
                sql = sql + "pa.cod_zona,pe.foto,ori.descripcion,pa.vih,tu.descripcion from personas pe, pacientes pa, estado_civil es, rh,oreintacion_sex ori,departamento de, municipio mu,tipo_usuario tu,";
                sql = sql + "nivel_educativo ne,eps where pa.serial_persona=pe.serial and pa.id_tipo_usuario=tu.id_tipo_usuario and  pe.id_person='" + id + "' ";
                sql = sql + "and es.idestado_civil=pa.cod_estado_civil ";
                sql = sql + "and rh.id_rh=pe.id_rh ";
                sql = sql + "and ori.id_sex=pa.id_orientacion ";
                sql = sql + "and mu.id_muni=pe.id_muni ";
                sql = sql + "and ne.id_nivel=pa.id_nivel_educativo ";
                sql = sql + "and eps.ideps=pe.id_eps;";

            //    System.out.print("aca esta:"+sql);
                ResultSet resu = null;
                try {
                    resu = ba.consultas(sql);
                } catch (Exception e) {
                }


                String datos[] = new String[24];

                for (int i = 0; i < 24; i++) {
                    datos[i] = "";
                }


                try {
                    while (resu.next() && resu != null) {
                        if (resu.getString(1) != null) {
                            datos[0] = resu.getString(1);
                        }//primer nonbre
                        if (resu.getString(2) != null) {
                            datos[1] = resu.getString(2);
                        }//segundo nombre
                        if (resu.getString(3) != null) {
                            datos[2] = resu.getString(3);
                        }//primer apellido
                        if (resu.getString(4) != null) {
                            datos[3] = resu.getString(4);
                        }//segundo apellido
                        if (resu.getString(5) != null) {
                            datos[4] = resu.getString(5);
                        }//cedula
                        if (resu.getString(6) != null) {
                            datos[5] = resu.getString(6);
                        }//fecha nacimiento
                        if (resu.getString(7) != null) {
                            datos[6] = resu.getString(7);
                        }//estado civil
                        if (resu.getString(8) != null) {
                            datos[7] = resu.getString(8);
                        }//nivel sisven
                        if (resu.getString(9) != null) {
                            datos[8] = resu.getString(9);
                        }//genero
                        if (resu.getString(10) != null) {
                            datos[9] = resu.getString(10);
                        }//rh
                        if (resu.getString(11) != null) {
                            datos[10] = resu.getString(11);
                        }//municipio
                        if (resu.getString(12) != null) {
                            datos[11] = resu.getString(12);
                        }//departamento
                        if (resu.getString(13) != null) {
                            datos[12] = resu.getString(13);
                        }//barrio
                        if (resu.getString(14) != null) {
                            datos[13] = resu.getString(14);
                        }//direccion
                        if (resu.getString(15) != null) {
                            datos[14] = resu.getString(15);
                        }//email
                        if (resu.getString(16) != null) {
                            datos[15] = resu.getString(16);
                        }//telefono
                        if (resu.getString(17) != null) {
                            datos[16] = resu.getString(17);
                        }//nivel educativo
                        if (resu.getString(18) != null) {
                            datos[17] = resu.getString(18);
                        }//eps
                        if (resu.getString(19) != null) {
                            datos[18] = resu.getString(19);
                        }//numero carnet
                        if (resu.getString(20) != null) {
                            datos[19] = resu.getString(20);
                        }//zona
                        if (resu.getString(21) != null) {
                            datos[20] = resu.getString(21);
                        }//foto
                        if (resu.getString(22) != null) {
                            datos[21] = resu.getString(22);
                        }//orientacion sexual
                        if (resu.getString(23) != null) {
                            datos[22] = resu.getString(23);
                        }//vih
                        if (resu.getString(24) != null) {
                            datos[23] = resu.getString(24);
                        }//tipo usuario
                    }
                } catch (SQLException ex) {
                } catch (Exception exe) {
                }


                ba.cierraResultado(resu);
                ba.cerrar();


        %>
        <table  style="width:100%" border="0">
            <tr>
                <td style="width:14%"><label class="letra">Primer Nombre </label></td>
                <td style="width:14%"><label class="letra">Segundo Nombre </label></td>
                <td style="width:14%"><label class="letra">Primer Apellido </label></td>
                <td style="width:14%"><label class="letra">Segundo Apellido </label></td>
                <td style="width:14%"><label class="letra">Cedula </label></td>
                <td style="width:14%"><label class="letra">RH </label></td>
                <td style="width:14%" rowspan="8"><input type="image" name="fo" size="15" id="fo" src="../imagenes/fotos/<% out.print(datos[20]);%>" alt="Pintura geomÃ©trica" style="width:100%;height:150px"></td>
            </tr>
            <!--Segunda Fila-->
            <tr class="letra">
                <td>
                    <input type="text" name="nombre1" size="15" id="nombre1" maxlength="30" disabled="disabled" value="<% out.print(datos[0]);%>">
                </td>
                <td>
                    <input type="text" name="nombre2" size="15" id="nombre2" maxlength="30" disabled="disabled" value="<% out.print(datos[1]);%>">
                </td>
                <td>
                    <input type="text" name="apellido1" size="15" id="apellido1" maxlength="30" disabled="disabled" value="<% out.print(datos[2]);%>">
                </td>
                <td>
                    <input type="text" name="apellido2" size="15" id="apellido2" maxlength="30" disabled="disabled"  value="<% out.print(datos[3]);%>">
                </td>
                <td>
                    <input type="text" name="numidentificacion" size="15" id="numidentificacion" maxlength="30" disabled="disabled" value="<% out.print(datos[4]);%>">
                </td>
                <td>
                    <input type="text" name="rh" size="15" id="rh" maxlength="30" disabled="disabled"  value="<% out.print(datos[9]);%>">
                </td>
            </tr>
            <!--Tercera Fila-->
            <tr>
                <td><label class="letra">Fecha de Nacimiento </label></td>
                <td><label class="letra">Edad </label></td>
                <td><label class="letra">Estado Civil </label></td>
                <td><label class="letra">Nivel Sisben </label></td>
                <td><label class="letra">Sexo </label></td>
                <td><label class="letra">Orientacion Sexual </label></td>
            </tr>
            <!--Cuarta Fila-->
            <tr class="letra">
                <td>
                    <input type="text" name="fechanacimiento" size="15" id="fechanacimiento" maxlength="30" disabled="disabled" value="<% out.print(datos[5]);%>">
                </td>
                <td>
                    <%  String fechanaci = datos[5];
                        edad s = new edad();
                        String adadcita = s.edad(fechanaci);
                    %>
                    <input type="text" name="edad" size="15" id="edad" maxlength="30" disabled="disabled" value="<% out.print(adadcita);%>">
                </td>
                <td>
                    <input type="text" name="estadocivil" size="15" id="estadocivil" maxlength="30" disabled="disabled" value="<% out.print(datos[6]);%>">
                </td>
                <td>
                    <input type="text" name="nivelsisben" size="15" id="nivelsisben" maxlength="30" disabled="disabled" value="<% out.print(datos[7]);%>">
                </td>
                <td>
                    <input type="text" name="sexo" size="15" id="sexo" maxlength="30" disabled="disabled" value="<% out.print(datos[8]);%>">
                </td>
                <td>
                    <input type="text" name="orientacionsexual" size="15" id="orientacionsexual" maxlength="30" disabled="disabled" value="<% out.print(datos[21]);%>">
                </td>
            </tr>
            <!--Quinta Fila-->
            <!--Sexta Fila-->
            <!--Septima Fila-->
            <tr>
                <td><label class="letra">Departamento </label></td>
                <td><label class="letra">Ciudad </label></td>
                <td><label class="letra">Barrio </label></td>
                <td><label class="letra">Direccion </label></td>
                <td><label class="letra">VIH </label></td>
                <td></td>
            </tr>
            <!--Octava Fila-->
            <tr class="letra">
                <td>
                    <input type="text" name="departamento" size="15" id="departamento" maxlength="30" disabled="disabled" value="<% out.print(datos[11]);%>" >
                </td>
                <td>
                    <input type="text" name="ciudad" size="15" id="ciudad" maxlength="30" disabled="disabled" value="<% out.print(datos[10]);%>">
                </td>
                <td>
                    <input type="text" name="barrio" size="15" id="barrio" maxlength="30" disabled="disabled" value="<% out.print(datos[12]);%>">
                </td>
                <td>
                    <input type="text" name="direccion" size="15" id="direccion" maxlength="30" disabled="disabled" value="<% out.print(datos[13]);%>">
                </td>
                <td>
                    <input type="text" name="vih" size="15" id="vih" maxlength="30" disabled="disabled" value="<% out.print(datos[22]);%>">
                </td>
                <td></td>
            </tr>
        </table>
        <% }%>
    </body>
</html>