/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pac;



/**
 *
 * @author servidor
 */
public class respaldo {
    

    
 
 public boolean backupDB(String dbName, String dbUserName, String dbPassword, String path) {
 
        String executeCmd = "mysqldump -u " + dbUserName + " -p" + dbPassword + " --add-drop-database -B " + dbName + " -r " + path;
        Process runtimeProcess;
        try {
 
            runtimeProcess = Runtime.getRuntime().exec(executeCmd);
            int processComplete = runtimeProcess.waitFor();
 
            if (processComplete == 0) {
               // System.out.println("Backup creado satisfactoriamente");
                return true;
            } else {
             //   System.out.println("Backup no pudo ser creado satisfactoriamente");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
 
        return false;
    }
// new respaldo().CrearRespaldo("localhost", "3306", "root", "123", "prestamos",nom,1);
            	            	        	
   	 
}



































































