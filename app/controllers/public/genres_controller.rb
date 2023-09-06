class Public::GenresController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @genre = Genre.find(params[:id])
    @item = Item.where(genre_id: @genre.id).page(params[:page])
  end
end
