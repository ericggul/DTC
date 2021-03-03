const enter = document.querySelector(".enter");
const beta = document.querySelector(".beta");


$(document).ready(function() {
	$(document).on('click', '.enter', function() {

		$('.alpha').addClass('.insivible')
		$('.container').addClass('active')

		window.setTimeout(function() {
			$('.beta').css('display', 'flex');
			
		},2000);
		
	}) 

	
})


