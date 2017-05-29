$(document).ready(function(){	
	
	
	
});	


function linkcli(code)
	{
		$("#contenido").load("linkcliente.php?id="+code+"");
    }	
    
 function unlinkcli(numero,code)
	{
		$("#contenido").load("unlinkcliente.php?id="+numero+"&ced="+code+"");
    }	   