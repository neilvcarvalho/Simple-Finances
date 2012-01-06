# coding: utf-8

class MovimentacoesController < ApplicationController
  before_filter :belongs_to_user, except: [:index, :create]
  def index
    @movimentacoes = Movimentacao.where(["conta_id in (?)",current_user.contas]).order("date desc, id desc").page(params[:page]).per_page(10)
    @categorias = Categoria.find_all_by_user_id(current_user)
    @contas = ContaDecorator.decorate(current_user.contas)
    @movimentacao = Movimentacao.new
    @tipos = [["gastei", "S"], ["ganhei", "E"], ["transferi", "T"]]
    @balance = current_user.monthly_balance
    @per_day = @balance / (Time.now.end_of_month.day - Time.now.day)
  end

  def show
    @movimentacao = Movimentacao.find(params[:id])
  end

  def new
    @movimentacao = Movimentacao.new
  end

  def create
    params[:movimentacao][:quantia].gsub!(",",".")
    @movimentacao = Movimentacao.new(params[:movimentacao])
    date = params[:movimentacao][:date]
    if date.present?
      date = date.split("/")
      if date.size == 1
        @movimentacao.date = Time.now.to_date if date[0] == "Hoje"
      else
        @movimentacao.date = Time.new(date[2].to_i, date[1].to_i, date[0].to_i)
      end
    end
    if @movimentacao.save
      respond_to do |format|
        format.html { redirect_to @movimentacao, :notice => "Successfully created movimentacao." }
        format.js { @salvou = true }
      end
    else
      puts @movimentacao.date
      respond_to do |format|
        format.html { render :action => 'new' }
        format.js { @salvou = false }
      end
    end
  end

  def edit
    @movimentacao = Movimentacao.find(params[:id])
  end

  def update
    @movimentacao = Movimentacao.find(params[:id])
    if @movimentacao.update_attributes(params[:movimentacao])
      redirect_to @movimentacao, :notice  => "Movimentação alterada com sucesso."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @movimentacao = Movimentacao.find(params[:id])
    @movimentacao.destroy
    respond_to do |format|
      format.html { redirect_to movimentacoes_url, :notice => "Successfully destroyed movimentacao." }
      format.js
    end
  end

  private
  def belongs_to_user
    movimentacao = Movimentacao.find(params[:id])
    unless current_user.contas.include?(movimentacao.conta)
      flash[:error] = "Esta movimentação não te pertence!"
      redirect_to movimentacoes_url  
    end
  end
end
