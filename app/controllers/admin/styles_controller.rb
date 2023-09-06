class Admin::StylesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
	  @styles = Style.all
	  @genres = Genre.all
  end
  
  def new
    @item = Item.new(admin_id: current_admin.id)
    @genre = Genre.new
    @style = Style.new
  end
  
  def create
  	@style = Style.new(style_params)
    if @style.save
      flash[:notice] = "新しいスタイルを作成しました"
      redirect_to admin_styles_path
    else
      flash[:alert] = "スタイル名が空か、既に存在しています"
      redirect_to new_admin_item_path
      
    end
  end
  
  def edit
  	@styles = Style.find(params[:id])
  end
  
  def update
  	styles = Style.find(params[:id])
  	if styles.update(style_params)
  	  flash[:notice] = "スタイル名を変更しました"
    	redirect_to admin_styles_path
    else
      flash[:alert] = "スタイル名が空か、既に存在しています"
      redirect_to admin_styles_path
    end
  end
  
  def destroy
    style = Style.find(params[:id])
    if style.destroy
      flash[:notice] = "スタイルを削除しました"
      redirect_to admin_styles_path
    else
      flash[:alert] = "スタイルを削除できませんでした"
      redirect_to admin_styles_path
    end
  end
  
  private
  
  def style_params
  	params.require(:style).permit(:name)
  end
end
