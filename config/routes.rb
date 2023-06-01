Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :customers, only: [] do
        resources :subscriptions, only: [:index, :create, :destroy]
        # "/api/v1/customers/:customer_id/subscriptions"
      end
    end
  end
end