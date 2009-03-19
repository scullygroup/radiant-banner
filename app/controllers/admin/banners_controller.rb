#class Admin::BannersController < ApplicationController
class Admin::BannersController < Admin::AbstractModelController
 #model_class Banner
  
  def index
    @banners = Banner.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @banners }
    end
  end
  
  def show
    @banner = Banner.find(params[:id])
    @image = Image.new(params[:image])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @banner }
    end
  end

  def new
    @banner = Banner.new
    #@image = Image.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @banner }
    end
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def create
    @banner = Banner.new(params[:banner])

    respond_to do |format|
      if @banner.save
        flash[:notice] = 'Banner was successfully created.'
        format.html { redirect_to('/admin/banners') }
        format.xml  { render :xml => @banner, :status => :created, :location => @banner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @banner.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    #params[:banner][:tag_ids] ||= []
    @banner = Banner.find(params[:id])

    respond_to do |format|
      if @banner.update_attributes(params[:banner])
        flash[:notice] = 'Banner was successfully updated.'
        format.html { redirect_to('/admin/banners') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @banner.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy

    respond_to do |format|
      format.html { redirect_to('/admin/banners') }
      format.xml  { head :ok }
    end
  end
  
  def update_positions
    @banner = Banner.find(params[:id])
    @banner.images.each do |image|
      image.position = params['image-list'].index(image.id.to_s) + 1 
      image.save
    end
    render :nothing => true 
  end
  
end