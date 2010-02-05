require 'test_helper'

class ComentarioTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Comentario.new.valid?
  end
end
