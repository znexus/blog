class FigurasController < ApplicationController
  before_filter :get_post
  before_filter :autorizado?
  
  def index
    @figuras = @post.figuras
  end
  
  def show
    @figura = Figura.find(params[:id])
  end
  
  def new
    @figura = Figura.new
  end
  
  def create
    @figura = Figura.new(params[:figura])
    @figura.user = current_user
    @figura.post = @post
    if @figura.save
      flash[:notice] = "Successfully created figura."
      redirect_to [@post,@figura]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @figura = Figura.find(params[:id])
  end
  
  def update
    @figura = Figura.find(params[:id])
    if @figura.update_attributes(params[:figura])
      flash[:notice] = "Successfully updated figura."
      redirect_to [@post,@figura]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @figura = Figura.find(params[:id])
    @figura.destroy
    flash[:notice] = "Successfully destroyed figura."
    redirect_to post_figuras_url(@documento)
  end

  private
    def get_post
      @post = Post.find(params[:post_id])
    end

  
end
