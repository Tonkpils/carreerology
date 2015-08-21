Rails.application.routes.draw do
  devise_for :admins

  match "/404", to: "errors#not_found", via: :all

  resources :jobs, except: [:show] do
    resources :application_forms
  end
  root to: "jobs#index"
end
