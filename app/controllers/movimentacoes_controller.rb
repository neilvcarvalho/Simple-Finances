class MovimentacoesController < ApplicationController
  def index
    @movimentacoes = Movimentacao.all
  end

  def show
    @movimentacao = Movimentacao.find(params[:id])
  end

  def new
    @movimentacao = Movimentacao.new
  end

  def create
    @movimentacao = Movimentacao.new(params[:movimentacao])
    if @movimentacao.save
      redirect_to @movimentacao, :notice => "Successfully created movimentacao."
    else
      render :action => 'new'
    end
  end

  def edit
    @movimentacao = Movimentacao.find(params[:id])
  end

  def update
    @movimentacao = Movimentacao.find(params[:id])
    if @movimentacao.update_attributes(params[:movimentacao])
      redirect_to @movimentacao, :notice  => "Successfully updated movimentacao."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @movimentacao = Movimentacao.find(params[:id])
    @movimentacao.destroy
    redirect_to movimentacoes_url, :notice => "Successfully destroyed movimentacao."
  end
end
