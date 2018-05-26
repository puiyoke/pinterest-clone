class SessionsController < ApplicationController

    def create_from_omniauth
        auth_hash = request.env["omniauth.auth"]
        authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)
      
        # if: previously already logged in with OAuth
        if authentication.user
          user = authentication.user
          authentication.update_token(auth_hash)
          @next = root_url
          @notice = "Signed in!"
        # else: user logs in with OAuth for the first time
        else
          user = User.create_with_auth_and_hash(authentication, auth_hash)
          # you are expected to have a path that leads to a page for editing user details
          @next = users_edit_path(user)
          @notice = "User created. Please confirm or edit details"
        end
      
        session[:user_id] = user.id
        flash[:notice] = "Login Succesful"
        redirect_to '/'
    end


    def create
        user = User.find_by_email(params[:email])
            # If the user exists AND the password entered is correct.
            if user && user.authenticate(params[:password])
                # Save the user id inside the browser cookie. This is how we keep the user 
                # logged in when they navigate around our website.
                session[:user_id] = user.id
                flash[:notice] = "Login Succesful"
                redirect_to '/'
            else
                # If user's login doesn't work, send them back to the login form.
                flash[:notice] = "Incorrect Email or Password, please try again"
                redirect_to '/login'
            end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logout Succesful"
        redirect_to '/login'
    end
  
end