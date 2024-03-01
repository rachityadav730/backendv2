class Api::V1::HomeController < ApplicationController
    def index
        render json: { login: 123 }
    end
end
