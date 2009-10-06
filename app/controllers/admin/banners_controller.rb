class Admin::BannersController < Admin::ResourceController
  
  def index
    @banners = Banner.find(:all)
    
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @banner = Banner.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end

  def new
    @banner = Banner.new

    respond_to do |format|
      format.html
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
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @banner = Banner.find(params[:id])

    respond_to do |format|
      if @banner.update_attributes(params[:banner])
        flash[:notice] = 'Banner was successfully updated.'
        format.html { redirect_to('/admin/banners') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy

    respond_to do |format|
      flash[:notice] = 'Banner was successfully deleted.'
      format.html { redirect_to('/admin/banners') }
    end
  end
  
  def update_positions
    @banner = Banner.find(params[:id])
    @banner.banner_images.each do |image|
      image.position = params['image-list'].index(image.id.to_s) + 1 
      image.save
    end
    render :nothing => true 
  end
  
end