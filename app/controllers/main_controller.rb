class MainController < ApplicationController
  def index
  	@movimentacoes = MovimentacaoDecorator.decorate(Movimentacao.where(["conta_id in (?)",current_user.contas]).order("date desc, id desc").page(params[:page]).per_page(10))
    @categorias = CategoriaDecorator.find_all_by_user_id(current_user)
    @contas = ContaDecorator.decorate(current_user.contas.order("owner_id, descricao"))
    @tipos = [["gastei", "S"], ["ganhei", "E"], ["transferi", "T"]]
    @balance = current_user.monthly_balance
    @income_month = current_user.movimentacoes.where(["tipo = ?", "E"]).sum("quantia")
    @per_day = @balance / (Time.now.end_of_month.day - Time.now.day)
    @last_movement = Movimentacao.where(["user_id = ?",current_user]).order("created_at DESC").first
    @movimentacao = Movimentacao.new(categoria_id: @last_movement.try(:categoria).try(:id), conta_id: @last_movement.try(:conta).try(:id))
  end
end
