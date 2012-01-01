#encoding: utf-8

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		 :recoverable, :rememberable, :trackable, :validatable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :remember_me, :name

	has_many :contas
	has_many :categorias
	has_many :movimentacoes
	after_save :create_accounts, :create_categories

	def create_accounts
		contas = ["Carteira", "Conta Corrente", "Poupança", "Cartão de Crédito"]
		for conta in contas
			Conta.create(descricao: conta, user_id: self.id, saldo: 0)
		end
	end

	def create_categories
		categorias = ["Diversão", "Contas de casa", "Mercado", "Gastos pessoais", "Estudos"]
		for categoria in categorias
			Categoria.create(descricao: categoria, user_id: self.id)
		end
	end
end
