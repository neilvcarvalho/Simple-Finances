class Conta < ActiveRecord::Base
  attr_accessible :saldo, :users, :descricao, :owner
  has_and_belongs_to_many :users
  has_many :movimentacoes
  validates_presence_of :descricao
  validates_presence_of :saldo
  belongs_to :owner, :class_name => "User"

  def description_owner
  	"#{descricao} (#{owner.email})"
  end
end
