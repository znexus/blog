class CategoriasController < ApplicationController
  before_filter :iniciar
  before_filter :autorizado?, :only => [:create,:update,:destroy]

  def index
    @categorias = @user.categorias
  end
  
  def show
    @categoria = Categoria.find(params[:id])
  end
  
  def new
    @categoria = Categoria.new
  end
  
  def create
    @categoria = Categoria.new(params[:categoria])
    @categoria.user = current_user
    if @categoria.save
      flash[:notice] = "Successfully created categoria."
      redirect_to user_categorias_path(@user)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @categoria = Categoria.find(params[:id])
  end
  
  def update
    @categoria = Categoria.find(params[:id])
    if @categoria.update_attributes(params[:categoria])
      flash[:notice] = "Successfully updated categoria."
      redirect_to user_categorias_path(@user)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @categoria = Categoria.find(params[:id])
    @categoria.destroy
    flash[:notice] = "Successfully destroyed categoria."
    redirect_to user_categorias_path(@user)
  end
end
