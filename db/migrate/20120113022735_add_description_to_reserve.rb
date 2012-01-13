class AddDescriptionToReserve < ActiveRecord::Migration
  def change
    add_column :reserves, :description, :string
  end
end
