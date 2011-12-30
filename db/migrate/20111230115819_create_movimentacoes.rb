class CreateMovimentacoes < ActiveRecord::Migration
  def self.up
    create_table :movimentacoes do |t|
      t.decimal :quantia
      t.integer :categoria_id
      t.integer :conta_origem
      t.integer :conta_destino
      t.string :tipo
      t.timestamps
    end
  end

  def self.down
    drop_table :movimentacoes
  end
end
