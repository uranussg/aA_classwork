class CatRentalRequestsController < ApplicationController
    def new
        @cats = Cat.all
        @cat_rental_request = CatRentalRequest.new
        render :new
    end

    def create 
     
        @cat_rental_request = CatRentalRequest.new(request_params)
        if @cat_rental_request.save
            redirect_to cat_url(request_params[:cat_id])
        else  
            render json: @cat_rental_request.errors.full_messages
        end
    end

    def index
        @cat_rental_requests = CatRentalRequest.find_by(cat_id: params[:cat_id])
        render :index

    end

    def request_params
        params.require(:cat_rental_request).permit(:id, :cat_id, :start_date, :end_date, :status)
    end

    def deny
        cat_rental_request = CatRentalRequest.find_by(id: params[:id])
        cat_rental_request.deny!
        redirect_to cat_url(cat_rental_request.cat_id)
    end

    def approve
        cat_rental_request = CatRentalRequest.find_by(id: params[:id])
        cat_rental_request.approve!
        redirect_to cat_url(cat_rental_request.cat_id)

    end


end
