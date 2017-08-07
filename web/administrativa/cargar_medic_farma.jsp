<%-- 
    Document   : cargar_medic
    Created on : 27-may-2013, 17:51:32
    Author     : Fercho
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" language="javascript">
            
            function cambia_vendedor(){
             
                var vdistribuidor=document.getElementById("distribuidor").value;
                //comp_signo=comp_signo.replace(/ /gi,'*');
                //comp_s_signo=comp_s_signo.replace(/ /gi,'*');
                //alert(comp_signo);
                $("#div_vendedor").load("select_vendedores.jsp?dato="+vdistribuidor+"");
                          
            }
            
            $(function(){
                $("#calendariofecfab").datepicker({
                    //inline:true
                    showOn:'both',
                    buttonImageOnly:true,
                    buttonImage:'../imagenes/fotos/calendar.gif',
                    firstDay:1,
                    changeMonth:true,
                    changeYear:true
                });	
                $('#calendariofecfab').datepicker($.datepicker.regional['es']);
                $('#calendariofecfab').datepicker("option","showAnim","slideDown");
                $('#calendariofecfab').datepicker("option","dateFormat","yy-mm-dd");
		     		
            });
            $(function(){
                $("#calendariofecven").datepicker({
                    //inline:true
                    showOn:'both',
                    buttonImageOnly:true,
                    buttonImage:'../imagenes/fotos/calendar.gif',
                    firstDay:1,
                    changeMonth:true,
                    changeYear:true
                });	
                $('#calendariofecven').datepicker($.datepicker.regional['es']);
                $('#calendariofecven').datepicker("option","showAnim","slideDown");
                $('#calendariofecven').datepicker("option","dateFormat","yy-mm-dd");
		     		
            });
        
            $('#form_insert_inventario').submit(function() {
                           
                var vcum=document.getElementById("cum").value;
                if(vcum == null ||vcum.length == 0 || /^\s+$/.test(vcum)){
                    alert('Codigo CUM es obligatorio ');
                    return false; 
                }
                var vproducto=document.getElementById("producto").value;
                if(vproducto == null ||vproducto.length == 0 ||vproducto.length > 398|| /^\s+$/.test(vproducto)){
                    alert('No has descrito el Medicamento, o has sobrepasado el límite de caracteres (398)');
                    return false; 
                }
                var vatc=document.getElementById("atc").value;
                if(vatc == null ||vatc.length == 0 || /^\s+$/.test(vatc)){
                    alert('Codigo ATC es obligatorio ');
                    
                }
                var vconcentracion=document.getElementById("concentracion").value;
                if(vconcentracion == null ||vconcentracion.length == 0 || /^\s+$/.test(vconcentracion)){
                    alert('Concentracion es obligatoria ');
                    return false; 
                }  
                
                var distribuidor=document.getElementById("distribuidor").value;
                if(distribuidor == 0 ||distribuidor == null||distribuidor.length == 0 || /^\s+$/.test(distribuidor)){
                    alert('Escoja Distribuidor');
                    return false; 
                }  
                
                var vvendedor=document.getElementById("vendedor").value;
                if(vvendedor == 0 ||vvendedor == null||vvendedor.length == 0 || /^\s+$/.test(vvendedor)){
                    alert('Escoja Vendedor');
                    return false; 
                }  
                
                var vlaboratorio=document.getElementById("laboratorio").value;
                if(vlaboratorio == 0 ||vlaboratorio == null||vlaboratorio.length == 0 || /^\s+$/.test(vlaboratorio)){
                    alert('Escoja Laboratorio');
                    return false; 
                }  
                
                var vnumfac=document.getElementById("numfac").value;
                if(vnumfac == null||vnumfac.length == 0 || /^\s+$/.test(vnumfac)){
                    alert('Digite numero de factura');
                    return false; 
                }
                
                var vlote=document.getElementById("lote").value;
                if(vlote == null||vlote.length == 0 || /^\s+$/.test(vlote)){
                    alert('Digite el lote');
                    return false; 
                }  
                
                var vinvima=document.getElementById("invima").value;
                if(vinvima == null||vinvima.length == 0 || /^\s+$/.test(vinvima)){
                    alert('Digite codigo de INVIMA');
                    return false; 
                }  
                var vcalendariofecfab=document.getElementById("calendariofecfab").value;
                if(vcalendariofecfab == null||vcalendariofecfab.length == 0 || /^\s+$/.test(vcalendariofecfab)){
                    alert('Seleccione fecha de fabricacion');
                    return false; 
                }
                
                var vcalendariofecven=document.getElementById("calendariofecven").value;
                if(vcalendariofecven == null||vcalendariofecven.length == 0 || /^\s+$/.test(vcalendariofecven)){
                    alert('Seleccione fecha de vencimiento');
                    return false; 
                }
                
                var vcantidadcomprada=document.getElementById("cantidadcomprada").value;
                var comp = parseInt(vcantidadcomprada);
                if (isNaN(comp)) {
                    alert('Cantidad no valida');
                    return false;
                }
                else if(comp!=vcantidadcomprada || comp.toString()!=vcantidadcomprada.toString()){
                    alert('Cantidad no valida');
                    return false;
                }
                
                var vvalorcompra=document.getElementById("valorcompra").value;
                var compval = parseFloat(vvalorcompra);
                //compval2=compval%1;
                //alert(compval);
                if (compval!=vvalorcompra || compval.toString()!=vvalorcompra.toString()) {
                    alert('Valor no valido');
                                   
                    return false;
                }
                
                var vdescuento=document.getElementById("descuento").value;
                var compdes = parseFloat(vdescuento);
                //compval2=compval%1;
                //alert(compval);
                if (compdes!=vdescuento || compdes.toString()!=vdescuento.toString()) {
                    alert('Descuento no valido');
                                   
                    return false;
                }
                
                var vimpuesto=document.getElementById("impuesto").value;
                var compimp = parseFloat(vimpuesto);
                //compval2=compval%1;
                //alert(compval);
                if (compimp!=vimpuesto || compimp.toString()!=vimpuesto.toString()) {
                    alert('impuesto no valido');
                                   
                    return false;
                }                   
                
                var vcodigobarras=document.getElementById("codigobarras").value;
                if(vcodigobarras == null||vcodigobarras.length == 0 || /^\s+$/.test(vcodigobarras)){
                    alert('Digite codigo barras');
                    return false; 
                }  
                
                
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                    dataType: "json",
                    success: function(data) {
                        alert(data.msj);
                        if(data.est==1){
                           $("#div_datos_medic").html("");
                        }
                       // $('#resumed').html(data);
                       // $("#divconfmed").load("<label>Exito</label>"); 
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

        String datop = request.getParameter("dato");
        datop = datop.replace('*', ' ');
        //out.print(datop);

        HttpSession sesion = request.getSession();
        sesion.setAttribute("cup_update", datop);
        //out.println("Sesion==>"+sesion.getAttribute("cup_update"));

        String sql = "select * from medicamentos where serial='" + datop + "';";
        //out.print(sql); 
        ResultSet resu = null;
        try {
            resu = ba.consultas(sql);
        } catch (Exception e) {
        }
        String datos[] = new String[32];

        for (int i = 0; i < 32; i++) {
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
                }
                if (resu.getString(9) != null) {
                    datos[8] = resu.getString(9);
                }
                if (resu.getString(10) != null) {
                    datos[9] = resu.getString(10);
                }
                if (resu.getString(11) != null) {
                    datos[10] = resu.getString(11);
                }
                if (resu.getString(12) != null) {
                    datos[11] = resu.getString(12);
                }
                if (resu.getString(13) != null) {
                    datos[12] = resu.getString(13);
                }
                if (resu.getString(14) != null) {
                    datos[13] = resu.getString(14);
                }
                if (resu.getString(15) != null) {
                    datos[14] = resu.getString(15);
                }
                if (resu.getString(16) != null) {
                    datos[15] = resu.getString(16);
                }
                if (resu.getString(17) != null) {
                    datos[16] = resu.getString(17);
                }
                if (resu.getString(18) != null) {
                    datos[17] = resu.getString(18);
                }
                if (resu.getString(19) != null) {
                    datos[18] = resu.getString(19);
                }
                if (resu.getString(20) != null) {
                    datos[19] = resu.getString(20);
                }
                if (resu.getString(21) != null) {
                    datos[20] = resu.getString(21);
                }
                if (resu.getString(22) != null) {
                    datos[21] = resu.getString(22);
                }
                if (resu.getString(23) != null) { 
                    datos[22] = resu.getString(23);
                }
                if (resu.getString(24) != null) {
                    datos[23] = resu.getString(24);
                }
                if (resu.getString(25) != null) {
                    datos[24] = resu.getString(25);
                }
                if (resu.getString(26) != null) {
                    datos[25] = resu.getString(26);
                }
                if (resu.getString(27) != null) {
                    datos[26] = resu.getString(27);
                }
                if (resu.getString(28) != null) {
                    datos[27] = resu.getString(28);
                }
                if (resu.getString(29) != null) {
                    datos[28] = resu.getString(29);
                }
                if (resu.getString(30) != null) {
                    datos[29] = resu.getString(30);
                }
                if (resu.getString(31) != null) {
                    datos[30] = resu.getString(31);
                }
                if (resu.getString(32) != null) {
                    datos[31] = resu.getString(32);
                }

            }
        } catch (SQLException ex) {
        } catch (Exception exe) {
        }
        ba.cierraResultado(resu);
    %>
    <form id="form_insert_inventario" name="form_insert_inventario" action="insert_inventario.jsp" method="post">
        <table style="height:100%;width:100%;padding-top:5px" align="center" border="0">
            <tbody valign="top">
                <tr>
                    <td style="width:40%">
                        <fieldset><legend>Medicamento</legend>
                            <table style="width:100%" border="0" align="left">
                                <tr>
                                    <td style="width:33%">
                                        <input type="hidden" id="serial_med" name="serial_med" value="<%out.print(datos[0]);%>">   
                                        <label for="codigo">CUM: </label>
                                    </td>
                                    <td style="width:33%">

                                        <label for="atc">Consecutivo: </label>
                                    </td>
                                    <td style="width:33%">
                                        <label for="viaadministracion">Registró Sanitario: </label>
                                    </td>
                                </tr>

                                <!-----2da fila---->

                                <tr>
                                    <td>
                                        <input type="text" name="cum" size="15" id="cum" maxlength="30" value="<%out.print(datos[1]);%>" readonly>
                                    </td>
                                    <td>
                                        <input type="text" name="consecutivo" size="15" id="consecutivo" maxlength="30" value="<%out.print(datos[8]);%>" readonly> 
                                    </td>
                                    <td>
                                        <!--<div id="divia" name="divia">-->
                                            <input type="text" name="atc" size="15" id="registrosanitario" maxlength="30" value="<%out.print(datos[4]);%>" readonly> 
<!--                                            <select name="via" id="via" maxlength="30" disabled="disabled">-->
                                                <%
//                                                    String sqlvia = "select * from via_admin;";
//                                                    ResultSet resuvia = ba.consultas(sqlvia);
//                                                    try {
//                                                        while (resuvia.next() && resuvia != null) {
//                                                            if (datos[6].compareTo("" + resuvia.getString(1) + "") == 0) {
//                                                                out.print("<option value='" + resuvia.getString(1) + "' SELECTED>" + resuvia.getString(2) + "</option>");
//                                                            } else {
//                                                                out.print("<option value='" + resuvia.getString(1) + "'>" + resuvia.getString(2) + "</option>");
//                                                            }
//                                                        }
//                                                    } catch (SQLException e) {
//                                                    } catch (Exception ex) {
//                                                    }
                                                %>  
<!--                                            </select>
                                        </div>-->
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <label for="producto">Producto: </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">    
                                        <input type="text" name="producto" size="75" id="producto" maxlength="500" value="<%out.print(datos[2]);%>" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <label for="principioactivo">Descripción Comercial: </label>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <input type="text" name="principioa" size="75" id="principioa" maxlength="500" value="<%out.print(datos[10]);%>" readonly>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <label for="principioactivo">Principio Activo: </label>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <input type="text" name="principioa" size="75" id="principioa" maxlength="500" value="<%out.print(datos[20]);%>" readonly>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <label for="formafarmaceutica">Forma Farmaceutica: </label>
                                    </td>
                                    <td>
                                        <label for="concentracion">Concentracion: </label>
                                    </td>
                                    <td>
                                        <label for="unidadmedida">Unidad de Medida: </label>
                                    </td>
                                </tr>

                                <!-----4ta fila---->

                                <tr>
                                    <td>
                                        <input type="text" name="concentracion" size="15" id="formafarma" maxlength="30" value="<%out.print(datos[24]);%>" readonly>
<!--                                        <div id="divforma" name="divforma">
                                            <select name="forma" id="forma" maxlength="30" disabled="disabled">
                                                <%
//                                                    String sql9 = "select * from forma_farmaceutica;";
//                                                    ResultSet resu1 = ba.consultas(sql9);
//                                                    try {
//                                                        while (resu1.next() && resu1 != null) {
//                                                            if (datos[5].compareTo("" + resu1.getString(1) + "") == 0) {
//                                                                out.print("<option value='" + resu1.getString(1) + "' SELECTED>" + resu1.getString(2) + "</option>");
//                                                            } else {
//                                                                out.print("<option value='" + resu1.getString(1) + "'>" + resu1.getString(2) + "</option>");
//                                                            }
//                                                        }
//                                                    } catch (SQLException e) {
//                                                    } catch (Exception ex) {
//                                                    }

                                                %>  
                                            </select>
                                        </div>-->

                                    </td>

                                    <td>
                                        <input type="text" name="concentracion" size="15" id="concentracion" maxlength="30" value="<%out.print(datos[7]);%>" readonly>
                                    </td>
                                    <td>
                                        <div id="divunidad" name="divunidad">
                                            <input type="text" name="concentracion" size="15" id="concentracion" maxlength="30" value="<%out.print(datos[21]);%>" readonly>
                                        </div>
                                    </td>
                                </tr>

                                <!--FILA-->
                                 <tr>
                                    <td colspan="2">
                                        <label for="formafarmaceutica">Laboratorio: </label>
                                    </td>
                                    <td>
                                        <label for="concentracion">Concentracion: </label>
                                    </td>
                                </tr>

                                <!-----fila---->

                                <tr>
                                    <td colspan="2">
                                        <input type="text" name="concentracion" size="45" id="formafarma" maxlength="30" value="<%out.print(datos[3]);%>" readonly>
                                    </td>

                                    <td>
                                        <input type="text" name="concentracion" size="15" id="concentracion" maxlength="30" value="<%out.print(datos[23]);%>" readonly>
                                    </td>
                                </tr>

                            </table>
                        </fieldset>


                    </td>
                    <td style="width:60%">
                        <table style="width:100%;padding-top:5px" align="center">
                            <!-- 
                            <tr>
                            <td>
                            <label>Serial Inventario: </label> 
                            <input type="text" name="serialinventario" size="25" id="serialinventario" maxlength="30" disabled="disabled">
                            </td>
                            </tr>
                            -->

                            <tr>
                                <td>
                                    <fieldset>
                                        <legend>Distribuidor</legend>
                                        <table style="width:100%">

                                            <tr>

                                                <td style="width:15%">
                                                    <label>Distribuidor: </label>
                                                </td>

                                                <td style="width:35%">
                                                    <select name="distribuidor" id="distribuidor" style="width:85%" onchange="cambia_vendedor();">
                                                          <option value="0">--Escoja Distribuidor--</option>
                                                        <%
                                                            String sqldistri = "select * from distribuidores;";
                                                            ResultSet resudistri = ba.consultas(sqldistri);
                                                            try {
                                                                while (resudistri.next() && resudistri != null) {
                                                                        out.print("<option value='" + resudistri.getString(1) + "'>" + resudistri.getString(2) + "</option>");
                                                                    
                                                                }
                                                            } catch (SQLException e) {
                                                            } catch (Exception ex) {
                                                            }
                                                        %>  
                                                    </select>
                                                </td>


                                                <td style="width:15%">
                                                    <label>Vendedor: </label>
                                                </td>

                                                <td style="width:35%">
                                                    <div id="div_vendedor" name="div_vendedor">
                                                        <select name="vendedor" id="vendedor" style="width:85%"></select>
                                                    </div>
                                                </td>

                                            </tr>

                                            <tr>

                                                <td>
                                                    <label>Laboratorio: </label>
                                                </td>

                                                <td>
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
                                                </td>

                                                <td>
                                                    <label>Numero de Factura: </label>
                                                </td>

                                                <td>
                                                    <input type="text" size="40" name="numfac" id="numfac" maxlength="50">
                                                </td>

                                            </tr>

                                        </table>
                                    </fieldset>
                                    <br>
                                    <fieldset>
                                        <legend>Fabricacion</legend>
                                        <table style="width:100%">

                                            <tr>

                                                <td style="width:15%">
                                                    <label>Lote: </label>
                                                </td>

                                                <td style="width:35%">
                                                    <input name="lote" id="lote" style="width:85%">
                                                </td>


                                                <td style="width:15%">
                                                    <label>Invima: </label>
                                                </td>

                                                <td style="width:35%">
                                                    <input name="invima" id="invima" style="width:85%">
                                                </td>

                                            </tr>

                                            <tr>

                                                <td>
                                                    <label>Fecha de Fabricacion: </label>
                                                </td>

                                                <td>
                                                    <input type="text" name="calendariofecfab" id="calendariofecfab" style="width:60%">
                                                </td>

                                                <td>
                                                    <label>Fecha de Vencimiento:</label>
                                                </td>

                                                <td>
                                                    <input type="text" name="calendariofecven" id="calendariofecven" style="width:60%">
                                                </td>

                                            </tr>
                                        </table>
                                    </fieldset>

                                    <br>

                                    <fieldset>
                                        <legend>Compra</legend>
                                        <table>
                                            <tr>
                                                <td style="width:20%">
                                                    <label>Cantidad Comprada: </label>
                                                </td>
                                                <td style="width:30%">
                                                    <input type="text" name="cantidadcomprada" size="25" id="cantidadcomprada" maxlength="30">
                                                </td>
                                                <td style="width:20%">
                                                    <label>Valor de Compra: </label>
                                                </td>
                                                <td style="width:30%">
                                                    <input type="text" name="valorcompra" size="25" id="valorcompra" maxlength="30">
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <label>Descuento: </label>
                                                </td>
                                                <td>
                                                    <input type="text" name="descuento" size="25" id="descuento" maxlength="30">
                                                </td>
                                                <td>
                                                    <label>Impuesto: </label>
                                                </td>
                                                <td>
                                                    <input type="text" name="impuesto" size="25" id="impuesto" maxlength="30">
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <label>Ubicacion Fisica: </label>
                                                </td>
                                                <td>
                                                    <input type="text" name="ubicacion" size="25" id="ubicacion" maxlength="30">
                                                </td>
                                                <td>
                                                    <label>Codigo de Barras: </label>
                                                </td>
                                                <td>
                                                    <input type="text" name="codigobarras" size="25" id="codigobarras" maxlength="30">
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">  <center><input type="submit" id="aceptar" value="Guardar"></center> </td>
            </tr>




        </table>
    </form>
    <div id="resumed" name="resumed"></div>
    <div id="divconfmed" name="divconfmed"></div>
</body>
</html>
<% ba.cerrar(); %>
