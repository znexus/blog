ActionController::Routing::Routes.draw do |map|

  map.resources :contactos

  map.devise_for :users, :as  => :cuentas
  
  map.resources :users, :has_many => [:posts,:categorias]

  map.root :controller => :posts

end
