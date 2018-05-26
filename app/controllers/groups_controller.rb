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

    def group_params
        params.require(:group).permit(:board_id, :pin_id)
    end
end