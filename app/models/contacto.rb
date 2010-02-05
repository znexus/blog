class Contacto < ActiveRecord::Base
  attr_accessible :nombre, :email, :texto
  belongs_to :user
  validates_presence_of :nombre, :texto
  validates_format_of :email, :with => Ccp::EmailAddress
  
end
