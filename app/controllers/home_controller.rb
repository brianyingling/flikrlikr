class HomeController < ApplicationController
  def index
      FlickRaw.api_key = "756092d22ac3734e2746938aeb7b2488"
      FlickRaw.shared_secret = "c799cf3e0a721081"
      @photos = flickr.photos.getRecent
      @photos = @photos.to_a
      @urls = build_urls(@photos)
      @photos = @urls.slice(10)
  end
  def new
  end
  def create
  end
  def update
  end
  def edit
  end
  def show
  end
  def destroy
  end
end