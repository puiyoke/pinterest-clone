class UsersController < ApplicationController

    def new
    end

    def show
        @user = current_user
    end

    def create
        @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id
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

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :gender, :description, :avatar)
    end
end