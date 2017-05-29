/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pac;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author EMMANUEL
 */
public class edad {
    
 public String edad(String fechitics) {
 
          SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
           	Date fechaInicial=null;
 	    	
            try {fechaInicial= formato.parse(fechitics);} 
            catch(ParseException ex){}  
 	    	
 	    //	Date fechaFinal=new java.util.Date();//hoy   
     
                Calendar fechaNacimiento = Calendar.getInstance();
	        //Se crea un objeto con la fecha actual
	        Calendar fechaActual = Calendar.getInstance();
	        //Se asigna la fecha recibida a la fecha de nacimiento.
                fechaNacimiento.setTime(fechaInicial);     
                
                String regresa="";
                
                //Se restan la fecha actual y la fecha de nacimiento
	        int año = fechaActual.get(Calendar.YEAR)- fechaNacimiento.get(Calendar.YEAR);
	        int mes = fechaActual.get(Calendar.MONTH)- fechaNacimiento.get(Calendar.MONTH);
	        int dia = fechaActual.get(Calendar.DATE)- fechaNacimiento.get(Calendar.DATE);
	        //Se ajusta el año dependiendo el mes y el día
           
               if(mes<0 || (mes==0 && dia<0)){
	           año--;
                }
               // if(año<0){año=0;}
                int mes2=meses(fechaNacimiento,fechaActual);
               // System.out.println("años:"+año+" meses:"+mes+" dias:"+dia+" meses2:"+mes2);
                if(año==0 && mes2 ==0){int dia2=dias(fechaNacimiento.getTime());
                                       if(dia2==1){ regresa=" "+dia2+" dia";}
                                       else{ regresa=" "+dia2+" dias";}
                                       }
                else if(año==0 ){  
                                   if(mes2==1){regresa=" "+mes2+" mes";}
                                   else{regresa=" "+mes2+" meses";}
                
                               }
                else{regresa=" "+año+" años";}
	    
        
           return regresa;
 } 
 public int[] edad_num(String fechitics) {
 
          SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
           	Date fechaInicial=null;
 	    	
            try {fechaInicial= formato.parse(fechitics);} 
            catch(ParseException ex){}  
 	    	
 	    //	Date fechaFinal=new java.util.Date();//hoy   
     
                Calendar fechaNacimiento = Calendar.getInstance();
	        //Se crea un objeto con la fecha actual
	        Calendar fechaActual = Calendar.getInstance();
	        //Se asigna la fecha recibida a la fecha de nacimiento.
                fechaNacimiento.setTime(fechaInicial);     
                
                int regresa[]= new int[2];
                regresa[0]=0;regresa[1]=0;
                
                //Se restan la fecha actual y la fecha de nacimiento
	        int año = fechaActual.get(Calendar.YEAR)- fechaNacimiento.get(Calendar.YEAR);
	        int mes = fechaActual.get(Calendar.MONTH)- fechaNacimiento.get(Calendar.MONTH);
	        int dia = fechaActual.get(Calendar.DATE)- fechaNacimiento.get(Calendar.DATE);
	        //Se ajusta el año dependiendo el mes y el día
           
               if(mes<0 || (mes==0 && dia<0)){
	           año--;
                }
               // if(año<0){año=0;}
                int mes2=meses(fechaNacimiento,fechaActual);
               // System.out.println("años:"+año+" meses:"+mes+" dias:"+dia+" meses2:"+mes2);
                if(año==0 && mes2 ==0){int dia2=dias(fechaNacimiento.getTime());
                                       if(dia2==1){ regresa[0]=0;regresa[1]=dia2;}
                                       else{ regresa[0]=0;regresa[1]=dia2;}
                                       }
                else if(año==0 ){  
                                   if(mes2==1){regresa[0]=1;regresa[1]=mes2;}
                                   else{regresa[0]=1;regresa[1]=mes2;}
                
                               }
                else{regresa[0]=2;regresa[1]=año; }
	    
            // 0 dias 1 meses 2 años 
           return regresa;
 }  
 
