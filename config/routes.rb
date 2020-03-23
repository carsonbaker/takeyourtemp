Rails.application.routes.draw do
  
  resources :readings, only: [:new, :create, :index] do
    get "/debug", action: :debug, on: :collection
    get "/slowslowslow", action: :slow, on: :collection
  end
  get "/add-person" => 'readings#add_person'

  resources :contactings do
    get "success", on: :collection, as: :success
  end

  resources :data do

  end

  controller :main do
    post "/token",  action: :token
    get "/faq",     action: :faq, as: :faq
    get "/cdc",     action: :cdc, as: :cdc
    get "/privacy", action: :privacy
    get "/terms",   action: :terms
  end

  root "readings#index"
end
