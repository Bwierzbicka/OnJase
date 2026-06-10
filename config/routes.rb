Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "pages#home"
  devise_for :users

  get "/dashboard", to: "pages#dashboard"
  get "/profile", to: "pages#profile"

  resources :user_conversations, only: [:index, :new, :create, :show, :destroy]
  resources :user_conversation_messages, only: [:create]
  resources :chats, only: [:index, :new, :create, :show] do
    resources :messages, only: [:create]
  end
  resources :saved_items, only: [:index]
end
