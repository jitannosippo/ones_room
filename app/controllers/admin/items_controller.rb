class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genre = Genre.new
    @style = Style.new
  end
  
  def create
    item = Item.new(item_params)
	  item.save
	  redirect_to admin_items_path
	end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :explanation, :genre_id, :style_id, :image, :price)
  end
  
end