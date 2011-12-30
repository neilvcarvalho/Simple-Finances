class AddDataToMovimentacao < ActiveRecord::Migration
  def change
    add_column :movimentacoes, :data, :date
  end
end
