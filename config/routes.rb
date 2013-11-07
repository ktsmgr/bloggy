Bloggy::Application.routes.draw do
  resources :tags

  resources :comments

  resources :blogs

  get "static_pages/test1"
  #Same as: get "static_pages/test1" => "static_pages#test1"
  #If naming convention matches, don't need to repeat it.
  get "static_pages/test2"
  get "static_pages/test3"

  
  get "index" => "main#index"
  #about-us in main
  #get "main/about-us" => "main#about_us"
  #if we use the underscore convention, we don't need to code the 2nd part.
  get "about_us" => "main#about_us"
  get "about-us" => "main#about_us"
  #This allows the user to navigate to the about us page using about_us AND about-us (underscore or hyphen). BUT, it only works if the :as statement points to a unique place (:about_us needs to be different here or eliminated.)
  #methods can't recognize hyphens
  get "contact_us" => "main#contact_us", :as => :contact_us
  #contact_us in main
  get "terms" => "main#terms", :as => :terms
  #terms in main
  get "our-team" => "main#our_team", :as => :our_team
  get "company_vision" => "main#company_vision", :as => :company_vision

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'main#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
