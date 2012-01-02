<% if @salvou %>
	$('#tabela_movimentacoes').prepend('<%= escape_javascript(render("linha_movimentacao", :movimentacao => @movimentacao)) %>')
<% else %>
	alert "Dados inválidos."
<% end %>
