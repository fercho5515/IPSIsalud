<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<!doctype html>
<html lang="es">
<% 
    request.setCharacterEncoding("UTF-8");     
    HttpSession sesion = request.getSession();
    sesion.setAttribute("id_paq","0");
%>
<head>
		<meta  content="text/html; charset=utf-8" http-equiv="Content-Type">
	
<script type="text/javascript" language="javascript">

/////////////////////////////
//////////tabs///////////////
/////////////////////////////
 $(function() {
        $( "#tabsc" ).tabs();
    });
  

                               
function cambiaPestanacontratos(pstana){

                           if(pstana==1){$("#tabs-contratos").load("crear_contrato.jsp");}  
                           else{   $("#tabs-contratos").load("editar_contratos.jsp");   }  
                         }    

   
</script>        
        

	<style type="text/css">
	body{
		font: 62.5% "Trebuchet MS", sans-serif;
		margin: 5px;
		background-color:#f2f5f7;
	}
	#dsa{padding: 5px 5px 0px 5px;}
	label,option,select{font-family:"Eras Medium ITC";
	      color:#2779aa;
          font-size:11pt;}
	legend{font-family:"Eras Bold ITC";
	       font-size:11pt;
    	   color:#2779aa;}
    fieldset{border:1px #2779aa solid;
             -webkit-border-radius: 10px;
             -moz-border-radius: 10px;
             border-radius: 10px;} 
    
  
	#aceptar,#mas{font-family:"Eras Medium ITC";
   			color:#2779aa;
          font-size:11pt; background:white;
         
          -webkit-border-radius: 10px;
          -moz-border-radius: 10px;
           border-radius: 10px;
         }
    #aceptar:hover,#mas:hover{
     	 background: #3baae3;
 	     border-top-color: #3baae3;
         color: #ffffff;
         cursor: pointer;
		}         
       #figu:hover{
		      background-color:#3baae3;
		      cursor:pointer;
		      border-radius: 10px;
	         }      
	</style>
</head>
<body>
    <% 
      
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }%>
<div id="tabsc"  style="height:100%;width:100%;" >
    
    <ul>    
        <li><a href="#tabs-contratos" onclick="cambiaPestanacontratos(1)">Crear Contrato</a></li>
        <li><a href="#tabs-contratos" onclick="cambiaPestanacontratos(2)">Editar Contrato</a></li>
    </ul>
    <div id="tabs-contratos" style="width:100%;height:100%;overflow:auto;" >
    </div>

</div>
<script type="text/javascript" language="javascript">

//document.writeln("<b>Tú resolución es de:</b> " + screen.width + " x " + screen.height +"");
var hoja = document.createElement('style')
  var element = document.getElementById("tabs-contratos");
  element.style.width= ""+(screen.width-295)+"px";
  element.style.height= ""+(screen.height-330)+"px";
   cambiaPestanacontratos(1);
</script>
</body>
</html>
