/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author EMMANUEL
 */
package pac;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class conecta_bd {
    String base="ips_isalud";
    String user,pass,urlConectar,driver;
    public Connection conection; // variable de la clase conect para conectar la base de datos
    private java.sql.Statement statement;
    
   
     	 
  	    	    
  	 ///conexion bases de datos
  	 public void ConectaDb() {
                               cla cl = new cla();
                              user=cl.us();
                              pass=cl.clav();
                              driver="com.mysql.jdbc.Driver";
                              urlConectar="jdbc:mysql://localhost:"+cl.puer()+"/"+cl.bas();
                             
                              try {
                                  Class.forName(driver);
                                  conection=DriverManager.getConnection(urlConectar,user,pass);
                                  // System.out.println("SI SE CONECTA A LA DB");
                                   }
                             catch (ClassNotFoundException exe) { }
                             catch (SQLException ex) {}
                              
       
    }
    
    
    //-------------------metodo para cerrar la conexion a la db
    
      public void cerrar() {
        try {
            conection.close();
        } catch (SQLException ex) {
            //ex.printStackTrace();
        }
        catch(Exception gf){}
    }
    
    //metodo para jenerar las consultas
    public ResultSet consultas(String cadConsulta){
        ResultSet resultado = null;
        try {
            statement=conection.createStatement();
            resultado=statement.executeQuery(cadConsulta);
        } catch (SQLException ex) { }
        catch(Exception gf){ }
        return resultado;
    }
    //------------------------------
   
    //----------------metodo para cerrar el resultado de las consultas
      public void cierraResultado(ResultSet resutado){
        try {

            resutado.close();
        } catch (SQLException ex) {
            //ex.printStackTrace();
        }
        catch (Exception ex) {
        }
    }
    // ---------------------fin del metodo
    
    //----------------transaccion
       public boolean transaccion(String cadenaSql){
        //boolean ejecuta= false;
          // System.out.println("insert |"+cadenaSql+"|");
        try {
            statement=conection.createStatement();
            statement.execute(cadenaSql);
            statement.close();
            return true;
        } catch (SQLException ex) {        	
                // System.out.println("ee1 "+ex);
                return false;
          //  ex.printStackTrace();
        }catch(Exception gf){//System.out.println("ee2 "+gf);
                            return false;}
       // return false;
    }
    //----------------------fin del metodo 
    
    ////lee datos del archivo para saber nombre de la base y contraseña
    

}