class Image < ActiveRecord::Base
  
  file_column :location
  belongs_to :banner
  
end
