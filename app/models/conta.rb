class Conta < ActiveRecord::Base
  attr_accessible :saldo, :user_id, :descricao
  belongs_to :user
  validates_presence_of :descricao
end
