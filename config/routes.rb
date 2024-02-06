Rails.application.routes.draw do
  resources :authors do
    get 'books', to: 'authors#books_index'
  end

  resources :books

end
