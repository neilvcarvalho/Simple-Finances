class AddOwnerIdToConta < ActiveRecord::Migration
  def change
    add_column :contas, :owner_id, :integer
  end
end
