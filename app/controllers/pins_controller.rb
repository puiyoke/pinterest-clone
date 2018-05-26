class PinsController < ApplicationController
# Add a before_filter to any controller that you want to secure.
# This will force user's to login before they can see the actions in this controller

    def new
    end

    def create
        @pin = Pin.new(pin_params)
            if @pin.save
                flash[:notice] = "Pin Successfully Created"
                redirect_to '/users/pins'
            else
                flash[:notice] = "Unable to create pin, please try again"
                redirect_to '/pins/new'
            end
    end

    def pin_params
        params.require(:pin).permit(:title, :description, :image, :user_id)
    end
end