Rails.application.routes.draw do
  root 'mappers#index'
  resources :mappers
end
