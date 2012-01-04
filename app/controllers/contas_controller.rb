# coding: utf-8

class ContasController < ApplicationController
  before_filter :belongs_to_user, except: [:index]
  before_filter :user_is_main_owner, only: [:destroy]

  def index
    @contas = current_user.contas
  end

  def show
    @conta = Conta.find(params[:id])
  end

  def new
    @conta = Conta.new
  end

  def create
    @conta = Conta.new(params[:conta])
    @conta.users << current_user
    @conta.owner = current_user
    if @conta.save
      redirect_to @conta, :notice => "Successfully created conta."
    else
      render :action => 'new'
    end
  end

  def edit
    @conta = Conta.find(params[:id])
  end

  def update
    @conta = Conta.find(params[:id])
    if @conta.update_attributes(params[:conta])
      redirect_to @conta, :notice  => "Successfully updated conta."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @conta = Conta.find(params[:id])
    @conta.destroy
    redirect_to contas_url, :notice => "Successfully destroyed conta."
  end

  private
  def belongs_to_user
    conta = Conta.find(params[:id])
    unless current_user.contas.include?(conta)
      flash[:error] = "Esta conta não te pertence!"
      redirect_to contas_url  
    end
  end

  def user_is_main_owner
    conta = Conta.find(params[:id])
    unless conta.owner == current_user
      flash[:error] = "Você não é o dono desta conta."
      redirect_to contas_url  
    end
  end
end
