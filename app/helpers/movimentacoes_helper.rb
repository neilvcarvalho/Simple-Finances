module MovimentacoesHelper
	def linha_tabela_movimentacao(movimentacao)
		render "linha_movimentacao", :movimentacao => movimentacao
	end

	def type_name(movimentacao)
		{"S" => "Gastei", "E" => "Ganhei", "T" => "Transferi"}[movimentacao.tipo]
	end

	def linha_saldo_user
		@balance = current_user.monthly_balance
    	@per_day = @balance / (Time.now.end_of_month.day - Time.now.day)
		"Saldo mensal: #{number_to_currency @balance} (#{number_to_currency @per_day}/dia)".html_safe
	end
end
