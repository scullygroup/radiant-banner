# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class BannerExtension < Radiant::Extension
  version "1.0"
  description "A Radiant extension that allows you to manage random banner ads"
  url "http://www.scullytown.com"
  
  define_routes do |map|
    
    #This links to an xml file listing of all the banners, defined in the extension tags
    #map.connect 'banners', :url => '/banners', :controller => "site", :action => "show_page"
   # map.connect '', :controller => "banners", :action => "index"
    
    map.resources :banners
    
    map.with_options(:controller => 'admin/banners') do |banner|
      banner.banner_index           'admin/banners',             :action => 'index'
      banner.banner_show            'admin/banners/show/:id',    :action => 'show'   
      banner.banner_new             'admin/banners/new',         :action => 'new'
      banner.banner_create          'admin/banners/create',      :action => 'create'   
      banner.banner_edit            'admin/banners/edit/:id',    :action => 'edit'
      banner.banner_update          'admin/banners/update/:id',  :action => 'update'
      banner.banner_updatepos       'admin/banners/update_positions/:id',  :action => 'update_positions'
      banner.banner_remove          'admin/banners/remove/:id',  :action => 'destroy'
    end
    
    map.with_options(:controller => 'admin/images') do |image|
      image.image_index           'admin/images',             :action => 'index'
      image.image_show            'admin/images/show/:id',    :action => 'show'   
      image.image_new             'admin/images/new',         :action => 'new'
      image.image_create          'admin/images/create',      :action => 'create'
      image.image_edit            'admin/images/edit/:id',    :action => 'edit'
      image.image_update          'admin/images/update/:id',  :action => 'update'   
      image.image_remove          'admin/images/remove/:id',  :action => 'destroy'
    end

  end
  
  def activate
    admin.tabs.add "Banners", "/admin/banners", :after => "Layouts", :visibility => [:all]
    Page.send :include, BannerTags
    NoCachePage
  end
  
  def deactivate
    # admin.tabs.remove "Banner"
  end
  
end