Rails.application.routes.draw do
  root 'casa#index'
  get 'search', to: 'casa#search'
  scope :admin do
    get "/", to: 'admin#index'
    resources :words
    resources :articles
  end
end