Rails.application.routes.draw do

  devise_for :users,
  controllers: {
   registrations: 'users/registrations' ,
   omniauth_callbacks: 'users/omniauth_callbacks'
   }

  # devise_for :users, controllers: { sessions: 'users/sessions' }


  get 'addresses/index'
  get 'addresses/new'
  get 'addresses/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#index'

  resources :products do
    collection do
      post 'purchase'
    end
  end

  resources :users do
    member do
      get :creditdisplay     #クレジットカード情報の表示
      get :identification    #本人情報
      get :logout            #ログアウト
      get :profile           #プロフィール編集
    end  
  end  


  resources :signup do
    collection do
      get 'entry_signin'
      get 'entry_signup'

      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end
  resources :sells,only:[:index,:new,:create,:edit,:update]

end




