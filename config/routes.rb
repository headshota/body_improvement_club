Rails.application.routes.draw do
  resources :workouts
  resources :exercises
  resources :performed_exercises

  get "up" => "rails/health#show", as: :rails_health_check
end
