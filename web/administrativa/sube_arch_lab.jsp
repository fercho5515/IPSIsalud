<%-- 
    Document   : sube_arch_lab
    Created on : 17/08/2013, 03:25:18 PM
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
            
          
        String id_soli_lab="";
        String archivo1="null";   
        
       String datos[]= new String[5];
         for(int i=0;i<5;i++){ datos[i]=""; }
              
                String ruta="";
                String destination="archivos/laboratorios/";
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
                                                                                                             
                                archivo1="'"+fecha+"_"+id_soli_lab+"."+ext+"'";                                             
                                File file=new File(destinationRealPath,""+fecha+"_"+id_soli_lab+"."+ext);
                                item.write(file);
                                ruta=file.getName();
                                                                        
                                          }
                    }else {    //aca recibe parametros
                     
                                if(item.getFieldName().compareTo("id_soli_lab")==0){     try{id_soli_lab=""+item.getString()+""; }catch(Exception e){}}
                          
                                 }
                }
            }
            catch(FileUploadException e){
                out.write("<p>Error al cargar archivo "+e.getMessage()+"</p>");
            }
    

     
                
   
                   String sqlu="UPDATE `ips_isalud`.`labs_sol` SET `archi_lab`="+archivo1+", `id_empleado`='"+session.getAttribute("id")+"' WHERE `serial`='"+id_soli_lab+"';";
                //   out.print(sqlu);
                 if(ba.transaccion(sqlu)){out.print("<input type='hidden' name='resu_arclab_dd1' id='resu_arclab_dd1' value='1'>");}
                                     else{out.print("<input type='hidden' name='resu_arclab_dd1' id='resu_arclab_dd1' value='0'>");}
     
 
  // out.print("mmmmmmmmmmmmmmm idper:"+id_persona+" <br> sq: "+sq+"<br> sql1: "+sql+" <br> sql2: "+sqlu); 
   ba.cerrar();
%>
