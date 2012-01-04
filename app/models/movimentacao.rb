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
	before_destroy :update_balance_removal

	def nome_categoria
		categoria.try(:descricao) || "Sem categoria"
	end

	def atualiza_saldo_conta
		conta.saldo += quantia if tipo == "E"
		conta.saldo -= quantia if ["S", "T"].include?(tipo)
		conta.save
	end

	def update_balance_removal
		conta.saldo -= quantia if tipo == "E"
		conta.saldo += quantia if ["S", "T"].include?(tipo)
		conta.save
	end
end
