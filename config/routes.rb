Americo::Application.routes.draw do

  resources :quotes

  devise_for :admins, :skip => [:registrations]
  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    put 'admins' => 'devise/registrations#update', :as => 'admin_registration'
    delete 'admins' => 'devise/registrations#destroy', :as => 'delete_admin_registration'
  end

  get "static_pages/home"

  root to: 'static_pages#home'

  match '/contact',  to: 'contacts#show',   as: :contact
  match '/about',    to: 'sheets#about',    as: :about
  match '/services', to: 'sheets#services', as: :services

  # Admin Pages
  match '/edit/company',  to: 'admins#edit_company',  as: :edit_company
  match '/edit/home',     to: 'admins#edit_home',     as: :edit_home
  match '/edit/about',    to: 'admins#edit_about',    as: :edit_about
  match '/edit/services', to: 'admins#edit_services', as: :edit_services

  # Form Submittals
  match '/update/company', to: 'admins#update_company', as: :update_company
  match '/update/home',    to: 'admins#update_home',    as: :update_home
  match '/update/sheet',   to: 'admins#update_sheet',   as: :update_sheet

  # Delete and Add Pages
  match '/add/:sheet_id',              to: 'admins#add_page',       as: :add_page
  match '/delete/page/:page_id',       to: 'admins#delete_page',    as: :delete_page
  match '/delete/picture/:picture_id', to: 'admins#delete_picture', as: :delete_picture

  # Send Quote
  match '/send/quote', to: 'contacts#send_quote', as: :send_quote

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
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
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
  #       get 'recent', :on => :collection
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
