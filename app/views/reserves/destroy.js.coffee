jQuery ->
	$("#reserves").html("<%= escape_javascript(render('reserves/reserves')) %>")
	<%= render :partial => "movimentacoes/update_information" %>