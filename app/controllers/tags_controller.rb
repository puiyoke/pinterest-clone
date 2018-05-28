class TagsController < ApplicationController

    def show
        @tag = Tag.where(name: params[:tag])
        @tagging = Tagging.where(tag_id: @tag)
        @pin = Pin.all
    end

    def search
        @pin = Pin.all
        @tags = Tag.search(params[:search])
        @tagging = Tagging.where(tag_id: @tags)
        
    end

end