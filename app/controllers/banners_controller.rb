class BannersController < ApplicationController
  
  no_login_required
  
  def index
    @banners = Banner.find(:all, :conditions => ["placement = ?", params[:placement]], :order => "RAND()", :limit => 1)
  
    respond_to do |format|
      format.xml
    end
  end
  
end
