require 'test_helper'

class CategoriasControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Categoria.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Categoria.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Categoria.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to categoria_url(assigns(:categoria))
  end
  
  def test_edit
    get :edit, :id => Categoria.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Categoria.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Categoria.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Categoria.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Categoria.first
    assert_redirected_to categoria_url(assigns(:categoria))
  end
  
  def test_destroy
    categoria = Categoria.first
    delete :destroy, :id => categoria
    assert_redirected_to categorias_url
    assert !Categoria.exists?(categoria.id)
  end
end
