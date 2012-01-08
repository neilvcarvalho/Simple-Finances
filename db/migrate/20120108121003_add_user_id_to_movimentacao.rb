class AddUserIdToMovimentacao < ActiveRecord::Migration
  def up
  	add_column :movimentacoes, :user_id, :integer
  	for movimentacao in Movimentacao.all
  		movimentacao.update_attribute(:user_id, movimentacao.conta.owner_id)
  	end
  end

  def down
  	remove_column :movimentacoes, :user_id
  end
end
