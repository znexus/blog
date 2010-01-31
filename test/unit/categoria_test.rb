require 'test_helper'

class CategoriaTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Categoria.new.valid?
  end
end
