class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @item = Item.new(admin_id: current_admin.id)
    @genre = Genre.new
    @style = Style.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品を投稿しました"
      redirect_to admin_item_path(@item.id)
    else
      flash[:alert] = @item.errors.full_messages
      redirect_to new_admin_item_path
    end
  end

  def index
    @items = Item.where(admin_id: current_admin.id).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    
  end
  
  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      flash[:notice] = "商品情報を変更しました"
      redirect_to admin_item_path(item.id)
    else
      flash[:alert] = "商品情報の変更に失敗しました"
      redirect_to edit_admin_item_path
    end
  end
  
  def destroy
    item = Item.find(params[:id])
    if item.destroy
      flash[:notice] = "商品を削除しました"
      redirect_to admin_items_path
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to admin_item_path(item.id)
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:admin_id, :name, :explanation, :genre_id, :style_id, :image, :price)
  end
  
end
