jQuery ->
	$("#reserves").html("<%= escape_javascript(render('reserves/reserves')) %>")
	$("#linha_saldo").text("<%= escape_javascript(linha_saldo_user)%>")