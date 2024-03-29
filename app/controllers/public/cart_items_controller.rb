class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
    
  def index
      @cart_items = current_customer.cart_items
      @items = Item.all
      @total = 0
  end
      
  def create
    if customer_signed_in?
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_items = CartItem.all
      @cart_items.each do |cart_item|
        if cart_item.item_id==@cart_item.item_id
          new_amount = cart_item.amount + @cart_item.amount
          cart_item.update_attribute(:amount, new_amount)
          @cart_item.delete
        end
      end
      @cart_item.save
      redirect_to cart_items_path
    else
      redirect_to new_customer_session_path
    end
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end
  
  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  private
  
  def cart_item_params
      params.require(:cart_item).permit(:item_id,:amount)
  end
  
    
    
end
