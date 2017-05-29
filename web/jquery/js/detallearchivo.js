$(document).ready(function(){	
             jQuery("#list10").jqGrid({
             url:'listarArchivos.php',
	         datatype: "json",
   	         colNames:['Nombre Archivo', 'Fecha Adicion','Descripcion','Ruta'],
   	         colModel:[
   				{name:'nombreArchivo',index:'nombreArchivo', width:50,searchoptions:{sopt:['cn','eq']}},
   				{name:'fecha_adicion',index:'fecha_adicion', width:50,searchoptions:{sopt:['cn','eq']}},
   				{name:'descripcion',index:'descripcion', width:190,searchoptions:{sopt:['cn','eq']}},
   				{name:'ruta',index:'ruta', width:80,hidden: true,searchoptions:{sopt:['cn','eq']}},
   	   		 ],
   	rowNum:500000000,
    height:200,
   	pager: '#pager10',
   	sortname: 'fecha_adicion',
   	rownumbers: true,
    viewrecords: true,
    altRows:true,
    sortorder: "desc",
    autowidth: true, 
    editurl: 'borraArchivo.php',
    autoheight: true,
	caption: "listado de Archivos.",
	ondblClickRow: function(id){	
    						    document.getElementById("nompdf").value=id;
    						    var formulario=document.getElementById("pdf");  
    							formulario.submit();
    							//document.location = ""+id;							
								}
	});
	
	//-----------------------------------------------------
	//-----------------------------------------------------
	
	
	jQuery(function ($) {
	var OSX = {
		container: null,
		init: function () {
			$("input.mas, a.mas").click(function (e) {
				e.preventDefault();	

				$("#osx-modal-content").modal({
					overlayId: 'osx-overlay',
					containerId: 'osx-container',
					closeHTML: null,
					minHeight: 80,
					opacity: 65, 
					position: ['0',],
					overlayClose: true,
					onOpen: OSX.open,
					onClose: OSX.close
				});
			});
		},
		open: function (d) {
			var self = this;
			self.container = d.container[0];
			d.overlay.fadeIn('slow', function () {
				$("#osx-modal-content", self.container).show();
				var title = $("#osx-modal-title", self.container);
				title.show();
				d.container.slideDown('slow', function () {
					setTimeout(function () {
						var h = $("#osx-modal-data", self.container).height()
							+ title.height()
							+ 20; // padding
						d.container.animate(
							{height: h}, 
							200,
							function () {
								$("div.close", self.container).show();
								$("#osx-modal-data", self.container).show();
							}
						);
					}, 300);
				});
			})
		},
		close: function (d) {
			var self = this; // this = SimpleModal object
			d.container.animate(
				{top:"-" + (d.container.height() + 20)},
				500,
				function () {
					self.close(); // or $.modal.close();
				}
			);
		}
	};

	OSX.init();

});
	
	
	
	

});

