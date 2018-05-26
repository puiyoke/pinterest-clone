class HomeController < ApplicationController
    def index
        @pin = Pin.all
    end
end