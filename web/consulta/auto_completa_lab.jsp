<%-- 
    Document   : auto_completa_lab
    Created on : 9/05/2013, 05:54:04 PM
    Author     : EMMANUEL
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html >

<head>
<meta charset="utf-8" >
<style type="text/css">
/*    
#diagnosticop{
width:250px;
border:solid 1px #000;
padding:3px;

}*/body{z-index: 1;}
#display,#display1,#display2,#display3
{
width:40px;
display:none;
/*float:right; margin-right:30px;*/
border-left:solid 1px #dedede;
border-right:solid 1px #dedede;
border-bottom:solid 1px #dedede;
overflow:hidden;
position: relative;
z-index: 4;
    
}
.display_box
{
padding:4px; border-top:solid 1px #dedede; font-size:12px; height:10px;
}

.display_box:hover
{
    cursor: pointer;
background:#3b5998;
color:#FFFFFF;
}       

</style>
<title>Sin título 1</title>
</head>

<body>
<%

String dato=request.getParameter( "searchword" );
           //select id_cups,cup_verdadero,descripcion from cups where id_cups not in (select DISTINCT id_lab from labs_sol where serial_historia='10001' and leido='0')  ORDER BY cup_verdadero desc LIMIT 0 , 15
                      String sql="select id_cups,cup_verdadero,descripcion from cups where  (tipo='0' or tipo='2') and  permi"+session.getAttribute("permiso")+"='1' and (sexo='"+session.getAttribute("genero_paciente")+"' or sexo='0') and id_cups not in (select DISTINCT id_lab from labs_sol where serial_historia='"+session.getAttribute("serial_pacinete")+"' and leido='0') and cup_verdadero like '"+dato+"%' LIMIT 15";
String sql2="select id_cups,count(cup_verdadero),descripcion,cup_verdadero from cups where  (tipo='0' or tipo='2') and  permi"+session.getAttribute("permiso")+"='1' and (sexo='"+session.getAttribute("genero_paciente")+"' or sexo='0') and id_cups not in (select DISTINCT id_lab from labs_sol where serial_historia='"+session.getAttribute("serial_pacinete")+"' and leido='0') and cup_verdadero like '"+dato+"%'";

//System.out.println(" sql1:"+sql+"\n sql2:"+sql2);

 conecta_bd ba = new conecta_bd();
 ba.ConectaDb();
 
 ResultSet resu2=ba.consultas(sql2);

 try{
	    while (resu2.next()&&resu2!=null) {
                           out.print(" <input type='hidden' name='id_r_lab' id='id_r_lab' value='"+resu2.getString(1)+"'>");
                           out.print(" <input type='hidden' name='cantidad' id='cantidad' value='"+resu2.getString(2)+"'>");
                           out.print(" <input type='hidden' name='nomcbrela' id='nomcbrela' value='"+resu2.getString(3)+"'>");              
                           out.print(" <input type='hidden' name='codigolab' id='codigolab' value='"+resu2.getString(4)+"'>");              
                  }
             }
        catch(SQLException e){}
        catch(Exception ex){}
 ba.cierraResultado(resu2);
         
         
        

         
         
         
 ResultSet resu=ba.consultas(sql);
           

            
         
	try{
	    while (resu.next()&&resu!=null) { 
                        %>
                        <div class="display_box" align="left" onclick="pasadatoLab('<% out.print(resu.getString(1));%>','<% out.print(resu.getString(2));%>','<% out.print(resu.getString(3));%>')">
                        <% out.print(resu.getString(2));%><br/>
                </div>              
           <%                       
                     }
             }
        catch(SQLException e){}
        catch(Exception ex){}
 ba.cierraResultado(resu);
 ba.cerrar();
%>

</body>

</html>