 public int[] edad_num2(String fecha_nacimiento,String fecha_consulta) {
 
          SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
           	Date fechaInicial=null;
           	Date fechaConsulta=null;
 	    	
                try {fechaInicial  = formato.parse(fecha_nacimiento);} 
                catch(ParseException ex){}  
 	    	
                try {fechaConsulta = formato.parse(fecha_consulta);} 
                catch(ParseException ex){}  
 	    //	Date fechaFinal=new java.util.Date();//hoy   
     
                Calendar fechaNacimiento = Calendar.getInstance();
	        //Se crea un objeto con la fecha actual
	        Calendar fechaConsultac = Calendar.getInstance();
	        //Se asigna la fecha recibida a la fecha de nacimiento.
                fechaNacimiento.setTime(fechaInicial);  
                fechaConsultac.setTime(fechaConsulta);      
                
                int regresa[]= new int[2];
                regresa[0]=0;regresa[1]=0;
                
                //Se restan la fecha actual y la fecha de nacimiento
	        int año = fechaConsultac.get(Calendar.YEAR)- fechaNacimiento.get(Calendar.YEAR);
	        int mes = fechaConsultac.get(Calendar.MONTH)- fechaNacimiento.get(Calendar.MONTH);
	        int dia = fechaConsultac.get(Calendar.DATE)- fechaNacimiento.get(Calendar.DATE);
	        //Se ajusta el año dependiendo el mes y el día
           
               if(mes<0 || (mes==0 && dia<0)){
	           año--;
                }
               // if(año<0){año=0;}
                int mes2=meses(fechaNacimiento,fechaConsultac);
               // System.out.println("años:"+año+" meses:"+mes+" dias:"+dia+" meses2:"+mes2);
                if(año==0 && mes2 ==0){int dia2=dias(fechaNacimiento.getTime());
                                       if(dia2==1){ regresa[0]=0;regresa[1]=dia2;}
                                       else{ regresa[0]=0;regresa[1]=dia2;}
                                       }
                else if(año==0 ){  
                                   if(mes2==1){regresa[0]=1;regresa[1]=mes2;}
                                   else{regresa[0]=1;regresa[1]=mes2;}
                
                               }
                else{regresa[0]=2;regresa[1]=año; }
	    
            // 0 dias 1 meses 2 años 
           return regresa;
 }  
 
 public String edad2(String fechitics) {
 
          SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
           	Date fechaInicial=null;
 	    	
            try {fechaInicial= formato.parse(fechitics);} 
            catch(ParseException ex){}  
 	    	
 	    //	Date fechaFinal=new java.util.Date();//hoy   
     
                Calendar fechaNacimiento = Calendar.getInstance();
	        //Se crea un objeto con la fecha actual
	        Calendar fechaActual = Calendar.getInstance();
	        //Se asigna la fecha recibida a la fecha de nacimiento.
                fechaNacimiento.setTime(fechaInicial);     
                
                String regresa="";
                
                //Se restan la fecha actual y la fecha de nacimiento
	        int año = fechaActual.get(Calendar.YEAR)- fechaNacimiento.get(Calendar.YEAR);
	        int mes = fechaActual.get(Calendar.MONTH)- fechaNacimiento.get(Calendar.MONTH);
	        int dia = fechaActual.get(Calendar.DATE)- fechaNacimiento.get(Calendar.DATE);
	        //Se ajusta el año dependiendo el mes y el día
           
               if(mes<0 || (mes==0 && dia<0)){
	           año--;
                }
               // if(año<0){año=0;}
                int mes2=meses(fechaNacimiento,fechaActual);
               // System.out.println("años:"+año+" meses:"+mes+" dias:"+dia+" meses2:"+mes2);
                if(año==0 && mes2 ==0){int dia2=dias(fechaNacimiento.getTime());
                                       if(dia2==1){ regresa=""+dia2+"-3";}
                                       else{ regresa=""+dia2+"-3";}
                                       }
                else if(año==0 ){  
                                   if(mes2==1){regresa=""+mes2+"-2";}
                                   else{regresa=""+mes2+"-2";}
                
                               }
                else{regresa=""+año+"-1";}
	    
        
           return regresa;
 } 
 
public int meses(Calendar g1, Calendar g2) {
int elapsed = -1;
Calendar gc1, gc2;
Date d1,d2;

if (g2.after(g1)) {
gc2 = (Calendar) g2.clone();
gc1 = (Calendar) g1.clone();
}
else {
gc2 = (Calendar) g1.clone();
gc1 = (Calendar) g2.clone();
}


while ( gc1.before(gc2) ) {
gc1.add(Calendar.MONTH, 1);
elapsed++;
}
return elapsed;
}

public int dias(Date f1){

           Date fechaInicial=f1;
 	   Date fechaFinal=new java.util.Date();//hoy   
      
           long fechaInicialMs = fechaInicial.getTime();
           long fechaFinalMs = fechaFinal.getTime();
           long diferencia = fechaFinalMs - fechaInicialMs;
           double dias = Math.floor(diferencia / (1000 * 60 * 60 * 24));
           
           int regresa=(int)dias;
           
           return regresa;
}    
}
