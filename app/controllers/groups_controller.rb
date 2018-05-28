class GroupsController < ApplicationController

    def create
        @group = Group.new(group_params)
            if @group.save
                flash[:notice] = "Pin successfully added to Board"
                redirect_to '/users/boards'
            else
                flash[:notice] = "Unable to add to board, please try again"
                redirect_to '/boards/new'
            end
    end

    def destroy
        @board = Board.find(params[:id])
        @pin = Pin.find(params[:pin_id])
        @group = Group.find_by(board_id: params[:id]) && Group.find_by(pin_id: params[:pin_id])
        @group.destroy
        respond_to do |format|
          format.html { redirect_to request.referrer }
          format.json
        end
    end

    def group_params
        params.require(:group).permit(:board_id, :pin_id)
    end
end