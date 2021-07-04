# routing
Rails.application.routes.draw do
  resources :projects do
    resources :teamresources
  end
end
