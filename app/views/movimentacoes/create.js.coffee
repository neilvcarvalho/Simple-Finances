<% if @salvou %>
	$("#tabela_movimentacoes").prepend "<%= linha_tabela_movimentacao(@movimentacao) %>"
<% else %>
	alert "Dados inválidos."
<% end %>
