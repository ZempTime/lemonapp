Rails.application.routes.draw do
  resources :lemons do
    member do
      get :form
    end
  end

  root to: "lemons#index"
end
