jQuery ->
	$("#reserves").html("<%= escape_javascript(render('reserves/reserves')) %>")
	$("#reserve-<%=@reserve.id%>").effect("highlight", {}, 4000)
	$("#linha_saldo").text("<%= escape_javascript(linha_saldo_user)%>")