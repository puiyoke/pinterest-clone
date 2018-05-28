class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.create(comment_params)
        respond_to do |format|
        format.html {redirect_to request.referrer}
        format.js
        end
    end

    def comment_params
        params.require(:comment).permit(:user_id, :pin_id, :comment)
    end

end