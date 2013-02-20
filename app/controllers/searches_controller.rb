class SearchesController < ApplicationController
   def index
  end


  # Create a new search
  # Determine whether its a random or a keyword search
  # if a random search then create Photo objects limiting
  # Strip out URLs without tags.

  def new
    @search = Search.create
    @search.text = params[:q] || 'random'
    @search.save
    redirect_to search_path(@search.id)
  end

    # Create a photo object
    # Determine whether its liked or disliked
    # Save photo to database
    # Parse Tag string into individual Tag objects
    # save tags to photo object

  def update
    @search = Search.find(params[:id])
    @photo = Photo.find(params[:photo_id])
    @photo.status = params[:commit].downcase
    Search.find(params[:id]).photos << @photo
    tags = params[:tags].split(" ")
    tags.each do |tag|
      @tag = Tag.where(:text=>tag).first || Tag.create(:text=>tag)
      @photo.status == 'like' ? @tag.num_likes +=1 : @tag.num_dislikes += 1
      @tag.save
      @photo.tags << @tag
    end
    @photo.comment = params[:comment]
    @photo.save
    redirect_to search_path(params[:id])
  end

  def edit
  end

  def show
    @search = Search.find(params[:id])
    photos = ''
    url = ''
    @photo = Photo.create
    if @search.text != 'random'
      photos = flickr.photos.search(:text=>@search.text,:extras=>'tags',:accuracy=>3)
    else
      photos = flickr.photos.getRecent(:extras=>'tags,url_c')
    end
    chosen_photo = format_photos(photos).shuffle.first
    @photo.url = build_urls(chosen_photo)
    @photo.title = chosen_photo.title
    @tags = chosen_photo.tags.split(' ')
    @photo.save
  end

  def destroy
  end
end



