Rails.application.routes.draw do

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  namespace 'api' do
    namespace 'v1' do
      # resources :home, only: [:index, :show]
      # Add other routes as needed    mount_devise_token_auth_for 'User', at: 'auth'
      # mount_devise_token_auth_for 'User', at: 'auth'
      get "/global_access", to: "home#index"
      post "/send_otp", to: "home#send_otp"
      get "/get_items", to: "product#product_list"

    end
  end
end
