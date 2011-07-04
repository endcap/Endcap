Endcap::Application.routes.draw do
  

  resources :festivals

  resources :songs

  resources :albums

  # Bands
  match "local_bands/:state/:city" => "bands#index", :as => "bands_by_state_and_city"
  match "local_bands/:state" => "bands#index", :as => "bands_by_state"
  match "local_bands" => "bands#index"
  match "bands/genre/:genre" => "bands#index", :as => "bands_by_genre"
  resources :bands do
    resources :albums
  end
  
  # Artists/users
  
  match "artists" => "users#index"
  match "artists/:id" => "users#show", :as => "show_artist"
  match "artists/:id/edit" => "users#edit", :as => "edit_artist"

  resources :user_sessions
  resources :users

  match "login" => "user_sessions#new", :as => "login"
  match "logout" => "user_sessions#destroy", :as => "logout"
  match "signup" => "users#new", :as => "signup"
  match "artist_by_name/(:name)" => "users#search_by_name", :as => "artist_by_name"

  # Admin stuff
  match "admin" => "admin#index"
  match "admin_demote_superuser/:id" => "admin#demote_superuser", :as => "admin_demote_superuser"
  match "admin_demote_editor/:id" => "admin#demote_editor", :as => "admin_demote_editor"
  match "admin_promote_superuser/:id" => "admin#promote_superuser", :as => "admin_promote_superuser"
  match "admin_promote_editor/:id" => "admin#promote_editor", :as => "admin_promote_editor"
  

  resources :venues
  resources :events
   
  root :to => "index#index"
  

  match "deletemembership" => "membership#delete", :as => "deletemembership"
  match "add_member/:user/to_band/:band" => "membership#create"
    
  match "deletebandevent" => "band_event#delete", :as => "deletebandevent"

  # Misc
  match "what_is_endcap" => "what_is_endcap#index", :as => "what_is_endcap"
  match "talk_to_us" => "talk_to_us#index", :as => "talk_to_us"
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
