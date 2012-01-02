class Movimentacao < ActiveRecord::Base
	attr_accessible :quantia, :categoria_id, :conta_id, :conta_destino_id, :tipo, :date
	belongs_to :user
	belongs_to :categoria
	belongs_to :conta
	validates_presence_of :quantia
	validates_presence_of :conta_id
	validates_presence_of :date
	validates_numericality_of :quantia, :greater_than => 0
	after_save :atualiza_saldo_conta

	def nome_categoria
		categoria.try(:descricao) || "Sem categoria"
	end

	def atualiza_saldo_conta
		total = 0
		for mov in conta.movimentacoes
			total += mov.quantia
		end
		conta.saldo = total
	end
end
