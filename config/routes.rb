Rails.application.routes.draw do

    devise_for :admin

    devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  get 'top' => 'user/homes#top'
  root 'user/homes#top'

  scope module: :user do

    resources :spots
    get 'spots/favorite' => 'spots#favorite'
    get 'spots/sarch' => 'spots#sarch'


    get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    patch 'users/:id/withdraw' => 'users#withdraw', as: 'withdraw_user'
    put 'withdraw/:id' => 'users#withdraw'

  	resources :users,only: [:show,:update]

  end
end
