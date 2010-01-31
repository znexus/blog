class Post < ActiveRecord::Base
  attr_accessible :titulo, :resumen, :texto, :categoria_id
  belongs_to :user
  belongs_to :categoria
  validates_presence_of :titulo, :texto
  
  def to_s
    titulo
  end

  def to_param
    "#{id}-#{to_s.parameterize}"
  end
  
end
