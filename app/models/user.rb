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
	has_many :reserves, :through => :contas
	after_create :create_accounts, :create_categories

	def create_accounts
		contas = ["Carteira", "Conta Corrente", "Poupança", "Cartão de Crédito", "Salário"]
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
		Movimentacao.where(["tipo = ? and conta_id in (?)","E", contas]).this_month.sum("quantia") -
		Movimentacao.where(["tipo in (?) and conta_id in (?)",["S","T"], contas]).this_month.sum("quantia") +
		Movimentacao.where(["tipo = ? and conta_destino_id in (?)","T", contas]).this_month.sum("quantia") -
		total_reserve
	end

	def monthly_income
		movimentacoes.income.this_month.sum("quantia")
	end

	def daily_balance
		Movimentacao.where(["date = ? and tipo = ? and conta_id in (?)",Time.now.to_date,"E", contas]).sum("quantia") -
		Movimentacao.where(["date = ? and tipo in (?) and conta_id in (?)",Time.now.to_date,["S","T"], contas]).sum("quantia") +
		Movimentacao.where(["date = ? and tipo = ? and conta_destino_id in (?)",Time.now.to_date,"T", contas]).sum("quantia")
	end

	def total_reserve
		Reserve.where(["conta_id in (?)", contas]).sum("sum")
	end
end
