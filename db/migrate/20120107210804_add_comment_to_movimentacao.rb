class AddCommentToMovimentacao < ActiveRecord::Migration
  def change
    add_column :movimentacoes, :comment, :text
  end
end
