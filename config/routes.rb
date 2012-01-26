HbsDemo::Application.routes.draw do
  root :to => redirect('/animals/index')

  match 'animals/index' => 'animals#index'
  match 'animals/index_hbs' => 'animals#index_hbs'
  match 'animals/index_erb' => 'animals#index_erb'
end
