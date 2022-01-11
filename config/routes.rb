Rails.application.routes.draw do

    devise_for :admin
  
    devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  get 'top' => 'user/homes#top'
  root 'user/homes#top'

  scope module: :user do
    get 'index' => 'spots#index'
    get 'show' => 'spots#show'
    get 'favorite' => 'spots#favorite'
    get 'sarch' => 'spots#sarch'

  	resource :users,only: [:show,:update] do
  		collection do
  	     patch 'out'
  	  end
  	end
  end
end
