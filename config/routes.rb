Rails.application.routes.draw do

  root 'welcome#index'
  get 'about_us', to: 'welcome#about_us'
  get 'contact', to: 'welcome#contact'

  resources :posts do
    resources :comments
  end
end