DecisionMakers::Application.routes.draw do
  namespace :admin do
    resources :administrators do
      get 'page/:page', :action => :show, :on => :member
    end
    resources :klasses do
      get 'page/:page', :action => :show, :on => :member
    end
    get 'profiles/:id' => 'profiles#index', :as => 'profile'
    resources :scholars do
      get 'search', :action => :search, :on => :collection, :as => 'search'
      get 'page/:page', :action => :index, :on => :collection
      resources :profiles, :only => [:show, :code] do
        post 'code', :action => :code, :as => 'code'
      end
    end
    
    post 'reporting/aggregate' => 'reporting#aggregate', :as => :aggregate_report
    get 'reporting/profile/:profile_id/scholar/:scholar_id' => 'reporting#scholar', :as => :scholar_report
    match 'reporting(/:action)' => 'reporting', :as => 'reporting'
    resources :schools do
      get 'page/:page', :action => :show, :on => :member
    end
    root :to => 'home#index'
  end
  
  # sessions
  get 'login' => 'sessions#new', :as => 'login'
  post 'login' => 'sessions#create', :as => 'login'
  delete 'logout' => 'sessions#destroy', :as => 'logout'
  
  get 'profiles/:id' => 'profiles#show', :as => 'profile'
  post 'profiles/:id/submit' => 'profiles#submit', :as => 'submit_profile'
  
  get 'steps(/:action)' => 'steps', :as => 'step'
  
  get ':action' => 'pages', :as => 'page'
  root :to => 'pages#index'
end