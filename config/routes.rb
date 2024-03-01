Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      # resources :home, only: [:index, :show]
      # Add other routes as needed
      get "/global_access", to: "home#index"

    end
  end
end