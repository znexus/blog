class Figura < ActiveRecord::Base
  validates_presence_of :nombre
  belongs_to :user
  belongs_to :post
  has_attached_file :img, 
                    :styles => {  :extra  => "800x600>",
                                  :large => "405x302>",
                                  :medium => "197x148#",
                                  :thumb => "77x57#" }  
  
  def to_s
    nombre
  end

end
