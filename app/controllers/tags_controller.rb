class TagsController < ApplicationController
  def index
    @tags = Tag.order(:num_likes).all.reverse
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
    @tag = Tag.find(params[:id])
  end
  def destroy
  end
end