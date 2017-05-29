$(document).ready(function(){	
             jQuery("#list10").jqGrid({
             url:'listarPagos.php',
	         datatype: "json",
   	         colNames:['Nro', 'Numero Caso','Descripcion','Pago', 'Fecha Pago'],
   	         colModel:[
   				{name:'Nro',index:'idpagos', width:15,searchoptions:{sopt:['cn','eq']}},
   				{name:'Caso',index:'ncaso', width:25,searchoptions:{sopt:['cn','eq']}},
   				{name:'Descripcion',index:'descripcion', width:150,searchoptions:{sopt:['cn','eq']}},
   				{name:'Pago',index:'pago', width:25,searchoptions:{sopt:['cn','eq']}},
   				{name:'Fecha Pago',index:'fecha', width:30,searchoptions:{sopt:['cn','eq']}}
   	   		 ],
   	rowNum:500000000,
    height:200,
   	pager: '#pager10',
   	sortname: 'idpagos',
   	rownumbers: true,
    viewrecords: true,
    altRows:true,
    editurl: 'borraPago.php',
    sortorder: "desc",
    autowidth: true, 
    autoheight: true,
	caption: "Listado de Pagos."
	});
	
	$('#list10').jqGrid('navGrid','#pager10',{add:false,edit:false,del:true,search:true,view:true},
					{},
					{},
					{},
					{multipleSearch:true,closeAfterSearch: true, closeOnEscape: true}	
	);
	
	//---------------------------------------------------------------------------------------------------
	//---------------------------------------------------------------------------------------------------
	
	
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