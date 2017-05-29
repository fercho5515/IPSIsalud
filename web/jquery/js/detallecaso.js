$(document).ready(function(){	
	
	$("#navigation li").hover(function() {
		$(this).stop(true).animate({width: "170px"},{duration:500,easing: 'easeOutBounce'});
		$(this).css({'background-color':'#777777','cursor':'pointer'});
	}, function() {
		$(this).stop(true).animate({width: "155px"},{duration:500,easing: 'easeOutCirc'});
		$(this).css({'background-color':'#999999'});
	});
	
	//---------------------------------------------------------------------------------------
	  	
	$('#navigation .esta a').click(function(e) {
		 var url = $(this).attr('href');
		 $('#loadcontent').load(url).slideDown('slow');
		 e.preventDefault();
	 });
	//---------------------------------------------------------------------------------------		
	
	
	
});	

//----------------------------------------------------------------------------------
//---------------CARGAR DENTRO DE EL SUBCONTENEDOR----------------------------------
//----------------------------------------------------------------------------------


function cargar(hola,caso)
	{
		console.log(hola, caso);
		if(hola=="caso")
		{
			$('#loadcontent').load("detallesEspCaso.php?var="+caso);
		}
		else if(hola=="pay")
		{
			$('#loadcontent').load("detallesEspPago.php?var="+caso);
		}
		else if(hola=="diario")
		{
			$('#loadcontent').load("detallesEspDiario.php?var="+caso);
		}
		else if(hola=="archivos")
		{
			$('#loadcontent').load("detallesEspArchivo.php?var="+caso);
		}
		else if(hola=="contra")
		{
			$('#loadcontent').load("detallesEspContra.php?var="+caso);
		}
		else if(hola=="cli")
		{
			$('#loadcontent').load("detallesEspCliente.php?var="+caso);
		}

   }	