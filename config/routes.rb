Rails.application.routes.draw do
  resources :workouts, except: [ :new ] do
    resources :performed_exercises, except: [ :index ] do
      resources :performed_sets, only: [ :create, :update, :destroy ]
    end
  end
  resources :exercises

  get "up" => "rails/health#show", as: :rails_health_check
end
