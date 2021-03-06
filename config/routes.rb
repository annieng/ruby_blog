Rails.application.routes.draw do

  # tells Rails to map requests to http://localhost:3000/welcome/index to the welcome controller's index action
  get 'welcome/index'

  # adding a new resource
  resources :articles do
    resources :comments
end

  # tells Rails to map requests to the root of the application to the welcome controller's index action
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
