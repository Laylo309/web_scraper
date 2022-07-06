# Rails.application.routes.draw do
# #  namespace :v1, defaults: {format: 'json'} do 
# #   get 'news', to: 'news#scrape'
# #  end
# resources :news 
# get 'scrape', to: 'news#scrape', as: :scrape

# root to: 'news#index'
# end


Rails.application.routes.draw do
  resources :news do
    post '/scrape', to: 'news#scrape',on: :collection
  end

  root to: 'news#index'
end
