<% if @salvou %>
	$('#tabela_movimentacoes').
	prepend('<%= escape_javascript(render("linha_movimentacao", :movimentacao => @movimentacao)) %>')
	$("#movimentacao-<%=@movimentacao.id%>").effect("highlight", {}, 4000)

	$("#linha_saldo").text("<%= escape_javascript(linha_saldo_user)%>")
	$("#movimentacao_comment").val('')
	$("#movimentacao_quantia").val('')
	$("#tabela_movimentacoes tr").removeClass("line_even").removeClass("line_odd")
	$("#tabela_movimentacoes tr:even").addClass("line_even")
	$("#tabela_movimentacoes tr:odd").addClass("line_odd")
<% else %>
	alert "Dados inválidos."
<% end %>
