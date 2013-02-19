class ApplicationController < ActionController::Base
  protect_from_forgery


  # Accesses Flickr and retrieves 100 of the most recent Flickr files.
  # Filters photos by removing photos with empty tags and that don't have a large-sized URL.
  # Also shuffles the photos.`
  def format_photos(photos)
    #photos = flickr.photos.getRecent(:extras=>'tags,url_c')
    photos.reject {|photo| Photo.exists?(:url=>build_urls(photo)) || photo.tags == '' ||  photo.tags.nil? || photo.tags.include?('uploaded') || photo.tags.include?('filter=none') || photo.tags.include?('filter=nofilter')}

    #photos.shuffle
  end

  # receives a Hash object of photos and returns an array of urls. It also builds the URL.
  def build_urls(photos)
    if photos.is_a?(Array)
      new_photos = photos.map {|photo| "http://farm#{photo['farm']}.staticflickr.com/#{photo['server']}/#{photo['id']}_#{photo['secret']}.jpg"}
    else
      "http://farm#{photos['farm']}.staticflickr.com/#{photos['server']}/#{photos['id']}_#{photos['secret']}.jpg"
    end
  end
end
