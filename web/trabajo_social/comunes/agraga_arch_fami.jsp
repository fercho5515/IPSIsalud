<%-- 
    Document   : agraga_arch_fami
    Created on : 30/10/2013, 05:56:40 PM
    Author     : Emmanuel
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
        String cedula=""+session.getAttribute("serial_pacinete");
        String codigocons=""+session.getAttribute("serial_consulta");
        String numero="";    
        String archivo1="''";
       String descri="''";
       
                String ruta="";
                String destination="archivos/arc_trab_soci/";
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
                         if(item.getName()==null||item.getName().compareTo("")==0){archivo1="''";}
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
                            if(item.getFieldName().compareTo("descri_arch")==0){     try{descri="'"+item.getString().replace("'","").replace("\"","")+"'";   }catch(Exception e){descri="''";}}
                          }
                }
            }
            catch(FileUploadException e){ }
    

       
    String sql="INSERT INTO `ips_isalud`.`archivos_consulta_trabajo_so` (`id_consulta`, `nombre`, `descripcion`) VALUES ('"+codigocons+"',"+archivo1+", "+descri+");";
 
    ba.transaccion(sql);
  
   ba.cerrar();
%>