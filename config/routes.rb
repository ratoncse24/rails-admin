Rails.application.routes.draw do

  namespace :admin do

    resources :orders
    resources :banners
    resources :email_marketings
    resources :offers

    resources :blogs
    resources :sliders
    resources :customers , only: [:index,:edit,:update,:destroy]



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



  end

# get "blogs", to: 'blogs#index'



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

  resources :users


  get "/admin", to: 'admin/dashboard#index'

  root 'admin/dashboard#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
