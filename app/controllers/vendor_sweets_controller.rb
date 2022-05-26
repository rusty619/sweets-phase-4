class VendorSweetsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create 
        vendor_sweet = VendorSweet.create!(vendor_sweet_params)
        render json: vendor_sweet, status: :created
    end

    def destroy 
        vendor_sweet = VendorSweet.find(params[:id])
        vendor_sweet.destroy
        head :no_content
    end

    private 

    def vendor_sweet_params 
        params.permit(:price, :vendor_id, :sweet_id)
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "VendorSweet not found" }, status: :not_found
    end
end
