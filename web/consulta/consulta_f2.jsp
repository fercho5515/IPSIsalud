<%-- 
    Document   : consulta_f2
    Created on : 6/05/2013, 05:12:30 PM
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
           <%    request.setCharacterEncoding("UTF-8");
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
       
        
        String fcar="null";
        try{float i=Float.parseFloat(""+request.getParameter("frecuenciacardica")+"");
               fcar="'"+request.getParameter("frecuenciacardica")+"'";     }
        catch(Exception exe){fcar="null";}
              
        String fres="null";
        try{float i=Float.parseFloat(""+request.getParameter("frecuenciarespiratoria")+"");
               fres="'"+request.getParameter("frecuenciarespiratoria")+"'";     }
        catch(Exception exe){fres="null";}
        
        String ten1="null";
        try{float i=Float.parseFloat(""+request.getParameter("tensionarterial1")+"");
               ten1="'"+request.getParameter("tensionarterial1")+"'";     }
        catch(Exception exe){ten1="null";}
        
        String ten2="null";
        try{float i=Float.parseFloat(""+request.getParameter("tensionarterial2")+"");
               ten2="'"+request.getParameter("tensionarterial2")+"'";     }
        catch(Exception exe){ten2="null";}
                
        String temp="null";
        try{float i=Float.parseFloat(""+request.getParameter("temperatura")+"");
               temp="'"+request.getParameter("temperatura")+"'";     }
        catch(Exception exe){temp="null";}
        
        String peso="null";
        try{float i=Float.parseFloat(""+request.getParameter("peso")+"");
               peso="'"+request.getParameter("peso")+"'";     }
        catch(Exception exe){peso="null";}
        
        String tall="null";
        try{float i=Float.parseFloat(""+request.getParameter("talla")+"");
               tall="'"+request.getParameter("talla")+"'";     }
        catch(Exception exe){tall="null";}
        
        String per=""+session.getAttribute("permiso");
        
        String aspectogen="";
        if(per.compareTo("3")!=0){ try{aspectogen=""+request.getParameter("aspectogeneral")+"";}
                                   catch(Exception ese){aspectogen="";}
                                   aspectogen=aspectogen.replace("'","").replace("\"","");
                               }
        
        
        ten1=ten1.replace("'","").replace("\"","");
        ten2=ten2.replace("'","").replace("\"","");
        fcar=fcar.replace("'","").replace("\"","");
        fres=fres.replace("'","").replace("\"","");
        temp=temp.replace("'","").replace("\"","");
        peso=peso.replace("'","").replace("\"","");
        tall=tall.replace("'","").replace("\"","");
        aspectogen=",`conducta_recomen`='"+aspectogen+"' ";
         
        String rcv="'0'";
        if(request.getParameter("rcv")!=null && request.getParameter("rcv").trim().compareTo("")!=0){
        rcv="'"+request.getParameter("rcv").replace("'","").replace("\"","")+"'";}
       
        
        
        String con="UPDATE `ips_isalud`.`consulta_medica` SET `tension_alta`="+ten1+", `tension_baja`="+ten2+", `f_cardiaca`="+fcar+", `f_respiratoria`="+fres+", `temperatura`="+temp+", `peso`="+peso+", `talla`="+tall+""+aspectogen+",`rcv`="+rcv+"  WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';";
// + "UPDATE `ips_isalud`.`consulta_medica` SET `anamnesis`='"+motconsu+"', `enf_actual`='"+enfact+"', `revision_por_sistemas`='"+revpsist+"' WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';";
    //   System.out.println("f2 "+con);
        ba.transaccion(con);       
                      
       ba.cerrar();
       
      %>
    </body>
</html>

