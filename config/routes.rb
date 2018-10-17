Rails.application.routes.draw do

  resources :email_marketings
  resources :offers
# get "blogs", to: 'blogs#index'

resources :customers , only: [:index,:edit,:update,:destroy]

  resources :blogs
  resources :banners
  resources :sliders

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords',
      confirmations: 'users/confirmations',
  }

  devise_for :customers, controllers: {
      sessions: 'customers/sessions',
      registrations: 'customers/registrations',
      passwords: 'customers/passwords',
      confirmations: 'customers/confirmations',
  }


  root 'dashboard#index'

  resources :users

  resources :categories

  resources :products

  resources :settings


  resources :products do
    member do
      delete :delete_image_attachment
    end
  end
  resources :categories do
    member do
      delete :delete_image_attachment
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
