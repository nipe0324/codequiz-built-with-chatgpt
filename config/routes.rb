Rails.application.routes.draw do

  # アカウント作成
  get "/sign_up" => "users#new", as: "sign_up"
  post "/users" => "users#create", as: "users"

  # ログイン・ログアウト
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  post "/session" => "clearance/sessions#create", as: "session"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"

  # パスワードリセット
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resources :users, only: [] do
    resource :password, controller: "clearance/passwords", only: [:edit, :update]
  end

  # root "articles#index"
end
