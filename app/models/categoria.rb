class Categoria < ActiveRecord::Base
  attr_accessible :nombre, :menu
  belongs_to :user
  has_many :posts
  
  validates_presence_of :nombre
  
  scope :menu, where("menu is true")
  
  def to_s
    nombre
  end

  def to_param
    "#{id}-#{to_s.parameterize}"
  end
  
end
