Rails.application.routes.draw do
  
  # TOP画面
  root to: 'public/homes#top'
  get '/admin' => 'admin/homes#top'

  # 顧客用デバイス
  devise_for :customers, skip:[:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用デバイス
  devise_for :admin, skip:[:passwords], controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }
  
  # 顧客用
  scope module: :public do
    
    resources :items do
      resource :favorites, only:[:create, :destroy]
      resources :reviews, only:[:index,:create]
    end
    
    resources :cart_items do
      collection do
        delete "destroy_all"   #パスが　all_destroy_cart_items_path, method: :delete　となる
      end 
    end
    
    resources :styles, only:[:index,:show]
    resources :genres, only:[:show]
    
    post '/orders/comfirmation' => 'orders#comfirmation'
    get '/orders/complete' => 'orders#complete'
    resources :orders
    get '/customer/mypage' => 'customers#show'

  end
  
  
  
  # 管理者
  namespace :admin do
	  resources :items 
	  resources :genres
	  resources :styles
	  resources :orders
	  
	  get '/mypage' => 'admins#show'
  end
  

end
