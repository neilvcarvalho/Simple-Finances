<% unless @movimentacao.new_record? %>
	$('#tabela_movimentacoes').
	prepend('<%= escape_javascript(render("linha_movimentacao", :movimentacao => @movimentacao)) %>')
	$("#progress_bars").html('<%= escape_javascript(render("movimentacoes/bars"))%>')
	$("#movimentacao-<%=@movimentacao.id%>").effect("highlight", {}, 4000)

	$("#linha_saldo").text("<%= escape_javascript(linha_saldo_user)%>")
	$("#movimentacao_comment").val('')
	$("#movimentacao_quantia").val('')
	$("#tabela_movimentacoes tr").removeClass("line_even").removeClass("line_odd")
	$("#tabela_movimentacoes tr:even").addClass("line_even")
	$("#tabela_movimentacoes tr:odd").addClass("line_odd")
<% else %>
	alert "A movimentação não pôde ser salva. Tem certeza que incluiu todos os dados válidos?"
<% end %>
