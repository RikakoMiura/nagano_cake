Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "public/homes#top"
  get '/about' => 'public/homes#about'

  get '/admin' => 'admin/homes#top'

  namespace :admin do
    resources :customers,only:[:index,:show,:edit,:update]
    resources :genres,only:[:index,:create,:edit,:update]
    resources :items,only:[:index,:new,:create,:show,:edit,:update]
    resources :order_details,only:[:update]
    resources :orders,only:[:show,:update]
    resources :sessions,only:[:new,:create,:destroy]
  end
  namespace :public do
    resources :addresses,only:[:index,:edit,:create,:update,:destroy]
    resources :cart_items,only:[:index,:update,:destroy,:destroy_all,:create]
    resources :customers,only:[:show,:edit,:update,:confirm]
    resources :items,only:[:index,:show]
    resources :orders,only:[:new,:confirm,:thanks,:create,:index,:show]
    resources :registrations,only:[:new,:create]
    resources :sessions,only:[:new,:create,:destroy]
  end

end
