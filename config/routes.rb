Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  get 'lunsj' => "lunch#index"

  root :to => "frontpage#frontpage_site"
  get 'test' => "frontpage#frontpage_site"
  get 'galla' => "frontpage#frontpage_site"
  get 'halla' => "frontpage#frontpage_site"
  get 'contact' => "tabs/contact/", as: "contact"
  get 'articles' => "articles#all"
  get 'blogs' => "articles#all_blog"
  get 'blog' => "articles#all_blog", as: "old_blog"
  get 'blogg' => "articles#all_blog"
  get 'blogs/:id' => "articles#show"
  get 'blog/:id' => "articles#show", as: "blog"
  get 'blogg/:id' => "articles#show"

  get 'isfit_jubileum' => "tabs#jubileum"
  get 'kjop_jubileums_billett' => "tabs#buy_jubilee_ticket"
  get 'kjop_bok' => "tabs#buy_book"

  get 'pages/:id' => 'tabs#redirect_page'
  resources :articles
  resources :tabs, except: :index
  #get "tabs/:page_slug", controller: "tabs", action: "show"

  resources :workshops

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
