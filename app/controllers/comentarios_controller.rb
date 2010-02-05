class ComentariosController < ApplicationController
  before_filter :iniciar
  before_filter :autorizado?, :except => [:show,:index, :new, :create]
  
  def index
    @comentarios = @post.comentarios
  end
  
  def show
    @comentario = Comentario.find(params[:id])
  end
  
  def new
    @comentario = Comentario.new
  end
  
  def create
    @comentario = Comentario.new(params[:comentario])
    @comentario.post = @post
    if @comentario.save
      flash[:notice] = "Successfully created comentario."
      redirect_to @post
    else
      render :action => 'new'
    end
  end
  
  def edit
    @comentario = Comentario.find(params[:id])
  end
  
  def update
    @comentario = Comentario.find(params[:id])
    if @comentario.update_attributes(params[:comentario])
      flash[:notice] = "Successfully updated comentario."
      redirect_to @post
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @comentario = Comentario.find(params[:id])
    @comentario.destroy
    flash[:notice] = "Successfully destroyed comentario."
    redirect_to @post
  end
  
  private
    def iniciar
      begin
        @post = Post.find params[:post_id]
      rescue
        @post = nil
      end
    end
  
end
