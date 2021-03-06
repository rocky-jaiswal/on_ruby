OnRuby::Application.routes.draw do
  resource :sitemap, only: :show

  resources :settings, only: :index

  resources :users do
    get :calendar, on: :member
  end

  resources :locations

  resources :events do
    resources :materials
    resources :topics
    resources :participants
  end

  resources :topics do
    resources :likes
  end

  scope '/auth' do
    get '/:provider/callback',       to: 'sessions#create'
    get '/failure',                  to: 'sessions#failure'
    get '/destroy_session',          to: 'sessions#destroy',  as: :destroy_session
    get '/login/:provider',          to: 'sessions#auth',     as: :auth
    get '/offline_login/:nickname',  to: 'sessions#offline_login' if Rails.env.development?
  end

  constraints MainDomainConstraint.new do
    get '/', to: 'labels#index', as: :labels
  end

  get '/api', to: 'api#index'

  root to: "home#index"
end
