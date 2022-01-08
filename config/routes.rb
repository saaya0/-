Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }

  scope module: :admin do
    resources :spots
    resources :users,only: [:index] do
  		collection do
  	     patch 'out'
  	  end
  	end
  end



    devise_for :users,skip: [:passwords,], controllers: {
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
