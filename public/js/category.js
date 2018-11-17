
function f(id_auhtor){
	alert(id_auhtor);
	$.ajax({
		type: "POST",
		url: "IndexController.class.php",
		data: {id}
	}).done(function(answer) {
		alert(answer);
		$("#x").html(answer);
		  });
	}
