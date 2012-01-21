# coding: utf-8

class CategoriasController < ApplicationController
  before_filter :belongs_to_user, except: [:index, :new, :create]
  def index
    @categorias = current_user.categorias
  end

  def show
    @categoria = Categoria.find(params[:id])
  end

  def new
    @categoria = Categoria.new
  end

  def create
    @categoria = Categoria.new(params[:categoria])
    @categoria.user_id = current_user.id
    respond_to do |format|
      if @categoria.save
        format.html { redirect_to @categoria, :notice => "Successfully created categoria." }
        format.js
      else
        format.html { render :action => 'new' }
        format.js
      end
    end
  end

  def edit
    @categoria = Categoria.find(params[:id])
  end

  def update
    @categoria = Categoria.find(params[:id])
    @categoria.user_id = current_user.id
    if @categoria.update_attributes(params[:categoria])
      redirect_to @categoria, :notice  => "Successfully updated categoria."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @categoria = Categoria.find(params[:id])
    @categoria.destroy
    respond_to do |format|
      format.html { edirect_to categorias_url, :notice => "Successfully destroyed categoria." }
      format.js
    end
  end

  private
  def belongs_to_user
    categoria = Categoria.find(params[:id])
    unless categoria.user == current_user
      flash[:error] = "Esta categoria não te pertence!"
      redirect_to categoriass_url  
    end
  end
end
