<%-- 
    Document   : carne_f1
    Created on : 27/05/2013, 06:43:49 PM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                <%
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){
          
          %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
        conecta_bd ba = new conecta_bd();
        ba.ConectaDb(); 
       
        String etnia="'8'";
        try{int etniaa=Integer.parseInt(""+request.getParameter("etnia").replace("'","").replace("\"","")+"");
                etnia="'"+request.getParameter("etnia").replace("'","").replace("\"","")  +"'";
           }
        catch(Exception exe){etnia="'8'";}
          
        
        
        String despla="'8'";
        try{int desplaa=Integer.parseInt(""+request.getParameter("despla").replace("'","").replace("\"","")+"");
                despla="'"+request.getParameter("despla").replace("'","").replace("\"","") +"'";
           }
        catch(Exception exe){despla="'8'";}
               
        String lye="'8'";
        try{int da=Integer.parseInt(""+request.getParameter("lye").replace("'","").replace("\"","")+"");
               lye="'"+request.getParameter("lye").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){lye="'8'";}
        
        String estu="'8'"; 
        try{int estua=Integer.parseInt(""+request.getParameter("estu").replace("'","").replace("\"","")+"");
                estu="'"+request.getParameter("estu").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){estu="'8'";}
        
        String anmn="'0'"; 
        if(request.getParameter("anmn")!=null && request.getParameter("anmn").trim().compareTo("")!=0){
        anmn="'"+request.getParameter("anmn").replace("'","").replace("\"","")+"'";}
       
        String estc="'8'";
        try{int da=Integer.parseInt(""+request.getParameter("estc").replace("'","").replace("\"","")+"");
               estc="'"+request.getParameter("estc").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){estc="'8'";}
        
         String ipc_controles="null"; 
        if(request.getParameter("ipc_controles")!=null && request.getParameter("ipc_controles").trim().compareTo("")!=0){
        ipc_controles="'"+request.getParameter("ipc_controles").replace("'","").replace("\"","")+"'";}
        
         String partoen="null"; 
        if(request.getParameter("partoen")!=null && request.getParameter("partoen").trim().compareTo("")!=0){
        partoen="'"+request.getParameter("partoen").replace("'","").replace("\"","")+"'";}
         
         
        String regimen="'8'"; 
        try{int da=Integer.parseInt(""+request.getParameter("regimen").replace("'","").replace("\"","")+"");
                regimen="'"+request.getParameter("regimen").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){regimen="'8'";}
        
        
        String codemb="";
        String c="select max(serial) from embarazo where cod_paciente='"+session.getAttribute("serial_pacinete")+"' ;";                   
          ResultSet resuc=null;
          try{  resuc=ba.consultas(c);
              while (resuc.next()&&resuc!=null) {  
                                 codemb="'"+resuc.getString(1)+"'";
                                              }
             }                       
          catch(SQLException ex){}
          catch(Exception exe){}
          ba.cierraResultado(resuc); 
        
        
        String con="INSERT INTO `ips_isalud`.`materno_perinatal` (`idembarazo`, `id_etnia`, `desplazado`, `lee_y_escribe`, `estudios`, `anos_mayor_nivel`, `estado_civil`, `control_pre_en`, `parto_en`, `regimen`) VALUES ("+codemb+","+etnia+","+despla+","+lye+","+estu+","+anmn+","+estc+","+ipc_controles+","+partoen+","+regimen+");";
    // System.out.println("datoins=>"+con);
        if(ba.transaccion(con)==false){
                String dos="UPDATE `ips_isalud`.`materno_perinatal` SET `id_etnia`="+etnia+", `desplazado`="+despla+", `lee_y_escribe`="+lye+", `estudios`="+estu+", `anos_mayor_nivel`="+anmn+", `estado_civil`="+estu+", `control_pre_en`="+ipc_controles+", `parto_en`="+partoen+", `regimen`="+regimen+" WHERE `idembarazo`="+codemb+";";
             //    System.out.println("datoins=>"+dos);              
                ba.transaccion(dos);
                
                                      }       
                      
       ba.cerrar();
       
      %>
    </body>
</html>
