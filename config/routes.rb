FlikrLikr::Application.routes.draw do

  resources :dashboards, :searches, :photos, :tags

  get '/'=>'home#index'

 post '/searches/:id'=>'searches#update', :as=>'update_search'

 root :to=>'home#index'
end
