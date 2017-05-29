<%-- 
    Document   : modif_estado_soli_no_post2
    Created on : 15/08/2013, 10:03:15 PM
    Author     : Emmanuel
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


       <% request.setCharacterEncoding("UTF-8");
      
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
                response.setContentType("text/x-json");
                response.setCharacterEncoding("utf-8");
                response.setHeader("Pragma", "no-cache");
                response.setHeader("Cache-Control", "no-cache, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                String json= "{ \"res\":\"0\" }";
                out.print(json);
                out.close();
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
            
          
        String id_soli_mnp="";
        String archivo1="null";   
        
       String datos[]= new String[6];
         for(int i=0;i<6;i++){ datos[i]=""; }
              
                String ruta="";
                String destination="archivos/apro_medic_mp/";
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
                         if(item.getName()==null||item.getName().compareTo("")==0){archivo1="null";}
                         else{   
                                String fname="";
                                String ext="";
                                int mid= item.getName().lastIndexOf(".");
                                fname=item.getName().substring(0,mid);
                                ext=item.getName().substring(mid+1,item.getName().length());  
                                                                                                             
                                archivo1="'"+fecha+"_"+id_soli_mnp+"."+ext+"'";                                             
                                File file=new File(destinationRealPath,""+fecha+"_"+id_soli_mnp+"."+ext);
                                item.write(file);
                                ruta=file.getName();
                                                                        
                                          }
                    }else {    //aca recibe parametros
                     
                                if(item.getFieldName().compareTo("id_soli_np")==0){     try{id_soli_mnp=""+item.getString()+""; }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("dato")==0){           try{datos[0]=""+item.getString()+""; }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("nuevoe")==0){         try{datos[1]=""+item.getString()+""; }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("fechai_medicnp")==0){ try{datos[2]=""+item.getString()+""; }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("fechaf_medicnp")==0){ try{datos[3]=""+item.getString()+""; }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("seriar_medic")==0){   try{datos[4]=""+item.getString()+""; }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("select_tarifario")==0){   try{datos[5]=""+item.getString()+""; }catch(Exception e){}}

                                 }
                }
            }
            catch(FileUploadException e){
                out.write("<p>Error al cargar archivo "+e.getMessage()+"</p>");
            }
    

       String sq="select c.serial_historia from soli_no_post s,consulta_medica c where s.cod_consulta=c.id_consulta and s.id_soli_no_post='"+id_soli_mnp+"'";
        
         String id_persona="";                 
         ResultSet result0=null;
           int c=0;
          try{  
           result0=ba.consultas(sq);          
           while (result0.next()&&result0!=null) { 
                        id_persona=""+result0.getString(1);
                        c=1;
                                               }
              }
        catch(SQLException ex){}
	catch(Exception exe){}
        ba.cierraResultado(result0); 
    //    System.out.println("idper: "+id_persona+" c: "+c);
      String sql="";
      String sqlu="";
             
      response.setContentType("text/x-json");
      response.setCharacterEncoding("utf-8");
      response.setHeader("Pragma", "no-cache");
      response.setHeader("Cache-Control", "no-cache, must-revalidate");
      response.setHeader("Pragma", "no-cache");
      JSONObject obj=new JSONObject();
       
               
      //String json= "{ \"res\":\"0\" }";
      
      
     if(c==0){ obj.put("res","0"); }   
     else{
        sql="INSERT INTO `ips_isalud`.`autorizacion_no_pos` (`id_soli_no_post`, `medi1`, `num`, `idpaciente_apro`, `id_empleado1`, `fecha_inicio`, `fecha_fin`, `ruta_archivo`, `fecha_real`,`id_tarifario`) VALUES ('"+id_soli_mnp+"','"+datos[4]+"','"+datos[0]+"','"+id_persona+"','"+session.getAttribute("id")+"', '"+datos[2]+"','"+datos[3]+"',"+archivo1+", now(),'"+datos[5]+"');";
  // System.out.print("==>>> "+sql);
        if(ba.transaccion(sql)){ 
                   sqlu="UPDATE `ips_isalud`.`soli_no_post` SET `id_med"+datos[0]+"`='"+datos[4]+"', `estado_m"+datos[0]+"`='"+datos[1]+"' WHERE `id_soli_no_post`='"+id_soli_mnp+"';";
                   ba.transaccion(sqlu);
                   obj.put("res","1");
                             }
      else{ obj.put("res","0");}
     }           
     
 
     
    out.print(obj);
    out.close(); 
     
  // out.print("mmmmmmmmmmmmmmm idper:"+id_persona+" <br> sq: "+sq+"<br> sql1: "+sql+" <br> sql2: "+sqlu); 
   ba.cerrar();
%>
