class VendorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index  
        vendors = Vendor.all 
        render json: vendors
    end

    def show 
        vendor = Vendor.find(params[:id])
        render json: vendor, serializer: VendorWithVendorSweetsSerializer
    end

    private 

    def render_not_found_response
        render json: { error: "Vendor not found" }, status: :not_found
    end
end
