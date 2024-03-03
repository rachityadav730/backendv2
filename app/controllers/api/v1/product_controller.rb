class Api::V1::ProductController < ApplicationController
    # before_action :authenticate_user
    include DeviseTokenAuth::Concerns::SetUserByToken
    before_action :authenticate_user

    def product_list
    
        p "@current_user ",@current_user ,current_user
    user_data = User.all

    render json: { user_data: @current_user }
    end
end
