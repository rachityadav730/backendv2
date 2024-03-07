class ApplicationController < ActionController::API
        # before_action :configure_permitted_parameters, if: :devise_controller?
        before_action :configure_permitted_parameters, if: :devise_controller?
        before_action :authenticate_user, unless: -> { devise_controller? && (action_name == 'product_list' || action_name == 'create') }

        protected
        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar])
          devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
        end

        def authenticate_user


                if request.headers['Authorization'].present? && request.headers['Authorization'] != "Bearer null"
                        jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last, 'a152414c4ff4c24f35dc7edc56c579d32161d6ca9367924db4a92cd9c7537253dc1bae628112e722be1bfff79b761cb274f81b732696f3433884d50714edbc82').first
                        @current_user = User.find_by_jti(jwt_payload['jti'])
                        if @current_user 
                        else
                                render json: {
                                        status: 401,
                                        message: "Couldn't find an active session."
                                }, status: :unauthorized
                        end
                end
               
        end
end
