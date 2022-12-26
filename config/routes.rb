Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    root 'users#index'

    resources :users do
      resources :questions, only: %i[create destroy] do
        resource :anwser, only: %i[create destroy]
      end
    end

    resource :session, only: %i[new create destroy]
  end
end
