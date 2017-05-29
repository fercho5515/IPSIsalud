<%-- 
    Document   : editarinventariofarmacia
    Author     : VAIO
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
                $("#div_vendedor").load("select_vendedores.jsp?dato="+vdistribuidor+"");                          
        }
            
        
        $('#form_update_inventario').submit(function() {
                           
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
                    return false; 
                }
                var vconcentracion=document.getElementById("concentracion").value;
                if(vconcentracion == null ||vconcentracion.length == 0 || /^\s+$/.test(vconcentracion)){
                    alert('Concentracion es obligatoria ');
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
                //var compval = parseFloat(vvalorcompra);
                //compval2=compval%1;
                //alert(compval);
                if (!/^([0-9])*[.]?[0-9]*$/.test(vvalorcompra)) {
                    alert('Valor no valido');                                   
                    return false;
                }
                
                var vdescuento=document.getElementById("descuento").value;
                //var compdes = parseFloat(vdescuento);
                //compval2=compval%1;
                //alert(compval);
                
                if (!/^([0-9])*[.]?[0-9]*$/.test(vdescuento)) {
                    alert('Valor no valido');                                   
                    return false;
                }
                
                var vimpuesto=document.getElementById("impuesto").value;
                //var compimp = parseFloat(vimpuesto);
                //compval2=compval%1;
                //alert(compval);
                if (!/^([0-9])*[.]?[0-9]*$/.test(vimpuesto)) {
                    alert('Valor no valido');                                   
                    return false;
                }              
                
                var vcodigobarras=document.getElementById("codigobarras").value;
                if(vcodigobarras == null||vcodigobarras.length == 0 || /^\s+$/.test(vcodigobarras)){
                    alert('Digite codigo barras');
                    return false; 
                }  
                
                var existencias=document.getElementById("existencias").value;
                if (! /^\d*$/.test(existencias)) {
                    alert('Existencias numero no valido');
                    return false;
                }
             
                var ccant=$("#cantidadcompradaant").val(); 
                var exant=$("#existenciasant").val(); 
                
                
                if((vcantidadcomprada != ccant) && (existencias==exant)){
                    var r = confirm("Esta a punto de actualizar la cantidad comprada, pero no el número de existencias es decir la cantidad del medicamento que realmente está en farmacia, si esto es correcto oprima continuar de lo Aceptar, oprime cancelar y realice las correcciones del caso");
                    if (r == true) { }
                    else {return false; }                    
                }
                else if((vcantidadcomprada == ccant) && (existencias!=exant)){
                    var r = confirm("Esta a punto de actualizar el número de existencias, pero no la cantidad comprada es decir cuanto medicamento se recibió al momento de hacer el pedido, si esto es correcto oprima Aceptar de lo contrario, oprime cancelar y realice las correcciones del caso");
                    if (r == true) { }
                    else {return false; }                    
                }
                
                
                
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                    dataType: "json",
                    success: function(data) {
                        alert(data.msj);
                        if(data.est==1){
                           $("#editarinvfarmacia").html("");
                        jQuery("#listinventariofarmacia").jqGrid('setCaption',"Medicamentos").trigger('reloadGrid');
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
        String datoi = request.getParameter("datoo");

        datop = datop.replace('*', ' ');
        //out.print(datop);

        HttpSession sesion = request.getSession();
        //sesion.setAttribute("cup_update", datop);
        //out.println("Sesion==>"+sesion.getAttribute("cup_update"));
        
        String sqlinv="select serial_inven,cod_distri,cod_vendedor,cod_medicamento,laboratorio,lote,fecha_fab,fecha_ven,cantidad_comprada,descuento,valor_compra,impuesto,num_factura,existencias,ubicacion,cod_barras,invima,id_empleado from inventario_farmacia,vendedores where id_vendedor=cod_vendedor and serial_inven='"+datoi+"'";
        String datosinvent[]= new String[18];
        try{
            ResultSet resuinv = null;
            resuinv = ba.consultas(sqlinv);
              while (resuinv.next() && resuinv != null) {
                if (resuinv.getString(1) != null)  { datosinvent[0] = resuinv.getString(1);}//serial_inven
                if (resuinv.getString(2) != null)  { datosinvent[1] = resuinv.getString(2);}//cod_distribuidor
                if (resuinv.getString(3) != null)  { datosinvent[2] = resuinv.getString(3);}//cod_vendedor
                if (resuinv.getString(4) != null)  { datosinvent[3] = resuinv.getString(4);}//cod_medicamento
                if (resuinv.getString(5) != null)  { datosinvent[4] = resuinv.getString(5);}//laboratorio 
                if (resuinv.getString(6) != null)  { datosinvent[5] = resuinv.getString(6);}//lote
                if (resuinv.getString(7) != null)  { datosinvent[6] = resuinv.getString(7);}//fecha_fab
                if (resuinv.getString(8) != null)  { datosinvent[7] = resuinv.getString(8);}//fecha_ven
                if (resuinv.getString(9) != null)  { datosinvent[8] = resuinv.getString(9);}//cantidad_comprada
                if (resuinv.getString(10) != null) { datosinvent[9] = resuinv.getString(10);}//descuento
                if (resuinv.getString(11) != null) { datosinvent[10] = resuinv.getString(11);}//valor_compra
                if (resuinv.getString(12) != null) { datosinvent[11] = resuinv.getString(12);}//impuesto
                if (resuinv.getString(13) != null) { datosinvent[12] = resuinv.getString(13);}//num_factura
                if (resuinv.getString(14) != null) { datosinvent[13] = resuinv.getString(14);}//existencias
                if (resuinv.getString(15) != null) { datosinvent[14] = resuinv.getString(15);}//ubicacion
                if (resuinv.getString(16) != null) { datosinvent[15] = resuinv.getString(16);}//cod_barras
                if (resuinv.getString(17) != null) { datosinvent[16] = resuinv.getString(17);}//invima
                if (resuinv.getString(18) != null) { datosinvent[17] = resuinv.getString(18);}//id_empleado
            }            
        }
        catch(Exception exe){}
        

        String sql = "select * from medicamentos where serial='" + datop + "';";
       
        ResultSet resu = null;
        try {
            resu = ba.consultas(sql);
        } catch (Exception e) {
        }
        String datos[] = new String[17];

        for (int i = 0; i < 17; i++) {
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

            }
        } catch (SQLException ex) {
        } catch (Exception exe) {
        }
        ba.cierraResultado(resu);
    %>
    <form id="form_update_inventario" name="form_update_inventario" action="farmacia/update_inventario.jsp" method="post">
        <input type="hidden" id="idinvent" name="idinvent" value="<%= datoi %>">
        <input type="hidden" id="idmedic" name="idmedic" value="<%= datop %>">
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

                                        <label for="atc">Codigo ATC: </label>
                                    </td>
                                    <td style="width:33%">
                                        <label for="viaadministracion">Via Administracion: </label>
                                    </td>
                                </tr>

                                <!-----2da fila---->

                                <tr>
                                    <td>
                                        <input type="text" name="cum" size="15" id="cum" maxlength="30" value="<%out.print(datos[12]);%>" readonly>
                                    </td>
                                    <td>
                                        <input type="text" name="atc" size="15" id="atc" maxlength="30" value="<%out.print(datos[2]);%>" readonly> 
                                    </td>
                                    <td>
                                        <div id="divia" name="divia">
                                            <select name="via" id="via" maxlength="30" disabled="disabled">
                                                <%
                                                    String sqlvia = "select * from via_admin;";
                                                    ResultSet resuvia = ba.consultas(sqlvia);
                                                    try {
                                                        while (resuvia.next() && resuvia != null) {
                                                            if (datos[6].compareTo("" + resuvia.getString(1) + "") == 0) {
                                                                out.print("<option value='" + resuvia.getString(1) + "' SELECTED>" + resuvia.getString(2) + "</option>");
                                                            } else {
                                                                out.print("<option value='" + resuvia.getString(1) + "'>" + resuvia.getString(2) + "</option>");
                                                            }
                                                        }
                                                    } catch (SQLException e) {
                                                    } catch (Exception ex) {
                                                    }
                                                %>  
                                            </select>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <label for="producto">Producto: </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">    
                                        <input type="text" name="producto" size="75" id="producto" maxlength="500" value="<%out.print(datos[1]);%>" readonly>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <label for="principioactivo">Principio Activo: </label>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <input type="text" name="principioactivo" size="75" id="principioactivo" maxlength="500" value="<%out.print(datos[9]);%>" readonly>
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

                                        <div id="divforma" name="divforma">
                                            <select name="forma" id="forma" maxlength="30" disabled="disabled">
                                                <%
                                                    String sql9 = "select * from forma_farmaceutica;";
                                                    ResultSet resu1 = ba.consultas(sql9);
                                                    try {
                                                        while (resu1.next() && resu1 != null) {
                                                            if (datos[5].compareTo("" + resu1.getString(1) + "") == 0) {
                                                                out.print("<option value='" + resu1.getString(1) + "' SELECTED>" + resu1.getString(2) + "</option>");
                                                            } else {
                                                                out.print("<option value='" + resu1.getString(1) + "'>" + resu1.getString(2) + "</option>");
                                                            }
                                                        }
                                                    } catch (SQLException e) {
                                                    } catch (Exception ex) {
                                                    }

                                                %>  
                                            </select>
                                        </div>

                                    </td>

                                    <td>
                                        <input type="text" name="concentracion" size="15" id="concentracion" maxlength="30" value="<%out.print(datos[7]);%>" readonly>
                                    </td>
                                    <td>
                                        <div id="divunidad" name="divunidad">
                                            <select name="unidad" id="unidad" maxlength="30" disabled="disabled">
                                                <%
                                                    String sqlunidad = "select * from unidad_medida;";
                                                    ResultSet resunidad = ba.consultas(sqlunidad);
                                                    try {
                                                        while (resunidad.next() && resunidad != null) {
                                                            if (datos[8].compareTo("" + resunidad.getString(1) + "") == 0) {
                                                                out.print("<option value='" + resunidad.getString(1) + "' SELECTED>" + resunidad.getString(2) + "</option>");
                                                            } else {
                                                                out.print("<option value='" + resunidad.getString(1) + "'>" + resunidad.getString(2) + "</option>");
                                                            }
                                                        }
                                                    } catch (SQLException e) {
                                                    } catch (Exception ex) {
                                                    }
                                                %>  
                                            </select>
                                        </div>

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
                                                        <%
                                                            String sqldistri = "select * from distribuidores;";
                                                            ResultSet resudistri = ba.consultas(sqldistri);
                                                            try {
                                                                while (resudistri.next() && resudistri != null) {
                                                                    if (datosinvent[1].compareTo("" + resudistri.getString(1) + "") == 0) {
                                                                        out.print("<option value='" + resudistri.getString(1) + "' SELECTED>" + resudistri.getString(2) + "</option>");
                                                                    } else {
                                                                        out.print("<option value='" + resudistri.getString(1) + "'>" + resudistri.getString(2) + "</option>");
                                                                    }
                                                                }
                                                            } catch (SQLException e) {
                                                            } catch (Exception ex) {
                                                            }
                                                            ba.cierraResultado(resudistri);
                                                        %>  
                                                    </select>
                                                </td>


                                                <td style="width:15%">
                                                    <label>Vendedor: </label>
                                                </td>

                                                <td style="width:35%">
                                                    <div id="div_vendedor" name="div_vendedor">
                                                        <select name="vendedor" id="vendedor" style="width:85%">
                                                            <%
                                                            String sqlvaded = "select id_vendedor,concat(nombres,' ',apellidos) as nom from vendedores ;";
                                                            ResultSet resudveded = ba.consultas(sqlvaded);
                                                            try {
                                                                while (resudveded.next() && resudveded != null) {
                                                                    if (datosinvent[2].compareTo("" + resudveded.getString(1) + "") == 0) {
                                                                        out.print("<option value='" + resudveded.getString(1) + "' SELECTED>" + resudveded.getString(2) + "</option>");
                                                                    } else {
                                                                        out.print("<option value='" + resudveded.getString(1) + "'>" + resudveded.getString(2) + "</option>");
                                                                    }
                                                                }
                                                            } catch (SQLException e) {
                                                            } catch (Exception ex) {
                                                            }
                                                            ba.cierraResultado(resudveded);
                                                        %>  
                                                            
                                                        </select>
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
                                                                    if (datosinvent[4].compareTo("" + resulabo.getString(1) + "") == 0) {
                                                                        out.print("<option value='" + resulabo.getString(1) + "' SELECTED>" + resulabo.getString(2) + "</option>");
                                                                    } else {
                                                                        out.print("<option value='" + resulabo.getString(1) + "'>" + resulabo.getString(2) + "</option>");
                                                                    }
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
                                                    <input type="text" size="40" name="numfac" id="numfac" maxlength="50" value="<%= datosinvent[12] %>">
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
                                                    <input name="lote" id="lote" style="width:85%" value="<%= datosinvent[5] %>">
                                                </td>


                                                <td style="width:15%">
                                                    <label>Invima: </label>
                                                </td>

                                                <td style="width:35%">
                                                    <input name="invima" id="invima" style="width:85%" value="<%= datosinvent[16] %>">
                                                </td>

                                            </tr>

                                            <tr>

                                                <td>
                                                    <label>Fecha de Fabricacion: </label>
                                                </td>

                                                <td>
                                                    <input type="text" name="calendariofecfab" id="calendariofecfab" style="width:60%"  >
                                                </td>

                                                <td>
                                                    <label>Fecha de Vencimiento:</label>
                                                </td>

                                                <td>
                                                    <input type="text" name="calendariofecven" id="calendariofecven" style="width:60%"  >
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
                                                    <input type="hidden" id="cantidadcompradaant" name="cantidadcompradaant" value="<%= datosinvent[8] %>">
                                                    <input type="text" name="cantidadcomprada" size="25" id="cantidadcomprada" maxlength="30"  value="<%= datosinvent[8] %>" >
                                                </td>
                                                <td style="width:20%">
                                                    <label>Valor de Compra: </label>
                                                </td>
                                                <td style="width:30%">
                                                    <input type="text" name="valorcompra" size="25" id="valorcompra" maxlength="30"  value="<%= datosinvent[10] %>">
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <label>Descuento: </label>
                                                </td>
                                                <td>
                                                    <input type="text" name="descuento" size="25" id="descuento" maxlength="30"  value="<%= datosinvent[9] %>">
                                                </td>
                                                <td>
                                                    <label>Impuesto: </label>
                                                </td>
                                                <td>
                                                    <input type="text" name="impuesto" size="25" id="impuesto" maxlength="30"  value="<%= datosinvent[11] %>">
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <label>Ubicacion Fisica: </label>
                                                </td>
                                                <td>
                                                    <input type="text" name="ubicacion" size="25" id="ubicacion" maxlength="30"  value="<%= datosinvent[14] %>">
                                                </td>
                                                <td>
                                                    <label>Codigo de Barras: </label>
                                                </td>
                                                <td>
                                                    <input type="text" name="codigobarras" size="25" id="codigobarras" maxlength="30" value="<%= datosinvent[15] %>">
                                                </td>
                                            </tr>
                                              <tr>
                                                <td style="width:20%">
                                                    <label>Existencias: </label>
                                                </td>
                                                <td style="width:30%">
                                                    <input type="hidden" id="existenciasant" name="existenciasant" value="<%= datosinvent[13] %>">
                                                    <input type="text" name="existencias" size="25" id="existencias" maxlength="30"  value="<%= datosinvent[13] %>" >
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
    
    
    <script type="text/javascript">   
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
            <%
             String[] partesfav = datosinvent[6].split("-");
             int mes1=0;
             try{ mes1=Integer.parseInt(partesfav[1]);mes1--; }catch(Exception es){}
             
             String[] partesven = datosinvent[7].split("-");
             int mes2=0;
             try{ mes2=Integer.parseInt(partesven[1]);mes2--; }catch(Exception es){}             
            %>
            $('#calendariofecfab').datepicker("setDate", new Date(<%= partesfav[0]+","+mes1+","+partesfav[2] %>) );
            $('#calendariofecven').datepicker("setDate", new Date(<%= partesven[0]+","+mes2+","+partesven[2] %>) );
  </script>
</body>
</html>
<% ba.cerrar(); %>