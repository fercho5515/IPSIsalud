<%-- 
    Document   : carne_f2
    Created on : 28/05/2013, 09:47:33 AM
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
        
        
        String tbcfami="'8'";
        try{int tbcfamia=Integer.parseInt(""+request.getParameter("tbcfami").replace("'","").replace("\"","")+"");
                tbcfami="'"+request.getParameter("tbcfami").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){tbcfami="'8'";}
        
        String tbcperso="'8'";
        try{int tbcpersoa=Integer.parseInt(""+request.getParameter("tbcperso").replace("'","").replace("\"","")+"");
                tbcperso="'"+request.getParameter("tbcperso").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){tbcperso="'8'";}
        
        String diafami="'8'";
        try{int diafamia=Integer.parseInt(""+request.getParameter("diafami").replace("'","").replace("\"","")+"");
                diafami="'"+request.getParameter("diafami").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){diafami="'8'";}
        
        String diaperso="'8'";
        try{int diapersoa=Integer.parseInt(""+request.getParameter("diaperso").replace("'","").replace("\"","")+"");
                diaperso="'"+request.getParameter("diaperso").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){diaperso="'8'";}
        
        String hipfami="'8'";
        try{int hipfamii=Integer.parseInt(""+request.getParameter("hipfami").replace("'","").replace("\"","")+"");
                hipfami="'"+request.getParameter("hipfami").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){hipfami="'8'";}
        
        String hipperso="'8'";
        try{int hippersoo=Integer.parseInt(""+request.getParameter("hipperso").replace("'","").replace("\"","")+"");
                hipperso="'"+request.getParameter("hipperso").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){hipperso="'8'";}
        
        String prefami="'8'";
        try{int prefamia=Integer.parseInt(""+request.getParameter("prefami").replace("'","").replace("\"","")+"");
                prefami="'"+request.getParameter("prefami").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){prefami="'8'";}
        
        String preperso="'8'";
        try{int prepersoa=Integer.parseInt(""+request.getParameter("preperso").replace("'","").replace("\"","")+"");
                preperso="'"+request.getParameter("preperso").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){preperso="'8'";}
        
        String otrfami="'8'";
        try{int otrfamia=Integer.parseInt(""+request.getParameter("otrfami").replace("'","").replace("\"","")+"");
                otrfami="'"+request.getParameter("otrfami").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){otrfami="'8'";}
        
        String otrperso="'8'";
        try{int otrpersoa=Integer.parseInt(""+request.getParameter("otrperso").replace("'","").replace("\"","")+"");
                otrperso="'"+request.getParameter("otrperso").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){otrperso="'8'";}
        
        String cirugiapel="'8'";
        try{int cirugiapela=Integer.parseInt(""+request.getParameter("cirugiapel").replace("'","").replace("\"","")+"");
                cirugiapel="'"+request.getParameter("cirugiapel").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){cirugiapel="'8'";}
        
        String infertilidad="'8'";
        try{int infertilidada=Integer.parseInt(""+request.getParameter("infertilidad").replace("'","").replace("\"","")+"");
                infertilidad="'"+request.getParameter("infertilidad").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){infertilidad="'8'";}
        
        String vihpos="'8'";
        try{int vihposa=Integer.parseInt(""+request.getParameter("vihpos").replace("'","").replace("\"","")+"");
                vihpos="'"+request.getParameter("vihpos").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){vihpos="'8'";}
        
        String cardionefro="'8'";
        try{int cardionefroa=Integer.parseInt(""+request.getParameter("cardionefro").replace("'","").replace("\"","")+"");
                cardionefro="'"+request.getParameter("cardionefro").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){cardionefro="'8'";}
        
        String condmedgra="'8'";
        try{int condmedgraa=Integer.parseInt(""+request.getParameter("condmedgra").replace("'","").replace("\"","")+"");
                condmedgra="'"+request.getParameter("condmedgra").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){condmedgra="'8'";}
        
        String molas="'8'";
        try{int molasa=Integer.parseInt(""+request.getParameter("molas").replace("'","").replace("\"","")+"");
                molas="'"+request.getParameter("molas").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){molas="'8'";}
        
        String ectopicos="'8'";
        try{int ectopicosa=Integer.parseInt(""+request.getParameter("ectopicos").replace("'","").replace("\"","")+"");
                ectopicos="'"+request.getParameter("ectopicos").replace("'","").replace("\"","")+"'";
           }
        catch(Exception exe){ectopicos="'8'";}
       
        
        
        String codemb="";
        String c="select serial from materno_perinatal where idembarazo=(select max(serial) from embarazo where cod_paciente='"+session.getAttribute("serial_pacinete")+"' )";
              // + "select max(serial) from embarazo where cod_paciente='"+session.getAttribute("serial_pacinete")+"' ;";                   
          ResultSet resuc=null;
          try{  resuc=ba.consultas(c);
              while (resuc.next()&&resuc!=null) {  
                                 codemb="'"+resuc.getString(1)+"'";
                                              }
             }                       
          catch(SQLException ex){}
          catch(Exception exe){}
          ba.cierraResultado(resuc); 
        
        
        String con="INSERT INTO `ips_isalud`.`antecedentes_perinatal` (`serial_meterno_perinatal`, `tbcf`, `diabetesf`, `hipertensionf`, `preclamf`, `otrosf`, `tbcp`, `diabetesp`, `hipertensionp`, `preclamp`, `otrosp`, `cirujia_pelvica`, `infertilidad`, `vihpos`, `cardio_nefro`, `cond_med_grave`, `molas`, `ectopicos`) VALUES ("+codemb+","+tbcfami+","+diafami+","+hipfami+","+prefami+","+otrfami+","+tbcperso+","+diaperso+","+hipperso+","+preperso+","+otrperso+","+cirugiapel+","+infertilidad+","+vihpos+","+cardionefro+","+condmedgra+","+molas+","+ectopicos+");"; 
             //   System.out.println("datoins=>"+con);
        if(ba.transaccion(con)==false){
             String dos="UPDATE `ips_isalud`.`antecedentes_perinatal` SET `tbcf`="+tbcfami+", `diabetesf`="+diafami+", `hipertensionf`="+hipfami+", `preclamf`="+prefami+", `otrosf`="+otrfami+",`tbcp`="+tbcperso+",`diabetesp`="+diaperso+",`hipertensionp`="+hipperso+",`preclamp`="+preperso+",`otrosp`="+otrperso+",`cirujia_pelvica`="+cirugiapel+",`infertilidad`="+infertilidad+",`vihpos`="+vihpos+",`cardio_nefro`="+cardionefro+",`cond_med_grave`="+condmedgra+",`molas`="+molas+",`ectopicos`="+ectopicos+" WHERE `serial_meterno_perinatal`="+codemb+";";
             //    System.out.println("datoins=>"+dos);              
                ba.transaccion(dos);
                                      }       
        //       System.out.println("carne f2 uno=>"+con);               
       ba.cerrar();
       
      %>
    </body>
</html>
