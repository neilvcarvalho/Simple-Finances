<% if @salvou %>
	$('#tabela_movimentacoes').prepend('<%= escape_javascript(render("linha_movimentacao", :movimentacao => @movimentacao)) %>')
	<% linha = linha_saldo_user %>
	$("#linha_saldo").text("<%= escape_javascript(linha)%>")
	$("#movimentacao_comment").val('')
	$("#movimentacao_quantia").val('')
<% else %>
	alert "Dados inválidos."
<% end %>
