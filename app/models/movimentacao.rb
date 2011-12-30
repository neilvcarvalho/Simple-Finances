class Movimentacao < ActiveRecord::Base
  attr_accessible :quantia, :categoria_id, :conta_origem, :conta_destino, :tipo
  belongs_to :user
  belongs_to :categoria
  belongs_to :conta
  validates_presence_of :quantia
  validates_numericality_of :quantia, :greater_than => 0
end
