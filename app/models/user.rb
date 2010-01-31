class User < ActiveRecord::Base

  attr_protected :admin
  devise :all
  
  has_many :posts
  has_many :categorias

  def to_s
    return nick if nick
    return nombre if nombre
    return email
  end
  
  def to_param
    "#{id}-#{to_s.parameterize}"
  end
  
end
