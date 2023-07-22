# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  
  #def after_sign_in_path_for(resource)
    #mypage_root_path # ログイン後に遷移するpathを設定/商品投稿画面へ
  #end

  def after_sign_out_path_for(resource)
    new_admin_session_path # ログアウト後に遷移するpathを設定/ログイン画面へ
  end
  
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
