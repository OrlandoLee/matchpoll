Rails.application.routes.draw do
  resources :hiring_companies
  resources :jobs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/landing', to: 'jobs#landing'
  root to: "jobs#landing"
end
