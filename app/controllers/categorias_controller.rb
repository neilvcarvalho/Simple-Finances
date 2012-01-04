class CategoriasController < ApplicationController
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
    if @categoria.save
      redirect_to @categoria, :notice => "Successfully created categoria."
    else
      render :action => 'new'
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
    redirect_to categorias_url, :notice => "Successfully destroyed categoria."
  end
end
