Rails.application.routes.draw do
  
  resources :readings, only: [:new, :create, :index]

  resources :contactings do
    get "success", on: :collection, as: :success
  end

  post "/token" => 'main#token'
  get "/add-person" => 'main#add_person'

  # get '/sign_in' => 'sessions#new', as: 'sign_in'
  # delete '/sign_out' => 'sessions#destroy', as: 'sign_out'
  # get '/sign_up' => 'users#new', as: 'sign_up'

  get "/faq" => 'main#faq', as: :faq
  get "/cdc" => 'main#cdc', as: :cdc
  get "/privacy" => 'main#privacy'
  get "/terms" => 'main#terms'

  root "main#index"
end
