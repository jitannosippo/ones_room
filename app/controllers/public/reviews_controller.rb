class Public::ReviewsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @item = Item.find(params[:item_id])
    @reviews = @item.reviews.all.page(params[:page])
  end
  
  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    if @review.save
      redirect_to item_path(@review.item_id)
    else
      @item = Item.find(params[:id])
      render "public/items/show"
    end
  end
  
  private
  def review_params
    params.require(:review).permit(:item_id, :customer_id, :score, :comment)
  end
  
end

