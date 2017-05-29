<%-- 
    Document   : edita_empleado
    Created on : 24/04/2013, 05:34:05 PM
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
                   
           String insertpermi="";       
     String inserthisto="";       
            
            
        int subio=0;   
        String id="";
        String numero="";      
        String archivo2="";   
        String archivo3="";               
                   
          String depto="''";         
        String seria="";   
        String cedula="";   
        String archivo1="";   
        String nombresss="";            
        String cambia=""; 
        String idant="";                                                        
       String datos[]= new String[15];
         for(int i=0;i<15;i++){ datos[i]="''"; }
         String datos2[]= new String[8];
         for(int i=0;i<8;i++){ datos2[i]="''"; }
               
                   String ruta="";
                String destination="imagenes/fotos/";
                String destinationRealPath = application.getRealPath(destination);
                DiskFileItemFactory factory=new DiskFileItemFactory();
                factory.setSizeThreshold (1024);
                factory.setRepository (new File(destinationRealPath));
                ServletFileUpload uploader =new ServletFileUpload(factory);
                
                String ruta2="";
                String destination2="archivos/contratos_emp/";
                String destinationRealPath2 = application.getRealPath(destination2);
                DiskFileItemFactory factory2=new DiskFileItemFactory();
                factory2.setSizeThreshold (1024);
                factory2.setRepository (new File(destinationRealPath2));
                ServletFileUpload uploader2 =new ServletFileUpload(factory2);
                
                String ruta3="";
                String destination3="archivos/firmas/";
                String destinationRealPath3 = application.getRealPath(destination3);
                DiskFileItemFactory factory3=new DiskFileItemFactory();
                factory3.setSizeThreshold (1024);
                factory3.setRepository (new File(destinationRealPath3));
                ServletFileUpload uploader3 =new ServletFileUpload(factory3);
                
                
            try{

                List items =uploader.parseRequest(request);
                Iterator iterator = items.iterator();
                while(iterator.hasNext()){ 
                    FileItem item=(FileItem)iterator.next();
                    if(!item.isFormField()){//negacion en if "!" 
                         if(item.getName()==null||item.getName().compareTo("")==0){}
                         else{   
                                String fname="";
                                String ext="";
                                int mid= item.getName().lastIndexOf(".");
                                fname=item.getName().substring(0,mid);
                                ext=item.getName().substring(mid+1,item.getName().length());  
                                                                                                             
                                if(item.getFieldName().compareTo("filef") ==0){ 
                                                                               archivo1=", `foto`='"+fecha+"_"+id+"."+ext+"'";                                             
                                                                               File file=new File(destinationRealPath,""+fecha+"_"+id+"."+ext);
                                                                               item.write(file);
                                                                               ruta=file.getName();///nombre real
                                                                            //  out.write("<p>foto "+file.getName()+" fue cargado ok </p>");
                                                                               subio=1;
                                                                              }
                                else if(item.getFieldName().compareTo("contrato")==0){
                                                                               archivo2=", `ruta_contrato`='archivos/contratos_emp/"+fecha+"_"+id+"."+ext+"'";                                             
                                                                               File file=new File(destinationRealPath2,""+fecha+"_"+id+"."+ext);
                                                                               item.write(file);
                                                                               ruta2=file.getName();///nombre real
                                                                            //   out.write("<p>contrato "+file.getName()+" fue cargado ok </p>");
                                                                               subio=1;
                                                                               }
                                else if(item.getFieldName().compareTo("firma")==0){
                                                                               archivo3=", `firma`='archivos/firmas/"+fecha+"_"+id+"."+ext+"'"; 
                                                                               File file=new File(destinationRealPath3,""+fecha+"_"+id+"."+ext);
                                                                               item.write(file);
                                                                               ruta3=file.getName();///nombre real
                                                                         //    out.write("<p>firma  "+file.getName()+" fue cargado ok </p>");
                                                                               subio=1;
                                                                              }
                                                                        
                                          }
                    }else {    //aca recibe parametros
                     
                                if(item.getFieldName().compareTo("nombre1")==0){              try{datos[0]="'"+item.getString()+"'"; nombresss=""+item.getString();              }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("nombre2")==0){              try{datos[1]="'"+item.getString()+"'"; nombresss=nombresss+" "+item.getString();   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("apellido1")==0){            try{datos[2]="'"+item.getString()+"'"; nombresss=nombresss+" "+item.getString();   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("apellido2")==0){            try{datos[3]="'"+item.getString()+"'"; nombresss=nombresss+" "+item.getString();   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("calenaci")==0){             try{datos[4]="'"+item.getString()+"'";    }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("tipoid")==0){               try{datos[5]="'"+item.getString()+"'";    }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("id")==0){ try{datos[6]="'"+item.getString()+"'";   cedula=""+item.getString(); }catch(Exception e){} }
                           else if(item.getFieldName().compareTo("idant")==0){ try{idant=""+item.getString()+""; }catch(Exception e){} }
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
                           else if(item.getFieldName().compareTo("cambia")==0){                try{cambia=""+item.getString();   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("serial_per")==0){                try{id=""+item.getString();   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("dptoemp")==0){               try{depto="'"+item.getString()+"'";   }catch(Exception e){}}     
                   
                        /////////
                                ////datos para empleado
                           else if(item.getFieldName().compareTo("cargo")==0){                try{datos2[0]="'"+item.getString()+"'";   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("tarjeta_prof")==0){         try{datos2[1]="'"+item.getString()+"'";   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("registro_prof")==0){        try{datos2[2]="'"+item.getString()+"'";   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("calendariovinculacion")==0){try{datos2[3]="'"+item.getString()+"'";   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("claveemp")==0){if(item.getString().length()>0||item.getString().compareTo("")!=0) {datos2[4]=", `clave`=password('"+item.getString()+"')";  }     else{datos2[4]="";}   }
                           else if(item.getFieldName().compareTo("cambio_datosp")==0){try{datos2[5]="'"+item.getString()+"'";   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("cambio_datose")==0){             try{datos2[6]="'"+item.getString()+"'";   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("estadoempleado")==0){             try{datos2[7]="'"+item.getString()+"'";   }catch(Exception e){}}


                                                                                                                                                            }
                }
            }
            catch(FileUploadException e){
                out.write("<p>Error al cargar archivo "+e.getMessage()+"</p>");
            }
    if(cedula.compareTo(idant)==0){idant="";}
    else{idant="`id_person`='"+cedula+"',";}            
     
                        
    String sql="UPDATE `ips_isalud`.`personas` SET "+idant+"`tipo_id`="+datos[5]+", `p_nom`="+datos[0]+", `s_nom`="+datos[1]+", `p_ape`="+datos[2]+", `s_ape`="+datos[3]+", `email`="+datos[13]+", `telefono`="+datos[12]+", `id_muni`="+datos[9]+", `direccion`="+datos[11]+", `genero`="+datos[7]+", `fecha_naci`="+datos[4]+", `id_rh`="+datos[8]+""+archivo1+", `barrio`="+datos[10]+", `id_eps`="+datos[14]+", `id_depto`="+depto+" WHERE `serial`='"+id+"';";
    String sqlem="UPDATE `ips_isalud`.`empleados` SET `id_cargo`="+datos2[0]+""+datos2[4]+", `fecha_ingreso`="+datos2[3]+", `tarjeta_prof`="+datos2[1]+""+archivo3+", `registro_prof`="+datos2[2]+""+archivo2+", `activo`="+datos2[7]+" WHERE `serial_empleado`='"+id+"';"; 
    String mashisto="";
    
  //  out.println("sql 1: "+sql);
  //  out.println("<br>sql 2: "+sqlem+"<br>d1 "+datos2[5]+"<br>d2 "+datos2[6]);
   //actualiza datos personales 
String paraimp="";      
 if(datos2[5].compareTo("'1'")==0){
      if(ba.transaccion(sql)==false){ paraimp=paraimp+" Falla al editar datos personales"; mashisto=mashisto+" Falla al editar datos de persona";}
                               else{  paraimp=paraimp+" Datos personales editados con exito";out.print("<center> <h2 style='color:green'></h2></center>"); }
                                 }
      //actualiza datos de empleado
 if(datos2[6].compareTo("'1'")==0){
  
   if(ba.transaccion(sqlem)==false){ if(paraimp.length()>0){paraimp=paraimp+",";}
                                     paraimp=paraimp+" Falla al editar datos de contratacion"; mashisto=mashisto+" Falla al editar datos de emplado"; }
                               else{ if(paraimp.length()>0){paraimp=paraimp+",";}
                                     paraimp=paraimp+" Datos de contratacion editados con exito";    }
                                 }
  out.print("<center> <h2 style='color:green'>"+paraimp+"</h2></center>");                                
  
   String sqlh="insert into historial_c (id_empleado,fecha_hora,descripcion) values ('"+session.getAttribute("id")+"',now(),'"+cambia+""+mashisto+"');";
       // System.out.print("sqhisto "+sqlh);
        try{ if(ba.transaccion(sqlh)==true){ } }
        catch(Exception e){}   
   
   
   
     out.println("</body></html>");
     

   
   ba.cerrar();
%>