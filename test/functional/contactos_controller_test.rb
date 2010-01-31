require 'test_helper'

class ContactosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Contacto.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Contacto.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Contacto.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to contacto_url(assigns(:contacto))
  end
  
  def test_edit
    get :edit, :id => Contacto.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Contacto.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Contacto.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Contacto.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Contacto.first
    assert_redirected_to contacto_url(assigns(:contacto))
  end
  
  def test_destroy
    contacto = Contacto.first
    delete :destroy, :id => contacto
    assert_redirected_to contactos_url
    assert !Contacto.exists?(contacto.id)
  end
end
