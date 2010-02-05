ActionController::Routing::Routes.draw do |map|

  map.resources :tags, :collection => { :autocomplete_for_tag_name => :get}

  map.resources :posts, :has_many => :comentarios

  map.resources :contactos

  map.devise_for :users, :as  => :cuentas
  
  map.resources :users, :has_many => [:posts,:categorias]

  map.root :controller => :posts
  
end
