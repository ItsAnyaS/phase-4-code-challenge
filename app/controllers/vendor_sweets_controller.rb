class VendorSweetsController < ApplicationController

   def create
    vendor_sweet = VendorSweet.new(vendor_id: params[:vendor_id], sweet_id: params[:sweet_id], price: params[:price])
    if vendor_sweet.save

        render json: {id: vendor_sweet.id,  name: vendor_sweet.sweet.name,price: vendor_sweet.price}
    else
        render json: vendor_sweet.errors.full_messages
    end
   end


    def destroy
        vendor_sweet = VendorSweet.find_by(id: params[:id])
        if vendor_sweet.destroy
            render json: {}
        else
            render json: {"error": "VendorSweet not found"}
        end
    end
end
