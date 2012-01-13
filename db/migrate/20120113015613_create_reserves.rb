class CreateReserves < ActiveRecord::Migration
  def self.up
    create_table :reserves do |t|
      t.decimal :sum
      t.integer :conta_id
      t.timestamps
    end
  end

  def self.down
    drop_table :reserves
  end
end
