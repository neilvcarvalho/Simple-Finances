<% unless @movimentacao.new_record? %>
	$('#tabela_movimentacoes').
	prepend('<%= escape_javascript(render("linha_movimentacao", :movimentacao => @movimentacao)) %>')
	$("#movimentacao-<%=@movimentacao.id%>").effect("highlight", {}, 4000)

	$("#movimentacao_comment").val('')
	$("#movimentacao_quantia").val('')
	$("#tabela_movimentacoes tr").removeClass("line_even").removeClass("line_odd")
	$("#tabela_movimentacoes tr:even").addClass("line_even")
	$("#tabela_movimentacoes tr:odd").addClass("line_odd")

	<%= render :partial => "update_information" %>
<% else %>
	alert "A movimentação não pôde ser salva. Tem certeza que incluiu todos os dados válidos?"
<% end %>
