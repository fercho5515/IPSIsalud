<%-- 
    Document   : nuevopaciente
    Created on : 28/04/2013, 10:42:19 AM
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
         <% 
           request.setCharacterEncoding("UTF-8");
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
            
           String idpaciente=request.getParameter("id_pers");
           String hisotial=request.getParameter("para_histo"); 
           
           String estcivil=request.getParameter("estado_civil");
           String neducativo=request.getParameter("nivel_educadivo");
           String nsisben=request.getParameter("nivel_sisben");
           String orisex=request.getParameter("orientacion_sex");
           String eps=request.getParameter("epsemptext");//si nada  ##4#&
           String ncarnet=request.getParameter("ncarnet");//depende de si tiene eps
           String fafiliacion=request.getParameter("fec_afiliacion");//depende de si tiene eps
           String tipousu=request.getParameter("tipo_usu");
           String zona=request.getParameter("zona");
           String vih=request.getParameter("vih");
           String fosiga=request.getParameter("fosiga");
           String estfosiga=request.getParameter("estadofosiga");//depende del fosiga
           String nomips=request.getParameter("nomips");
           String modalidad=request.getParameter("modalidad");
           String idtpob=request.getParameter("idtpob");
           String embarazo=request.getParameter("embarazo"); //solo para mujer
         //  System.out.println("eps: "+eps);
           if(eps.compareTo("Seleccione Eps")==0){
                 ncarnet="null";
                 fafiliacion="null";
                 tipousu="null";
           }
          else{
               if(ncarnet!=null && ncarnet.compareTo("")!=0){         ncarnet="'"+ncarnet+"'";  }else{      ncarnet="null";}
               if(fafiliacion!=null && fafiliacion.compareTo("")!=0){ fafiliacion="'"+fafiliacion+"'";}else{fafiliacion="null";}
               if(tipousu!=null && tipousu.compareTo("")!=0){         tipousu="'"+tipousu+"'";}else{        tipousu="null";   }
               }
           if(fosiga.compareTo("CARGADO AL FOSIGA")!=0){estfosiga=null;
                                                         if(fosiga.compareTo("0")==0){fosiga=null;}
                                                         else{ fosiga="'"+fosiga+"'";}
                                                         }
           else{estfosiga="'"+estfosiga+"'";fosiga="'"+fosiga+"'"; }
           
           
           String sql="INSERT INTO `ips_isalud`.`pacientes` (`serial_persona`, `cod_estado_civil`, `id_nivel_educativo`, `fecha_afi`, `nivel_sisben`, `cod_modalidad`, `idtpob`, `nu_carnet`, `fosiga`, `estado_fosiga`, `cod_zona`, `embarazo_activo`, `id_orientacion`, `id_tipo_usuario`, `vih`, `nomips`) "
                                                   + "VALUES ('"+idpaciente+"','"+estcivil+"','"+neducativo+"',"+fafiliacion+",'"+nsisben+"', '"+modalidad+"', '"+idtpob+"',"+ncarnet+","+fosiga+","+estfosiga+", '"+zona+"','"+embarazo+"','"+orisex+"',"+tipousu+", '"+vih+"', '"+nomips+"');";
         //  System.out.println("insert "+sql);
           conecta_bd ba=new conecta_bd();
           ba.ConectaDb();    
            if(ba.transaccion(sql)==false){    
                   out.print("<center> <h2 style='color:red'>Falla al crear paciente</h2></center>"); 
                                            }
              else{   
                   out.print("<center> <h2 style='color:green'>Paciente creado con exito</h2></center>");
                   String sqlh="insert into historial_c (id_empleado,fecha_hora,descripcion) values ('"+session.getAttribute("id")+"',now(),'"+hisotial+"');";
                   try{ if(ba.transaccion(sqlh)==true){ } }
                   catch(Exception e){}   
            }



              ba.cerrar();           
          %>
    </body>
</html>
