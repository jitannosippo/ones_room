class Public::OrdersController < ApplicationController
    before_action :authenticate_customer!
    
    def new
        @order = Order.new
        @customer = current_customer
    end
  
    def create
        order = Order.new(order_params)
        order.customer_id = current_customer.id
        order.save
        @cart_items = CartItem.all
        @cart_items.each do |cart_item|
          @order_items = OrderItem.new
          @order_items.order_id = order.id
          @order_items.admin_id = cart_item.item.admin_id
          @order_items.item_id = cart_item.item.id
          @order_items.item_name = cart_item.item.name
          @order_items.order_price = cart_item.item.price
          @order_items.amount = cart_item.amount
          @order_items.save
        end
        
        @cart_items.destroy_all
        redirect_to orders_complete_path
    end

    def index
       @order = Order.where(customer_id: current_customer.id)
    end
    
    def show
        @order = Order.find(params[:id])
    end

    def comfirmation
        @order = Order.new(order_params)
        @order.name = current_customer.name
        @total = 0
        @cart_items = current_customer.cart_items
        @order.total_price = 0
        @order.postage = 800
    end

    def complete
    
    end
  
    private
      
    def order_params
        params.require(:order).permit(:payment_method,:postage, :address,:name,:total_price)
    end

end
