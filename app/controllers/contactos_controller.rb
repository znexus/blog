class ContactosController < ApplicationController
  before_filter :autorizado?, :except => [:new, :create, :show]
  
  def index
    @contactos = Contacto.all
  end
  
  def show
    @contacto = Contacto.find(params[:id])
  end
  
  def new
    @contacto = Contacto.new
    if user_signed_in?
      @contacto.email = current_user.email
      @contacto.nombre = current_user.nombre
    end
  end
  
  def create
    @contacto = Contacto.new(params[:contacto])
    @contacto.user = current_user if user_signed_in?
    if @contacto.save
      flash[:notice] = "Se registró correctamente contacto."
      redirect_to @contacto
    else
      render :action => 'new'
    end
  end
  
  def edit
    @contacto = Contacto.find(params[:id])
  end
  
  def update
    @contacto = Contacto.find(params[:id])
    if @contacto.update_attributes(params[:contacto])
      flash[:notice] = "Se actualizó correctamente contacto."
      redirect_to @contacto
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @contacto = Contacto.find(params[:id])
    @contacto.destroy
    flash[:notice] = "Successfully destroyed contacto."
    redirect_to contactos_url
  end
end
