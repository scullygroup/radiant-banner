class Banner < ActiveRecord::Base
  has_many :images, :order => :position, :dependent => :destroy
end

