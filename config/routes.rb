Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: "admin/sessions"
  }

  scope module: :admin do
    resources :spots
    resource :users,only: [:inde] do
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
    resources :spots,only: [:index,:show,]
    get 'spot' => 'spots#favorite'
    get 'spot' => 'spots#sarch'

  	resource :users,only: [:show,:update] do
  		collection do
  	     patch 'out'
  	  end
  	end
  end
end
