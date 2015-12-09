Rails.application.routes.draw do

  devise_for :users,
    :controllers => { :registrations => "registrations", :sessions => "sessions",omniauth_callbacks: 'omniauth_callbacks' }
  resources :users do
    member do
      post 'upload_file'
    end
  end

  resources :posts, :only => [:create, :update, :destroy, :show,:index, :edit] do
    collection do
      get 'autocomplete_tag_search'
      get 'scrape_url_for'
    end
    member do
      post 'create_or_destroy_reaction'
    end
  end

  resources :videos
  resources :projects

  resources :url_videos, :only => [:index, :show, :destroy]
  resources :url_images, :only => [:index, :show, :destroy]
  resources :websites, :only => [:index, :show, :destroy]

  resources :comments, :only => [:create, :destroy]

  root 'pages#home'
  get '/climate-justice/' => 'posts#index', :cat=>1
  get '/social-justice/' => 'posts#index', :cat=>2
  get '/gender-equality/' => 'posts#index', :cat=>3
  get '/climate-justice/:id' => 'posts#show'
  get '/social-justice/:id' => 'posts#show'
  get '/gender-equality/:id' => 'posts#show'
  get '/tags/:tag' => 'posts#index'
  get '/resume' => 'pages#resume'

  get '/pages/:page_name' => 'pages#index', :as => :pages
  get '/sitemap.xml' => 'pages#sitemap'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
