class PinsController < ApplicationController
# Add a before_filter to any controller that you want to secure.
# This will force user's to login before they can see the actions in this controller

    def new
        @pin = Pin.new
    end

    def show
        @pin = Pin.find(params[:id])
    end

    def create
        @pin = Pin.create(pin_params)
        respond_to do |format|
        format.html {redirect_to '/users/pins'}
        format.js
        end
    end

    def destroy
        @pin = Pin.find(params[:id])
        @pin.destroy
        respond_to do |format|
          format.html { redirect_to request.referrer }
          format.json
        end
    end

    def pin_params
        params.require(:pin).permit(:title, :description, :image, :user_id)
    end
end