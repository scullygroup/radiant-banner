class BannersController < ApplicationController
  
  no_login_required
  
  def index
    @current_page = Page.find_by_slug("#{params[:path]}")
    
    if @current_page.nil?
      @current_page = Page.find_by_slug("/")
    end

    @banners = Banner.find(:all, :conditions => ["placement = ? AND page_id = ?", params[:placement], "#{@current_page.id}"], :order => "RAND()", :limit => 1)
  
    respond_to do |format|
      format.xml
    end
  end
  
end