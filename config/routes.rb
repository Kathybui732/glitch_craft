Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/auth/failure', to:redirect('/')
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#show'
  get '/search', to: 'search#index'
  get '/search/:id', to: 'search#show', as: :search_show
  post '/image', to: 'images#create'
  get '/information', to: 'information#index'
  get '/about', to: 'developers#index'
  get '/500', to: 'application#server_errors'
  get '/400', to: 'application#search_errors'
  match 'download', to: 'images#download', as: 'download', via: :get
  get '*path', to: redirect('/404'), constraints: lambda { |req|
  req.path.exclude? 'rails/active_storage' }
  # get '(*url)', to: redirect('/404')
end
