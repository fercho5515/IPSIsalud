<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>
<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8">
	
<style type="text/css">

</style>
<script type="text/javascript" language="javascript">
 function cargacont(idcom){//alert("ncom "+com);
     $("#datos_contratos").load("carga_todo_editar_contratos.jsp?cod="+idcom);
 }
 
	
</script>
<title>Sin título 1</title>
</head>

<body>

       <% request.setCharacterEncoding("UTF-8");
           if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
        %>
            
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>    
  
            <% 
              out.println("</body></html>");
              return;
            }%>
    
    
  <table style="width:100%">
        
        <tr>   
            <td> 
                <fieldset >
                <legend>Contratos</legend>
                   <div style="vertical-align:top">
                       <% 
                         conecta_bd ba = new conecta_bd();
                            ba.ConectaDb(); 

                            String sql="select id_contratacion,n_contrato,nombre from contratacion order by nombre;";

                             ResultSet resu=null;
                             try{  resu=ba.consultas(sql);
                                   while (resu.next()&&resu!=null) {  
                                        out.print(" <figure id='figu' name='figu' style=' display:inline-block;' onclick='cargacont("+'"'+resu.getString(1)+'"'+")' style='width:100px'>");
					out.print(" <center> <img src='../imagenes/fotos/cont.png' alt='contrato uno' style='width:50px;height:50px'>");
                                        out.print("  <figcaption  style='width:100px'>"+resu.getString(3)+"_"+resu.getString(2)+"</figcaption></center> ");
                                        out.print("  </figure>");
                                                                    }
                                 }                       
                             catch(SQLException ex){}
                             catch(Exception exe){}
                             ba.cierraResultado(resu); 
                       %>
                     

                  </div>
                </fieldset>           
            </td>            
        </tr>
        <tr>
            <td>                 
		
            </td>
        </tr>
  </table>
<div id="datos_contratos" name="datos_contratos">  		
</div>                 
			    
 


<% ba.cerrar(); %>  
</body>

</html>
