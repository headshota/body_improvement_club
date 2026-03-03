Rails.application.routes.draw do
  resources :workouts, except: [ :new ] do
    resources :performed_exercises do
      resources :performed_sets, only: [ :create, :edit, :update ]
    end
  end
  resources :exercises

  get "up" => "rails/health#show", as: :rails_health_check
end
