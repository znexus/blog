class PostsController < ApplicationController
  before_filter :iniciar
  before_filter :autorizado?, :except => [:show,:index]
  
  def index
    page = params[:page]
    page ||= 1 
    @posts = @user.posts.paginate(:page => page, :order=> "created_at desc")
  end
  
  def show
    @post = Post.find(params[:id])
    @post.revert_to(params[:version].to_i) if params[:version]
    c = Comentario.new
    c.post = @post
    if user_signed_in?
      c.user = current_user
      c.email = current_user.email
      c.web = current_user.web
    end
    @comentario = c
    spamify(@comentario)    
  end
  
  def new
    @post = Post.new

  end
  
  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    if @post.save
      flash[:notice] = "Se registró correctamente post."
      redirect_to [@user,@post]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Se actualizó correctamente post."
      redirect_to [@user,@post]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to user_posts_url(@user)
  end
  
end
