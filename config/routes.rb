Rails.application.routes.draw do
  resources :workouts, except: [ :new ] do
    resources :performed_exercises
  end
  resources :exercises

  get "up" => "rails/health#show", as: :rails_health_check
end
