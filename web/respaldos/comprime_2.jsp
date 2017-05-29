<%-- 
    Document   : comprime
    Created on : 25-ago-2013, 18:04:09
    Author     : servidor
--%>

<%@page import="pac.cla"%>
<%@page import="pac.ruta"%>
<%@page import="pac.JavaMail"%>
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
           
       <% request.setCharacterEncoding("UTF-8");
      
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
        
                out.print("<br><center><h1>Por favor ingrese adecuadamente</h1></center>");
                out.print("<br><center><a href='../index.jsp'>volver</a></center>");
                out.println("</body></html>");
                return;
            }   
           String per=""+session.getAttribute("permiso");
           if(per.compareTo("10")!=0){
                out.print("<br><center><h1>Solo la gerencia posee permiso para realizar esta acción</h1></center>");
                out.println("</body></html>");
                return;          
          }         
  
        try {          

                      String correod  =""+request.getParameter("correo_en");
                      String correod_c=""+request.getParameter("correo_en_c");                      
                      String correop  =""+request.getParameter("correo_de");
                      String correoa  =""+request.getParameter("correo_as");
                      String correom  =""+request.getParameter("correo_me");
                      
                       Calendar cal1 = Calendar.getInstance();
	            String dia=""+cal1.get(Calendar.DATE)+"";
	                   dia=dia.trim();
	            String mes=""+(1+Integer.parseInt(""+cal1.get(Calendar.MONTH)+""))+"";
	                   mes=mes.trim();
	            if(dia.length()==1){dia="0"+dia;} 
	            if(mes.length()==1){mes="0"+mes;} 	      
                  String fecha=""+dia+"-"+mes+"-"+cal1.get(Calendar.YEAR)+"-"+cal1.get(Calendar.HOUR)+"-"+cal1.get(Calendar.MINUTE)+"-"+cal1.get(Calendar.SECOND)+"-"+cal1.get(Calendar.MILLISECOND);
    
                        String r=new ruta().dir();
                        cla cl=new cla();
                        boolean copi=new respaldo().backupDB(""+cl.bas()+"",""+cl.us()+"",""+cl.clav()+"",""+r+"/ISALUD/respaldos/copias_r/copiaDB_"+fecha+".sql");
		       if(copi){
			Archivos arch = new Archivos();
			arch.Zippear(""+r+"/ISALUD/respaldos/copias_r/copiaDB_"+fecha+".sql", ""+r+"/ISALUD/respaldos/copias_r/copiaDB_"+fecha+".zip");
			out.println("<center> <br><h2>Copia realizada con éxito<h2> </center><br> ");
                               }
                    try {
	                     Thread.sleep(1000);
                             JavaMail enviar= new JavaMail();
                             enviar.email(correop,correoa,correom,correod,correod_c,""+r+"/ISALUD/respaldos/copias_r/copiaDB_"+fecha+".zip","copiaDB_"+fecha+".zip");
	               } catch(InterruptedException e) {        }
                           
               } catch (Exception e) {
			e.printStackTrace();
		}
        %>
          
          
    </body>
</html>



