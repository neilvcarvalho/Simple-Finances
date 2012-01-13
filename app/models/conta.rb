class Conta < ActiveRecord::Base
  attr_accessible :saldo, :users, :descricao, :owner
  has_and_belongs_to_many :users
  has_many :movimentacoes
  validates_presence_of :descricao
  validates_presence_of :saldo
  has_many :reserves
  belongs_to :owner, :class_name => "User"


  def monthly_balance
    income   = movimentacoes.where(["date >= ? and date <= ? and tipo = ?",Time.now.beginning_of_month,Time.now.end_of_month,"E"]).sum("quantia")
    outcome  = movimentacoes.where(["date >= ? and date <= ? and tipo in (?)",Time.now.beginning_of_month,Time.now.end_of_month,["S","T"]]).sum("quantia")
    transfer = Movimentacao.where(["date >= ? and date <= ? and tipo = ? and conta_destino_id = ?",Time.now.beginning_of_month,Time.now.end_of_month,"T", self.id]).sum("quantia")
    reserve  = self.reserves.sum("sum")
    income + transfer - outcome - reserve
  end

  def balance
    income   = movimentacoes.where(["tipo = ?","E"]).sum("quantia")
    outcome  = movimentacoes.where(["tipo in (?)",["S","T"]]).sum("quantia")
    transfer = Movimentacao.where(["tipo = ? and conta_destino_id = ?","T", self.id]).sum("quantia")
    income + transfer - outcome
  end
end
