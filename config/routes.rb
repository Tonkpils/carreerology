Rails.application.routes.draw do
  devise_for :admins

  resources :jobs, except: [:show] do
    resources :application_forms
  end
  root to: "jobs#index"
end
