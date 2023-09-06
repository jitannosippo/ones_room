class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @order_item = OrderItem.where(admin_id: current_admin.id)
  end

  def show
    @order = Order.find(params[:id])
  end
end
