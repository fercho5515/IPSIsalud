function casoAct(caso)
{
	
	document.cookie ='identificador='+caso+'; expires=Thu, 2 Aug 2421 20:47:11 UTC; path=/';
	document.cookie ='tipo=busqueda; expires=Thu, 2 Aug 2421 20:47:11 UTC; path=/';	
	document .cookie='casilla=pay; expires=Thu, 2 Aug 2421 20:47:11 UTC; path=/';
	location.href='contenedor.php';
   
}
