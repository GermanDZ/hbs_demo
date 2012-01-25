HbsDemo::Application.routes.draw do
  root :to => redirect('/animals/index')

  match 'animals/index' => 'animals#index'
  match 'animals/index_hbs' => 'animals#index_hbs'
end
