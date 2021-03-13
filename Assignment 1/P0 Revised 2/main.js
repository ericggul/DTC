
$(document).ready(function(){
	$("#Real1").click(function(){
		$("#Real1").css("display","none");
		$("#Real2").css("fill", "pink");
		$("#expl1").css("display", "block");
		$('#header').css("height", "8vh");
		$("#Real2").click(function(){
			$("#Real2").css("display","none");
			$("#Real3").css("fill", "red");
			$("#expl2").css("display", "block");
			$('#header').css("height", "9vh");
			$("#Real3").click(function(){
				$("#Real3").css("display","none");
				$("#expl3").css("display", "block");
				$('#header').css({"height": "12vh","text-decoration": "none"});
			})
		})
	})

	$(".cls-26").click(function(){
		$("#Blackswan_modal").css("display", "flex");
	})

	$("#Blackswan_modal").click(function(){
		$("#Blackswan_modal").css("display", "none");
	})
})