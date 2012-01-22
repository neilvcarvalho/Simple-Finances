jQuery ->
	$("#movimentacao-" + <%= @movimentacao.id %>).remove()
	$("#progress_bars").html('<%= escape_javascript(render("movimentacoes/bars"))%>')
	<% linha = linha_saldo_user %>
	$("#linha_saldo").text("<%= escape_javascript(linha)%>")