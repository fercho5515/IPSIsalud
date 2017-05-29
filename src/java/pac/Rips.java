
package pac;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;


public class Rips {
  private  String numIDeven="000036";  
  private  String numIDpacq="000035";  
  private  String codigoEps="";
  private  String nombreEps="";
  private  String codigoIps="";
  private  String nombreIps="";
  private  String tipoIdIps="";
  private  String NumeIdIps="";
  private  String nombre="";
  private  String contrato="";
  private  String fecha_inicial="";
  private  String fecha_final="";
  
  private   int paqueteI=-1;
  private   int cuentaUSint=0;
  private   int cuentaUSeve=0;
public void RipsIni(String contratoN,String paquete,String nombrer,String fechaI,String fechaF){
      contrato=contratoN;
      nombre=nombrer;
      fecha_inicial=fechaI;
      fecha_final=fechaF;
              
      if(paquete == null || paquete.compareTo("null") == 0 || paquete.compareTo("") == 0 || paquete.compareTo("-1") == 0 ){}
      else{
           try{paqueteI=Integer.parseInt(paquete);}
           catch(Exception exe){paqueteI=-1;}
          }

            String sqleps="SELECT c.cod_eps,e.nombre FROM ips_isalud.contratacion c,ips_isalud.eps e where c.cod_eps=e.ideps and id_contratacion='"+contratoN+"';";
            ResultSet resu55=null;
            conecta_bd ba = new conecta_bd();
            ba.ConectaDb(); 
            try{  resu55=ba.consultas(sqleps);
                    while (resu55.next()&&resu55!=null) {  codigoEps=resu55.getString(1);nombreEps=resu55.getString(2);  }
                }                       
            catch(SQLException ex){}
            catch(Exception exe){}
            ba.cierraResultado(resu55); 
            
            String sql2="SELECT razon_social,codigo_de_prestador,tipo_identif,numero_identif FROM ips_isalud.datos_ips limit 1;";
            ResultSet resu22=null;
            try{  resu22=ba.consultas(sql2);
                    while (resu22.next()&&resu22!=null) {  
                                           nombreIps=resu22.getString(1);
                                           codigoIps=resu22.getString(2);  
                                           tipoIdIps=resu22.getString(3);
                                           NumeIdIps=resu22.getString(4);  
                                                        }
                }                       
            catch(SQLException ex){}
            catch(Exception exe){}
            ba.cierraResultado(resu22); 
            
            ba.cerrar(); 
      
      

}   
    
public boolean crea_carpetas() {  
   ruta r=new ruta();
    try{
        File folder = new File(r.dir()+"/ISALUD/rips/"+nombre+"/evento");
        File dirFile = folder.getCanonicalFile (); 
        dirFile.mkdirs();

        File folder2 = new File(r.dir()+"/ISALUD/rips/"+nombre+"/integral");
        File dirFile2 = folder2.getCanonicalFile (); 
        dirFile2.mkdirs();
    }catch(Exception ex){  return false; }
    return true;
    
}
/////////////////////////////////////////////////
/////////////////////////////////////////////////
public String crea_rips() { 

  // integral  
  String result_falla="<p style='text-align:justify'>";
      
  if(!crea_carpetas()){result_falla=result_falla+" Ocurrió un error al generar rips, inténtelo nuevamente </p> "; return result_falla;  } 
    
  ruta r=new ruta();  
  int controla=0;
  
  String coma=" ";
  
  if(paqueteI != -1){
            if(rip_integral_AC()== false){result_falla=result_falla+coma+"falla al crear rip AC para integral"; controla=1; coma=", ";} 
            if(rip_integral_AF()== false){result_falla=result_falla+coma+"falla al crear rip AF para integral"; controla=1; coma=", ";} 
            if(rip_integral_AM()== false){result_falla=result_falla+coma+"falla al crear rip AM para integral"; controla=1; coma=", ";} 
            if(rip_integral_AT()== false){result_falla=result_falla+coma+"falla al crear rip AT para integral"; controla=1; coma=", ";} 
            if(rip_integral_US()== false){result_falla=result_falla+coma+"falla al crear rip US para integral"; controla=1; coma=", ";} 
            if(rip_integral_CT()== false){result_falla=result_falla+coma+"falla al crear rip CT para integral"; controla=1; coma=", ";} 
                   }
  // evento  
  if(rip_evento_AC()== false){result_falla=result_falla+coma+"falla al crear rip AC para evento"; controla=1; coma=", ";} 
  if(rip_evento_AF()== false){result_falla=result_falla+coma+"falla al crear rip AF para evento"; controla=1; coma=", ";}
  if(rip_evento_AM()== false){result_falla=result_falla+coma+"falla al crear rip AM para evento"; controla=1; coma=", ";} 
  if(rip_evento_AP()== false){result_falla=result_falla+coma+"falla al crear rip AP para evento"; controla=1; coma=", ";} 
  if(rip_evento_US()== false){result_falla=result_falla+coma+"falla al crear rip US para evento"; controla=1; coma=", ";} 
  if(rip_evento_CT()== false){result_falla=result_falla+coma+"falla al crear rip CT para evento"; controla=1; coma=", ";} 
    
  Archivos zip = new Archivos();
  try{ 
        if(paqueteI != -1){zip.zipDirectory(r.dir()+"/ISALUD/rips/"+nombre+"/integral",r.dir()+"/ISALUD/rips/integral_"+nombre+".zip");}
                           zip.zipDirectory(r.dir()+"/ISALUD/rips/"+nombre+"/evento",r.dir()+"/ISALUD/rips/evento_"+nombre+".zip");}
  catch(Exception exe){result_falla=result_falla+coma+"falla al comprimir archivos"; controla=1;}
  result_falla=result_falla+"</p> ";
  /*
  File f = new File(r.dir()+"/ISALUD/rips/"+nombre); 
       f.delete();
  */
  String  resut_bien="";
  if(paqueteI != -1){
          resut_bien="<center> <label> Rips creados satisfactoriamente </label> </center> <br> "
                   +"<center> <a href='/ISALUD/rips/integral_"+nombre+".zip' >Descargar Rips Integral</a></center> <br>"
                   +"<center> <a href='/ISALUD/rips/evento_"+nombre+".zip' >Descargar Rips Evento</a></center> <br>";
                    }
  else{
      resut_bien="<center> <label> Rips creados satisfactoriamente </label> </center> <br> "
                +"<center> <a href='/ISALUD/rips/evento_"+nombre+".zip' >Descargar Rips Evento</a></center> <br>";                    
     }
  
  if(controla==0){ return resut_bien;}
  else{return result_falla; }
  
 }


//////////////////////////////////////
////////// RIPS INTEGRAL /////////////
//////////////////////////////////////
private boolean rip_integral_AC(){
    ruta r=new ruta();
    try{
    BufferedWriter x= new BufferedWriter(new FileWriter (r.dir()+"/ISALUD/rips/"+nombre+"/integral/AC"+numIDpacq+".txt"));
    x.write("ac");
    x.newLine();
    x.close();
    }
    catch(IOException exe){return false;}
    catch(Exception exe){return false;}
    
 return true;
}

private boolean rip_integral_AF(){
    ruta r=new ruta();
    try{
    BufferedWriter x= new BufferedWriter(new FileWriter (r.dir()+"/ISALUD/rips/"+nombre+"/integral/AF"+numIDpacq+".txt"));
    x.write("af");
    x.newLine();
    x.close();
    }
    catch(IOException exe){return false;}
    catch(Exception exe){return false;}
    
return true;
}

private boolean rip_integral_AM(){    
    ruta r=new ruta();
    try{
    BufferedWriter x= new BufferedWriter(new FileWriter (r.dir()+"/ISALUD/rips/"+nombre+"/integral/AM"+numIDpacq+".txt"));
    x.write("am");
    x.newLine();
    x.close();
    }
    catch(IOException exe){return false;}
    catch(Exception exe){return false;}
    
return true;
}

private boolean rip_integral_AT(){
    ruta r=new ruta();
    try{
    BufferedWriter x= new BufferedWriter(new FileWriter (r.dir()+"/ISALUD/rips/"+nombre+"/integral/AT"+numIDpacq+".txt"));
    x.write("at");
    x.newLine();
    x.close();
    }
    catch(IOException exe){return false;}
    catch(Exception exe){return false;}
    
return true;
}

private boolean rip_integral_CT(){
    ruta r=new ruta();
    Calendar CALENDARIO_GREGORIANO= new GregorianCalendar(); 
    String FECHA_DIA=Integer.toString(CALENDARIO_GREGORIANO.get(Calendar.DATE));
    String FECHA_MES=Integer.toString(CALENDARIO_GREGORIANO.get(Calendar.MONTH));
    String FECHA_ANO=Integer.toString(CALENDARIO_GREGORIANO.get(Calendar.YEAR));  
    int tdia=FECHA_DIA.length();
    if(tdia>2){FECHA_DIA="0"+FECHA_DIA;}
    int tmes=FECHA_MES.length();
    if(tmes>2){FECHA_MES="0"+FECHA_MES;}
    
    String fecha=""+FECHA_DIA+"/"+FECHA_MES+"/"+FECHA_ANO+"";

    try{
    BufferedWriter x= new BufferedWriter(new FileWriter (r.dir()+"/ISALUD/rips/"+nombre+"/integral/CT"+numIDpacq+".txt"));
    x.write(""+codigoIps+","+fecha+",US"+numIDpacq+","+cuentaUSint);
    x.newLine();
    x.close();
    }
    catch(IOException exe){return false;}
    catch(Exception exe){return false;}
return true;
}

private boolean rip_integral_US(){
   String consulta="select pe.fecha_naci,pe.tipo_id,pe.id_person,pa.id_tipo_usuario,pe.p_ape,pe.s_ape,pe.p_nom,pe.s_nom,pe.genero,"
                 + "pe.id_depto,pe.id_muni,pa.cod_zona from personas pe,pacientes pa where pe.serial=pa.serial_persona"
                 + " and pe.serial in (select DISTINCT(serial) from personas where serial in "
                 + " (select c.serial_historia as us from consulta_medica c,agenda a where c.id_consulta=a.id_consulta and c.id_permiso_profecional=a.id_permiso and c.id_estado_consulta='3' and date(c.fecha)>='"+fecha_inicial+"' and date(c.fecha)<='"+fecha_final+"' and a.id_contrato ='"+contrato+"'  AND id_paquete ='"+paqueteI+"'  )"
                 + "or serial in"
                 + " (select c.id_historia as us from consulta_nutri c,agenda a where c.id_consulta=a.id_consulta and c.id_permiso=a.id_permiso and c.guardado='1' and date(c.fecha)>='"+fecha_inicial+"' and date(c.fecha)<='"+fecha_final+"' and a.id_contrato ='"+contrato+"' AND id_paquete ='"+paqueteI+"'  )"
                 + "or serial in"
                 + " (select c.id_historia as us from consulta_psico c,agenda a where c.id_consulta=a.id_consulta and '5'=a.id_permiso and c.guardado='3' and date(c.fecha)>='"+fecha_inicial+"' and date(c.fecha)<='"+fecha_final+"' and a.id_contrato ='"+contrato+"' AND id_paquete ='"+paqueteI+"' )"
                 + "or serial in"
                 + " (select c.id_historia as us from consulta_trabajo_social c,agenda a where c.id_consulta_trabajo_social=a.id_consulta and '6'=a.id_permiso and c.guardado='1' and date(c.fecha)>='"+fecha_inicial+"' and date(c.fecha)<='"+fecha_final+"' and a.id_contrato ='"+contrato+"' AND id_paquete ='"+paqueteI+"'  ))";
    
    
    ruta r=new ruta();
    try{
    BufferedWriter x= new BufferedWriter(new FileWriter (r.dir()+"/ISALUD/rips/"+nombre+"/integral/US"+numIDpacq+".txt"));
   // x.write("us");
    String eda="";String genero="";String municipio="";String depto="";cuentaUSint=0;
            conecta_bd ba = new conecta_bd();
            edad ed= new edad();
            ba.ConectaDb(); 
            ResultSet resu55=null;
            try{  resu55=ba.consultas(consulta);
                 while (resu55.next()&&resu55!=null) { 
                     try{
                            eda=ed.edad2(resu55.getString(1));
                            String[] edadd = eda.split("-");
                            genero=resu55.getString(9);
                            depto=resu55.getString(10);
                            int tdep=depto.length();
                            if(tdep<2){ for(int i=tdep;i<2;i++){depto="0"+depto;} }
                            
                            municipio=resu55.getString(11);
                            int tmun=municipio.length();
                            if(tmun<3){ for(int i=tmun;i<3;i++){municipio="0"+municipio;} }
                            
                                if(genero.compareTo("Masculino")==0){genero="M";}
                            else if(genero.compareTo("Femenino")==0){genero="F";}
                            else{genero="I";} 
                            x.write(""+resu55.getString(2)+","+resu55.getString(3)+","+codigoEps+","+resu55.getString(4)+","+resu55.getString(5)+","+resu55.getString(6)+","+resu55.getString(7)+","+resu55.getString(8)+","+edadd[0]+","+edadd[1]+","+genero+","+depto+","+municipio+","+resu55.getString(12)+""); 
                            x.newLine();
                            cuentaUSint++;
                     }catch(Exception edes){}                           
                     }
                }                       
            catch(SQLException ex){}
            catch(Exception exe){}
            ba.cierraResultado(resu55); 
                        
            ba.cerrar(); 
    
    x.close();
    }
    catch(IOException exe){return false;}
    catch(Exception exe){return false;}
    
return true;
}

//////////////////////////////////////
/////////// RIPS EVENTO //////////////
//////////////////////////////////////
private boolean rip_evento_AC(){
    ruta r=new ruta();
    try{
    BufferedWriter x= new BufferedWriter(new FileWriter (r.dir()+"/ISALUD/rips/"+nombre+"/evento/AC"+numIDeven+".txt"));
    x.write("ac");
    x.newLine();
    x.close();
    }
    catch(IOException exe){return false;}
    catch(Exception exe){return false;}
    
return true;
}

private boolean rip_evento_AF(){
    ruta r=new ruta();
    try{
    BufferedWriter x= new BufferedWriter(new FileWriter (r.dir()+"/ISALUD/rips/"+nombre+"/evento/AF"+numIDeven+".txt"));
    x.write("af");
    x.newLine();
    x.close();
    }
    catch(IOException exe){return false;}
    catch(Exception exe){return false;}
    
return true;
}

private boolean rip_evento_AM(){
    ruta r=new ruta();
    try{
    BufferedWriter x= new BufferedWriter(new FileWriter (r.dir()+"/ISALUD/rips/"+nombre+"/evento/AM"+numIDeven+".txt"));
    x.write("am");
    x.newLine();
    x.close();
    }
    catch(IOException exe){return false;}
    catch(Exception exe){return false;}
    
return true;
}

private boolean rip_evento_AP(){
    ruta r=new ruta();
    try{
    BufferedWriter x= new BufferedWriter(new FileWriter (r.dir()+"/ISALUD/rips/"+nombre+"/evento/AP"+numIDeven+".txt"));
    x.write("ap");
    x.newLine();
    x.close();
    }
    catch(IOException exe){return false;}
    catch(Exception exe){return false;}
    
return true;
}

private boolean rip_evento_CT(){
    ruta r=new ruta();
    Calendar CALENDARIO_GREGORIANO= new GregorianCalendar(); 
    String FECHA_DIA=Integer.toString(CALENDARIO_GREGORIANO.get(Calendar.DATE));
    String FECHA_MES=Integer.toString(CALENDARIO_GREGORIANO.get(Calendar.MONTH));
    String FECHA_ANO=Integer.toString(CALENDARIO_GREGORIANO.get(Calendar.YEAR));  
    int tdia=FECHA_DIA.length();
    if(tdia>2){FECHA_DIA="0"+FECHA_DIA;}
    int tmes=FECHA_MES.length();
    if(tmes>2){FECHA_MES="0"+FECHA_MES;}
    
    String fecha=""+FECHA_DIA+"/"+FECHA_MES+"/"+FECHA_ANO+"";

    try{
    BufferedWriter x= new BufferedWriter(new FileWriter (r.dir()+"/ISALUD/rips/"+nombre+"/evento/CT"+numIDeven+".txt"));
    x.write(""+codigoIps+","+fecha+",US"+numIDeven+","+cuentaUSeve);
    x.newLine();
    x.close();
    }
    catch(IOException exe){return false;}
    catch(Exception exe){return false;}
    
return true;
}

private boolean rip_evento_US(){
     String consulta="select pe.fecha_naci,pe.tipo_id,pe.id_person,pa.id_tipo_usuario,pe.p_ape,pe.s_ape,pe.p_nom,pe.s_nom,pe.genero,"
                 + "pe.id_depto,pe.id_muni,pa.cod_zona from personas pe,pacientes pa where pe.serial=pa.serial_persona"
                 + " and pe.serial in (select DISTINCT(serial) from personas where serial in "
                 + " (select c.serial_historia as us from consulta_medica c,agenda a where c.id_consulta=a.id_consulta and c.id_permiso_profecional=a.id_permiso and c.id_estado_consulta='3' and date(c.fecha)>='"+fecha_inicial+"' and date(c.fecha)<='"+fecha_final+"' and a.id_contrato ='"+contrato+"'  AND (id_paquete IS NULL or id_paquete =0 ) )"
                 + "or serial in"
                 + " (select c.id_historia as us from consulta_nutri c,agenda a where c.id_consulta=a.id_consulta and c.id_permiso=a.id_permiso and c.guardado='1' and date(c.fecha)>='"+fecha_inicial+"' and date(c.fecha)<='"+fecha_final+"' and a.id_contrato ='"+contrato+"' AND (id_paquete IS NULL or id_paquete =0 ) )"
                 + "or serial in"
                 + " (select c.id_historia as us from consulta_psico c,agenda a where c.id_consulta=a.id_consulta and '5'=a.id_permiso and c.guardado='3' and date(c.fecha)>='"+fecha_inicial+"' and date(c.fecha)<='"+fecha_final+"' and a.id_contrato ='"+contrato+"' AND (id_paquete IS NULL or id_paquete =0 ) )"
                 + "or serial in"
                 + " (select c.id_historia as us from consulta_trabajo_social c,agenda a where c.id_consulta_trabajo_social=a.id_consulta and '6'=a.id_permiso and c.guardado='1' and date(c.fecha)>='"+fecha_inicial+"' and date(c.fecha)<='"+fecha_final+"' and a.id_contrato ='"+contrato+"' AND (id_paquete IS NULL or id_paquete =0 ) ))";
    
    
    ruta r=new ruta();
    try{
    BufferedWriter x= new BufferedWriter(new FileWriter (r.dir()+"/ISALUD/rips/"+nombre+"/evento/US"+numIDeven+".txt"));
   
     String eda="";String genero="";String municipio="";String depto="";cuentaUSeve=0;
            conecta_bd ba = new conecta_bd();
            edad ed= new edad();
            ba.ConectaDb(); 
            ResultSet resu55=null;
            try{  resu55=ba.consultas(consulta);
                 while (resu55.next()&&resu55!=null) { 
                     try{
                            eda=ed.edad2(resu55.getString(1));
                            String[] edadd = eda.split("-");
                            genero=resu55.getString(9);
                            depto=resu55.getString(10);
                            int tdep=depto.length();
                            if(tdep<2){ for(int i=tdep;i<2;i++){depto="0"+depto;} }
                            
                            municipio=resu55.getString(11);
                            int tmun=municipio.length();
                            if(tmun<3){ for(int i=tmun;i<3;i++){municipio="0"+municipio;} }
                            
                                if(genero.compareTo("Masculino")==0){genero="M";}
                            else if(genero.compareTo("Femenino")==0){genero="F";}
                            else{genero="I";} 
                            x.write(""+resu55.getString(2)+","+resu55.getString(3)+","+codigoEps+","+resu55.getString(4)+","+resu55.getString(5)+","+resu55.getString(6)+","+resu55.getString(7)+","+resu55.getString(8)+","+edadd[0]+","+edadd[1]+","+genero+","+depto+","+municipio+","+resu55.getString(12)+""); 
                            x.newLine();cuentaUSeve++;
                     }catch(Exception edes){}                           
                     }
                }                       
            catch(SQLException ex){}
            catch(Exception exe){}
            ba.cierraResultado(resu55); 
                        
            ba.cerrar();     
    x.close();
    }
    catch(IOException exe){return false;}
    catch(Exception exe){return false;}
    
return true;
}

}
