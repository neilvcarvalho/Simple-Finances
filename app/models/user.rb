#encoding: utf-8

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		 :recoverable, :rememberable, :trackable, :validatable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :users

	has_and_belongs_to_many :contas
	has_many :categorias
	has_many :own_accounts, :class_name => "Conta", :foreign_key => "owner_id"
	has_many :movimentacoes, :through => :contas
	after_create :create_accounts, :create_categories

	def create_accounts
		contas = ["Carteira", "Conta Corrente", "Poupança", "Cartão de Crédito"]
		for conta in contas
			self.contas << Conta.create(descricao: conta, saldo: 0, owner: self)
		end
	end

	def create_categories
		categorias = ["Diversão", "Contas de casa", "Mercado", "Gastos pessoais", "Estudos"]
		for categoria in categorias
			Categoria.create(descricao: categoria, user_id: self.id)
		end
	end

	def monthly_balance
		Movimentacao.where(["date >= ? and date <= ? and tipo = ? and conta_id in (?)",Time.now.beginning_of_month,Time.now.end_of_month,"E", contas]).sum("quantia") -
		Movimentacao.where(["date >= ? and date <= ? and tipo in (?) and conta_id in (?)",Time.now.beginning_of_month,Time.now.end_of_month,["S","T"], contas]).sum("quantia") +
		Movimentacao.where(["date >= ? and date <= ? and tipo = ? and conta_destino_id in (?)",Time.now.beginning_of_month,Time.now.end_of_month,"T", contas]).sum("quantia")
	end
end
