HbsDemo::Application.routes.draw do

  root :to => redirect('/animals')

  resources :animals, only: [:index]

end
