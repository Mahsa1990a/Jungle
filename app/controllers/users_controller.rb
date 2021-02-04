class UsersController < ApplicationController

  # for rendering the signup form
  def new
  end

  # for receiving the form and creating a user with the form's parameters.
  def create

    # Add logic to create action
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end 

  #add the private user_params method to sanitize the input from the form
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
