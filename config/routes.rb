Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "public/homes#top"
  get '/about' => 'public/homes#about'
  get '/customers' => 'public/customers#show'
  get '/customers/edit' => 'public/customers#edit'
  post '/customers/confirm' => 'public/customers#confirm'

  delete '/cart_items' => 'public/cart_items#destroy_all'
  post '/orders/confirm' => 'public/orders#confirm'
  get '/orders/thanks' => 'public/orders#thanks'

  get '/admin' => 'admin/homes#top'

  namespace :admin do
    resources :customers,only:[:index,:show,:edit,:update]
    resources :genres,only:[:index,:create,:edit,:update]
    resources :items,only:[:index,:new,:create,:show,:edit,:update]
    resources :order_details,only:[:update]
    resources :orders,only:[:show,:update]
  end
  scope module: 'public' do
    resources :addresses,only:[:index,:edit,:create,:update,:destroy]
    resources :cart_items,only:[:index,:update,:destroy,:create]
    resources :items,only:[:index,:show]
    resources :orders,only:[:new,:confirm,:thanks,:create,:index,:show]
  end

end
