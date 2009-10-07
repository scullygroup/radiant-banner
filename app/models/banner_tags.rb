module BannerTags
  include Radiant::Taggable
  
  tag 'banners' do |tag|
    tag.expand
  end
  
  tag 'ads' do |tag|
    tag.expand
  end
  
  tag 'banners:each' do |tag|
    @placement = tag.attr['placement']
    result = []
    @page = Page.find_by_url("#{params[:url]}")
    @banners = Banner.find(:all, :conditions => ["placement = ? AND page_id = ?", "#{tag.attr['placement']}", "#{@page.id}"], :order => "RAND()", :limit => 1)
    @banners.each do |banner|
      tag.locals.banner = banner
      result << tag.expand
    end
    result
  end
  
  tag 'ads:each' do |tag|
    result = []
    banner = tag.locals.banner
    @ads = banner.banner_images.find(:all, :order => "RAND()", :limit => 1)
    @ads.each do |ad|
      tag.locals.ad = ad
      result << tag.expand
    end
    result
  end
  
  tag 'ads:each:ad' do |tag|
    ad = tag.locals.ad
    %{<a href="#{ad.url}" target="_blank"><img src="#{ad.ad.url}" /></a>}
  end
  
  tag 'slideshow' do |tag|
    @placement = tag.attr['placement']
    %{<div id="ad_slideshow"></div>
      <script type="text/javascript" charset="utf-8">
	      var flashvars = {
	        xml_path:"/banners/#{@placement}"
	      };
        var params = {
          menu: "false",
          wmode: "transparent"
        };
        var attributes = {};
        swfobject.embedSWF("/swf/slideshow.swf", "ad_slideshow", "1000", "800","9.0.0", "", flashvars, params, attributes);
      </script>}
  end
  
  
########################################################################
#
# These are not really used at all
# 
########################################################################

  # pull the id of the banner
  tag 'banners:each:id' do |tag|
    banner = tag.locals.banner
    %{#{banner.id}}
  end
  
  # pull the title of the banner
  tag 'banners:each:title' do |tag|
    banner = tag.locals.banner
    %{#{banner.title}}
  end

end