class Banner < ActiveRecord::Base
  has_many :banner_images, :order => :position, :dependent => :destroy
  
  validates_presence_of :title, :page_id, :placement
  
end

