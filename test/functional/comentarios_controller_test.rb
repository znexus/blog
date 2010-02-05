require 'test_helper'

class ComentariosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Comentario.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Comentario.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Comentario.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to comentario_url(assigns(:comentario))
  end
  
  def test_edit
    get :edit, :id => Comentario.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Comentario.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Comentario.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Comentario.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Comentario.first
    assert_redirected_to comentario_url(assigns(:comentario))
  end
  
  def test_destroy
    comentario = Comentario.first
    delete :destroy, :id => comentario
    assert_redirected_to comentarios_url
    assert !Comentario.exists?(comentario.id)
  end
end
