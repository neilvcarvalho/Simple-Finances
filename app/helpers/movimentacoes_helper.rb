module MovimentacoesHelper
	def linha_tabela_movimentacao(movimentacao)
		html  = "<tr>"
		html += "<td>#{movimentacao.date.strftime("%d/%m/%Y")}</td>"
		html += "<td>#{movimentacao.categoria.descricao}</td>"
		html += "<td>#{number_to_currency movimentacao.quantia}</td>"
		html += "<td>#{movimentacao.conta.descricao}</td>"
		html += "</tr>"
		html.html_safe
	end
end
