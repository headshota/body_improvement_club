Rails.application.routes.draw do
  resources :workouts
  resources :exercises

  get "up" => "rails/health#show", as: :rails_health_check
end
