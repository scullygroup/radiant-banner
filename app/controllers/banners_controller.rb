class BannersController < ApplicationController
  
  no_login_required
  
  def index
    @page = Page.find_by_url("#{params[:url]}")
    @banners = Banner.find(:all, :conditions => ["placement = ? AND page_id = ?", params[:placement], "#{@page.id}"], :order => "RAND()", :limit => 1)
  
    respond_to do |format|
      format.xml
    end
  end
  
end