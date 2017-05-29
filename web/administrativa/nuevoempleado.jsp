<%-- 
    Document   : nuevoempleado
    Created on : 3/04/2013, 12:19:13 PM
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
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%> 
<%@page import="java.util.Date"%>
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

//System.out.println("fecha "+fecha);



                                                                              
    conecta_bd ba=new conecta_bd();
    ba.ConectaDb();
    String scuen="select count(id_permi) from permisos";
    int canpermi=0;
    
    ResultSet resu=null;
    try{  resu=ba.consultas(scuen);
          while (resu.next()&&resu!=null) {  
                           canpermi=Integer.parseInt(""+resu.getString(1)+"");
                                           }
         }                       
    catch(SQLException ex){}
    catch(Exception exe){}
    ba.cierraResultado(resu);  
    
    String permisos[][]=new String[3][canpermi];
    String consu="select id_permi,descripcion from permisos";
        ResultSet resu2=null;
    try{  resu2=ba.consultas(consu);
          int band=0;
          while (resu2.next()&&resu2!=null) { 
                           permisos[0][band]=""+resu2.getString(1)+"";
                           permisos[1][band]=""+resu2.getString(2)+"";
                           permisos[2][band]="0"; 
                           band++;
                                           }
         }                       
    catch(SQLException ex){}
    catch(Exception exe){}
    ba.cierraResultado(resu);      
            
            
     String insertpermi="";       
     String inserthisto="";       
            
            
        int subio=0;   
        String id="";
        String numero="";    
        String archivo1="''";     
        String archivo2="''";   
        String archivo3="''";   
                                                               
       String datos[]= new String[6];
         for(int i=0;i<6;i++){ datos[i]="''"; }
              
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
                
                int band=0;
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
                                                                               archivo1="'"+fecha+"_"+id+"_"+item.getName()+"'";                                             
                                                                               File file=new File(destinationRealPath,""+fecha+"_"+id+"."+ext);
                                                                               item.write(file);
                                                                               ruta=file.getName();///nombre real
                                                                              // out.write("<p>foto "+file.getName()+" fue cargado ok </p>");
                                                                               subio=1;band++;
                                                                              }
                                else if(item.getFieldName().compareTo("contrato")==0){
                                                                               archivo2="'"+fecha+"_"+id+"_"+item.getName()+"'";                                             
                                                                               File file=new File(destinationRealPath2,""+fecha+"_"+id+"."+ext);
                                                                               item.write(file);
                                                                               ruta2=file.getName();///nombre real
                                                                              // out.write("<p>contrato "+file.getName()+" fue cargado ok </p>");
                                                                               subio=1;band++;
                                                                               }
                                else if(item.getFieldName().compareTo("firma")==0){
                                                                               archivo3="'"+fecha+"_"+id+"_"+item.getName()+"'";                                             
                                                                               File file=new File(destinationRealPath3,""+fecha+"_"+id+"."+ext);
                                                                               item.write(file);
                                                                               ruta3=file.getName();///nombre real
                                                                              // out.write("<p>firma  "+file.getName()+" fue cargado ok </p>");
                                                                               subio=1;
                                                                              }
                                          }
                    }else {    //aca recibe parametros
                   //    System.out.println(item.getFieldName()+" "+item.getString()+"<br>");

                                if(item.getFieldName().compareTo("cargo")==0){                try{datos[0]="'"+item.getString()+"'";   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("tarjeta_prof")==0){         try{datos[1]="'"+item.getString()+"'";   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("registro_prof")==0){        try{datos[2]="'"+item.getString()+"'";   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("calendariovinculacion")==0){try{datos[3]="'"+item.getString()+"'";   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("claveemp")==0){             try{datos[4]="'"+item.getString()+"'";   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("id_pers")==0){              try{datos[5]="'"+item.getString()+"'"; id=""+item.getString();   }catch(Exception e){}}
                           else if(item.getFieldName().compareTo("ced_pers")==0){             try{ inserthisto=""+item.getString();   }catch(Exception e){}}
                       
                         //  out.print(" id: "+item.getFieldName()+" dato: "+item.getString()); 
                           for(int i=0;i<canpermi;i++){      
                            //  out.print("<br> id: "+item.getFieldName()+" dato: "+item.getString()+" dato matriz: "+permisos[1][i]);                                                        
                                if(item.getString().compareTo(""+permisos[1][i]+"")==0){   
                                   //   insertpermi=insertpermi+"INSERT INTO `ips_isalud`.`permiso_empleado` (`id_permi`, `serial_empleado`) VALUES ("+item.getFieldName()+","+id+");";
                                      inserthisto=inserthisto+", agrega permiso: "+item.getString()+"";
                                      permisos[2][i]="1";
                                                                                        }
                                                       }
                     }
                }
            }
            catch(FileUploadException e){
                out.write("<p>Error al cargar archivo "+e.getMessage()+"</p>");
            }
  // out.print(""+insertpermi+" <br> "+inserthisto);
       
    String sql="INSERT INTO `ips_isalud`.`empleados` (`serial_empleado`,`id_cargo`, `clave`, `fecha_ingreso`, `tarjeta_prof`, `firma`, `registro_prof`, `ruta_contrato`, `activo`) VALUES ('"+id+"',"+datos[0]+",password("+datos[4]+") ,"+datos[3]+","+datos[1]+","+archivo3+","+datos[2]+", "+archivo2+",'1');";  
 
  // System.out.print("Suugh "+sql);
    
   if(ba.transaccion(sql)==false){    
        out.print("<center> <h2 style='color:red'>Falla al crear empleado</h2></center>"); 
                                 }
   else{   
        out.print("<center> <h2 style='color:green'>Empleado creado con exito</h2></center>");
        for(int i=0;i<canpermi;i++){
                if(permisos[2][i].compareTo("1")==0){
                          String sqlp="INSERT INTO `ips_isalud`.`permiso_empleado` (`id_permi`, `serial_empleado`) VALUES ('"+permisos[0][i]+"','"+id+"');";
                           try{ if(ba.transaccion(sqlp)==true){ } }
                           catch(Exception e){out.print("<center> <h2 style='color:red'>Falla al agregar permiso "+permisos[1][i]+"</h2></center>"); 
                                              inserthisto=inserthisto+", Falla al agregar permiso "+permisos[1][i]+"";
                                             } 
                                                    }
                                    }
        String sqlh="insert into historial_c (id_empleado,fecha_hora,descripcion) values ('"+session.getAttribute("id")+"',now(),'"+inserthisto+"');";
        try{ if(ba.transaccion(sqlh)==true){ } }
        catch(Exception e){} 
 }
   ba.cerrar();
%>