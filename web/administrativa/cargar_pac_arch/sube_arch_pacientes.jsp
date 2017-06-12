<%-- 
    Document   : sube_arch_pacientes
    Created on : 20/08/2013, 06:43:20 PM
    Author     : Emmanuel
--%>



<%@page import="pac.ruta"%>
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
     
     
    <% 
             
              return;
            } 
%>
    
    <%
     String id_contratacion="";
     String id_eps="";                       
                    
                Calendar cal1 = Calendar.getInstance();
	            String dia=""+cal1.get(Calendar.DATE)+"";
	                   dia=dia.trim();
	            String mes=""+(1+Integer.parseInt(""+cal1.get(Calendar.MONTH)+""))+"";
	                   mes=mes.trim();
	            if(dia.length()==1){dia="0"+dia;} 
	            if(mes.length()==1){mes="0"+mes;} 	      
                String fechai=""+dia+"-"+mes+"-"+cal1.get(Calendar.YEAR)+"-"+cal1.get(Calendar.HOUR)+"-"+cal1.get(Calendar.MINUTE)+"-"+cal1.get(Calendar.SECOND)+"-"+cal1.get(Calendar.MILLISECOND);
   
            
        conecta_bd ba=new conecta_bd();
                   ba.ConectaDb();    
            
       String archivo1="null"; 
        int control=0;         
        
              
                String ruta="";
                String destination="archivos/pacientes/";
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
                                                                                                             
                                archivo1=""+fechai+"_lista_p."+ext+"";                                             
                                File file=new File(destinationRealPath,""+fechai+"_lista_p."+ext);
                                item.write(file);
                                ruta=file.getName();
                                 
                                control=1;                                                                       
                                          }
                    }else {   //aca recibe parametros
                         if(item.getFieldName().compareTo("contrato_arch")==0){ 
                             try{id_contratacion="'"+item.getString()+"'";   
                                String sql="select c.cod_eps from contratacion c where c.id_contratacion="+id_contratacion+"";
                                ResultSet resu55=null;
                                ba.ConectaDb(); 
                                try{  resu55=ba.consultas(sql);
                                    while (resu55.next()&&resu55!=null) { id_eps="'"+resu55.getString(1)+"'";  }
                                }                       
                                catch(SQLException ex){}
                                catch(Exception exe){}
                                ba.cierraResultado(resu55);
                                 }
                             catch(Exception e){}
                                                                             }
                          
                       }
                }
            }
            catch(FileUploadException e){ control=0;
                out.write("<p>Error al cargar archivo "+e.getMessage()+"</p>");
            }
    int sera=0;

    if(control==1){
        
       try{
             String r=new ruta().dir();
             String nom=""+r+"/archivos/pacientes/"+archivo1;
       
             BufferedReader x= new BufferedReader(new FileReader(nom));
             String linea=x.readLine();   
                    linea=x.readLine();  
             
                      
               try{
                   ba.transaccion("SET SQL_SAFE_UPDATES=0;");
                   ba.transaccion("UPDATE `ips_isalud`.`pacientes` SET `activo`='0' WHERE `serial_persona` in (select serial_paciente from afiliados_cont where id_cont="+id_contratacion+")");                     
                   ba.transaccion("UPDATE `ips_isalud`.`afiliados_cont` SET `activo`='0' WHERE `id_cont`="+id_contratacion+"");
                   }
               catch(Exception ede){}
             while(linea!=null){ 
                     try{
                    //Utilizamos el separador para los datos
                    String[] datosli=null;
                    datosli = linea.split(",");
                    //Presentamos los datos
                    
                  

                String fecha="";String fecha2="";
                            	  	
                StringTokenizer parteant= new StringTokenizer(datosli[7]," ");
                datosli[7]=parteant.nextToken();
                StringTokenizer parte= new StringTokenizer(datosli[7],"/");
                try{fecha=parte.nextToken();}catch(Exception e){}   
                try{fecha=""+parte.nextToken()+"-"+fecha;}catch(Exception e){}
                try{fecha=""+parte.nextToken()+"-"+fecha;}catch(Exception e){}  
                
                StringTokenizer parteant2= new StringTokenizer(datosli[12]," ");
                datosli[12]=parteant2.nextToken();
                StringTokenizer parte2= new StringTokenizer(datosli[12],"/");
                try{fecha2=parte2.nextToken();}catch(Exception e){}   
                try{fecha2=""+parte2.nextToken()+"-"+fecha2;}catch(Exception e){}
                try{fecha2=""+parte2.nextToken()+"-"+fecha2;}catch(Exception e){}    

                String genero="";
                            String serial="";
                            String eps="";		
                            
                            String zona="";
                            if(datosli[11]==null || datosli[11].compareTo("")==0 || datosli[11].compareTo("null")==0  ){zona="'D'";}
                            else{zona="'"+datosli[11]+"'";}
                            if(datosli[8].trim().compareTo("M")==0 || datosli[8].trim().compareTo("m")==0 ){genero="Masculino";}
                            else{genero="Femenino";}
                            if(datosli[0]==null || datosli[0].compareTo("")==0 || datosli[0].compareTo("null")==0  ){eps="'-1'";}
                            else{eps="'"+datosli[0]+"'";}
                        
                try{ ba.transaccion("INSERT INTO `ips_isalud`.`personas` (`id_person`, `tipo_id`, `p_nom`, `s_nom`, `p_ape`, `s_ape`, `email`, `telefono`, `id_muni`, `direccion`, `genero`, `fecha_naci`, `id_rh`, `foto`, `barrio`, `id_eps`, `id_depto`) VALUES ('"+datosli[2]+"','"+datosli[1]+"', '"+datosli[5]+"', '"+datosli[6]+"', '"+datosli[3]+"', '"+datosli[4]+"', '', '','"+datosli[10]+"', '"+datosli[16]+"', '"+genero+"', '"+fecha+"','1', '', '',"+id_eps+",'"+datosli[9]+"');");
                out.print("INSERT INTO `ips_isalud`.`personas` (`id_person`, `tipo_id`, `p_nom`, `s_nom`, `p_ape`, `s_ape`, `email`, `telefono`, `id_muni`, `direccion`, `genero`, `fecha_naci`, `id_rh`, `foto`, `barrio`, `id_eps`, `id_depto`) VALUES ('"+datosli[2]+"','"+datosli[1]+"', '"+datosli[5]+"', '"+datosli[6]+"', '"+datosli[3]+"', '"+datosli[4]+"', '', '','"+datosli[10]+"', '"+datosli[16]+"', '"+genero+"', '"+fecha+"','1', '', '',"+id_eps+",'"+datosli[9]+"');");
                }
                catch(Exception exe){	}    

                            ResultSet resu=null;   
                try{  resu=ba.consultas("select serial from personas where id_person='"+datosli[2]+"'  and tipo_id='"+datosli[1]+"'");
                     while (resu.next()&&resu!=null) { serial=resu.getString(1); }
                   }                      
                catch(Exception exe){}	
                ba.cierraResultado(resu);	 

                try{ if(ba.transaccion("INSERT INTO `ips_isalud`.`pacientes` (`serial_persona`, `cod_estado_civil`, `id_nivel_educativo`, `fecha_afi`, `nivel_sisben`, `cod_modalidad`, `idtpob`, `nu_carnet`, `fosiga`, `estado_fosiga`, `cod_zona`, `embarazo_activo`, `id_orientacion`, `id_tipo_usuario`, `vih`, `nomips`, `activo`) VALUES ('"+serial+"','1','1', '"+fecha2+"','"+datosli[14]+"','"+datosli[15]+"','"+datosli[13]+"','"+datosli[17]+"','"+datosli[18]+"','"+datosli[19]+"',"+zona+",'0','1','2','Negativo','"+datosli[20]+"','1');")==false){
                        ba.transaccion("UPDATE `ips_isalud`.`pacientes` SET `activo`='1' WHERE `serial_persona`='"+serial+"';");
                                                        } 
                   }
                catch(Exception exe){}  
                
                /////////////////////////////////////////////////////////////////////////////
                /////////////////////////////////////////////////////////////////////////////
                /////////////////////////////////////////////////////////////////////////////
                /////////////////////////////////////////////////////////////////////////////
                
                
                 try {
                    
                        String sql = "INSERT INTO `ips_isalud`.`afiliados_cont`(`serial_paciente`,`id_cont`,`activo`) VALUES ('"+serial+"'," + id_contratacion + ",'1');";
                        //out.print(sql);
                        if (ba.transaccion(sql)) {   } 
                        else {
                              String sqlll2="UPDATE `ips_isalud`.`afiliados_cont` SET `activo`='1' WHERE `id_cont`=" + id_contratacion + " and`serial_paciente`='"+serial+"';";
                              ba.transaccion(sqlll2);  }
                        
                    
                } catch (Exception e) {}                
                
                
                
              } catch(Exception exep){}
                
                linea=x.readLine();                 
                }  
            x.close();    
            }
            catch(Exception e){sera=1;
                out.println("<br> ee: "+e);
             }
    if(sera==0){     
     out.print("<center><h1 style='color:green'>Proceso Finalizado</h1></center>");
               }
           else{     
     out.print("<center><h1 style='color:red'>falla al subrir el archivo</h1></center>");
               }
    } 
  else{  out.print("<center><h1 style='color:red'>falla al subrir el archivo</h1></center>");  }             
   
  ba.transaccion("SET SQL_SAFE_UPDATES=1;");       
 
  // out.print("mmmmmmmmmmmmmmm idper:"+id_persona+" <br> sq: "+sq+"<br> sql1: "+sql+" <br> sql2: "+sqlu); 
   ba.cerrar();
%>

