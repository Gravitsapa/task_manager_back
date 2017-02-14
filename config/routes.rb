Rails.application.routes.draw do
  resources :users
  resources :projects, except: [:show] do
    resources :tasks, only: [:create, :update, :destroy] do
      collection { post :sort }
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
