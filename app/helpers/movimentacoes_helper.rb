module MovimentacoesHelper
	def linha_tabela_movimentacao(movimentacao)
		render "linha_movimentacao", :movimentacao => movimentacao
	end

	def type_name(movimentacao)
		{"S" => "Gastei", "E" => "Ganhei", "T" => "Transferi"}[movimentacao.tipo]
	end
end
