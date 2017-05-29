

jQuery.fn.previewInputFileImage = function( previewer ){

    this.each( function(){

		$(this).change(function () {

			var previewer = $(this).data('previewer');
			var file = $(this)[0].files[0];
			var reader = new FileReader();

		    reader.onload = function(e){

		    	var data = e.target.result;
				$(previewer).attr('src',data);

		    }

		    reader.readAsDataURL(file);

		});

    });

}
