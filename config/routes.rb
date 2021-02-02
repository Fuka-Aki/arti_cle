Rails.application.routes.draw do
  devise_for :users, controllers: {
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'homes#index'
  resources :rooms, only: %i[index new create] do
    member do
      get :join
    end
    resources :messages, only: [:index, :create]
  end
end