class RenomearTabelas < ActiveRecord::Migration
	def change
		rename_table :categoria, :categorias
		rename_table :conta, :contas
	end
end
