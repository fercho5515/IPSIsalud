<%-- 
    Document   : nuevo_contrato
    Created on : 3/03/2013, 10:23:57 AM
    Author     : EMMANUEL
--%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.util.*" session="true" %>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="org.apache.commons.io.*"%>
<%@page import="java.io.*"%>
<%        
          response.setContentType("text/x-json");
          response.setCharacterEncoding("utf-8");
          response.setHeader("Pragma", "no-cache");
          response.setHeader("Cache-Control", "no-cache, must-revalidate");
          response.setHeader("Pragma", "no-cache");
          JSONObject obj=new JSONObject();      
          request.setCharacterEncoding("UTF-8");
        

                 
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
              obj.put("est","0");
              obj.put("msj","Sesión Expirada.");
             
            } else{
     
        Calendar cal1 = Calendar.getInstance();
	String dia=""+cal1.get(Calendar.DATE)+"";
	       dia=dia.trim();
	String mes=""+(1+Integer.parseInt(""+cal1.get(Calendar.MONTH)+""))+"";
	        mes=mes.trim();
	     if(dia.length()==1){dia="0"+dia;} 
	     if(mes.length()==1){mes="0"+mes;} 	      
        String fecha=""+dia+"-"+mes+"-"+cal1.get(Calendar.YEAR)+"-"+cal1.get(Calendar.HOUR)+"-"+cal1.get(Calendar.MINUTE)+"-"+cal1.get(Calendar.SECOND)+"-"+cal1.get(Calendar.MILLISECOND);

                             
       int subio=0;   
        String nombre="";
        String numero="";    
        String archivo="null";                                                       
       String datos[]= new String[18];
         for(int i=0;i<18;i++){ datos[i]=""; }
              
                String ruta="";
                String destination="archivos/contratos/";
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
                                 if(item.getName()==null||item.getName().compareTo("")==0){archivo="null";}
                                 else{   archivo="'archivos/contratos/"+fecha+"_"+nombre+"_"+numero+"_"+item.getName()+"'";                                             
                                         File file=new File(destinationRealPath,""+fecha+"_"+nombre+"_"+numero+"_"+item.getName());
                                         item.write(file);
                                         ruta=file.getName();///nombre real
                                         subio=1;
                                    }
                    }else {   
                                        if(item.getFieldName().compareTo("nocontrato")==0){       try{datos[0]="'"+item.getString()+"'";   numero=""+item.getString()+"";  }catch(Exception e){}}
                                   else if(item.getFieldName().compareTo("objetocontrato")==0){   try{datos[1]="'"+item.getString()+"'";   }catch(Exception e){}}
                                   else if(item.getFieldName().compareTo("resumencontrato")==0){  try{datos[2]="'"+item.getString()+"'";   }catch(Exception e){}}
                                   else if(item.getFieldName().compareTo("modalidadcontrato")==0){try{datos[3]="'"+item.getString()+"'";   }catch(Exception e){}}
                                   else if(item.getFieldName().compareTo("regimencontrato")==0){  try{datos[4]="'"+item.getString()+"'";   }catch(Exception e){}}
                                   else if(item.getFieldName().compareTo("numafiliados")==0){     try{datos[5]="'"+item.getString()+"'";   }catch(Exception e){}}
                                   else if(item.getFieldName().compareTo("porcentajeupc")==0){    try{datos[6]="'"+item.getString()+"'";   }catch(Exception e){}}
                                   else if(item.getFieldName().compareTo("contratovalorcano")==0){try{datos[7]="'"+item.getString()+"'";   }catch(Exception e){}}
                                   else if(item.getFieldName().compareTo("contratovalorcmes")==0){try{datos[8]="'"+item.getString()+"'";   }catch(Exception e){}}
                                   else if(item.getFieldName().compareTo("alaraunocontraen")==0){ try{datos[9]="'"+item.getString()+"'";   }catch(Exception e){}}
                                   else if(item.getFieldName().compareTo("contratovalorfano")==0){try{datos[10]="'"+item.getString()+"'";   }catch(Exception e){}}
                                   else if(item.getFieldName().compareTo("contratovalorfmes")==0){try{datos[11]="'"+item.getString()+"'";   }catch(Exception e){}}
                                   else if(item.getFieldName().compareTo("alaradoscontraen")==0){ try{datos[12]="'"+item.getString()+"'";   }catch(Exception e){}}
                                   else if(item.getFieldName().compareTo("contrahabifactu")==0){  try{datos[13]="'"+item.getString()+"'";   }catch(Exception e){}}
                                   else if(item.getFieldName().compareTo("fcontratod")==0){       try{datos[14]="'"+item.getString()+"'";   }catch(Exception e){}}
                                   else if(item.getFieldName().compareTo("fcontratoh")==0){       try{datos[15]="'"+item.getString()+"'";   }catch(Exception e){}}
                                   else if(item.getFieldName().compareTo("ideps")==0){            try{datos[16]="'"+item.getString()+"'";   }catch(Exception e){}}
                                   else if(item.getFieldName().compareTo("nom_cont")==0){         try{datos[17]="'"+item.getString()+"'";  nombre=""+item.getString()+""; }catch(Exception e){}}
                    }
                }
            }
            catch(FileUploadException e){
              /*  obj.put("est","2");
                obj.put("msj","Fallo al Crear");               
                out.print(obj);
                out.close();
                return;*/
            }
    
      for(int i=0;i<18;i++){
          if(datos[i].compareTo("''")==0){datos[i]="null";}
          else if(datos[i].compareTo("'on'")==0){datos[i]="'1'";}
          else if(datos[i].compareTo("'null'")==0){datos[i]="'0'";}
          // out.print((i+1)+" |"+datos[i]+"| <br>");
      }
       
    String sql="INSERT INTO `ips_isalud`.`contratacion` (`nombre`,`cod_eps`, `cod_ips`, `f_inicio`, `f_fin`, `n_contrato`, `objeto_cont`, `resumen_contrato`, `modalidad`, `regimen`, `v_cap_ano`, `v_cap_mes`, `alarma_en`, `v_fac_ano`, `v_fac_mes`, `alarma`, `factura`, `ruta`, `num_afiliados`, `por_upc`) VALUES ("+datos[17]+","+datos[16]+",'1',"+datos[14]+","+datos[15]+","+datos[0]+","+datos[1]+","+datos[2]+","+datos[3]+","+datos[4]+","+datos[7]+","+datos[8]+","+datos[9]+","+datos[10]+","+datos[11]+","+datos[12]+","+datos[13]+","+archivo+","+datos[5]+","+datos[6]+");";  
   //out.println("sql "+sql);
    try{
        conecta_bd ba=new conecta_bd();
        ba.ConectaDb();
        if(ba.transaccion(sql)==false){  
               obj.put("est","2");
               obj.put("msj","Falla al crear contrato, asegúrese de que el nombre no se repita");
                                         }
        else{ 
               obj.put("est","1");
               obj.put("msj","Contrato creado con exito");
         }
           ba.cerrar();
    }
    catch(Exception es){
               obj.put("est","2");
               obj.put("msj","Fallo al Crear");
                       }
            
           
   
}
            
out.print(obj);
out.close();

%>