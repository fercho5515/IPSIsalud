<%-- 
    Document   : edita_persona
    Created on : 15/04/2013, 07:26:58 PM
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
        String seria="";   
        String cedula="";   
        String archivo1="";   
        String nombresss="";            
        String cambia=""; 
        String idant="";     
        String depto="''";                                                          
       String datos[]= new String[15];
         for(int i=0;i<15;i++){ datos[i]="''"; }
              
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
                         if(item.getName()==null||item.getName().compareTo("")==0){archivo1="";}
                         else{   
                                String fname="";
                                String ext="";
                                int mid= item.getName().lastIndexOf(".");
                                fname=item.getName().substring(0,mid);
                                ext=item.getName().substring(mid+1,item.getName().length());  
                                                                                                             
                                archivo1=", `foto`='"+fecha+"_"+cedula+"."+ext+"'";                                             
                                File file=new File(destinationRealPath, ""+fecha+"_"+cedula+"."+ext);
                                item.write(file);
                                ruta=file.getName();///nombre real
                               // out.write("<p>foto "+file.getName()+" fue cargado ok </p>");
                               
                                                                        
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
                           else if(item.getFieldName().compareTo("serial_per")==0){                try{seria=""+item.getString();   }catch(Exception e){}}
                          else if(item.getFieldName().compareTo("dptoemp")==0){               try{depto="'"+item.getString()+"'";   }catch(Exception e){}}     
                     }
                }
            }
            catch(FileUploadException e){
                out.write("<p>Error al cargar archivo "+e.getMessage()+"</p>");
            }
    if(cedula.compareTo(idant)==0){idant="";}
    else{idant="`id_person`='"+cedula+"',";}            
     
                        
    String sql="UPDATE `ips_isalud`.`personas` SET "+idant+"`tipo_id`="+datos[5]+", `p_nom`="+datos[0]+", `s_nom`="+datos[1]+", `p_ape`="+datos[2]+", `s_ape`="+datos[3]+", `email`="+datos[13]+", `telefono`="+datos[12]+", `id_muni`="+datos[9]+", `direccion`="+datos[11]+", `genero`="+datos[7]+", `fecha_naci`="+datos[4]+", `id_rh`="+datos[8]+""+archivo1+", `barrio`="+datos[10]+", `id_eps`="+datos[14]+", `id_depto`="+depto+" WHERE `serial`='"+seria+"';";
       
  //System.out.println("sql "+sql);
  
   if(ba.transaccion(sql)==false){    
        out.print("<center> <h2 style='color:red'>Falla al editar persona</h2></center>"); 
                                 }
   else{   
        out.print("<center> <h2 style='color:green'>Persona editada con exito</h2></center>");
        String sqlh="insert into historial_c (id_empleado,fecha_hora,descripcion) values ('"+session.getAttribute("id")+"',now(),'"+cambia+"');";
       // System.out.print("sqhisto "+sqlh);
        try{ if(ba.transaccion(sqlh)==true){ } }
        catch(Exception e){}   
 }
   out.println("<script type='text/javascript' language='javascript'>recargaTabla();</script>");
     out.println("</body></html>");
     

   
   ba.cerrar();
%>