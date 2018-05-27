class TagsController < ApplicationController

    def show
        @tag = Tag.where(name: params[:tag])
        @tagging = Tagging.where(tag_id: @tag)
        @pin = Pin.all
    end


end