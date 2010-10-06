class User < ActiveRecord::Base         
  attr_protected :admin
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable
  is_gravtastic! :size => 120
  validates_format_of :web, :with => Ccp::WebAddress,
                      :allow_blank=>true,
                      :message => "El URL de tu web es inválido. http://ejemplo.com "  
  
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
