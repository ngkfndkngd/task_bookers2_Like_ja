Rails.application.routes.draw do
 
  root 'homes#top'
  devise_for :users
  resources :books
  resources :users,only:[:show,:index,:edit,:update]
  get 'home/about' => 'homes#about'
end
