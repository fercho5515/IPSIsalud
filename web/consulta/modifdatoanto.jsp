<%-- 
    Document   : modifdatoanto
    Created on : 8/05/2013, 06:40:51 PM
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
       
        
        String getaciones="null";
        try{int da=Integer.parseInt(""+request.getParameter("gestaciones").replace("'","").replace("\"","")+"");
            getaciones="'"+request.getParameter("gestaciones").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){getaciones="null";}
         
        String partos="null";
        try{int da=Integer.parseInt(""+request.getParameter("partos").replace("'","").replace("\"","")+"");
            partos="'"+request.getParameter("partos").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){partos="null";}
               
        String cesarear="null";
        try{int da=Integer.parseInt(""+request.getParameter("cesareas").replace("'","").replace("\"","")+"");
            cesarear="'"+request.getParameter("cesareas").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){cesarear="null";}
        
        String vaginales="null"; 
        try{int da=Integer.parseInt(""+request.getParameter("vaginales").replace("'","").replace("\"","")+"");
            vaginales="'"+request.getParameter("vaginales").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){vaginales="null";}
        
        String muertos="null"; 
        try{int da=Integer.parseInt(""+request.getParameter("m").replace("'","").replace("\"","")+"");
            muertos="'"+request.getParameter("m").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){muertos="null";}
        
        String abortos="null";
        try{int da=Integer.parseInt(""+request.getParameter("abortos").replace("'","").replace("\"","")+"");
            abortos="'"+request.getParameter("abortos").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){abortos="null";}
        
        String ectopicos=request.getParameter("e"); 
        try{int da=Integer.parseInt(""+request.getParameter("e").replace("'","").replace("\"","")+"");
            ectopicos="'"+request.getParameter("e").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){ectopicos="null";}
        
        String menarquia="null";
        if(request.getParameter("caledario")!=null && request.getParameter("caledario").compareTo("")!=0){
        menarquia="'"+request.getParameter("caledario").replace("'","").replace("\"","")+"'";}
        
        String fum="null";
        if(request.getParameter("caledariofum")!=null && request.getParameter("caledariofum").trim().compareTo("")!=0){
        fum="'"+request.getParameter("caledariofum").replace("'","").replace("\"","")+"'";}
       
        String fup="null";
        if(request.getParameter("caledariofup")!=null && request.getParameter("caledariofup").trim().compareTo("")!=0){
        fup="'"+request.getParameter("caledariofup").replace("'","").replace("\"","")+"'";}

        
        String metodo="";
        if(request.getParameter("metodo")!=null){metodo=""+request.getParameter("metodo").replace("'","").replace("\"","");}
        
        String fechcitologia="null";
        if(request.getParameter("calendarioultimacitologia")!=null && request.getParameter("calendarioultimacitologia").trim().compareTo("")!=0){
        fechcitologia="'"+request.getParameter("calendarioultimacitologia").replace("'","").replace("\"","")+"'";}
        
        String resucitologia="";
        if(request.getParameter("resultadoultimacitologia")!=null){resucitologia=""+request.getParameter("resultadoultimacitologia").replace("'","").replace("\"","");}
      
        String con="INSERT INTO `ips_isalud`.`ante_obstreticos` (`id_historia_clinica`,`id_consulta`,`fecha`, `gestaciones`, `partos`, `cesaria`, `vaginales`, `abortos`, `ectopico`, `mueren`, `menarquia`, `fum`, `fup`, `cual`, `ultima_citologia`, `resultado`) VALUES ('"+session.getAttribute("serial_pacinete")+"','"+session.getAttribute("serial_consulta")+"',now(),"+getaciones+","+partos+","+cesarear+","+vaginales+","+abortos+","+ectopicos+","+muertos+","+menarquia+","+fum+","+fup+",'"+metodo+"',"+fechcitologia+", '"+resucitologia+"');";
     // System.out.println("datoins=>"+con);
        if(ba.transaccion(con)==false){
        String dos="UPDATE `ips_isalud`.`ante_obstreticos` SET `fecha`=now(), `gestaciones`="+getaciones+", `partos`="+partos+", `cesaria`="+cesarear+", `vaginales`="+vaginales+", `abortos`="+abortos+", `ectopico`="+ectopicos+", `mueren`="+muertos+", `menarquia`="+menarquia+", `fum`="+fum+", `fup`="+fup+", `cual`='"+metodo+"', `ultima_citologia`="+fechcitologia+", `resultado`='"+resucitologia+"' WHERE `id_historia_clinica`='"+session.getAttribute("serial_pacinete")+"' and `id_consulta`='"+session.getAttribute("serial_consulta")+"';";
        ba.transaccion(dos);
        
        }       
                      
       ba.cerrar();
       
      %>
    </body>
</html>

