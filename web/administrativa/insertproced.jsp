<%-- 
    Document   : newjsp
    Created on : 20-mar-2013, 10:07:03
    Author     : Fercho
--%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>

<%   
            
            
         
      response.setContentType("text/x-json");
      response.setCharacterEncoding("utf-8");
      response.setHeader("Pragma", "no-cache");
      response.setHeader("Cache-Control", "no-cache, must-revalidate");
      response.setHeader("Pragma", "no-cache");
      JSONObject obj=new JSONObject();      
         
         
         String obs,pp,quir,c,c1,ser,cup,des;
         if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){obj.put("res","0");}
         else{
              try{
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb(); 
                
                obs=request.getParameter("obstetrico");
                pp=request.getParameter("pyp");
                quir=request.getParameter("quirurjico");
                c1=request.getParameter("consulta1");
                c=request.getParameter("consulta");
                ser=request.getParameter("servicio");
                
                cup=request.getParameter("cod_cup");
                
                String datos[]=new String[1];
                String sqlcup= "select id_cups from cups where cup_verdadero='"+cup+"';";
                ResultSet resucup=ba.consultas(sqlcup);
                try{
                             while (resucup.next()||resucup!=null) { 
                                         datos[0]=resucup.getString(1);
                                         
                                       }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                
                if(obs ==null){
                    obs="0";
                }
                else{
                    obs="1";
                } 
                if(pp ==null){
                    pp="0";
                }
                else{
                    pp="1";
                }
                if(quir ==null){
                    quir="0";
                }
                else{
                    quir="1";
                }
                if(c1 ==null){
                    c1="0";
                }
                else{
                    c1="1";
                }
                if(c ==null){
                    c="0";
                }
                else{
                    c="1";
                }
                if(ser ==null){
                    ser="0";
                }
                else{
                    ser="1";
                }
                
                String emin=request.getParameter( "edadmin" );
                if(emin.compareTo("")==0){
                emin="null";
                //out.print(emin);
                }
                else {emin="'"+emin+"'";}
            
                String emax=request.getParameter( "edadmax" );
                if(emax.compareTo("")==0){
                emax="null";
                //out.print(emax);
                }
                else {emax="'"+emax+"'";}
                
                String sql="INSERT INTO `ips_isalud`.`procedimientos_tari`(`codigo_maipos`,`cod_cups`,`descripcion`,`sexo`,`edad_min`,`unidad_edad_min`,`edad_max`,`unidad_edad_max`,`plan_beneficios`,`obstetrico`,`pyp`,`quirurgico`,`consulta_primeraves`,`consulta`,`servicio`,`cod_finalidad`,`cod_rip_adicional`,`cod_forma_realiza`,`cod_tipo_serv`,`cod_concepto_facturacion`) VALUES ('"+request.getParameter( "cod_mapipo" )+"','"+datos[0]+"','"+request.getParameter( "mapipo" )+"','"+request.getParameter( "sexo" )+"',"+emin+",'"+request.getParameter( "edadmin2" )+"',"+emax+",'"+request.getParameter( "edadmax2" )+"','"+request.getParameter( "plan" )+"','"+obs+"','"+pp+"','"+quir+"','"+c1+"','"+c+"','"+ser+"','"+request.getParameter( "finalidad" )+"','"+request.getParameter( "rip_adicional" )+"','"+request.getParameter( "formarealizacion" )+"','"+request.getParameter( "tiposervicio" )+"','"+request.getParameter( "conceptofactu" )+"');";
                //out.print(sql);
                              
                if(ba.transaccion(sql)){  obj.put("res","1");}
                else{  obj.put("res","0");}
                ba.cerrar();  
                               }
              catch(Exception e){  obj.put("res","0");}
             }
         
        out.print(obj);
        out.close(); 
        %>   
 