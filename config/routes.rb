Rails.application.routes.draw do
  get 'todo_items/index'

  resources :todo_lists do
    resources :todo_items
  end
  root 'todo_lists#index'

end
