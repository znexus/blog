require 'test_helper'

class ContactoTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Contacto.new.valid?
  end
end
