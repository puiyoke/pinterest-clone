class BoardsController < ApplicationController

    def new
    end

    def show
        @board = Board.find(params[:id])
    end

    def create
        @board = Board.new(board_params)
            if @board.save
                flash[:notice] = "Board Successfully Created"
                redirect_to '/users/boards'
            else
                flash[:notice] = "Unable to create board, please try again"
                redirect_to '/boards/new'
            end
    end

    def board_params
        params.require(:board).permit(:title, :description, :user_id)
    end
end