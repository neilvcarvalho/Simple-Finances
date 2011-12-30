class CreateConta < ActiveRecord::Migration
  def self.up
    create_table :conta do |t|
      t.decimal :saldo
      t.integer :user_id
      t.string :descricao
      t.timestamps
    end
  end

  def self.down
    drop_table :conta
  end
end
