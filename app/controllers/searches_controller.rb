class SearchesController < ApplicationController
  def index
  end


  # Create a new search
  # Determine whether its a random or a keyword search
  # if a random search then create Photo objects limiting
  # Strip out URLs without tags.

  def new
    search = Search.create
    search.text = params[:q] || 'random'
    search.save
    redirect_to search_path(search.id)
  end

    # Create a photo object
    # Determine whether its liked or disliked
    # Save photo to database
    # Parse Tag string into individual Tag objects
    # save tags to photo object

  def update
    photo = Photo.find(params[:photo_id])
    photo.status = params[:status]
    Search.find(params[:id]).photos << photo
    tags = params[:tags]
    tags.each do |tag|
      @tag = Tag.where(:text=>tag).first || Tag.create(:text=>tag)
      photo.status == 'like' ? @tag.num_likes +=1 : @tag.num_dislikes += 1
      @tag.save
      photo.tags << @tag
    end
    photo.save
    redirect_to search_path(params[:id])
  end

  def edit
  end

  def show
    FlickRaw.api_key = ENV['FLICKR_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_SHARED_SECRET']
    search = Search.find(params[:id])
    photos = ''
    url = ''
    @photo = Photo.create
    if search.text != 'random'
      photos = flickr.photos.search(:text=>search.text,:extras=>'tags',:accuracy=>3)
      filtered_photos = photos.reject {|photo| Photo.exists?(:url=>build_urls(photo))}
      chosen_photo = filtered_photos.shuffle.first
      @photo.url = build_urls(chosen_photo)
      @photo.title = chosen_photo.title
      @tags = chosen_photo.tags.split(' ')
      photos = filtered_photos
    else
      photos = format_photos
      photos = flickr.photos.getRecent(:extras=>'tags,url_c')
      filtered_photos = photos.reject {|photo| Photo.exists?(:url=>build_urls(photo))}
      #url = build_urls(photos)
      #@photo.url = url[0]
      @photo.url = filtered_photos[0].url_c
      @photo.title = photos.first.title
      @tags = photos.first.tags.split(' ')
  end
    # @photo.title = photos.first.title
    # @tags = photos.first.tags.split(' ')
    @photo.save
  end

  def destroy
  end

  # Accesses Flickr and retrieves 100 of the most recent Flickr files.
  # Filters photos by removing photos with empty tags and that don't have a large-sized URL.
  # Also shuffles the photos.`
  def format_photos
    photos = flickr.photos.getRecent(:extras=>'tags,url_c')
    photos = photos.reject {|photo| photo.tags == '' || !photo['url_c'].present? || photo.tags.nil? || photo.tags.include?('uploaded') || photo.tags.include?('filter=none') || photo.tags.include?('filter=nofilter')}
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



