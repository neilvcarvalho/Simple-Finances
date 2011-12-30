class Conta < ActiveRecord::Base
  attr_accessible :saldo, :user_id, :descricao
  belongs_to :user
  has_many :movimentacoes
  validates_presence_of :descricao
end
