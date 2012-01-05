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

  def monthly_balance
    entrada        = movimentacoes.where(["date >= ? and date <= ? and tipo = ?",Time.now.beginning_of_month,Time.now.end_of_month,"E"]).sum("quantia")
    saida          = movimentacoes.where(["date >= ? and date <= ? and tipo in (?)",Time.now.beginning_of_month,Time.now.end_of_month,["S","T"]]).sum("quantia")
    transferencia  = Movimentacao.where(["date >= ? and date <= ? and tipo = ? and conta_destino_id = ?",Time.now.beginning_of_month,Time.now.end_of_month,"T", self.id]).sum("quantia")
    entrada + transferencia - saida
  end
end
