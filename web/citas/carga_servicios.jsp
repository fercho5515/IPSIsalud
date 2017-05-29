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
                      String dato=request.getParameter("dato");
                      if(dato.compareTo("ftg")==0){
                          out.print("</body></html>");
                      return;
                      }
                      String sql="select count(pt.idprocedimientos_tari) from procedimientos_tari pt, tari_proced tp where pt.idprocedimientos_tari=tp.id_proced and (tp.id_proced in (select DISTINCT cod_activ from procedimientos_cont where id_contrato='"+dato+"') or tp.id_proced in(select DISTINCT cod_actividad from procedimientos_paquete, paquete_int where cod_paq_int=id_paquete_int and id_contratacion='"+dato+"' ));";    
                      ResultSet resu1=ba.consultas(sql);
                       String cont="";
                        try{
                            while (resu1.next()&&resu1!=null) {
                                       cont = resu1.getString(1);
                              }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                       int conta = Integer.parseInt(cont);
                       /*String datos1[][]=new String[conta][2];
                       
                        for(int i=0;i<conta;i++){
                             datos1[i][0]="";
                             datos1[i][1]="";
                        }*/
                       String sql2="select DISTINCT pt.idprocedimientos_tari,pt.descripcion from procedimientos_tari pt, tari_proced tp where pt.idprocedimientos_tari=tp.id_proced and (tp.id_proced in (select DISTINCT cod_activ from procedimientos_cont where id_contrato='"+dato+"') or tp.id_proced in(select DISTINCT cod_actividad from procedimientos_paquete, paquete_int where cod_paq_int=id_paquete_int and id_contratacion='"+dato+"' ));";    
                       ResultSet resu2=ba.consultas(sql2);
                       int i=0;
                       out.print("<table><tr><td><label>Servicios</label></td></tr>");
                        try{
                            while (resu2.next()&&resu2!=null) {   
                          out.print("<tr><td>");
                                     out.print("<input type='checkbox' id='check_"+i+"' name='check_"+i+"'><label>"+resu2.getString(2)+"</label>");
                                     out.print("<input type='hidden' id='text_"+i+"' name='text_"+i+"' value='"+resu2.getString(1)+"'");
                          out.print("</tr></td>");
                               i++;
                            }
                        }
                       catch(SQLException e){}
                       catch(Exception ex){}
                       out.print("<tr><td>"); 
                       String sqlfecha="select YEAR(f_fin) as año,MONTH (f_fin) as mes,DAY(f_fin) as dia from contratacion where id_contratacion='"+dato+"';";
                       ResultSet resuf=ba.consultas(sqlfecha); 
                       String diaf="";
                       String mesf="";
                       String anof="";
                       try{
                            while (resuf.next()&&resuf!=null) {
                                anof=""+resuf.getString(1);
                                mesf=""+(resuf.getInt(2)-1);
                                diaf=""+resuf.getString(3);
                              }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                       ba.cerrar();
                        out.print("</tr></td>");
                       %>
                              <tr>
                                  <td>
                                      <input type="hidden" id="cantidad" name="cantidad" value="<% out.print(conta); %>">
                                      <input type="submit" id="car" name="car" value="Programar"> 
                                  </td>
                              </tr>   
                      <% 
                        out.print("</table>");
                        out.print("<script type='text/javascript' language='javascript'>");
                        out.print("actu_datap("+diaf+","+mesf+","+anof+")");
                        out.print("</script>");
                      %>
      </body>
</html>