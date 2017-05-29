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
                 
       $('#form_med_paq').submit(function() {
       
                // Enviamos el formulario usando AJAX
                  
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('action'),
                    data: $(this).serialize(),
                    dataType: "json",                              
                     success: function( response ){ alert( response.msj );
                                                    jQuery("#listMed").jqGrid('setCaption',"Medicamentos Contratados Paquete").trigger('reloadGrid');
                                                   },
                     error: function( error ) { alert(error.msj ); }                            
                })  
                     
                return false;
            });   
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
         
         String dato=request.getParameter("dato");//id tarifario
         String dato2=request.getParameter("dato2");//id medicamento
         String dato3=request.getParameter("dato3");//id laboratorio
         dato=dato.replace('*',' ');
         //out.print(datop);
         
         //HttpSession sesion=request.getSession();
         //sesion.setAttribute("cup_update",datop);
         //out.println("Sesion==>"+sesion.getAttribute("cup_update"));
        // String sqq="select m.serial,m.cum,m.cod_atc,m.producto,m.concentracion,um.descripcion as d1,ff.descripcion as d2,m.presentacion,lf.nombre as lab,tm.precio,t.nombre as tari                  from medicamentos m,unidad_medida um,forma_farmaceutica ff,tari_med tm,lab_farmaceutico lf, tarifarios t  where lf.idlab_farmaceutico=tm.id_laboratorio and um.id_unidad_medida=m.unidad_medida and ff.id_forma_farmaceutica=m.forma_farmaceutica and tm.id_med=m.serial and t.id_tarifarios=tm.id_tari";
         String sql="select m.serial,m.cum,m.cod_atc,m.producto,m.concentracion,um.descripcion as d1,ff.descripcion as d2,m.presentacion,lf.nombre as lab,tm.precio,t.nombre as tari, t.id_tarifarios from medicamentos m,unidad_medida um,forma_farmaceutica ff,tari_med tm,lab_farmaceutico lf, tarifarios t  where lf.idlab_farmaceutico=tm.id_laboratorio and um.id_unidad_medida=m.unidad_medida and ff.id_forma_farmaceutica=m.forma_farmaceutica and tm.id_med=m.serial and t.id_tarifarios=tm.id_tari and tm.id_tari ='"+dato+"' and tm.id_med ='"+dato2+"' and tm.id_laboratorio='"+dato3+"';";
         //out.print(sql); 
         ResultSet resu=null;
         try{  resu=ba.consultas(sql);}
         catch(Exception e){}
            String datos[]=new String[12];
            
            for(int i=0;i<12;i++){
                datos[i]="";
            }
         try{
	    while (resu.next()&&resu!=null) {   
                         if(resu.getString(1)!=null){datos[0]=resu.getString(1);}
                         if(resu.getString(2)!=null){datos[1]=resu.getString(2);}
                         if(resu.getString(3)!=null){datos[2]=resu.getString(3);}
                         if(resu.getString(4)!=null){datos[3]=resu.getString(4);}                        
                         if(resu.getString(5)!=null){datos[4]=resu.getString(5);}
                         if(resu.getString(6)!=null){datos[5]=resu.getString(6);}
                         if(resu.getString(7)!=null){datos[6]=resu.getString(7);}
                         if(resu.getString(8)!=null){datos[7]=resu.getString(8);}
                         if(resu.getString(9)!=null){datos[8]=resu.getString(9);}
                         if(resu.getString(10)!=null){datos[9]=resu.getString(10);}
                         if(resu.getString(11)!=null){datos[10]=resu.getString(11);}
                         if(resu.getString(12)!=null){datos[11]=resu.getString(12);}
                         
                     }
        }
        catch(SQLException ex){}
	catch(Exception exe){}
        ba.cierraResultado(resu);
        ba.cerrar();
        %>
<div id="div_resu_insertmed"></div>
<form id="form_med_paq" name="form_med_paq" method="post" action="insert_medictari_paq.jsp">
       
<table style="height:100%;width:80%;padding-top:5px" align="center" border="0">
    <input type="hidden" id="id_medic" name="id_medic" value="<% out.print(dato2) ;%>"><br>
    <input type="hidden" id="id_tari" name="id_tari" value="<% out.print(dato); %>"><br>
    <input type="hidden" id="id_labo" name="id_labo" value="<% out.print(dato3); %>"><br>
    
    
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
            <input type="text" value="<%out.print(datos[8]);%>" readonly size="100"><br>
        </td></tr>
        <tr><td>
            <label>PRECIO: </label>
        </td><td>
            <input type="text" id="precio" name="precio" size="100" value="<%out.print(datos[9]);%>"  readonly><br>
        </td></tr>
        <tr><td>
            <label>TARIFARIO: </label>
        </td><td>
            <input type="text" id="precio" name="precio" size="100" value="<%out.print(datos[10]);%>"  readonly><br>
        </td></tr>
        <tr><td colspan="2"><input type="submit" id="aceptinsertprocedar" name="aceptar" value="Agregar Medicamento"></td></tr>
</table>
</form>
</body>
</html>
