class Public::StylesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @styles = Style.all
    @genres = Genre.all
  end
  
  def show
    @style = Style.find(params[:id])
    @item = Item.where(style_id: @style.id).page(params[:page])
  end
  
end
