Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	resources :projects, only: [:index, :new, :create]
 root 'projects#index'
  get 'projects/new' => 'projects#new'
  post 'projects' => 'projects#create'
  get 'projects/:id/edit' => 'projects#edit', as: :edit_project
  patch '/projects/:id' => 'projects#update'
  delete 'projects/:id/edit' => 'projects#destroy', as: :destroy_project
  get 'signup' => 'users#new'
  get 'users' => 'users#index'
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  patch '/users/:id' => 'users#update'
  delete 'users/:id/edit' => 'users#destroy', as: :destroy_user

  resources :users
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
end
