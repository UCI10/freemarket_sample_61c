Rails.application.routes.draw do
  get 'addresses/index'
  get 'addresses/new'
  get 'addresses/create'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tops#index'
  resources :products
  resources :users 

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
end




