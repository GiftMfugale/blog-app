class SessionsController < ApplicationController
    def user_logout
      sign_out(current_user)
      flash[:notice] = "Hello #{current_user.full_name}, you've been signed out "
      redirect_to anauthorized_root_path
    end
end
