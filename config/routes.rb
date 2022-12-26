Rails.application.routes.draw do
  root "users#index"

  resources :users do
    resources :questions, only: %i[create destroy] do
      resource :anwser, only: :create
    end
  end

  resource :session, only: %i[new create destroy]
end
