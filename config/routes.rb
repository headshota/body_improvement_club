Rails.application.routes.draw do
  resources :workouts

  get "up" => "rails/health#show", as: :rails_health_check
end
