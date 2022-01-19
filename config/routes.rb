Rails.application.routes.draw do

    devise_for :admin

    devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  get 'top' => 'user/homes#top'
  root 'user/homes#top'

  scope module: :user do
    get 'spots/favorite' => 'spots#favorite'
    get 'spots/sarch' => 'spots#sarch'
    resources :spots do
      resources :comments, only: [:create,:destroy]
      resource :favorites, only: [:create, :destroy]
    end


    get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    patch 'users/:id/withdraw' => 'users#withdraw', as: 'withdraw_user'
    put 'withdraw/:id' => 'users#withdraw'

  	resources :users,only: [:show,:update] do
  	  get :favorites, on: :collection
  	end


  end
end
