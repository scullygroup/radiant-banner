class Admin::BannerImagesController < ApplicationController
  
  def index
    @images = BannerImage.find(:all)

    respond_to do |format|
      format.html
    end
  end

  def show
    @image = BannerImage.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @image = BannerImage.new
    
    respond_to do |format|
      format.html
    end
  end

  def edit
    @image = BannerImage.find(params[:id])
  end
  
  def create
    @image = BannerImage.new(params[:banner_image])
    
    respond_to do |format|
      if @image.save
        flash[:notice] = 'Banner Image was successfully created.'
        format.html { redirect_to :back }
      else
        format.html do
          #params[:id] = "#{@banner_image.banner_id}"
          flash[:error] = 'Please indicate the banner position and select a banner ad for upload.'
          redirect_to "/admin/banners/show/#{params[:banner_image][:banner_id]}"
        end
      end
    end
  end

  def update
    @image = BannerImage.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:banner_image])
        flash[:notice] = 'Banner Image was successfully updated.'
        format.html { redirect_to(@image) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @image = BannerImage.find(params[:id])
    @image.destroy

    respond_to do |format|
      flash[:notice] = 'Banner Image was successfully deleted.'
      format.html { redirect_to :back }
    end
  end
  
end
