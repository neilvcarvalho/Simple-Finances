#encoding: utf-8

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
		 :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :contas
  after_save :create_accounts

  def create_accounts
	Conta.create(:descricao => "Carteira", :user_id => self.id)
	Conta.create(:descricao => "Conta Corrente", :user_id => self.id)
	Conta.create(:descricao => "Poupança", :user_id => self.id)
  end
end
