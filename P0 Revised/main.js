
$(document).ready(function(){
	if ($("#Real1").is(":visible")){
		$("#Real2").click(function(){
		console.log("Alert");
	})
	}
	$("#Real1").click(function(){
		$("#Real1").css("display","none");
		$("#Real2").click(function(){
			$("#Real2").css("display","none");
			$("#Real3").click(function(){
				$("#Real3").css("display","none");
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