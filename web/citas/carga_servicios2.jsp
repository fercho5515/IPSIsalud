<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileUploadException"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="org.apache.commons.io.*"%>
<%@page import="java.io.*"%>

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
        <%
            conecta_bd ba = new conecta_bd();
            ba.ConectaDb();
        %>
    </head>
    <body>
        <%
            String dato = request.getParameter("dato");
            String dato2 = request.getParameter("dato2");
            String dato3 = request.getParameter("dato3");
            String sql="select ag.id_contrato,ag.id_procedimiento,pt.descripcion"
            +" from agenda ag,personas pe,pacientes pa, tari_proced tp,procedimientos_tari pt"
            +" where ag.id_paciente=pe.serial and pa.serial_persona=pe.serial and pe.id_person='1088798141' "
            +"and ag.id_tarifario=tp.id_tarifario and ag.id_procedimiento=tp.id_proced "
            +"and pt.idprocedimientos_tari=tp.id_proced "
            +"and MONTH(CURDATE())=MONTH (ag.fecha) and year(CURDATE())=year(ag.fecha);";
//            String sql = "select da.id_contrato, da.id_proced,pt.descripcion from pacientes pa, personas pe,afiliados_cont ac,dias_atencion da,procedimientos_tari pt where pa.serial_persona=pe.serial and pe.id_person='" + dato2 + "' and ac.serial_paciente=pa.serial_persona and ac.id_cont=da.id_contrato and pt.idprocedimientos_tari=da.id_proced;";
//            out.print(sql);
            ResultSet resu1 = ba.consultas(sql);
            String cont = "";
            try {
                while (resu1.next() && resu1 != null) {
                    cont = resu1.getString(1);
                }
            } catch (SQLException e) {
            } catch (Exception ex) {
            }
            
            int conta = Integer.parseInt(cont);
            /*String datos1[][]=new String[conta][2];
                       
             for(int i=0;i<conta;i++){
             datos1[i][0]="";
             datos1[i][1]="";
             }*/
            // String sql2="select da.id_proced,pt.descripcion,cu.cup_verdadero from pacientes pa, personas pe,afiliados_cont ac,dias_atencion da,procedimientos_tari pt,cups cu where pa.serial_persona=pe.serial and pe.id_person='"+dato2+"' and cu.id_cups=pt.cod_cups and ac.serial_paciente=pa.serial_persona and ac.id_cont=da.id_contrato and da.dia='"+dato+"' and pt.idprocedimientos_tari=da.id_proced;";    
            String sql2 = "select tari_proced.id_proced, procedimientos_tari.descripcion,cups.cup_verdadero,tari_proced.id_tarifario from tari_proced,procedimientos_cont,contratacion,procedimientos_tari,cups where procedimientos_cont.cod_activ=tari_proced.id_proced and procedimientos_cont.cod_tarifario=tari_proced.id_tarifario and procedimientos_cont.id_contrato='1' and procedimientos_cont.id_contrato=contratacion.id_contratacion and procedimientos_tari.idprocedimientos_tari=tari_proced.id_proced and cups.id_cups=procedimientos_tari.cod_cups and procedimientos_cont.cod_activ in(select dias_atencion.id_proced from dias_atencion,contratacion where dias_atencion.id_contrato=contratacion.id_contratacion and dias_atencion.dia='" + dato + "' and dias_atencion.id_contrato='" + dato3 + "')";
//            out.print(sql2);
            ResultSet resu2 = ba.consultas(sql2);
            int i = 0;
            out.print("<table><tr><td colspan='2'style='text-align: center'><h2>Servicios</h2></td></tr>");
            try {
                while (resu2.next() && resu2 != null) {
                    out.print("<tr><td style='text-align: right'>");
                    //out.print("<input type='checkbox' id='check_"+i+"' name='check_"+i+"'><label>"+resu2.getString(2)+"</label>");
                    out.print("<label>" + resu2.getString(2) + "</label>");
                    out.print("<input type='hidden' id='text_" + i + "' name='text_" + i + "' value='" + resu2.getString(1) + "'");
                    out.print("<br>");
                    out.print("<input type='hidden' id='text2_" + i + "' name='text2_" + i + "' value='" + resu2.getString(3) + "'");
                    out.print("<br>");
                    out.print("<input type='hidden' id='text3_" + i + "' name='text3_" + i + "' value='" + resu2.getString(4) + "'");
                    out.print("<br>");
                    out.print("</td><td>");
                    out.print("<input type='button' onclick='busca_profesional(" + i + ");' value='Programar'>");
                    out.print("</td></tr>");
                    i++;
                }
            } catch (SQLException e) {
            } catch (Exception ex) {
            }
            ba.cerrar();
        %>
    <tr>
        <td>
            <input type="hidden" id="cantidad" name="cantidad" value="<% out.print(conta);%>">

        </td>
        <td></td>
    </tr>   
    <%
        out.print("</table>");
    %>
</body>
</html>