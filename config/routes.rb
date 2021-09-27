Rails.application.routes.draw do
  resources :activities
  resources :campers
  resources :signups
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
