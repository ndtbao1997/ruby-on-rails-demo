Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  scope 'api' do
    post 'authenticate', to: 'user_rest#authenticate'
  end
  namespace 'api' do
    resources :product_details do
      collection do
        get 'find_all_small_lest', to: 'product_details#find_all_small_lest'
        get 'find_all_by_product_id/:id', to: 'product_details#find_all_by_product_id'
      end
      member do

        put 'update', to: 'products_rest#update'
      end
    end
  end
  post '/graphql', to: 'graphql#execute'
end
