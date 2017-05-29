<%-- 
    Document   : ingresa_report_img
    Created on : 17/05/2013, 06:45:57 PM
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
            
          
                String archivo1="null";     
                String id_img_sol="";
                String cod_exam="";
                String result="";                             
                String ruta="";
                
                String destination="archivos/imagenes/";
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
                                String ext="";
                                int mid= item.getName().lastIndexOf(".");
                                //fname=item.getName().substring(0,mid);
                                ext=item.getName().substring(mid+1,item.getName().length());  
                                                                                                             
                                archivo1="'"+fecha+"_"+session.getAttribute("serial_pacinete")+"."+ext+"'";                                             
                                File file=new File(destinationRealPath,""+fecha+"_"+session.getAttribute("serial_pacinete")+"."+ext);
                                item.write(file);
                                ruta=file.getName();
                                                                        
                                          }
                    }else {    //aca recibe parametros
                     
                                if(item.getFieldName().compareTo("id_img_sol")==0){try{id_img_sol=""+item.getString().replace("'","").replace("\"","")+""; }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("cod_exam2")==0){  try{  cod_exam=""+item.getString().replace("'","").replace("\"","")+""; }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("result2")==0){    try{  result=""+item.getString().replace("'","").replace("\"","")+"";   }catch(Exception e){}}
                          }
                }
            }
            catch(FileUploadException e){
                out.write("<p>Error al cargar archivo "+e.getMessage()+"</p>");
            }
    

       
    String sql="INSERT INTO `ips_isalud`.`resu_img` (`id_consulta`, `fecha`, `cod_img`, `reporte`, `ruta`, `id_sol_ima`) VALUES ('"+session.getAttribute("serial_consulta")+"',curdate(),'"+cod_exam+"', '"+result+"', "+archivo1+",'"+id_img_sol+"');";  
    String sql2="UPDATE `ips_isalud`.`imgs_sol` SET `leido`=1 WHERE `serial`='"+id_img_sol+"';";
  
   if(ba.transaccion(sql)==false){    
         out.print("<center> <h2 style='color:red'>Falla al ingresar resultados</h2></center>"); 
                                 }
   else{   
        out.print("<center> <h2 style='color:green'>Resultados ingresados con exito</h2></center>");
        ba.transaccion(sql2);
        }
     out.println("</body></html>");
  // System.out.println("sql1: "+sql+"\n sql2: "+sql2);
 
   
   ba.cerrar();
%>


             
                