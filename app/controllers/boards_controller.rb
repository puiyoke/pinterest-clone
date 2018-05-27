class BoardsController < ApplicationController

    def new
        @board = Board.new
    end

    def show
        @board = Board.find(params[:id])
        @group = Group.where(board_id: params[:id])        
    end

    def list
        @board = current_user.boards
    end

    def create
        @board = Board.create(board_params)
        respond_to do |format|
            format.html {redirect_to '/users/boards'}
            format.js
            end
    end

    def board_params
        params.require(:board).permit(:title, :description, :user_id)
    end
end