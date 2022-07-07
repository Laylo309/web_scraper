# Rails.application.routes.draw do

# #  namespace :v1, defaults: {format: 'json'} do 
# #   get 'news', to: 'news#scrape'
# #  end
# resources :news 
# get 'scrape', to: 'news#scrape', as: :scrape

# root to: 'news#index'
# end


Rails.application.routes.draw do
  resources :posts do
    match '/scrape', to: 'posts#scrape', via: :post, on: :collection
  end

  root to: 'posts#index'
end
