class Api::V1::ProductController < ApplicationController
    # before_action :authenticate_user
    # include DeviseTokenAuth::Concerns::SetUserByToken
    # before_action :authenticate_user

    def product_list
    
        all_items = Product.where(category_id: 1)
        render json: { item_list: all_items }
    end
end
