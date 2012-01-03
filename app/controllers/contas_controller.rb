class ContasController < ApplicationController
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
    @conta.users << current_user
    if @conta.update_attributes(params[:conta])
      redirect_to @conta, :notice  => "Successfully updated conta."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @conta = Conta.find(params[:id])
    @conta.destroy
    redirect_to conta_url, :notice => "Successfully destroyed conta."
  end
end
