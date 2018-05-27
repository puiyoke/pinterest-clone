class HomeController < ApplicationController

    def index
        @pin = Pin.all
    end

    def explore
        @tag = Tag.all.order('created_at DESC').first(20)
        @tagged = Tag.where(name: params[:tag])
        @tagging = Tagging.where(tag_id: @tagged)
        @pin = Pin.all
    end
    
end