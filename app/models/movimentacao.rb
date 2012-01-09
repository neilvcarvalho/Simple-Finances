class Movimentacao < ActiveRecord::Base
	attr_accessible :quantia, :categoria_id, :conta_id, :conta_destino_id, :tipo, :date, :comment, :user_id
	belongs_to :user
	belongs_to :categoria
	belongs_to :conta
	validates_presence_of :quantia
	validates_presence_of :conta_id
	validates_presence_of :date
	validates_numericality_of :quantia, :greater_than => 0
	after_save :atualiza_saldo_conta
	before_destroy :update_balance_removal

	def atualiza_saldo_conta
		conta_destino = Conta.find_by_id(conta_destino_id)
		conta.update_attribute(:saldo, conta.balance)
		conta_destino.update_attribute(:saldo, conta_destino.balance) if conta_destino.present?
	end
	
	def atualiza_saldo_conta2
		conta_destino = Conta.find_by_id(conta_destino_id)
		conta.saldo += quantia if tipo == "E"
		conta_destino.saldo += quantia if conta_destino.present?
		conta_destino.save if conta_destino.present?
		conta.saldo -= quantia if ["S", "T"].include?(tipo)
		conta.save
	end

	def update_balance_removal
		conta_destino = Conta.find_by_id(conta_destino_id)
		conta.saldo -= quantia if tipo == "E"
		conta_destino.saldo -= quantia if conta_destino.present?
		conta_destino.save if conta_destino.present?
		conta.saldo += quantia if ["S", "T"].include?(tipo)
		conta.save
	end
end
