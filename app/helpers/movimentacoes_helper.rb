module MovimentacoesHelper
	def linha_tabela_movimentacao(movimentacao)
		render "linha_movimentacao", :movimentacao => movimentacao
	end
end
