Rails.application.routes.draw do
  resources :workouts, except: [ :new ] do
    resources :performed_exercises, only: [ :new, :create ]
  end

  resources :performed_exercises, only: [ :show, :edit, :update, :destroy ] do
    resources :performed_sets, only: [ :create ]
  end

  namespace :performed_exercises do
    resources :positions, only: [ :update ]
  end

  resources :performed_sets, only: [ :update, :destroy ]

  resources :exercises

  get "up" => "rails/health#show", as: :rails_health_check
end
