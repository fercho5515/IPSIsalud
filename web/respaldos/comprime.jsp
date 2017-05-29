<%-- 
    Document   : comprime
    Created on : 25-ago-2013, 18:04:09
    Author     : servidor
--%>

<%@page import="pac.JavaMail"%>
<%@page import="pac.cla"%>
<%@page import="pac.ruta"%>
<%@page import="java.util.Calendar"%>
<%@page import="pac.respaldo"%>
<%@page import="pac.Archivos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% ruta r = new ruta();
        try {           Calendar cal1 = Calendar.getInstance();
	            String dia=""+cal1.get(Calendar.DATE)+"";
	                   dia=dia.trim();
	            String mes=""+(1+Integer.parseInt(""+cal1.get(Calendar.MONTH)+""))+"";
	                   mes=mes.trim();
	            if(dia.length()==1){dia="0"+dia;} 
	            if(mes.length()==1){mes="0"+mes;} 	      
                  String fecha=""+dia+"-"+mes+"-"+cal1.get(Calendar.YEAR)+"-"+cal1.get(Calendar.HOUR)+"-"+cal1.get(Calendar.MINUTE)+"-"+cal1.get(Calendar.SECOND)+"-"+cal1.get(Calendar.MILLISECOND);
    
                                 cla cl=new cla();
                        boolean copi=new respaldo().backupDB(""+cl.bas()+"",""+cl.us()+"",""+cl.clav()+"",r.dir2()+"/copiasBD/copiaDB_"+fecha+".sql");
		       if(copi){
			Archivos arch = new Archivos();
			arch.Zippear(r.dir2()+"/copiasBD/copiaDB_"+fecha+".sql", r.dir2()+"/copiasBD/copiaDB_"+fecha+".zip");
			out.println("Comprimido!");
                               }
                        try {
	                     Thread.sleep(1000);
                             JavaMail enviar= new JavaMail();
                             enviar.email(""+cl.email_r()+"","base de datos","copia de la base de dato",""+cl.email_e()+"",""+cl.c_email_e()+"",r.dir2()+"/copiasBD/copiaDB_"+fecha+".zip","copiaDB_"+fecha+".zip");
	               } catch(InterruptedException e) {        }
                        //arch.UnZip("devtroce.zip", "new_devtroce.jpg");
			//System.out.println("Descomprimido!");
               } catch (Exception e) {
			e.printStackTrace();
		}
        %>
    </body>
</html>
