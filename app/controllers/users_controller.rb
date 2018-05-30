class UsersController < ApplicationController

    def new
    end

    def show
        @user = current_user
    end

    def view
        @user = User.find(params[:id])
    end

    def pins
        @pin = current_user.pins
    end

    def boards
        @board = current_user.boards
    end

    def create
        @user = User.new(user_params)
            if @user.save
                cookies[:auth_token] = @user.auth_token
                flash[:notice] = "User Successfully Created"
                redirect_to '/'
            else
                flash[:notice] = "Unable to create user, please try again"
                redirect_to '/signup'
            end
    end  
    
    def edit
        @user = current_user
    end

    def update
        @user = current_user
            if @user.update_attributes(user_params)
                flash[:notice] = "Update Succesful"
                redirect_to users_show_path
            else
                flash[:notice] = "Unable to update profile, please try again"
                render 'edit'
            end
    end

    def follow
        @user = User.find(params[:id])
        current_user.follow(@user)
        @follow = Follow.find_by(follower: @current_user, followable: @user)
        redirect_to request.referrer
    end

    def unfollow
        @user = User.find(params[:id])
        current_user.stop_following(@user)
        redirect_to request.referrer
    end

    def follower
    end

    def following
        
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :gender, :description, :avatar, :remote_avatar_url)
    end
end