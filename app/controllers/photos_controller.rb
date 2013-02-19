class PhotosController < ApplicationController
  def index
    @photos = Photo.order('created_at DESC')
  end
  def new
  end
  def create
  end
  def update
    binding.pry
    redirect_to search_path(params[:id])
  end
  def edit
  end
  def show
    @photo = Photo.find(params[:id])
  end
  def destroy
  end
end