Rails.application.routes.draw do
  devise_for :users, controllers: {
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'homes#index'
  resources :rooms, only: %i[index new create edit update destroy] do
    member do
      get :join
    end
    resources :messages, only: %i[index create]
    resource :favorites, only: %i[create destroy]
  end
  resources :users, only: %i[show edit update] do
    get :favorites, on: :collection
  end
end
