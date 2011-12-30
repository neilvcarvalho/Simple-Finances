class CreateMovimentacoes < ActiveRecord::Migration
  def self.up
    create_table :movimentacoes do |t|
      t.decimal :quantia
      t.integer :categoria_id
      t.integer :conta_id
      t.integer :conta_destino_id
      t.string :tipo
      t.timestamps
    end
  end

  def self.down
    drop_table :movimentacoes
  end
end
