<%-- 
    Document   : inicia_carnet_peri
    Created on : 27/05/2013, 03:13:50 PM
    Author     : EMMANUEL
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
         request.setCharacterEncoding("UTF-8");
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){ /*System.out.print("hola1 ");*/}
         else{
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb();
                String ins="INSERT INTO `ips_isalud`.`embarazo` (`cod_paciente`, `fecha_inicio`, `cod_consulta_i`) VALUES ('"+session.getAttribute("serial_pacinete")+"',curdate(),'"+session.getAttribute("serial_consulta")+"');";
                String cod="select max(serial) as hh from embarazo where cod_paciente='"+session.getAttribute("serial_pacinete")+"'";
                if(ba.transaccion(ins)){     }
                
                String dat="";
                ResultSet resurh=null;
                try{  resurh=ba.consultas(cod);
                      while (resurh.next()&&resurh!=null) {  
                                       dat=""+resurh.getString(1);
                                                           }
                   }                       
                catch(SQLException ex){}
                catch(Exception exe){}
                ba.cierraResultado(resurh);
                
                String ins2="UPDATE `ips_isalud`.`historia_clinica` SET `cod_embarazo`='"+dat+"' WHERE `serial_peciente`='"+session.getAttribute("serial_pacinete")+"';";
                ba.transaccion(ins2);
              //  System.out.println("inicia_canet -->"+ins+"\n"+cod+"\n"+dat+"\n"+ins2);
                String ins3="INSERT INTO `ips_isalud`.`materno_perinatal` (`idembarazo`) VALUES ('"+dat+"');";
                ba.transaccion(ins3);
                String ins4="update `ips_isalud`.`pacientes` SET embarazo_activo='1' where serial_persona='"+session.getAttribute("serial_pacinete")+"';";
                ba.transaccion(ins4);
                
                String c2="select serial from materno_perinatal where idembarazo='"+dat+"'";
                String idmaternoperi="";
                 ResultSet resurh2=null;
                try{  resurh2=ba.consultas(c2);
                      while (resurh2.next()&&resurh2!=null) {  
                                       idmaternoperi=""+resurh2.getString(1);
                                                           }
                   }                       
                catch(SQLException ex){}
                catch(Exception exe){}
                ba.cierraResultado(resurh2);
                
                String ins5="INSERT INTO `ips_isalud`.`antecedentes_perinatal` (`serial_meterno_perinatal`) VALUES ('"+idmaternoperi+"');";
                ba.transaccion(ins5);
                
                String ins6="INSERT INTO `ips_isalud`.`obstetrico` (`materno_perinatal`) VALUES ('"+idmaternoperi+"');";
                ba.transaccion(ins6);
                
                String ins7="INSERT INTO `ips_isalud`.`gestacion_actual` (`materno_perinatal`) VALUES ('"+idmaternoperi+"');";
                ba.transaccion(ins7);
                
                String ins8="INSERT INTO `ips_isalud`.`parto_aborto` (`id_materno_perinatal`) VALUES ('"+idmaternoperi+"');";
                ba.transaccion(ins8);
                
                String ins9="INSERT INTO `ips_isalud`.`enfermedades` (`materno_perinatal`) VALUES ('"+idmaternoperi+"');";
                ba.transaccion(ins9);
                
                String ins10="INSERT INTO `ips_isalud`.`recien_nacido` (`materno_perinatal`) VALUES ('"+idmaternoperi+"');";
                ba.transaccion(ins10);
            
                String ins11="INSERT INTO `ips_isalud`.`puerperio` (`id_materno_perinatal`) VALUES ('"+idmaternoperi+"');";
                ba.transaccion(ins11);
                
                ba.cerrar();           

               }
        %>
    </body>
</html>

