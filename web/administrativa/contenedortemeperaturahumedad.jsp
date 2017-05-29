<%-- 
    Document   : contenedortemeperaturahumedad
    Created on : 16/03/2013, 05:03:53 PM
    Author     : EMMANUEL
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
<head>
		<meta  content="text/html; charset=utf-8" http-equiv="Content-Type">
	
<script type="text/javascript" language="javascript">

 $(function() {
        $( "#tabshumedad" ).tabs();
    });
  

                               
function cambiaTemphumedad(pstana){

                           if(pstana==1){$("#tabs-temphumedad").load("tem_farma.jsp");}  
                           else if(pstana==2){$("#tabs-temphumedad").load("cont_tem_farma_d.jsp");} 
                           else if(pstana==3){$("#tabs-temphumedad").load("cont_tem_farma_m.jsp");}  
                           
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
      request.setCharacterEncoding("UTF-8");
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }%>
<div id="tabshumedad"  style="height:100%;width:100%;" >
    
    <ul>    
        <li><a href="#tabs-temphumedad" onclick="cambiaTemphumedad(1)">Agregar Control Diario</a></li>
        <li><a href="#tabs-temphumedad" onclick="cambiaTemphumedad(2)">Informe Diario</a></li>
        <li><a href="#tabs-temphumedad" onclick="cambiaTemphumedad(3)">Informe Mensual</a></li>
    </ul>
    <div id="tabs-temphumedad" style="width:100%;height:100%;overflow:auto;" >
    </div>

</div>
<script type="text/javascript" language="javascript">

//document.writeln("<b>Tú resolución es de:</b> " + screen.width + " x " + screen.height +"");
var hoja = document.createElement('style')
  var element = document.getElementById("tabs-temphumedad");
  element.style.width= ""+(screen.width-295)+"px";
  element.style.height= ""+(screen.height-330)+"px";
  cambiaTemphumedad(1);
</script>
</body>
</html>
