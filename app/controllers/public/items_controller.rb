class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @review = Review.new
    @cart_item = CartItem.new
  end
end
