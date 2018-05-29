class HomeController < ApplicationController

    def index
        @pin = Pin.all.order('created_at DESC')
        @tag = Tag.all
    end

    def explore
        @tag = Tag.all.order('created_at DESC').first(15)
        @tagged = Tag.where(name: params[:tag])
        @tagging = Tagging.where(tag_id: @tagged)
        @taggings = Tagging.all
        @pin = Pin.all
    end
    
end