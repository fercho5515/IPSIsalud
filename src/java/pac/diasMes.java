/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pac;

import java.util.Calendar;

/**
 *
 * @author EMMANUEL
 */
public class diasMes {
    
    public void diasMes(){}
    
    public int diasDelMes (int anio, int mesBase0){ 
    	 int dias = 31; 
    	 Calendar c = Calendar.getInstance(); 
    	 c.set(anio, mesBase0, dias); 
    	 while (c.get(Calendar.MONTH) != mesBase0){ 
        	 c.set(anio, mesBase0, --dias); 
    	 } 
    	 return dias; 
}
}
