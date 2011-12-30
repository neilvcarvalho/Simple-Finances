class Movimentacao < ActiveRecord::Base
  attr_accessible :quantia, :categoria_id, :conta_origem, :conta_destino, :tipo
end
