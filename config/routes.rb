# routing
Rails.application.routes.draw do
  resources :teamresources, only: [:index]
end
