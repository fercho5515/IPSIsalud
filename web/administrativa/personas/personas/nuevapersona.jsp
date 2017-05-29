<%-- 
    Document   : nuevapersona
    Created on : 12/04/2013, 09:48:13 AM
    Author     : EMMANUEL
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.util.*" session="true" %>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="org.apache.commons.io.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


       <% request.setCharacterEncoding("UTF-8");
      
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
    <% 
              out.println("</body></html>");
              return;
            } 
            
                    
 Calendar cal1 = Calendar.getInstance();
	            String dia=""+cal1.get(Calendar.DATE)+"";
	                   dia=dia.trim();
	            String mes=""+(1+Integer.parseInt(""+cal1.get(Calendar.MONTH)+""))+"";
	                   mes=mes.trim();
	            if(dia.length()==1){dia="0"+dia;} 
	            if(mes.length()==1){mes="0"+mes;} 	      
                String fecha=""+dia+"-"+mes+"-"+cal1.get(Calendar.YEAR)+"-"+cal1.get(Calendar.HOUR)+"-"+cal1.get(Calendar.MINUTE)+"-"+cal1.get(Calendar.SECOND)+"-"+cal1.get(Calendar.MILLISECOND);
   
            
        conecta_bd ba=new conecta_bd();
                   ba.ConectaDb();    
            
        int subio=0;   
        String cedula="";
        String numero="";    
        String archivo1="null";     
        String archivo2="null";   
        String archivo3="null";   
        String nombresss="";            
        String depto="''";
       String datos[]= new String[15];
         for(int i=0;i<15;i++){ datos[i]=""; }
              
                String ruta="";
                String destination="imagenes/fotos/";
                String destinationRealPath = application.getRealPath(destination);
                DiskFileItemFactory factory=new DiskFileItemFactory();
                factory.setSizeThreshold (1024);
                factory.setRepository (new File(destinationRealPath));
                ServletFileUpload uploader =new ServletFileUpload(factory);
                
                
            try{

                List items =uploader.parseRequest(request);
                Iterator iterator = items.iterator();
                while(iterator.hasNext()){ 
                    FileItem item=(FileItem)iterator.next();
                    if(!item.isFormField()){//negacion en if "!" 
                         if(item.getName()==null||item.getName().compareTo("")==0){archivo1="null";archivo2="null";archivo3="null";}
                         else{   
                                String fname="";
                                String ext="";
                                int mid= item.getName().lastIndexOf(".");
                                fname=item.getName().substring(0,mid);
                                ext=item.getName().substring(mid+1,item.getName().length());  
                                                                                                             
                                archivo1="'"+fecha+"_"+cedula+"."+ext+"'";                                             
                                File file=new File(destinationRealPath,""+fecha+"_"+cedula+"."+ext);
                                item.write(file);
                                ruta=file.getName();///nombre real
                               // out.write("<p>foto "+file.getName()+" fue cargado ok </p>");
                                subio=1;
                                                                        
                                          }
                    }else {    //aca recibe parametros
                     
                                if(item.getFieldName().compareTo("nombre1")==0){              try{datos[0]="'"+item.getString()+"'"; nombresss=""+item.getString();              }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("nombre2")==0){              try{datos[1]="'"+item.getString()+"'"; nombresss=nombresss+" "+item.getString();   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("apellido1")==0){            try{datos[2]="'"+item.getString()+"'"; nombresss=nombresss+" "+item.getString();   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("apellido2")==0){            try{datos[3]="'"+item.getString()+"'"; nombresss=nombresss+" "+item.getString();   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("calenaci")==0){             try{datos[4]="'"+item.getString()+"'";    }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("tipoid")==0){               try{datos[5]="'"+item.getString()+"'";    }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("id")==0){               
                                                                           try{datos[6]="'"+item.getString()+"'";   cedula=""+item.getString(); }catch(Exception e){}
                                                                           String sql="select count(id_person) from personas where id_person='"+item.getString()+"'";
                                                                           String cant="0";
                                                                            ResultSet resu4=null;
                                                                            try{  resu4=ba.consultas(sql);
                                                                                  while (resu4.next()&&resu4!=null) {  
                                                                                              cant=resu4.getString(1);
                                                                                                                    }
                                                                               }                       
                                                                            catch(SQLException ex){}
                                                                            catch(Exception exe){}
                                                                            ba.cierraResultado(resu4);
                                                                            if(cant.compareTo("1")==0){
                                                                                      out.print("</body></html>");
                                                                                      out.print("<center> <h2 style='color:red'>La persona ya esta registrada</h2></center>"); 
                                                                                      return;
                                                                                                      }
                                                                          }
                           else if(item.getFieldName().compareTo("sexo")==0){                 try{datos[7]="'"+item.getString()+"'";    }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("rh")==0){                   try{datos[8]="'"+item.getString()+"'";    }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("ciudad")==0){               try{datos[9]="'"+item.getString()+"'";    }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("barrio")==0){               try{datos[10]="'"+item.getString()+"'";   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("direcc")==0){               try{datos[11]="'"+item.getString()+"'";   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("telefono")==0){             try{datos[12]="'"+item.getString()+"'";   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("email")==0){                try{datos[13]="'"+item.getString()+"'";   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("epsemp")==0){               try{
                                                                                                  if(item.getString().compareTo("ninguna")==0){datos[14]="null";}
                                                                                                  else{datos[14]="'"+item.getString()+"'";  }
                                                                                                 }
                                                                                              catch(Exception e){}}
                          else if(item.getFieldName().compareTo("dptoemp")==0){               try{depto="'"+item.getString()+"'";   }catch(Exception e){}}     
                    }
                }
            }
            catch(FileUploadException e){
                out.write("<p>Error al cargar archivo "+e.getMessage()+"</p>");
            }
    

       
    String sql="INSERT INTO `ips_isalud`.`personas` (`id_person`, `tipo_id`, `p_nom`, `s_nom`, `p_ape`, `s_ape`, `email`, `telefono`, `id_muni`, `direccion`, `genero`, `fecha_naci`, `id_rh`, `foto`, `barrio`, `id_eps`, `id_depto`) VALUES ("+datos[6]+","+datos[5]+","+datos[0]+","+datos[1]+","+datos[2]+","+datos[3]+","+datos[13]+","+datos[12]+", "+datos[9]+","+datos[11]+","+datos[7]+","+datos[4]+","+datos[8]+","+archivo1+","+datos[10]+","+datos[14]+","+depto+");";
 //+ "INSERT INTO `ips_isalud`.`contratacion` (`nombre`,`cod_eps`, `cod_ips`, `f_inicio`, `f_fin`, `n_contrato`, `objeto_cont`, `resumen_contrato`, `modalidad`, `regimen`, `v_cap_ano`, `v_cap_mes`, `alarma_en`, `v_fac_ano`, `v_fac_mes`, `alarma`, `factura`, `ruta`, `num_afiliados`, `por_upc`) VALUES ("+datos[17]+","+datos[16]+",'1',"+datos[14]+","+datos[15]+","+datos[0]+","+datos[1]+","+datos[2]+","+datos[3]+","+datos[4]+","+datos[7]+","+datos[8]+","+datos[9]+","+datos[10]+","+datos[11]+","+datos[12]+","+datos[13]+","+archivo1+","+datos[5]+","+datos[6]+");";  

  
   if(ba.transaccion(sql)==false){    
        out.print("<center> <h2 style='color:red'>Falla al crear persona</h2></center>"); 
                                 }
   else{   
        out.print("<center> <h2 style='color:green'>Persona creada con exito</h2></center>");
        String sqlh="insert into historial_c (id_empleado,fecha_hora,descripcion) values ('"+session.getAttribute("id")+"',now(),'crea persona "+nombresss+" con identificacion "+cedula+"');";
        try{ if(ba.transaccion(sqlh)==true){ } }
        catch(Exception e){}   
 }
     out.println("</body></html>");
     
 
   
   ba.cerrar();
%>