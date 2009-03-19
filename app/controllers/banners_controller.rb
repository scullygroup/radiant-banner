class BannersController < ApplicationController
  
  no_login_required
  radiant_layout 'Main'
  
  def index
      @banner = Banner.find_by_sql("select * from banners, images where banners.id=images.banner_id order by rand() limit 4")
      #render :layout => false
      
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @banners }
      end
      
    end
      
  def show
    @banner = Banner.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @banners }
    end
  end
  
  def image
    @banner = Banner.find(params[:id])
    render :layout => false
  end
  
end
