class RenameDataToDateInMovimentacao < ActiveRecord::Migration
	def change
		rename_column :movimentacoes, :data, :date
	end
end
