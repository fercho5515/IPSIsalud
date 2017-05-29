<%-- 
    Document   : edita_controles_gestacion
    Created on : 11/07/2013, 07:43:35 PM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% request.setCharacterEncoding("UTF-8");
           if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null ){}
         else{
            String opera=(String)request.getParameter("oper");
            
            String id="null";
            String fecha="null";
   	    String edad9gest="null";
            String peso="null";
            String presion="null";
            String altura9uterina="null";
            String presentacion="null";
            String fcf="null";
            String movi9fetales="null";
            String fe="null";
            String folatos="null";
            String calcio="null";
            String estado9nutricional="null";
            String sind9exa9trata="null";
            String nombre9profesional="null";
            String proccima9cita="null";
            
                if(request.getParameter("id")!=null && request.getParameter("id").compareTo("null")!=0){id="'"+request.getParameter("id")+"'";}
                if(request.getParameter("fecha")!=null && request.getParameter("fecha").compareTo("null")!=0){fecha="'"+request.getParameter("fecha")+"'";}
                if(request.getParameter("edad9gest")!=null && request.getParameter("edad9gest").compareTo("null")!=0){edad9gest="'"+request.getParameter("edad9gest")+"'";}
                if(request.getParameter("peso")!=null && request.getParameter("peso").compareTo("null")!=0){peso="'"+request.getParameter("peso")+"'";}
                if(request.getParameter("presion")!=null && request.getParameter("presion").compareTo("null")!=0){presion="'"+request.getParameter("presion")+"'";}
                if(request.getParameter("altura9uterina")!=null && request.getParameter("altura9uterina").compareTo("null")!=0){altura9uterina="'"+request.getParameter("altura9uterina")+"'";}
                if(request.getParameter("presentacion")!=null && request.getParameter("presentacion").compareTo("null")!=0){presentacion="'"+request.getParameter("presentacion")+"'";}
                if(request.getParameter("fcf")!=null && request.getParameter("fcf").compareTo("null")!=0){fcf="'"+request.getParameter("fcf")+"'";}
                if(request.getParameter("movi9fetales")!=null && request.getParameter("movi9fetales").compareTo("null")!=0){movi9fetales="'"+request.getParameter("movi9fetales")+"'";}
                if(request.getParameter("fe")!=null && request.getParameter("fe").compareTo("null")!=0){fe="'"+request.getParameter("fe")+"'";}
                if(request.getParameter("folatos")!=null && request.getParameter("folatos").compareTo("null")!=0){folatos="'"+request.getParameter("folatos")+"'";}
                if(request.getParameter("calcio")!=null && request.getParameter("calcio").compareTo("null")!=0){calcio="'"+request.getParameter("calcio")+"'";}
                if(request.getParameter("estado9nutricional")!=null && request.getParameter("estado9nutricional").compareTo("null")!=0){estado9nutricional="'"+request.getParameter("estado9nutricional")+"'";}
                if(request.getParameter("sind9exa9trata")!=null && request.getParameter("sind9exa9trata").compareTo("null")!=0){sind9exa9trata="'"+request.getParameter("sind9exa9trata")+"'";}
                if(request.getParameter("nombre9profesional")!=null && request.getParameter("nombre9profesional").compareTo("null")!=0){nombre9profesional="'"+request.getParameter("nombre9profesional")+"'";}
                if(request.getParameter("proccima9cita")!=null && request.getParameter("proccima9cita").compareTo("null")!=0){proccima9cita="'"+request.getParameter("proccima9cita")+"'";}
               
              if(opera.compareTo("add")==0){
                         conecta_bd ba = new conecta_bd();
                        ba.ConectaDb();
                        String idgest="";
                        String c="select g.serial from materno_perinatal m, gestacion_actual g where m.serial=g.materno_perinatal and m.idembarazo=(select max(serial) from embarazo where cod_paciente='"+session.getAttribute("serial_pacinete")+"' )";
                           ResultSet resuc=null;
                          try{  resuc=ba.consultas(c);
                              while (resuc.next()&&resuc!=null) {  
                                                 idgest="'"+resuc.getString(1)+"'";
                                                              }
                             }                       
                          catch(SQLException ex){}
                          catch(Exception exe){}
                          ba.cierraResultado(resuc);
                          String sql="INSERT INTO `ips_isalud`.`controles_gestacion` (`id_gestacion_actual`, `fecha`, `edad_gest`, `peso`, `presion`, `altura_uterina`, `presentacion`, `fcf`, `movi_fetales`, `fe`, `folatos`, `calcio`, `estado_nutricional`, `sind_exa_trata`, `nombre_profesional`, `proccima_cita`, `cod_consulta`) VALUES ("+idgest+",curdate(),"+edad9gest+","+peso+","+presion+","+altura9uterina+","+presentacion+","+fcf+","+movi9fetales+","+fe+","+folatos+","+calcio+","+estado9nutricional+", "+sind9exa9trata+","+nombre9profesional+","+proccima9cita+",'"+session.getAttribute("serial_consulta")+"');";
                          ba.transaccion(sql);
                          ba.cerrar();
                                     }
             if(opera.compareTo("edit")==0){                           
                          conecta_bd ba = new conecta_bd();
                          ba.ConectaDb();                        
                          String sql="UPDATE `ips_isalud`.`controles_gestacion` SET `edad_gest`="+edad9gest+", `peso`="+peso+", `presion`="+presion+", `altura_uterina`="+altura9uterina+", `presentacion`="+presentacion+", `fcf`="+fcf+", `movi_fetales`="+movi9fetales+", `fe`="+fe+", `folatos`="+folatos+", `calcio`="+calcio+", `estado_nutricional`="+estado9nutricional+", `sind_exa_trata`="+sind9exa9trata+", `nombre_profesional`="+nombre9profesional+", `proccima_cita`="+proccima9cita+" WHERE `serial`="+id+";";                
                          ba.transaccion(sql);
                          ba.cerrar();
                                     }
             else if(opera.compareTo("del")==0){
             
                        String sql="DELETE FROM `ips_isalud`.`controles_gestacion` WHERE `serial`="+id+";";
                        conecta_bd ba = new conecta_bd();
                        ba.ConectaDb();
                        ba.transaccion(sql);
                        ba.cerrar();                     

                                }
              } 
        %>
    </body>
</html>
