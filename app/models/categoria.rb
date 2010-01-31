class Categoria < ActiveRecord::Base
  attr_accessible :nombre
  belongs_to :user
  has_many :posts
  
  def to_s
    nombre
  end

  def to_param
    "#{id}-#{to_s.parameterize}"
  end
  
end
