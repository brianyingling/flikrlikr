class PhotosController < ApplicationController
  def index
    @photos = Photo.all
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
    @photo = Photo.find(params[:id])
  end
  def destroy
  end
end