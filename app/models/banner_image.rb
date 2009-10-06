class BannerImage < ActiveRecord::Base
  
  belongs_to :banner
  
  has_attached_file :ad,
                    :url => "/banners/:id/:style/:basename.:extension",
                    :styles => { :thumb => '100x100#' }
  
  validates_attachment_presence     :ad
  validates_attachment_content_type :ad, :content_type => ['image/jpeg', 'image/gif', 'image/png']
  
end
