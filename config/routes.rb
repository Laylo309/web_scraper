Rails.application.routes.draw do
  namespace :v1, defaults: { format: 'json' }  do
    resources :posts do
      match '/scrape', to: 'posts#scrape', via: :post, on: :collection
    end
  end

  get '*page', to: 'static#index', constraints: lambda { |req|
    !req.xhr? && req.format.html?
  }

  root 'static#index'
end
