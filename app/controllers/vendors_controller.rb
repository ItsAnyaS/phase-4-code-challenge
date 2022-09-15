class VendorsController < ApplicationController

    def index
        vendors = Vendor.all 
        render json: vendors, only: [:id, :name]
    end

    def show 
        vendor = Vendor.find_by(id: params[:id])
        if vendor
            render json: vendor.to_json(methods: [:vendor_sweets])
        else
            render json: {"error": "Vendor not found"}
        end
    end

end
