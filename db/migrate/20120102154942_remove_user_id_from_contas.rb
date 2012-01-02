class RemoveUserIdFromContas < ActiveRecord::Migration
	def up
		remove_column :contas, :user_id
	end

	def down
		add_column :contas, :user_id, :integer
	end
end
