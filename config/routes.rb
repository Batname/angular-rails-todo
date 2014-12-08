Todo::Application.routes.draw do

  namespace :api, defaults: {format: :json} do
      resources :tasks, only: [:index, :create, :update, :destroy]
      resources :complete, only: [:index]
      resources :incomplete, only: [:index]
  end

  root :to => "templates#index"

  get '/templates/:path.html' => 'templates#template', :constraints => { :path => /.+/  }
  get '/complete' => 'templates#index'
  get '/incomplete' => 'templates#index'
end
