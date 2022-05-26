class SweetsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response 
    

    def index 
        sweets = Sweet.all 
        render json: sweets
    end

    def show 
        sweet = Sweet.find(params[:id])
        render json: sweet
    end

    private 

    def render_not_found_response 
        render json: { error: "Sweet not found" }, status: :not_found
    end

end
