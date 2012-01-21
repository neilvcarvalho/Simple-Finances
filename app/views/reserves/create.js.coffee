jQuery ->
	$("#reserves").html("<%= escape_javascript(render('reserves/reserves')) %>")
	$("#reserve-<%=@reserve.id%>").effect("highlight", {}, 4000)
	<%= render :partial => "movimentacoes/update_information" %>