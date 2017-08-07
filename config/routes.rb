Rails.application.routes.draw do

  resources :articles,only:[:show]

  post 'jobsearches/action'

  root 'jobsearches#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
