
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="org.apache.commons.io.*"%>
<%@page import="java.io.*"%>
<%
         request.setCharacterEncoding("UTF-8");
         String sql="";   
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb();
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){}
         else{
              
             
int cantidad=Integer.parseInt(request.getParameter("cantidad"));
for (int i=0;i<cantidad;i++){
    if(request.getParameter("check_"+i+"")==null||request.getParameter("check_"+i+"").compareTo("null")==0){}
    else{out.print("Checked "+request.getParameter("check_"+i+"")+"  Dato "+request.getParameter("text_"+i+"")+"<br>");
        try{  
                sql="INSERT INTO `ips_isalud`.`dias_atencion`(`dia`,`id_contrato`,`id_proced`) VALUES ('"+request.getParameter( "calendarioatencion" )+"','"+request.getParameter( "contratos" )+"','"+request.getParameter("text_"+i+"")+"');";
                //out.print(sql);
                if(ba.transaccion(sql)){%><label style="color:red">Insertado Exitosamente<%}
                else{out.println("<br>falloalcrear");}
                 
                }
                catch(Exception e){out.println("<br>fallo");}
    }
}

ba.cerrar();  

/*out.print(request.getParameter("contratos"));
out.print("<br>");
out.print(request.getParameter("calendarioatencion"));
out.print("<br>");
out.print(request.getParameter("hora_inicio"));
out.print("<br>");
out.print(request.getParameter("hora_fin"));
out.print("<br>");
out.print(request.getParameter("cantidad"));
out.print("<br>");*/
         }
%>