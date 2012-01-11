class Categoria < ActiveRecord::Base
  attr_accessible :descricao, :user_id
  belongs_to :user
  has_many :movimentacoes

  def monthly_balance
  	movimentacoes.where(["tipo = ?", "E"]).sum("quantia") - movimentacoes.where(["tipo = ?", "S"]).sum("quantia")
  end
end
