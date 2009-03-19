module BannerTags
  include Radiant::Taggable
  
  tag 'banners' do |tag|
    tag.expand
  end
          
  tag 'banners:each' do |tag|
    placement = tag.attr['placement']
    result = []
    Banner.find_by_sql("select * from banners, images where banners.id=images.banner_id and placement='#{tag.attr['placement']}' order by rand() limit 1").each do |banner|
    #Banner.find(:all, :order => 'title ASC').each do |banner|
      tag.locals.banner = banner
      result << tag.expand
    end
    result
  end
  
  # tag 'images' do |tag|
  #   tag.expand
  # end
  # 
  # tag 'images:each' do |tag|
  #   result = []
  #     banner = tag.locals.banner
  #     banner.images.each do |image|
  #       tag.locals.image = image
  #       result << tag.expand
  #     end
  #   result
  # end
 
  tag 'banners:each:id' do |tag|
     banner = tag.locals.banner
     %{#{banner.id}}
  end
     
  tag 'banners:each:title' do |tag|
    banner = tag.locals.banner
    %{#{banner.title}}
   end
  
   tag 'banners:each:url' do |tag|
     banner = tag.locals.banner
     %{#{banner.url}}
  end

  tag 'banners:each:location' do |tag|
     banner = tag.locals.banner
     %{#{banner.location}}
  end
    
  # tag 'images:each:thumb' do |tag|
  #     image = tag.locals.image
  #     %{#{image.location_relative_path("thumb")}}
  # end
  # 
  # tag 'images:each:medium' do |tag|
  #     image = tag.locals.image
  #     %{#{image.location_relative_path("medium")}}
  # end
  # 
  # tag 'images:each:image' do |tag|
  #     image = tag.locals.image
  #     %{#{image.location_relative_path}}
  # end
  
end