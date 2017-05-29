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
            var pantalla=screen.width-320;
//            alert("=="+pantalla/4);
            var elemento = document.getElementById('tabla_total').style.width = pantalla+"px"; // Seleccionar el elemento
           
            var elementa = document.getElementsByClassName('cuatro');
            var i;
            for (i = 0; i < elementa.length; i++) {
                elementa[i].style.width = (pantalla/4)+"px";
            } 
            
            $('#form_update_medic').submit(function() {
                //CUM          
                var vcum=document.getElementById("cum").value;
                if(vcum == null ||vcum.length == 0 || /^\s+$/.test(vcum)){
                    alert('Codigo CUM es obligatorio ');
                    return false; 
                }
                //R-Sanitario
                var vrs=document.getElementById("registrosanitario").value;
                if(vrs == null ||vrs.length == 0 || /^\s+$/.test(vrs)){
                    alert('Registró sanitario es obligatorio ');
                    return false; 
                }
                //Producto
                var vp=document.getElementById("producto").value;
                if(vp == null ||vp.length == 0 || /^\s+$/.test(vp)){
                    alert('Casilla Producto es obligatoria');
                    return false; 
                }
                //Laboratorio
                var vlab=document.getElementById("laboratorio").value;
                if(vlab == null ||vlab.length == 0 || /^\s+$/.test(vlab)){
                    alert('Casilla Laboratorio es obligatoria ');
                    return false; 
                }                
                //consecutivo
                var vcons=document.getElementById("consecutivo").value;
                if(vcons == null ||vcons.length == 0 || /^\s+$/.test(vcons)){
                    alert('Casilla Consecutivo es obligatoria ');
                    return false; 
                }
                //Cantidad Cum
                var vccum=document.getElementById("cantidadcum").value;
                if(vccum == null ||vccum.length == 0 || /^\s+$/.test(vccum)){
                    alert('Casilla Cantidad CUM es obligatoria ');
                    return false; 
                }
                //Descripcion Comercial
                var vdcom=document.getElementById("descripcionc").value;
                if(vdcom == null ||vdcom.length == 0 || /^\s+$/.test(vdcom)){
                    alert('Casilla Descripcion Comercial es obligatoria ');
                    return false; 
                }
                //Estado Cum
                var vecum=document.getElementById("estadocum").value;
                if(vecum == null ||vecum.length == 0 || /^\s+$/.test(vecum)){
                    alert('Casilla Estado CUM es obligatoria ');
                    return false; 
                }
                //Unidad 
                var vunidad=document.getElementById("unidad").value;
                if(vunidad == null ||vunidad.length == 0 || /^\s+$/.test(vunidad)){
                    alert('Casilla Unidad es obligatoria ');
                    return false; 
                }
                //Via Admin 
                var vviaadmin=document.getElementById("viaadmin").value;
                if(vviaadmin == null ||vviaadmin.length == 0 || /^\s+$/.test(vviaadmin)){
                    alert('Casilla Vía Administración es obligatoria ');
                    return false; 
                }
                //Principio Activo  
                var vpactivo=document.getElementById("viaadmin").value;
                if(vpactivo == null ||vpactivo.length == 0 || /^\s+$/.test(vpactivo)){
                    alert('Casilla Principio Activo es obligatoria ');
                    return false; 
                }
                 //Unidad Medida  
                var vumedida=document.getElementById("unidadmedida").value;
                if(vumedida == null ||vumedida.length == 0 || /^\s+$/.test(vumedida)){
                    alert('Casilla Unidad Medida es obligatoria ');
                    return false; 
                }
                 //Cantidad  
                var vcantidad=document.getElementById("cantidad").value;
                if(vcantidad == null ||vcantidad.length == 0 || /^\s+$/.test(vcantidad)){
                    alert('Casilla Cantidad es obligatoria ');
                    return false; 
                }
                 //Unidad Referencia  
                var vureferencia=document.getElementById("unidadreferencia").value;
                if(vureferencia == null ||vureferencia.length == 0 || /^\s+$/.test(vureferencia)){
                    alert('Casilla Unidad Referencia es obligatoria ');
                    return false; 
                }
                 //Forma Farmacéutica
                var vformafarma=document.getElementById("formafarma").value;
                if(vformafarma == null ||vformafarma.length == 0 || /^\s+$/.test(vformafarma)){
                    alert('Casilla Forma Farmacéutica es obligatoria ');
                    return false; 
                }
                
//                var vproducto=document.getElementById("producto").value;
//                if(vproducto == null ||vproducto.length == 0 ||vproducto.length > 398|| /^\s+$/.test(vproducto)){
//                    alert('No has descrito el Medicamento, o has sobrepasado el límite de caracteres (398)');
//                    return false; 
//                }
                
                
                //return x == y && x.toString() == y.toString();
//                var vedadmin=document.getElementById("edadmin").value;
//                var vedadmin2=$("input[name='edadmin2']:checked").val();
//                if(vedadmin.length != 0 || /^\s+$/.test(vedadmin)){
//                    var comp = parseInt(vedadmin);
//                    if (isNaN(comp)) {
//                        alert('Edad minima no valida');
//                        return false;
//                    }
//                    else if(comp!=vedadmin || comp.toString()!=vedadmin.toString()){
//                        alert('Edad minima no valida');
//                        return false;
//                    }
//                    if(vedadmin2==0){
//                        alert('Debes escoger una unidad para Edad Minima');
//                        return false;
//                    }
//                }
//                else if(vedadmin.length == 0){
//                    if(vedadmin2==1||vedadmin2==2||vedadmin2==3){
//                        alert('Debes escribir una Edad Minima');
//                        return false;
//                    }
//                } 
//                           
//                var vedadmax=document.getElementById("edadmax").value;
//                var vedadmax2=$("input[name='edadmax2']:checked").val();
//                if(vedadmax.length != 0 || /^\s+$/.test(vedadmax)){
//                    var comp2 = parseInt(vedadmax);
//                    if (isNaN(comp2)) {
//                        alert('Edad maxima no valida');
//                        return false;
//                    }
//                    else if(comp2!=vedadmax || comp2.toString()!=vedadmax.toString()){
//                        alert('Edad maxima no valida');
//                        return false;
//                    }
//                    if(vedadmax2==0){
//                        alert('Debes escoger una unidad para Edad Maxima');
//                        return false;
//                    }
//                }
//                else if(vedadmax.length == 0){
//                    if(vedadmax2==1||vedadmax2==2||vedadmax2==3){
//                        alert('Debes escribir una Edad Maxima');
//                        return false;
//                    }
//                } 
                          
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                    success: function(data) {;
                        $('#resumed').html(data);
                        $("#divconfmed").load("<label>Exito</label>"); 
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
        String datos[] = new String[40];

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
    
    <form id="form_update_medic" name="form_update_medic" action="update_medic.jsp" method="post">
        <table style="height:100%;padding-top:5px" align="center" id="tabla_total" name="tabla_total">
            <tbody valign="top">
                <tr>
                    <td>
                        <fieldset><legend>Medicamentos CUMS</legend>
                            
                            <table style="width:100%">
                                <tr>
                                    <td class="cuatro">
                                        <input type="hidden" id="serial_med" name="serial_med" value="<%out.print(datos[0]);%>">   
                                        <label for="codigo">CUM: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="producto">Registró Sanitario: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Fecha Expedición: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Fecha Vencimiento </label>
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="cum" id="cum" maxlength="30" value="<%out.print(datos[1]);%>" size="24%">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="registrosanitario" id="registrosanitario" maxlength="400" value="<%out.print(datos[4]);%>">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="fechae" id="fechae" maxlength="30" value="<%out.print(datos[5]);%>">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="fechav" id="fechav" maxlength="30" value="<%out.print(datos[6]);%>">
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <label for="codigo">Producto: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="producto">Laboratorio : </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Estado Registro: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Consecutivo: </label>
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="producto" id="producto" maxlength="30" value="<%out.print(datos[2]);%>" size="24%">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="laboratorio" id="laboratorio" maxlength="400" value="<%out.print(datos[3]);%>">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="estador" id="estador" maxlength="30" value="<%out.print(datos[7]);%>">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="consecutivo" id="consecutivo" maxlength="30" value="<%out.print(datos[8]);%>">
                                    </td>
                                </tr>
                              
                              <!-----fila---->
                                <tr>
                                    <td class="cuatro" name="cuatro">
                                        <label for="codigo">Cantidad CUM: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="producto">Descripción Comercial: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Estado CUM: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Fecha Activo </label>
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="cantidadcum" id="cantidadcum" maxlength="30" value="<%out.print(datos[9]);%>" size="24%">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="descripcionc" id="descripcionc" maxlength="400" value="<%out.print(datos[10]);%>">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="estadocum" id="estadocum" maxlength="30" value="<%out.print(datos[11]);%>">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="fechaac" id="fechaac" maxlength="30" value="<%out.print(datos[12]);%>">
                                    </td>
                                </tr>
                                
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro" name="cuatro">
                                        <label for="codigo">Fecha Inactivo: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="producto">Muestra Médica: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Unidad: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">ATC:</label>
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="fechain" id="fechain" maxlength="30" value="<%out.print(datos[13]);%>" size="24%">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="muestra" id="muestra" maxlength="400" value="<%out.print(datos[14]);%>">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="unidad" id="unidad" maxlength="30" value="<%out.print(datos[15]);%>">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="atc" id="atc" maxlength="30" value="<%out.print(datos[16]);%>">
                                    </td>
                                </tr>
                              <!-----fila---->
                                <tr>
                                    <td class="cuatro" name="cuatro">
                                        <label for="codigo">Descripción ATC: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="producto">Vía Administración: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Concentración: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Principio Activo: </label>
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="descripcionatc" id="descripcionatc" maxlength="30" value="<%out.print(datos[17]);%>" size="24%">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="viaadmin" id="viaadmin" maxlength="400" value="<%out.print(datos[18]);%>">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="concentracion" id="concentracion" maxlength="30" value="<%out.print(datos[19]);%>">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="principioa" id="principioa" maxlength="30" value="<%out.print(datos[20]);%>">
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro" name="cuatro">
                                        <label for="codigo">Unidad Medida: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="producto">Cantidad: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Unidad Referencia: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Forma Farmacéutica: </label>
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="unidadmedida" id="unidadmedida" maxlength="30" value="<%out.print(datos[21]);%>" size="24%">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="cantidad" id="cantidad" maxlength="400" value="<%out.print(datos[22]);%>">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="unidadreferencia" id="unidadreferencia" maxlength="30" value="<%out.print(datos[23]);%>">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="formafarma" id="formafarma" maxlength="30" value="<%out.print(datos[24]);%>">
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro" name="cuatro">
                                        <label for="codigo">Nombre Rol: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="producto">Tipo Rol: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Modalidad: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc">Activo: </label>
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="nombrerol" id="nombrerol" maxlength="30" value="<%out.print(datos[25]);%>" size="24%">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="tiporol" id="tiporol" maxlength="400" value="<%out.print(datos[26]);%>">
                                    </td>
                                    <td class="cuatro">
                                        <input type="text" class="cuatro" name="modalidad" id="modalidad" maxlength="30" value="<%out.print(datos[27]);%>">
                                    </td>
                                    <td class="cuatro">
                                <center><label style="padding-right: 5px">Activo</label><input type="radio" name="activo" id="activo1" value="1" <% if(datos[28].compareTo("1")==0){out.print("checked");} %>>
                                        <label  style="padding-left:20px">Inactivo</label><input type="radio" name="activo" id="activo0" value="0" <% if(datos[28].compareTo("0")==0){out.print("checked");} %>>
                                </center>
                                        <!--<input type="text" class="cuatro" name="activo" id="activo" maxlength="30" value="<%out.print(datos[28]);%>">-->
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro" name="cuatro">
                                        <label for="codigo">Retroviral: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="producto">Plan Beneficios: </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc"> </label>
                                    </td>
                                    <td class="cuatro">
                                        <label for="atc"> </label>
                                    </td>
                                </tr>
                                <!-----fila---->
                                <tr>
                                    <td class="cuatro">
                                        <center><label style="padding-right: 5px">Si</label><input type="radio" name="retroviral" id="retroviral1" value="1" <% if(datos[29].compareTo("1")==0){out.print("checked");} %>>
                                        <label  style="padding-left:20px">No</label><input type="radio" name="retroviral" id="retroviral0" value="0" <% if(datos[29].compareTo("0")==0){out.print("checked");} %>>
                                        </center>
                                        <!--<input type="text" class="cuatro" name="retroviral" id="retroviral" maxlength="30" value="<%out.print(datos[29]);%>" size="24%">-->
                                    </td>
                                    <td class="cuatro" colspan="2">
                                        <center><label style="padding-right: 5px">POS</label><input type="radio" name="plan" id="plan1" value="1" <% if(datos[30].compareTo("1")==0){out.print("checked");} %>>
                                        <label  style="padding-left:20px">POS_S</label><input type="radio" name="plan" id="plan2" value="2" <% if(datos[30].compareTo("2")==0){out.print("checked");} %>>
                                        <label  style="padding-left:20px">PAB</label><input type="radio" name="plan" id="plan3" value="3" <% if(datos[30].compareTo("3")==0){out.print("checked");} %>>
                                        <label  style="padding-left:20px">No aplica</label><input type="radio" name="plan" id="plan4" value="4" <% if(datos[30].compareTo("4")==0){out.print("checked");} %>>
                                        </center>
                                        <!--<input type="text" class="cuatro" name="plan" id="plan" maxlength="400" value="<%out.print(datos[30]);%>">-->
                                    </td>
                                    <td class="cuatro">
                                        <!--<input type="text" class="cuatro" name="atc" id="atc" maxlength="30" value="<%out.print(datos[31]);%>">-->
                                    </td>
                                </tr>
                            </table>
                        </fieldset>

                    </td>
                </tr>

                <tr>
                    <td style="text-align:left;width:80%">
                        <input type="submit" value="Guardar" name="aceptar" size="25" id="aceptar" maxlength="30"><br>
                    </td>
                </tr>


        </table>
    </form>
    <div id="resumed" name="resumed"></div>
    <div id="divconfmed" name="divconfmed"></div>
    
</body>

   
</html>
<% ba.cerrar();%>