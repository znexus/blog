class Comentario < ActiveRecord::Base
  attr_accessible :texto, :nombre, :email, :web, :user_id, :post_id
  belongs_to :post
  belongs_to :user
  validates_presence_of :texto, :nombre, :email
  is_gravtastic! :size => 60
  validates_format_of :email, :with => Ccp::EmailAddress
  validates_format_of :web, :with => Ccp::WebAddress, :allow_blank => true
  
end
