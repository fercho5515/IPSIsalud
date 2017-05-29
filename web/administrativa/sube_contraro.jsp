<%-- 
    Document   : sube_contraro
    Created on : 2/03/2013, 07:31:16 PM
    Author     : EMMANUEL
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="org.apache.commons.io.*"%>
<%@page import="java.io.*"%>
  <% 
             request.setCharacterEncoding("UTF-8");
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
                            return;
            }

  


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
            File file=new File(destinationRealPath, item.getName());
            item.write(file);
            ruta=file.getName();///nombre real
            out.write("<p>"+file.getName()+" fue cargado ok </p>");
               
        }else {    //aca recibe parametros
            out.write(item.getFieldName()+" "+item.getString()+"<br>");
        }
    }
}
catch(FileUploadException e){
    out.write("<p>Error al Cargar "+e.getMessage()+"</p>");
}
    
%>

<img src="archivos/contratos/<%= ruta%>"/>