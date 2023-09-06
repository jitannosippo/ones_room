class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  
  def index
  	@genres = Genre.all
  end
  def create
  	@genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "新しいジャンルを作成しました"
      redirect_to admin_styles_path
    else
      flash[:alert] = "ジャンル名が空か、既に存在しています"
      redirect_to new_admin_item_path
    end
  end
  
  def edit
  	@genres = Genre.find(params[:id])
  end

  def update
  	genres = Genre.find(params[:id])
  	if genres.update(genre_params)
      flash[:notice] = "ジャンル名を変更しました"
      redirect_to admin_styles_path
    else
      flash[:alert] = "ジャンル名が空か、既に存在しています"
      redirect_to new_admin_item_path
    end
  end
  
  def destroy
    genre = Genre.find(params[:id])
    if genre.destroy
      flash[:notice] = "ジャンルを削除しました"
      redirect_to admin_styles_path
    else
      flash[:alert] = "ジャンルを削除できませんでした"
      redirect_to admin_styles_path
    end
  end
  
  private
  
  def genre_params
  	params.require(:genre).permit(:name)
  end
end
