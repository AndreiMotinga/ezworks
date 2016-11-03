Rails.application.routes.draw do
  resources :articles do
    get "tag/:tag", to: "articles#tag", on: :collection, as: :tag
  end
end
