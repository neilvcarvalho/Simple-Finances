class Categoria < ActiveRecord::Base
  attr_accessible :descricao, :user_id
  belongs_to :user
  has_many :movimentacoes
end
