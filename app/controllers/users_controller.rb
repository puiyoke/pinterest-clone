class UsersController < ApplicationController

    def new
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
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :gender)
    end
end