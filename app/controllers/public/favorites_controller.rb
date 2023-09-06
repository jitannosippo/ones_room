class Public::FavoritesController < ApplicationController
    before_action :authenticate_customer!
    
    def create
        customer = current_customer
    	item = Item.find(params[:item_id])
    	favorite = current_customer.favorites.new(item_id:item.id)
    	favorite.save
    	redirect_to item_path(item.id)
    end

    def destroy
        customer = current_customer
    	item = Item.find(params[:item_id])
    	favorite = current_customer.favorites.find_by(item_id:item.id)
    	favorite.destroy
    	redirect_to item_path(item.id)
    end
    
end
