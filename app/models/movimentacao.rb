class Movimentacao < ActiveRecord::Base
  attr_accessible :quantia, :categoria_id, :conta_id, :conta_destino_id, :tipo, :date
  belongs_to :user
  belongs_to :categoria
  belongs_to :conta
  validates_presence_of :quantia
  validates_presence_of :conta_id
  validates_presence_of :date
  validates_numericality_of :quantia, :greater_than => 0
end
