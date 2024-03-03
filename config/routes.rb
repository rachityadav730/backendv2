Rails.application.routes.draw do

  # devise_for :users, controllers: {
  #       sessions: 'users/sessions'
  #     }
      devise_for :users, path: '', path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        registration: 'signup'
      },
      controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  # namespace 'auth' do
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      # resources :home, only: [:index, :show]
      # Add other routes as needed    mount_devise_token_auth_for 'User', at: 'auth'
      # mount_devise_token_auth_for 'User', at: 'auth'
      get "/global_access", to: "home#index"
      post "/send_otp", to: "home#send_otp"

    end
  end
end
